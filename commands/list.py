
import logging
import pymysql.cursors

class List(object):
    ''''''
    
    def __init__(self, args, db_config, logger=None):
        self.args = args
        self.db_config = db_config
        self.logger = logger or logging.getLogger(__name__)
        
    def __call__(self):
        ''''''
        conn = pymysql.connect(host=self.db_config['host'],
                               user=self.db_config['user'],
                               password=self.db_config['password'],
                               db=self.db_config['db'],
                               cursorclass=self.db_config['cursorclass'],
                               
                               )
        
        try:
            queryset = []
            if self.args.sp500:
                self.logger.debug('list with sp500')
                with conn.cursor() as cursor:
                    sql = "select SecID, SecName from sp500;"
                    cursor.execute(sql)
                    rows = cursor.fetchall()
                    for row in rows:
                        self.logger.info('%s, %s' % (row['SecID'],row['SecName']))
                        queryset.append(row)
            
            if self.args.nasdaq100:
                self.logger.debug('list with nasdaq100')
                with conn.cursor() as cursor:
                    sql = "select SecID, SecName from nasdaq100;"
                    cursor.execute(sql)
                    rows = cursor.fetchall()
                    for row in rows:
                        self.logger.info('%s, %s' % (row['SecID'],row['SecName']))
                        queryset.append(row)
        except:
            self.logger.error('List SubCommand Exception', exc_info=True)
        finally:
            conn.close()
            return queryset