# -*- coding: utf-8 -*-
import traceback

import MySQLdb

from ConfigU import ConfigU


class MysqlU(object):
    '''
    mysql操作工具类：(1)依赖安装MySQLdb包、ConfigU工具类 (2)导入如from smutils.MysqlU import MysqlU
    
    使用请看测试程序
    '''
    def __init__(self, filename, section):
        super(MysqlU, self).__init__()

        # read config
        cfg = ConfigU(filename)
        self.cfg = cfg
        self.section = section

        # init mysql connection(charset='utf8'否则中文乱码)
        self.conn = MySQLdb.connect(
            host=cfg.get(section, 'host'),
            port=cfg.getint(section, 'port'),
            user=cfg.get(section, 'user'),
            passwd=cfg.get(section, 'passwd'),
            db=cfg.get(section, 'db'),
            connect_timeout=cfg.getint(section, 'connect_timeout'),
            charset='utf8'
        )
        self.cur = self.conn.cursor()

    def fetchmany(self, sql):
        '''
        查询多条：返回一个元组，循环取值如item[0]
        '''
        sql = sql.replace('{$db}', self.cfg.get(self.section, 'db'))
        try:
            return self.cur.fetchmany(self.cur.execute(sql))
        except Exception as e:
            print(traceback.print_exc())
            print(sql)

    def fetchone(self, sql):
        '''
        查询一条
        '''
        sql = sql.replace('{$db}', self.cfg.get(self.section, 'db'))
        try:
            self.cur.execute(sql)
            return self.cur.fetchone()
        except Exception as e:
            print(traceback.print_exc())
            print(sql)

    def sql_commit(self, sql):
        '''
        新增/修改/建表. ? 新增返回id
        '''
        try:
            self.cur.execute(sql)
            self.conn.commit()
        except Exception as e:
            print(traceback.print_exc())

    def sql_create(self, sql):
        '''
        新增返回id(不支持并发)
        '''
        try:
            self.cur.execute(sql)

            # 最后插入行的主键ID
            last_id = self.cur.lastrowid
            # 最新插入行的主键ID
            id = self.conn.insert_id()

            self.conn.commit()
            return id
        except Exception as e:
            print(traceback.print_exc())
            return None

    def table_exit(self, tableName):
        '''
        判断该表是否存在
        '''
        try:
            self.cur.execute("""
                SELECT count(*) FROM information_schema.tables WHERE table_schema = %s AND table_name = %s
            """, (self.cfg.get(self.section, 'db'), tableName))
            count = self.cur.fetchone()
            if count[0]:
                return True
            else:
                return False
        except Exception as e:
            print(traceback.print_exc())

    def close_db(self):
        '''
        关闭数据库资源(连接和游标)
        '''
        self.cur.close()
        self.conn.close()


'''
测试
'''
if __name__ == "__main__":
    db = MysqlU('../ini.cfg', 'src_mysql')
    try:
        test = db.fetchone('select * from test limit 1')
        print(test[1])

        print(db.table_exit('test'))
    finally:
        db.close_db()