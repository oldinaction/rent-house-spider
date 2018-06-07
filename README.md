## 租房房源爬虫

### 简介

- 此程序是本人租房使用，开源仅供学习
- 此程序主要为了爬取最新的房源信息(租房)，暂时只爬取安居客房源，获取结果后以邮件的形式通知。

#### 功能

- 爬取安居客租房房源：上海、武汉
- 将数据存储在mysql数据库
- 定时检查最新结果并通过邮件发送爬取结果

### 安装python环境和依赖

- `python2.7`
- `pip`(windows默认已经安装，`pip list`查看安装插件)
- `pip install scrapy` v1.3
- `pip install ConfigParser`
- `pip install MySQL-python` mysql数据库

- 创建mysql数据库
- 导入rentHouse.sql表结构和数据

### 运行

- `python main.py`
- 脱机运行：`nohup python -u main.py > out.log 2>&1 &`
