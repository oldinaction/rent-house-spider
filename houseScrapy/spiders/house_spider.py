# -*- coding: utf-8 -*-
import traceback

import scrapy
from scrapy.contrib.loader import ItemLoader

from houseScrapy.items import RenthouseItem

from smutils.ConfigU import ConfigU
from smutils.MysqlU import MysqlU


class RentHouseSpider(scrapy.Spider):
    '''
    爬取安居客上海江浦路房源
    '''
    name = "rentHouseSpider"

    # 上海江浦路1000-1300房源
    # search_url = 'https://sh.zu.anjuke.com/fangyuan/jiangpulu/je1300-js1000-px3/'

    # 减慢爬取速度为2s, 防止被禁
    download_delay = 2

    def __init__(self):
        super(RentHouseSpider, self).__init__()

        self.db = MysqlU('ini.cfg', 'src_mysql')
        self.config = ConfigU('ini.cfg')
        try:
            # 创建表
            if not self.db.table_exit('sm_renthouse_user'):
                self.db.sql_commit(self.config.get('src_mysql', 'table_sm_renthouse_user'))

            if not self.db.table_exit('sm_renthouse_search'):
                self.db.sql_commit(self.config.get('src_mysql', 'table_sm_renthouse_search'))

            if not self.db.table_exit('sm_renthouse_user_search'):
                self.db.sql_commit(self.config.get('src_mysql', 'table_sm_renthouse_user_search'))

            if not self.db.table_exit('sm_renthouse_house'):
                self.db.sql_commit("""
                    create table sm_renthouse_house(
                        urlmd5_id varchar(225) not null primary key,
                        search_urlmd5_id varchar(225),
                        url varchar(225),
                        money varchar(10),
                        address varchar(60),
                        publish_tm varchar(20),
                        publisher varchar(20),
                        publisher_tel varchar(20),
                        update_tm varchar(20))
                """)
        except Exception, e:
            print traceback.print_exc()
        finally:
            self.db.close_db()

    '''
    # 入口函数:scrapy crawl rentHouseSpider
    '''
    def start_requests(self):
        try:
            self.db = MysqlU('ini.cfg', 'src_mysql')
            # 查询需要爬去的任务
            tasks = self.db.fetchmany("""
                SELECT DISTINCT
                    srs.search_urlmd5_id,
                    srs.search_url,
                    srs.site_name
                FROM
                    sm_renthouse_search srs
                JOIN sm_renthouse_user_search srus ON srs.search_urlmd5_id = srus.search_urlmd5_id AND srus.yes_status = '1'
                JOIN sm_renthouse_user sru ON sru.id = srus.user_id AND sru.yes_receive = '1'
            """)

            for task in tasks:
                # 类似于generator（生成器），此时返回一个iterable对象，使用iterable_obj.next()获取下一条数据
                yield scrapy.Request(url=task[1], meta={'search_urlmd5_id': task[0], 'site_name': task[2]}, callback=self.parse)
        except Exception, e:
            print traceback.print_exc()
        finally:
            self.db.close_db()

    '''
    解析返回数据
    '''
    def parse(self, response):
        rentHouse = ItemLoader(item=RenthouseItem(), response=response)
        rentHouse.add_value('search_urlmd5_id', response.meta['search_urlmd5_id'])
        try:
            itemInfoCss = "#list-content>div.zu-itemmod>div.zu-info>"
            rentHouse.add_css("url", itemInfoCss + "h3>a::attr(href)")
            rentHouse.add_css("address", itemInfoCss + "address")

            yield scrapy.Request(rentHouse.load_item()['url'], meta={'rentHouse': rentHouse}, callback=self.parse_detail)
            # 此时就会调用pipelines
            yield rentHouse.load_item()
        except Exception, e:
            print traceback.print_exc()

    '''
    解析详细页面：https://sh.zu.anjuke.com/fangyuan/1086publish_tm462731
    '''
    def parse_detail(self, response):
        rentHouse = response.meta['rentHouse']

        try:
            rentHouse.add_value("publish_tm", response.css('div.mod-title>div.right-info::text').extract_first())
            rentHouse.add_value("money", response.css('ul.house-info-zufang>li.full-line>span.price>em::text').extract_first())
            rentHouse.add_value("publisher", response.css('div.broker-border>h2.broker-name::text').extract_first())
            # rentHouse.add_value("publisher_tel", response.css('p.broker-mobile::text').extract_first()) # 需要点击查看电话

            return rentHouse.load_item()
        except Exception, e:
            print traceback.print_exc()