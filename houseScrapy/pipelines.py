# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html

import json
import codecs
from twisted.enterprise import adbapi
import time
from hashlib import md5
import MySQLdb
import MySQLdb.cursors
import logging

from smutils.ConfigU import ConfigU

from houseScrapy.items import RenthouseItem


class RenthousePipeline(object):
    '''
    处理item中的值
    '''
    def process_item(self, item, spider):
        if isinstance(item, RenthouseItem):
            if item.get('address'):
                item.__setitem__('address', item['address'].replace("\n", "").replace(" ", ""))
            if item.get('publish_tm'):
                # 截取后面11位
                item.__setitem__('publish_tm', item['publish_tm'][-11:])
        return item


class JsonWriterPipeline(object):
    '''
    写入文件(json)
    '''
    def __init__(self):
        # 使用codecs解决中文乱码
        self.file = codecs.open('data.json', 'wb', encoding='utf-8')

    def process_item(self, item, spider):
        line = json.dumps(dict(item), ensure_ascii=False) + "\n"
        # self.file.write(line.decode("unicode_escape"))
        self.file.write(line)
        return item

    def spider_closed(self, spider):
        self.file.close()


class MySQLStorePipeline(object):
    '''
    存入数据库
    '''
    def __init__(self, dbpool):
        self.dbpool = dbpool

    @classmethod
    def from_settings(cls, settings):
        '''
        1、@classmethod声明一个类方法，而对于平常我们见到的则叫做实例方法。 
        
        2、类方法的第一个参数cls（class的缩写，指这个类本身），而实例方法的第一个参数是self，表示该类的一个实例
        
        3、可以通过类来调用，就像C.f()，相当于java中的静态方法
        '''
        cls.config = ConfigU('ini.cfg')
        dbargs = dict(
            # host=settings['MYSQL_HOST'],
            # db=settings['MYSQL_DBNAME'],
            # user=settings['MYSQL_USER'],
            # passwd=settings['MYSQL_PASSWD'],
            host=cls.config.get('src_mysql', 'host'),
            db=cls.config.get('src_mysql', 'db'),
            user=cls.config.get('src_mysql', 'user'),
            passwd=cls.config.get('src_mysql', 'passwd'),
            charset='utf8',
            cursorclass=MySQLdb.cursors.DictCursor,
            use_unicode=True,
        )
        # **表示将字典扩展为关键字参数,相当于host=xxx, db=yyy....
        dbpool = adbapi.ConnectionPool('MySQLdb', **dbargs)
        # 相当于dbpool付给了这个类，self中可以得到
        return cls(dbpool)

    # pipeline默认调用
    def process_item(self, item, spider):
        d = self.dbpool.runInteraction(self.do_upinsert, item, spider)
        d.addErrback(self.handle_error, item, spider)
        d.addBoth(lambda _: item)
        return d

    # 将每行更新或写入到数据库中
    def do_upinsert(self, conn, item, spider):
        urlMd5Id = self.get_url_md5_id(item['url'])
        searchUrlMd5Id = item['search_urlmd5_id']
        # 获取当前时间
        now = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))

        conn.execute("""
            select 1 from sm_renthouse_house where urlmd5_id = %s
        """, (urlMd5Id,))
        exist = conn.fetchone()

        if not exist:
            if not item.get('publisher_tel'): # 无联系人电话信息，判断防止报错
                item['publisher_tel'] = ''

            # 新增房源信息
            conn.execute("""
                insert into sm_renthouse_house(urlmd5_id, search_urlmd5_id, url, money, address, publish_tm, publisher, publisher_tel, update_tm) 
                values(%s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, (urlMd5Id, searchUrlMd5Id, item['url'], item['money'], item['address'], item['publish_tm'], item['publisher'], item['publisher_tel'], now))

            # 修改用户房源关系表状态为未发送
            conn.execute("""
                UPDATE sm_renthouse_user_search SET yes_send = '0' 
                    WHERE search_urlmd5_id = %s AND yes_status = '1' AND yes_send = '1'
            """, (searchUrlMd5Id,))

    # 获取url的md5编码
    def get_url_md5_id(self, value):
        # url进行md5处理，为避免重复采集设计
        return md5(value).hexdigest()

    # 异常处理
    def handle_error(self, failure, item, spider):
        logging.error(failure)
