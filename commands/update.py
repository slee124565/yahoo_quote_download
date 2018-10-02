
import logging
import pymysql
from datetime import datetime
from dateutil.relativedelta import relativedelta
import sys
from yahoo_quote import YahooQuote
from six.moves import urllib


class Update(object):
    """"""
    conn = None
    quote_id_list = []
    start_date = None
    end_date = None
    yahoo_quote = None
    
    def __init__(self, args, db_config, logger=None):
        self.args = args
        self.db_config = db_config
        self.logger = logger or logging.getLogger(__name__)

    def _get_db_conn(self):
        conn = pymysql.connect(host=self.db_config['host'],
                               user=self.db_config['user'],
                               password=self.db_config['password'],
                               db=self.db_config['db'],
                               cursorclass=self.db_config['cursorclass'],
                               )
        self.logger.debug('_get_db_conn')
        self.conn = conn

    def _get_quote_id_list(self):
        quote_id_list = self.args.quote_id.split(',')
        self.logger.debug('quote_id_list initial: %s' % str(quote_id_list))
        
        if 'sp500' in quote_id_list or 'all' in quote_id_list:
            with self.conn.cursor() as cursor:
                sql = "select SecID, SecName from sp500;"
                cursor.execute(sql)
                rows = cursor.fetchall()
                for row in rows:
                    quote_id_list.append([row['SecID'], row['SecName']])
        if 'nasdaq100' in quote_id_list or 'all' in quote_id_list:
            with self.conn.cursor() as cursor:
                sql = "select SecID, SecName from nasdaq100;"
                cursor.execute(sql)
                rows = cursor.fetchall()
                for row in rows:
                    quote_id_list.append([row['SecID'], row['SecName']])
        
        if 'sp500' in quote_id_list:
            quote_id_list.remove('sp500')
        if 'nasdaq100' in quote_id_list:
            quote_id_list.remove('nasdaq100')
        if 'all' in quote_id_list:
            quote_id_list.remove('all')
        self.logger.debug('db initi quote_id_list count %s ' % len(quote_id_list))
        quote_id_list.sort()
        self.logger.debug('quote_id_list final:')
        for entry in quote_id_list:
            self.logger.debug('%s' % entry)
        self.quote_id_list = quote_id_list
        
    def _get_yahoo_quote(self):
        self.yahoo_quote = YahooQuote(logger=self.logger)
    
    def _get_until_now_start_date(self,q_table,ticker):
        """"""
        if self.args.until_now:
            sql = "select * from %s where StockID = '%s' order by DDate desc limit 1" % (
                q_table, ticker)
            with self.conn.cursor() as cursor:
                self.logger.debug('sql cmd: %s' % sql)
                cursor.execute(sql)
                query_set = cursor.fetchone()
                self.logger.debug('query_set type %s, %s' % (type(query_set), str(query_set)))
                if query_set is None:
                    if self.args.interval == '1d':
                        start_date = self.end_date - relativedelta(years=3,months=6)
                    else:
                        start_date = self.end_date - relativedelta(years=5)
                    start_date = start_date.date()
                else:
                    start_date = query_set['DDate']
            return start_date
        else:
            raise Exception('missing args.until_now')
        
    def _get_period_start_date(self):
        """"""
        if self.args.period:
            period_value = self.args.period[:-1]
            period_type = self.args.period[-1]
            if not period_type in ['d', 'w', 'm', 'y']:
                self.logger.warning('update args [period] error')
                return
            try:
                period_value = int(period_value)
                if period_type == 'd':
                    start_date = self.end_date - relativedelta(days=period_value)
                elif period_type == 'w':
                    start_date = self.end_date - relativedelta(weeks=period_value)
                elif period_type == 'm':
                    start_date = self.end_date - relativedelta(months=period_value)
                elif period_type == 'y':
                    start_date = self.end_date - relativedelta(years=period_value)
                else:
                    self.logger.error('unknow period type %s' % period_type)
                    raise Exception('period_type {} error'.format(period_type))
            except:
                self.logger.error('update args [period] error')
                raise
        self.start_date = start_date
        return start_date
        
    def _get_target_table(self):
        if not self.args.interval in ['1d', '1wk', '1mo']:
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
            raise Exception('args.interval {} error'.format(self.args.interval))
        self.logger.debug('quote update with q_table: %s' % q_table)
        return q_table
    
    def _update_ticker_quote_to_db(self, ticker, q_table, date_quote):
        """"""
        if date_quote.strip() != '':
            self.logger.debug(date_quote)
            columns = date_quote.split(',')
            if len(columns) == 7:
                t_date, t_open, t_high, t_low, t_close, _, t_volume = columns
                try:
                    _ = [float(x) for x in columns[1:]]
                    t_date = datetime.strptime(t_date, '%Y-%m-%d')
                    t_open, t_high, t_low, t_close = ['{:.2f}'.format(float(x)) for x in columns[1:-2]]
                except:
                    self.logger.error('ticker %s quote %s update exception, skip!' % (ticker,date_quote),
                                      exc_info=True)
                    return False

                sql = "select count(*) from %s where DDate = '%s' and StockID = '%s'" % (
                    q_table, t_date, ticker)
                with self.conn.cursor() as cursor:
                    cursor.execute(sql)
                    count_query = cursor.fetchone()['count(*)']
                    self.logger.debug('count_query %s' % count_query)
                    if count_query > 1:
                        self.logger.warning('duplicate row data for (%s %s)' % (ticker, t_date))
                    if count_query == 0:
                        if q_table == 'usastock_dd':
                            sql = "insert into %s values ('%s','%s',%s,%s,%s,%s,%s)" % (
                                q_table, t_date, ticker, t_open, t_high, t_low, t_close, t_volume )
                        else:
                            sql = "insert into %s values ('%s','%s',%s,%s,%s,%s)" % (
                                q_table, t_date, ticker, t_open, t_high, t_low, t_close )
                    else:
                        if q_table == 'usastock_dd':
                            sql = "update %s set SOpen = %s, SHigh = %s, \
SLow = %s, SClose = %s, TShare = %s \
where DDate = '%s' and StockID = '%s'" % (
                                        q_table, t_open, t_high, t_low, t_close, t_volume,
                                        t_date,ticker)
                        else:
                            sql = "update %s set SOpen = %s, SHigh = %s, \
SLow = %s, SClose = %s \
where DDate = '%s' and StockID = '%s'" % (
                                        q_table, t_open, t_high, t_low, t_close,
                                        t_date, ticker)
                    self.logger.debug(sql)
                    cursor.execute(sql)
                    self.conn.commit()
                    return True
        return False

    def _ticker_validate(self,ticker):
        """"""
        tables = ['nasdaq100','sp500']
        for t_table in tables:
            sql = "select count(*) from %s where SecID = '%s'" % (t_table, ticker)
            with self.conn.cursor() as cursor:
                cursor.execute(sql)
                count_query = cursor.fetchone()['count(*)']
                self.logger.debug('ticker count query %s' % count_query)
                if count_query == 1:
                    return True
                elif count_query > 1:
                    self.logger.warning('ticker %s has multiple entries in %s' % (ticker, t_table))
                    return True
        self.logger.warning('ticker %s validate Fail' % ticker)
        return False

    def __call__(self):
        """"""
        quote_fail_list = []

        try:
            self._get_db_conn()

            # -> args.quote_id
            self._get_quote_id_list()
            
            # ->
            self.start_date = self.end_date = datetime.today()

            # -> start update quote
            self._get_yahoo_quote()

            # -> start update_process

            q_table = self._get_target_table()
            
            t_ticker_done_list = []
            
            for entry in self.quote_id_list:
                if type(entry) == list:
                    ticker, name = entry
                else:
                    ticker = entry
                    name = ''
                    
                if self._ticker_validate(ticker):
                    if ticker in t_ticker_done_list:
                        self.logger.warning('ticker %s already be quoted' % ticker)
                    else:
                        self.logger.debug('update %s %s ...' % (ticker,name))
                        
                        start_date = self.end_date
                        
                        if self.args.until_now:
                            start_date = self._get_until_now_start_date(q_table,ticker)
        
                        if self.args.period:
                            start_date = self._get_period_start_date()
            
                        self.logger.debug('== upate (%s, %s) period (%s, %s, %s) ==' % (ticker, name,
                                                                    start_date.strftime('%Y%m%d'),
                                                                    self.end_date.strftime('%Y%m%d'),
                                                                    self.args.interval))
                        try:
                            quotes = self.yahoo_quote.get_quote(ticker, 
                                                   start_date.strftime('%Y%m%d'), 
                                                   self.end_date.strftime('%Y%m%d'),
                                                   self.args.interval)
                        except KeyboardInterrupt:
                            self.logger.error('KeyboardInterrupt event, stop process')
                            break
                        except:
                            self.logger.warning('yahoo_quote for ticker %s fail, skip to next' % ticker)
                            quote_fail_list.append(ticker)
                            continue
                        
                        #if quotes is None:
                        #    self.logger.warning('yahoo_quote.get_quote for ticker %s, skip to next' % ticker)
                        #    quote_fail_list.append(ticker)
                        #    continue
                               
                        self.logger.debug('yahoo_quote get row count %s' % (len(quotes)))
                        self.logger.debug('titles: %s' % quotes[0])
                        counter = 0
                        for date_quote in quotes[1:]:
                            if self._update_ticker_quote_to_db(ticker,q_table,date_quote):
                                counter += 1
                        self.logger.info('== [%s, %s] update (%s,%s) with count %s done ==' % (
                            ticker,name,
                            start_date.strftime('%Y%m%d'),self.end_date.strftime('%Y%m%d'),
                            counter
                            ))
                        t_ticker_done_list.append(ticker)
        except:
            self.logger.error('%s command exception' % self.__class__.__name__, 
                              exc_info=True)
        finally:
            quote_fail_list.sort()
            self.logger.info('quote fail list: %s' % quote_fail_list)
            if self.conn:
                self.conn.close()
