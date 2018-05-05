# -*- coding: utf-8 -*
# !/usr/bin/env python
import smtplib
import string

from smutils.ConfigU import ConfigU


class EmailU():
    @classmethod
    def init(cls):
        # 初始化配置
        # 从外面的main.py执行此处的路径必须是./smutils/common.cfg
        # cls.config = ConfigU.get_common()
        cls.config = ConfigU('./smutils/common.cfg')

        cls.section = 'send_email'
        cls.host = cls.config.get(cls.section, 'host')
        cls.port = cls.config.get(cls.section, 'port')
        cls.email_username = cls.config.get(cls.section, 'email_username')
        cls.email_password = cls.config.get(cls.section, 'email_password')
        cls.email_from = cls.config.get(cls.section, 'email_from')

    @classmethod
    def send_email(cls, email_to, subject, msg_body):
        '''
        发送邮件
        '''
        EmailU.init()

        # 邮件内容
        text = "%s" % msg_body
        body = string.join((
            "From: %s" % cls.email_from,
            "To: %s" % email_to,
            "Subject: %s" % subject,
            "",
            text
        ), "\r\n")

        # 防止一次发送失败, 循环发送3次
        for i in range(3):
            try:
                server = smtplib.SMTP()
                server.connect(cls.host, cls.port)
                # server.starttls()
                server.login(cls.email_username, cls.email_password)
                server.sendmail(cls.email_from, [email_to], body)
                server.quit()
                return True
            except Exception as e:
                print(e)
                continue


if __name__ == '__main__':
    EmailU.send_email('demo@aezo.cn', '主题:Hello', '内容:Hello World')