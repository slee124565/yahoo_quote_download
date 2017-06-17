
import logging
import pymysql
from datetime import datetime
from dateutil.relativedelta import relativedelta
import sys
from yahoo_quote import YahooQuote

class Update(object):
    ''''''
    
    def __init__(self, args, db_config, logger=None):
        self.args = args
        self.db_config = db_config
        self.logger = logger or logging.getLogger(__name__)

    def __call__(self):
        ''''''
        try:
            conn = pymysql.connect(host=self.db_config['host'],
                                   user=self.db_config['user'],
                                   password=self.db_config['password'],
                                   db=self.db_config['db'],
                                   cursorclass=self.db_config['cursorclass'],
                                   
                                   )
            #-> args.period
            start_date = end_date = datetime.today()
            if not self.args.until_now:
                period_value = self.args.period[:-1]
                period_type = self.args.period[-1]
                if not period_type in ['d','w','m','y']:
                    self.logger.warning('update args [period] error')
                    return
                try:
                    period_value = int(period_value)
                    if period_type == 'd':
                        start_date = end_date - relativedelta(days=period_value)
                    elif period_type == 'w':
                        start_date = end_date - relativedelta(weeks=period_value)
                    elif period_type == 'm':
                        start_date = end_date - relativedelta(months=period_value)
                    elif period_type == 'y':
                        start_date = end_date - relativedelta(years=period_value)
                    else:
                        self.logger.error('unknow period type %s' % period_type)
                        sys.exit(1)
                except:
                    self.logger.error('update args [period] error')
                    sys.exit(1)
            self.logger.info('update quote from %s - %s' % (start_date,end_date))
                
            #-> args.quote_id
            quote_id_list = self.args.quote_id.split(',')
            self.logger.debug('initial quote_id_list: %s' % str(quote_id_list))
            if 'sp500' in quote_id_list or 'all' in quote_id_list:
                with conn.cursor() as cursor:
                    sql = "select SecID, SecName from sp500;"
                    cursor.execute(sql)
                    rows = cursor.fetchall()
                    for row in rows:
                        quote_id_list.append([row['SecID'],row['SecName']])
            elif 'nasdaq100' in quote_id_list or 'all' in quote_id_list:
                with conn.cursor() as cursor:
                    sql = "select SecID, SecName from nasdaq100;"
                    cursor.execute(sql)
                    rows = cursor.fetchall()
                    for row in rows:
                        quote_id_list.append([row['SecID'],row['SecName']])
            
            if 'sp500' in quote_id_list:
                quote_id_list.remove('sp500')
            if 'nasdaq100' in quote_id_list:
                quote_id_list.remove('nasdaq100')
            if 'all' in quote_id_list:
                quote_id_list.remove('all')
            self.logger.debug('final quote_id_list: %s' % str(quote_id_list))
            
            #-> args.interval: 1d, 1wk, 1mo
            if not self.args.interval in ['1d','1wk','1mo']:
                self.logger.error('update args [interval] error')
                sys.exit(1)
            if self.args.interval == '1d':
                q_table = 'usastock_dd'
            elif self.args.interval == '1wk':
                q_table = 'usastock_ww'
            elif self.args.interval == '1mo':
                q_table = 'usastock_mm'
            else:
                self.logger.error('unknow args [interval] %s' % self.args.interval)
                sys.exit(1)
            self.logger.debug('q_table: %s' % q_table)
            
            #-> start update quote
            yahoo_quote = YahooQuote(logger=self.logger)
            for entry in quote_id_list:
                if type(entry) == list:
                    ticker,name = entry
                else:
                    ticker = entry
                    name = ''
                self.logger.info('update %s %s ...' % (ticker,name))
                if self.args.until_now:
                    sql = "select * from %s where StockID = '%s' order by DDate desc" % (
                        q_table, ticker)
                    with conn.cursor() as cursor:
                        self.logger.debug('sql cmd: %s' % sql)
                        cursor.execute(sql)
                        query_set = cursor.fetchone()
                        self.logger.debug('query_set type %s, %s' % (type(query_set),str(query_set)))
                        if query_set is None:
                            start_date = end_date - relativedelta(years=1)
                            start_date = start_date.date()
                        else:
                            start_date = query_set['DDate']
                self.logger.debug('== upate (%s, %s) period (%s, %s, %s) ==' % (ticker, name,
                                                            start_date.strftime('%Y%m%d'),
                                                            end_date.strftime('%Y%m%d'),
                                                            self.args.interval))
                quotes = yahoo_quote.get_quote(ticker, 
                                               start_date.strftime('%Y%m%d'), 
                                               end_date.strftime('%Y%m%d'),
                                               self.args.interval)
                self.logger.debug('yahoo quote count %s' % (len(quotes)))
                self.logger.debug(quotes[0])
                for date_quote in quotes[1:]:
                    if date_quote.strip() != '':
                        self.logger.debug(date_quote)
                        columns = date_quote.split(',')
                        if len(columns) == 7:
                            t_date,t_open,t_high,t_low,t_close,_,t_volume = columns
                            try:
                                _ = [float(x) for x in columns[1:]]
                                t_date = datetime.strptime(t_date,'%Y-%m-%d')
                            except:
                                self.logger.warning('ticker %s quote %s update exception, skip!' % (ticker,date_quote))
                                continue
                            sql = "select count(*) from %s where DDate = '%s' and StockID = '%s'" % (
                                q_table,t_date,ticker)
                            with conn.cursor() as cursor:
                                cursor.execute(sql)
                                count_query = cursor.fetchone()['count(*)']
                                self.logger.debug('count_query %s' % count_query)
                                if count_query > 1:
                                    self.logger.warning('duplicate row data for (%s %s)' % (ticker, t_date))
                                if count_query == 0:
                                    if q_table == 'usastock_dd':
                                        sql = "insert into %s values ('%s','%s',%s,%s,%s,%s,%s)" % (
                                            q_table,t_date,ticker,t_open,t_high,t_low,t_close,t_volume )
                                    else:
                                        sql = "insert into %s values ('%s','%s',%s,%s,%s,%s)" % (
                                            q_table,t_date,ticker,t_open,t_high,t_low,t_close )                                        
                                else:
                                    if q_table == 'usastock_dd':
                                        sql = "update %s set SOpen = %s, SHigh = %s, \
                                                SLow = %s, SClose = %s, TShare = %s \
                                                where DDate = '%s' and StockID = '%s'" % (
                                                    q_table,t_open,t_high,t_low,t_close,t_volume,
                                                    t_date,ticker)
                                    else:
                                        sql = "update %s set SOpen = %s, SHigh = %s, \
                                                SLow = %s, SClose = %s \
                                                where DDate = '%s' and StockID = '%s'" % (
                                                    q_table,t_open,t_high,t_low,t_close,
                                                    t_date,ticker)
                                self.logger.debug(sql)
                                cursor.execute(sql)
                                conn.commit()
                self.logger.info('== [%s, %s] update (%s,%s) done ==' % (
                    ticker,name,start_date.strftime('%Y%m%d'),end_date.strftime('%Y%m%d')
                    ))
        except:
            self.logger.error('quote update exception', exc_info=True)
        finally:
            conn.close()
