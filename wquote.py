#!/usr/bin/env python

import argparse
import logging
import sys
from commands.list import List
from commands.update import Update
from db_config import db_config

logger = logging.getLogger(__name__)

class WQuote(object):
    
    def __init__(self, logger=None):
        self.logger = logger or logging.getLogger(__name__)
        self.db_config = db_config
        parser = argparse.ArgumentParser(
            description='Yahoo Financial Site (http://www.twse.com.tw/) Parser',
            usage='''wquote <command> [<args>]
            
The most commonly use wquote commands are:
    list                List all sp500 or nasdaq100 ticker
    update <id> <3y>    Download last 3 years market trading exchange daily data for company <id> from TWSE
'''
            )
        parser.add_argument('command',
                           help='Subcommand to run')
        # parse_args defaults to [1:] for args, but you need to
        # exclude the rest of the args too, or validation will fail
        args = parser.parse_args(sys.argv[1:2])
        
        if not hasattr(self, args.command):
            self.logger.error('Unrecognized command %s' % args.command)
            parser.print_help()
            exit(1)
        # use dispatch pattern to invoke method with same name
        getattr(self, args.command)()
        
    def list(self):
        parser = argparse.ArgumentParser(
            description='List all stock id and name from TWSE'
            )
        parser.add_argument('-s','--sp500',
                            action='store_true',
                            help='S&P500 market',
                            default=False)
        parser.add_argument('-n','--nasdaq100',
                            action='store_true',
                            help='NASDAQ100 market',
                            default=False)
        args = parser.parse_args(sys.argv[2:])
        self.logger.info('quote list with args %s' % (args))
        cmd = List(args, self.db_config, logger=self.logger)
        cmd()
    
    def update(self):
        parser = argparse.ArgumentParser(
            description='Download stock trading data from Yahoo Financial'
            )
        parser.add_argument('--quote_id', 
                            help='company stock id, sp500, nasdaq100 or all',
                            default='all')
        parser.add_argument('--period', 
                            help='fetch data period: 1d, 2w, 3m or 3y; d for day, w for week, m for month, y for year')
        parser.add_argument('--until_now',
                            action='store_true',
                            help='update since last time updated to now',
                            default=False)
        args = parser.parse_args(sys.argv[2:])
        self.logger.info('quote update with args %s' % (args))
        cmd = Update(args, self.db_config, logger=self.logger)
        cmd()
    
if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG)
    WQuote()
    