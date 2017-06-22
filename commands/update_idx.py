
from .update import Update
from yahoo_quote import YahooQuote

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

    def _get_yahoo_quote(self):
        self.logger.debug('UpdateIdx _get_yahoo_quote')
        

    def _quote_update_process(self):
        ''''''
        self.logger.debug('UpdateIdx _quote_update_process')
        