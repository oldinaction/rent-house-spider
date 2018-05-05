# -*- coding: utf-8 -*-
import traceback
from configparser import ConfigParser

class ConfigU(object):
    '''
    配置文件工具类：
    
    (1) 依赖ConfigParser包 
    
    (2) 文件夹外部必须导入 from smutils.ConfigU import ConfigU (文件夹内部可导入import ConfigU, 但是这样将无法调用静态方法)
    
    1. 配置文件如：ini.cfg
    [admin]
    user = smalle
    password = aezocn
    
    2.初始化读取配置文件：config = ConfigU('ini.cfg') # 注意文件路径
    
    3.取值：config.items(self, 'admin')
    '''

    def __init__(self, fileName):
        '''
        初始化：fileName配置文件名
        '''
        super(ConfigU, self).__init__()
        try:
            self.fileName = fileName
            self.config = ConfigParser()
            self.config.read(fileName, 'utf-8')
        except IOError as e:
            print(traceback.print_exc())

    # 静态方法无参数, 类方法可以携带一个参数cls(类本身), 实例方法可携带self(实例本身)
    @staticmethod
    def get_common():
        '''
        获取通用配置
        '''
        return ConfigU('./common.cfg')

    def get(self, section, key):
        '''
        获取某个节点的某个配置项
        '''
        return self.config.get(section, key)

    def getint(self, section, key):
        '''
        获取某个节点的某个配置项的整形值
        '''
        return self.config.getint(section, key)

    def set(self, section, key, value):
        '''
        对某个节点新加配置项
        '''
        self.config.set(section, key, value)
        self.config.write(open(self.fileName, "w"))

    def sections(self):
        '''
        获取所有的配置文件节点(section)
        '''
        return self.config.sections()

    def add_section(self, section):
        '''
        增加新节点
        '''
        return self.config.add_section(section)

    def remove_section(self, section):
        '''
        删除指定节点
        '''
        return self.config.remove_section(section)

    def items(self, section):
        '''
        获取某个节点的所有配置项(items)
        '''
        return self.config.items(section)


'''
测试
'''
if __name__ == "__main__":
    config = ConfigU.get_common()
    print(config.get('send_email', 'host'))

