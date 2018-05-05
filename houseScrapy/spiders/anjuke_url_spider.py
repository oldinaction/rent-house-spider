# -*- coding: utf-8 -*-
import traceback

import scrapy
from scrapy.contrib.loader import ItemLoader

from houseScrapy.items import RenthouseItem

from smutils.ConfigU import ConfigU
from smutils.MysqlU import MysqlU


class AnjukeUrlSpider(scrapy.Spider):
    '''
    爬取安居客url地址
    '''
    name = "AnjukeUrlSpider"

    # 区域找房
    search_url = 'https://wh.zu.anjuke.com/?from=navigation'

    # 减慢爬取速度为5s, 防止被禁
    download_delay = 60


    '''
    # 入口函数:scrapy crawl AnjukeUrlSpider
    '''
    def start_requests(self):
        try:
            yield scrapy.Request(url=self.search_url, meta={'pid': '1'}, callback=self.parse)
        except Exception as e:
            print(traceback.print_exc())

    '''
    解析区域
    '''
    def parse(self, response):
        try:
            self.db = MysqlU('ini.cfg', 'src_mysql')

            pid = response.meta['pid']
            for a in response.css('.items-list>div.items:nth-of-type(1)>span.elems-l>a'):
                name = a.css('::text').extract_first()
                url = a.css('::attr(href)').extract_first()

                pidNew = self.db.sql_create("""
                                insert into sm_renthouse_url(site, url_type, name, url, pid, is_leaf, level)
                                    values('anjuke', '1', '%s', '%s', %s, 1, 1)
                            """ % (name, url, pid))

                if pidNew is not None:
                    yield scrapy.Request(url=url, meta={'pid': pidNew}, callback=self.parse_region_sub)
        except Exception as e:
            print(traceback.print_exc())
        finally:
            self.db.close_db()

    '''
    解析子区域
    '''
    def parse_region_sub(self, response):
        try:
            self.db = MysqlU('ini.cfg', 'src_mysql')
            pid = response.meta['pid']

            a_css = ".items-list>div.items:nth-of-type(1)>span.elems-l>.sub-items>a"
            nameFirst = response.css(a_css).extract_first()
            if nameFirst is not None:
                for a in response.css(a_css):
                    name = a.css('::text').extract_first()
                    url = a.css('::attr(href)').extract_first()
                    self.db.sql_create("""
                                    insert into sm_renthouse_url(site, url_type, name, url, pid, is_leaf, level)
                                        values('anjuke', '1', '%s', '%s', %s, 1, 2)
                                """ % (name, url, pid))
        except Exception as e:
            print(traceback.print_exc())
        finally:
            self.db.close_db()