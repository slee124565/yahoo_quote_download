
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
            period_value = self.args.period[:-1]
            period_type = self.args.period[-1]
            if not period_type in ['d','w','m','y']:
                self.logger.warning('update args [period] error')
                return
            try:
                period_value = int(period_value)
            except:
                self.logger.warning('update args [period] error')
                
            #-> args.quote_id
            quote_id_list = self.args.quote_id.split(',')
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
            
            #-> start update quote
            self.logger.debug('quote update for period (%s,%s) with id list count %s' % (
                                                                        period_value,
                                                                        period_type,
                                                                        len(quote_id_list)))
            start_date = end_date = datetime.today()
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
            start_date = start_date.strftime('%Y%m%d')
            end_date = end_date.strftime('%Y%m%d')
            self.logger.info('update quote from %s - %s' % (start_date,end_date))
            yahoo_quote = YahooQuote(logger=self.logger)
            for entry in quote_id_list:
                if type(entry) == list:
                    ticker,name = entry
                else:
                    ticker = entry
                    name = ''
                self.logger.info('update %s %s ...' % (ticker,name))
                quotes = yahoo_quote.get_quote(ticker, start_date, end_date)
                self.logger.debug('== %s (%s, %s) count %s ==' % (name,
                                                                  start_date,
                                                                  end_date,
                                                                  len(quotes)))
                self.logger.debug(quotes[0])
                for date_quote in quotes[1:]:
                    if date_quote.strip() != '':
                        self.logger.debug(date_quote)
                        columns = date_quote.split(',')
                        if len(columns) == 7:
                            t_date,t_open,t_high,t_low,t_close,t_adj_close,t_volume = columns
                            t_date = datetime.strptime(t_date,'%Y-%m-%d')
                            sql = "select count(*) from usastock_dd where DDate = '%s' and StockID = '%s'" % (
                                t_date,ticker)
                            with conn.cursor() as cursor:
                                cursor.execute(sql)
                                count_query = cursor.fetchone()['count(*)']
                                self.logger.debug('count_query %s' % count_query)
                                if count_query > 1:
                                    self.logger.warning('duplicate row data for (%s %s)' % (ticker, t_date))
                                if count_query == 0:
                                    sql = "insert into usastock_dd values ('%s','%s',%s,%s,%s,%s,%s)" % (
                                        t_date,ticker,t_open,t_high,t_low,t_close,t_volume )
                                else:
                                    sql = "update usastock_dd set SOpen = %s, SHigh = %s, \
                                            SLow = %s, SClose = %s, TShare = %s \
                                            where DDate = '%s' and StockID = '%s'" % (
                                                t_open,t_high,t_low,t_close,t_volume,
                                            t_date,ticker)
                                self.logger.debug(sql)
                                cursor.execute(sql)
                                conn.commit()
                self.logger.info('='*15)
        except:
            self.logger.error('quote update exception', exc_info=True)
        finally:
            conn.close()
