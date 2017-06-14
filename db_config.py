
import pymysql.cursors

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'db': 'yahoo',
    'cursorclass': pymysql.cursors.DictCursor
    }