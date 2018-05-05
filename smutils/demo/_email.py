# -*- coding: utf-8 -*
# !/usr/bin/env python

import smtplib
import string


email_username = "oldinaction@qq.com"
email_password = "aezocn"

# email
info = "hello world!"


def send_email():
    HOST = "smtp.mxhichina.com"
    SUBJECT = "Backup Timer"
    # 收件人
    TO = "oldinaction@qq.com"
    # 发件人
    FROM = "oldinaction@qq.com"
    # 邮件内容
    text = "%s" % info
    BODY = string.join((
        "From: %s" % FROM,
        "To: %s" % TO,
        "Subject: %s" % SUBJECT,
        "",
        text
    ), "\r\n")
    # 防止一次发送失败,循环发送3次
    for i in range(3):
        try:
            server = smtplib.SMTP()
            server.connect(HOST, "25")
            # server.starttls()
            server.login(email_username, email_password)
            server.sendmail(FROM, [TO], BODY)
            server.quit()
            return True
        except Exception, error:
            print " \033[31m%s \033[0m" % error
            continue


if __name__ == '__main__':
    send_email()