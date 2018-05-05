# -*- coding:utf-8 -*-
import os, threading, sys, datetime
import scrapy.cmdline as cmdline

from result.SendEmail import SendEmail


# 把 str 编码由 ascii 改为 utf8(否则会导致其他文件运行出错，如SendEmail组装邮件内容出错)
# "UnicodeDecodeError: 'ascii' codec can't decode byte 0xe6 in position 0: ordinal not in range(128)"
reload(sys)
sys.setdefaultencoding('utf8')


# 程序运行时间段：每天8点到21点运行
time_section = (8, 20)
# 爬取时间间隔(秒)
main_scrapy_interval = 60*15
# 检查爬取结果时间间隔
main_check_result_interval = 60*15


'''
线程：继承父类threading.Thread
'''
class ScrapyThread (threading.Thread):
    def __init__(self, threadID, name, counter):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter

    # 把要执行的代码写到run函数里面 线程在创建后会直接运行run函数
    def run(self):
        print('Thread: %s running' % self.name)
        main_scrapy("scrapy crawl rentHouseSpider", main_scrapy_interval)


class CheckResultThread (threading.Thread):
    def __init__(self, threadID, name, counter):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter

    def run(self):
        print('Thread: %s running' % self.name)
        main_check_result("", main_check_result_interval)


'''
爬虫
'''
def run_scrapy(command, inc):
    # 启动爬虫
    if time_section[0] <= datetime.datetime.now().hour <= time_section[1]:
        # cmdline.execute("scrapy crawl rentHouseSpider".split())
        os.system(command)
    main_scrapy(command, inc)


def main_scrapy(command, inc=60):
    t = threading.Timer(inc, run_scrapy, (command, inc))
    t.start()


'''
检查搜索结果
'''
def run_check_result(command, inc):
    # 发送邮件
    if time_section[0] <= datetime.datetime.now().hour <= time_section[1]:
        sender = SendEmail()
        sender.check_result()
    main_check_result(command, inc)


def main_check_result(command, inc=60):
    t = threading.Timer(inc, run_check_result, (command, inc))
    t.start()


'''
主方法
'''
def main():
    # 运行shell命令
    os.system("dir")
    os.system("rm ./logs/error.log ./logs/info.log")
    os.system("touch ./logs/error.log ./logs/info.log")

    # 创建新线程
    scrapy_thread = ScrapyThread(1, "ScrapyThread", 1)
    check_result_thread = CheckResultThread(2, "CheckResultThread", 2)

    # 开启线程
    scrapy_thread.start()
    check_result_thread.start()

'''
启动租房神器
'''
if __name__ == "__main__":
    # main()
    os.system("scrapy crawl rentHouseSpider") # 爬取房源(运行一次)
    # os.system("scrapy crawl AnjukeUrlSpider") # 爬取搜房url