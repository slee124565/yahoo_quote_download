#!/usr/bin/env python

from yahoo_quote_download import yqd
import logging
from datetime import date, timedelta
import os
from six.moves import urllib
from retrying import retry

def retry_if_http_error(exception):
    return isinstance(exception, urllib.error.HTTPError)

class YahooQuote(object):
    
    def __init__(self,logger=None):
        
        self.logger = logger or logging.getLogger(__name__)
        self.output = os.path.join(os.path.dirname(__file__),'csv')
        if not os.path.exists(self.output):
            self.logger.info('output folder %s not exist, create' % self.output)
            os.mkdir(self.output)
        
    @retry(retry_on_exception=retry_if_http_error, stop_max_attempt_number=5,wait_fixed=2000)
    def get_quote(self,ticker,start_date,end_date,interval='1d'):
        try:
            quotes = yqd.load_yahoo_quote(ticker=ticker, 
                                 begindate=start_date, 
                                 enddate=end_date,
                                 interval=interval)
            with open(os.path.join(self.output,ticker + '.csv'),'w') as fh:
                for line in quotes:
                    if line.strip() != '':
                        self.logger.debug(line)
                        fh.write(line + '\n')
            self.logger.debug('result file output file %s' % os.path.join(self.output,ticker + '.csv'))
            return quotes
        except urllib.error.HTTPError:
            self.logger.error('get_quote HTTP ERROR')
            self.logger.info('refreshing yahoo cookie crumb')
            yqd._get_cookie_crumb()
            raise urllib.error.HTTPError
        except:
            self.logger.error('ticker %s quote not found from yahoo' % ticker, exc_info=True)
            raise

if __name__ == '__main__':  # noqa
    import argparse

    parser = argparse.ArgumentParser(
        description='Yahoo Financial Page Parser',
        )

    parser.add_argument(
        'ticker',
        help="company's ticker, e.g., AAPL, MSFT, etc.")

    parser.add_argument(
        'startdate',
        nargs='?',
        help="format: Ymd, default: <today, %(default)s>",
        default=date.today().strftime('%Y%m%d'))

    parser.add_argument(
        'enddate',
        nargs='?',
        help="format: Ymd, default: <today, %(default)s>",
        default=date.today().strftime('%Y%m%d'))
    
    parser.add_argument(
        '--interval',
        nargs='?',
        help="quote interval: 1d, 1wk, or 1mo, default: %(default)",
        default='1d')

    args = parser.parse_args()

    FORMAT = '%(asctime)s [%(levelname)s] %(name)s: %(message)s'
    logging.basicConfig(level=logging.DEBUG, format=FORMAT)

    quoute = YahooQuote()
    quoute.get_quote(args.ticker, args.startdate, args.enddate, args.interval)
