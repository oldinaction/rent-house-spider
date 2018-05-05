# -*- coding:utf-8 -*-
import traceback
import string
import os
import time

from smutils.EmailU import EmailU
from smutils.MysqlU import MysqlU


class SendEmail:
    def check_result(self):
        try:
            self.db = MysqlU('ini.cfg', 'src_mysql')
            # 查询是否有结果需要发送
            tasks = self.db.fetchmany("""
                        SELECT
                            sru.username,
                            sru.email,
                            srh.url,
                            srh.money,
                            srh.address,
                            srh.publish_tm,
                            srh.publisher,
                            srh.publisher_tel,
                            srh.search_urlmd5_id,
                            sru.id
                        FROM
                            sm_renthouse_house srh
                        JOIN sm_renthouse_user_search srus ON srh.search_urlmd5_id = srus.search_urlmd5_id 
                            AND srus.yes_status = '1' AND srus.yes_send = '0'
                        JOIN sm_renthouse_user sru ON sru.id = srus.user_id AND sru.yes_receive = '1'
                    """)

            for task in tasks:
                status = True
                email = task[1]

                if email != "":
                    subject = "最新租房信息：%s (%s)" % (task[3], task[4])
                    body = string.join((
                        "房源链接: %s" % task[2],
                        "价格: %s" % task[3],
                        "地址: %s" % task[4],
                        "发布时间: %s" % task[5],
                        "发布人: %s" % task[6],
                        "发布人联系方式: %s" % task[7],
                        "",
                    ), "\r\n")
                    status = EmailU.send_email(email, subject, body)

                if status:
                    os.system("echo 'date: %s, email: %s, url: %s' >> ./logs/info.log" % (
                        time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time())), email, task[2]))
                    # 修改记录状态用户房源查询关系表状态为已发送
                    self.db.sql_commit("""
                        UPDATE sm_renthouse_user_search SET yes_send = '1' WHERE search_urlmd5_id = '%s' AND user_id = %s
                    """ % (task[8], task[9]))
        except Exception as e:
            print(traceback.print_exc())
        finally:
            self.db.close_db()