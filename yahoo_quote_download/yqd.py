# -*- coding: utf-8 -*-
"""
Created on Thu May 18 22:58:12 2017

@author: c0redumb
"""

# To make print working for Python2/3
from __future__ import print_function

# Use six to import urllib so it is working for Python2/3
from six.moves import urllib
# If you don't want to use six, please comment out the line above
# and use the line below instead (for Python3 only).
#import urllib.request, urllib.parse, urllib.error

import time

'''
Starting on May 2017, Yahoo financial has terminated its service on
the well used EOD data download without warning. This is confirmed
by Yahoo employee in forum posts.

Yahoo financial EOD data, however, still works on Yahoo financial pages.
These download links uses a "crumb" for authentication with a cookie "B".
This code is provided to obtain such matching cookie and crumb.
'''

import logging
logger = logging.getLogger(__name__)

# Build the cookie handler
cookier = urllib.request.HTTPCookieProcessor()
opener = urllib.request.build_opener(cookier)
urllib.request.install_opener(opener)

# Cookie and corresponding crumb
_cookie = None
_crumb = None

def _get_cookie_crumb():
	'''
	This function perform a query and extract the matching cookie and crumb.
	'''

	# Perform a Yahoo financial lookup on SP500
	url = 'https://finance.yahoo.com/quote/^GSPC'
	f = urllib.request.urlopen(url)
	alines = f.read().decode('utf-8')

	# Extract the crumb from the response
	global _crumb
	cs = alines.find('CrumbStore')
	cr = alines.find('crumb', cs + 10)
	cl = alines.find(':', cr + 5)
	q1 = alines.find('"', cl + 1)
	q2 = alines.find('"', q1 + 1)
	crumb = alines[q1 + 1:q2]
	_crumb = crumb

	# Extract the cookie from cookiejar
	global cookier, _cookie
	for c in cookier.cookiejar:
		if c.domain != '.yahoo.com':
			continue
		if c.name != 'B':
			continue
		_cookie = c.value

	# Print the cookie and crumb
	#print('Cookie:', _cookie)
	#print('Crumb:', _crumb)

def load_yahoo_quote(ticker, begindate, enddate, interval='1d', info = 'quote'):
	'''
	This function load the corresponding history/divident/split from Yahoo.
	'''
	# Check to make sure that the cookie and crumb has been loaded
	global _cookie, _crumb
	if _cookie == None or _crumb == None:
		_get_cookie_crumb()

	# Prepare the parameters and the URL
	tb = time.mktime((int(begindate[0:4]), int(begindate[4:6]), int(begindate[6:8]), 4, 0, 0, 0, 0, 0))
	te = time.mktime((int(enddate[0:4]), int(enddate[4:6]), int(enddate[6:8]), 18, 0, 0, 0, 0, 0))

	param = dict()
	param['period1'] = int(tb)
	param['period2'] = int(te)
	param['interval'] = interval
	if info == 'quote':
		param['events'] = 'history'
	elif info == 'dividend':
		param['events'] = 'div'
	elif info == 'split':
		param['events'] = 'split'
	param['crumb'] = _crumb
	params = urllib.parse.urlencode(param)
	url = 'https://query1.finance.yahoo.com/v7/finance/download/{}?{}'.format(ticker, params)
	print(url)
	logger.debug(url)

	# Perform the query
	# There is no need to enter the cookie here, as it is automatically handled by opener
	f = urllib.request.urlopen(url)
	alines = f.read().decode('utf-8')
	#print(alines)
	return alines.split('\n')
