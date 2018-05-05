# -*- coding:utf-8 -*-
import threading
import time


def func(command, inc):
    print "I'm Timer,", command, inc
    # 再次调用达到循环调用Timer
    main(command, inc)


def main(command, inc):
    t = threading.Timer(inc, func, (command, inc))
    t.start()

'''
非阻塞的定时器
'''
if __name__ == "__main__":
    main("hello", 5)
    # 此处未被阻塞
    print time.time()



