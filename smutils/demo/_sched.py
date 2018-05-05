# -*- coding:utf-8 -*-
import time, sched

# 初始化sched模块的scheduler类
# 第一个参数是一个可以返回时间戳的函数，第二个参数可以在定时未到达之前阻塞。
schedule = sched.scheduler(time.time, time.sleep)


# 被周期性调度触发的函数
def run(command, inc):
    print "Current Time:", time.time(), 'msg:', command
    schedule.enter(inc, 0, run, (command, inc))


def main(command, inc=60):
    # enter四个参数分别为：间隔时间、优先级（用于同时间到达的两个事件同时执行时定序）、被调用触发的函数，
    # 给该触发函数的参数（tuple形式）
    schedule.enter(0, 0, run, (command, inc))
    schedule.run()


if __name__ == "__main__":
    main("hello", 3)
    # 此处被阻塞了
    print time.time()
