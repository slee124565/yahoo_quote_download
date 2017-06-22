#!/usr/bin/env python

import argparse
import logging
import sys

from db_config import db_config
from commands.list import List
from commands.update import Update
from commands.update_idx import UpdateIdx

def _list(args):
    ''''''
    cmd = List(args, db_config)
    cmd()
    
def _update(args):
    ''''''
    cmd = Update(args, db_config)
    cmd()
    
def _update_idx(args):
    ''''''
    cmd  = UpdateIdx(args,db_config)
    cmd()
    
if __name__ == '__main__':
    #-> base parser
    base_parser = argparse.ArgumentParser(add_help=False)
    base_parser.add_argument(
        '--develop',
        action='store_true',
        help='set develop mode',
        default=False)
    base_parser.add_argument(
        '--debug',
        action='store_true',
        help='set logging level to DEBUG',
        default=False)

    parser = argparse.ArgumentParser(
        description='Yahoo Financial Site (http://www.twse.com.tw/) Parser')
    subparsers = parser.add_subparsers(
        title='commands')

    #-> [list] command arguments
    list_parser = subparsers.add_parser(
        'list',
        help='list yahoo financial company id',
        parents=[base_parser])
    list_parser.add_argument('-s','--sp500',
                        action='store_true',
                        help='S&P500 market',
                        default=False)
    list_parser.add_argument('-n','--nasdaq100',
                        action='store_true',
                        help='NASDAQ100 market',
                        default=False)
    list_parser.add_argument('-i','--idx',
                        action='store_true',
                        help='IDX market',
                        default=False)
    list_parser.set_defaults(func=_list)

    #-> duration_parser
    duration_parser = argparse.ArgumentParser(add_help=False)
    ex_group = duration_parser.add_mutually_exclusive_group()
    ex_group.add_argument('--period', 
                        help='update period: (<n>d | <n>w | <n>m | <n>y)')
    ex_group.add_argument('--until_now',
                        action='store_true',
                        help='update since last time updated to now',
                        default=False)
    duration_parser.add_argument('--interval',
                        help="1d, 1wk, or 1mo, default: %(default)s",
                        default='1d')

    #-> [update] command arguments
    update_parser = subparsers.add_parser(
        'update',
        help='update yahoo financial stock exchange data',
        parents=[base_parser,duration_parser])
    update_parser.set_defaults(func=_update)
    update_parser.add_argument('--quote_id',
                               help="target market (sp500,nasdaq100,idx,all) or company id")

    
    
    #-> [update] command arguments
    update_idx_parser = subparsers.add_parser(
        'update_idx',
        help='update yahoo financial idx exchange data',
        parents=[base_parser,duration_parser])
    update_idx_parser.set_defaults(func=_update_idx)
    update_idx_parser.add_argument('--quote_id',
                               help="idx id or all")


    args = parser.parse_args()
    print(args)
    if args.debug:
        log_level = logging.DEBUG
    else:
        log_level = logging.INFO
    logging.basicConfig(
        format='[%(levelname)s]: %(message)s',
        level=log_level)

    args.func(args)
    