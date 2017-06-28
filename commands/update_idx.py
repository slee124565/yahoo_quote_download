
import sys
from datetime import datetime
from dateutil.relativedelta import relativedelta

from .update import Update

class UpdateIdx(Update):
    
    def __init__(self,args,db_config,logger=None):
        super(UpdateIdx,self).__init__(args,db_config,logger)
        
    def _get_quote_id_list(self):
        quote_id_list = self.args.quote_id.split(',')
        self.logger.debug('quote_id_list initial: %s' % str(quote_id_list))
        
        if 'all' in quote_id_list:
            with self.conn.cursor() as cursor:
                sql = "select Index_ID, Index_name from idx;"
                cursor.execute(sql)
                rows = cursor.fetchall()
                for row in rows:
                    quote_id_list.append([row['Index_ID'],row['Index_name']])
        if 'all' in quote_id_list:
            quote_id_list.remove('all')

        self.logger.debug('quote_id_list final: %s' % str(quote_id_list))
        self.quote_id_list = quote_id_list

    def _get_target_table(self):
        if not self.args.interval in ['1d','1wk','1mo']:
            self.logger.error('update args [interval] error')
            sys.exit(1)
        if self.args.interval == '1d':
            q_table = 'idx_dd'
        elif self.args.interval == '1wk':
            q_table = 'idx_ww'
        elif self.args.interval == '1mo':
            q_table = 'idx_mm'
        else:
            self.logger.error('unknow args [interval] %s' % self.args.interval)
            raise
        self.logger.debug('quote update with q_table: %s' % q_table)
        return q_table

    def _get_until_now_start_date(self,q_table,ticker):
        ''''''
        if self.args.until_now:
            sql = "select * from %s where Index_ID = '%s' order by DDate desc limit 1" % (
                q_table, ticker)
            with self.conn.cursor() as cursor:
                self.logger.debug('sql cmd: %s' % sql)
                cursor.execute(sql)
                query_set = cursor.fetchone()
                self.logger.debug('query_set type %s, %s' % (type(query_set),str(query_set)))
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
            raise

    def _ticker_validate(self,ticker):
        ''''''
        return True
        tables = ['idx']
        for t_table in tables:
            sql = "select count(*) from %s where Index_ID = '%s'" % (t_table,ticker)
            self.logger.debug('sql: %s' % sql)
            with self.conn.cursor() as cursor:
                cursor.execute(sql)
                count_query = cursor.fetchone()['count(*)']
                self.logger.debug('ticker count query %s' % count_query)
                if count_query == 1:
                    return True
                elif count_query > 1:
                    self.logger.warning('ticker %s has multiple entries in %s' % (ticker,t_table))
                    return True
        self.logger.warning('ticker %s validate Fail' % ticker)
        return False

    def _update_ticker_quote_to_db(self,ticker, q_table, date_quote):
        ''''''
        if date_quote.strip() != '':
            self.logger.debug(date_quote)
            columns = date_quote.split(',')
            if len(columns) == 7:
                t_date,t_open,t_high,t_low,t_close,_,t_volume = columns
                try:
                    _ = [float(x) for x in columns[1:]]
                    t_date = datetime.strptime(t_date,'%Y-%m-%d')
                    t_open,t_high,t_low,t_close = ['{:.2f}'.format(float(x)) for x in columns[1:-2]]
                except:
                    self.logger.error('ticker %s quote %s update exception, skip!' % (ticker,date_quote),
                                      exc_info=True)
                    return False

                sql = "select count(*) from %s where DDate = '%s' and Index_ID = '%s'" % (
                    q_table,t_date,ticker)
                with self.conn.cursor() as cursor:
                    cursor.execute(sql)
                    count_query = cursor.fetchone()['count(*)']
                    self.logger.debug('count_query %s' % count_query)
                    if count_query > 1:
                        self.logger.warning('duplicate row data for (%s %s)' % (ticker, t_date))
                    if count_query == 0:
                        sql = "insert into %s values ('%s','%s',%s,%s,%s,%s,%s)" % (
                            q_table,t_date,ticker,t_open,t_high,t_low,t_close,t_volume )
                    else:
                        sql = "update %s set SOpen = %s, SHigh = %s, \
SLow = %s, SClose = %s, TShare = %s \
where DDate = '%s' and Index_ID = '%s'" % (
                                    q_table,t_open,t_high,t_low,t_close,t_volume,
                                    t_date,ticker)
                    self.logger.debug(sql)
                    cursor.execute(sql)
                    self.conn.commit()
                    return True
        return False
        