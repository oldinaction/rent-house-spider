/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2017-08-26 17:23:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sm_renthouse_house
-- ----------------------------
DROP TABLE IF EXISTS `sm_renthouse_house`;
CREATE TABLE `sm_renthouse_house` (
  `urlmd5_id` varchar(225) NOT NULL COMMENT '房源urlmd5',
  `search_urlmd5_id` varchar(225) DEFAULT NULL COMMENT '查询房源urlmd5',
  `url` varchar(225) DEFAULT NULL COMMENT '房源url',
  `money` varchar(10) DEFAULT NULL COMMENT '租金',
  `address` varchar(60) DEFAULT NULL COMMENT '地址',
  `publish_tm` varchar(20) DEFAULT NULL COMMENT '发布时间',
  `publisher` varchar(20) DEFAULT NULL COMMENT '发布人',
  `publisher_tel` varchar(20) DEFAULT NULL COMMENT '发布人联系方式',
  `update_tm` varchar(20) DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`urlmd5_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_renthouse_house
-- ----------------------------

-- ----------------------------
-- Table structure for sm_renthouse_search
-- ----------------------------
DROP TABLE IF EXISTS `sm_renthouse_search`;
CREATE TABLE `sm_renthouse_search` (
  `search_urlmd5_id` varchar(225) DEFAULT NULL COMMENT '查询房源urlmd5',
  `site_name` varchar(60) DEFAULT NULL COMMENT '房源站点名',
  `search_url` varchar(225) DEFAULT NULL COMMENT '查询房源url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_renthouse_search
-- ----------------------------
INSERT INTO `sm_renthouse_search` VALUES ('1d0097908f09a6fbaa713a02cb972e45', 'anjuke', 'https://sh.zu.anjuke.com/fangyuan/jiangpulu/je1300-js1000-px3/');

-- ----------------------------
-- Table structure for sm_renthouse_url
-- ----------------------------
DROP TABLE IF EXISTS `sm_renthouse_url`;
CREATE TABLE `sm_renthouse_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(255) DEFAULT NULL COMMENT '站点类型',
  `url_type` char(1) DEFAULT NULL COMMENT 'url类型：1区域找房，2地铁找房，0是全部',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT 'url中的部分值',
  `pid` int(11) DEFAULT NULL COMMENT '父节点id：0标识根节点',
  `is_leaf` char(1) DEFAULT NULL COMMENT '是否为叶子节点：0 代表非叶子节点，1代表叶子节点',
  `level` char(1) DEFAULT NULL COMMENT '层级：0标识第一层，即根节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_renthouse_url
-- ----------------------------
INSERT INTO `sm_renthouse_url` VALUES ('1', 'anjuke', '0', '上海', 'sh', '0', '0', '0');
INSERT INTO `sm_renthouse_url` VALUES ('2', 'anjuke', '0', '武汉', 'wh', '0', '0', '0');
INSERT INTO `sm_renthouse_url` VALUES ('63', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('64', 'anjuke', '1', '静安区', 'https://sh.zu.anjuke.com/fangyuan/jingan/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('65', 'anjuke', '1', '黄浦区', 'https://sh.zu.anjuke.com/fangyuan/huangpu/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('66', 'anjuke', '1', '徐汇区', 'https://sh.zu.anjuke.com/fangyuan/xuhui/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('67', 'anjuke', '1', '长宁区', 'https://sh.zu.anjuke.com/fangyuan/changning/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('68', 'anjuke', '1', '浦东新区', 'https://sh.zu.anjuke.com/fangyuan/pudong/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('69', 'anjuke', '1', '虹口区', 'https://sh.zu.anjuke.com/fangyuan/hongkou/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('70', 'anjuke', '1', '杨浦区', 'https://sh.zu.anjuke.com/fangyuan/yangpu/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('71', 'anjuke', '1', '普陀区', 'https://sh.zu.anjuke.com/fangyuan/putuo/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('72', 'anjuke', '1', '闵行区', 'https://sh.zu.anjuke.com/fangyuan/minhang/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('73', 'anjuke', '1', '宝山区', 'https://sh.zu.anjuke.com/fangyuan/baoshan/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('74', 'anjuke', '1', '嘉定区', 'https://sh.zu.anjuke.com/fangyuan/jiading/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('75', 'anjuke', '1', '松江区', 'https://sh.zu.anjuke.com/fangyuan/songjiang/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('76', 'anjuke', '1', '奉贤区', 'https://sh.zu.anjuke.com/fangyuan/fengxian/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('77', 'anjuke', '1', '金山区', 'https://sh.zu.anjuke.com/fangyuan/jinshan/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('78', 'anjuke', '1', '青浦区', 'https://sh.zu.anjuke.com/fangyuan/qingpu/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('79', 'anjuke', '1', '崇明县', 'https://sh.zu.anjuke.com/fangyuan/chongming/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('80', 'anjuke', '1', '上海周边', 'https://sh.zu.anjuke.com/fangyuan/shanghaizhoubian/', '1', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('81', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('82', 'anjuke', '1', '北郊站', 'https://sh.zu.anjuke.com/fangyuan/beijiaozhan/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('83', 'anjuke', '1', '曹家渡', 'https://sh.zu.anjuke.com/fangyuan/caojiadu/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('84', 'anjuke', '1', '大宁', 'https://sh.zu.anjuke.com/fangyuan/daninga/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('85', 'anjuke', '1', '大悦城', 'https://sh.zu.anjuke.com/fangyuan/dayuecheng/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('86', 'anjuke', '1', '江宁路', 'https://sh.zu.anjuke.com/fangyuan/jiangninglu/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('87', 'anjuke', '1', '静安寺', 'https://sh.zu.anjuke.com/fangyuan/jingansi/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('88', 'anjuke', '1', '南京西路', 'https://sh.zu.anjuke.com/fangyuan/nanjingxilu/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('89', 'anjuke', '1', '彭浦', 'https://sh.zu.anjuke.com/fangyuan/pengpua/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('90', 'anjuke', '1', '西藏北路', 'https://sh.zu.anjuke.com/fangyuan/xizangbeilua/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('91', 'anjuke', '1', '新客站', 'https://sh.zu.anjuke.com/fangyuan/xinkezhana/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('92', 'anjuke', '1', '永和', 'https://sh.zu.anjuke.com/fangyuan/yonghea/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('93', 'anjuke', '1', '闸北公园', 'https://sh.zu.anjuke.com/fangyuan/zhabeigongyuana/', '64', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('94', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('95', 'anjuke', '1', '打浦桥', 'https://sh.zu.anjuke.com/fangyuan/dapuqiaoa/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('96', 'anjuke', '1', '董家渡', 'https://sh.zu.anjuke.com/fangyuan/dongjiadu/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('97', 'anjuke', '1', '复兴公园', 'https://sh.zu.anjuke.com/fangyuan/fuxinggongyuana/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('98', 'anjuke', '1', '黄浦滨江', 'https://sh.zu.anjuke.com/fangyuan/huangpubinjiang/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('99', 'anjuke', '1', '老西门', 'https://sh.zu.anjuke.com/fangyuan/laoximen/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('100', 'anjuke', '1', '南京东路', 'https://sh.zu.anjuke.com/fangyuan/nanjingdonglu/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('101', 'anjuke', '1', '蓬莱公园', 'https://sh.zu.anjuke.com/fangyuan/penglaigongyuan/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('102', 'anjuke', '1', '人民广场', 'https://sh.zu.anjuke.com/fangyuan/renminguangchang/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('103', 'anjuke', '1', '世博滨江', 'https://sh.zu.anjuke.com/fangyuan/shibobinjiangb/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('104', 'anjuke', '1', '五里桥', 'https://sh.zu.anjuke.com/fangyuan/wuliqiaoa/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('105', 'anjuke', '1', '新天地', 'https://sh.zu.anjuke.com/fangyuan/xintiandia/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('106', 'anjuke', '1', '豫园', 'https://sh.zu.anjuke.com/fangyuan/yuyuan/', '65', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('107', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('108', 'anjuke', '1', '漕河泾', 'https://sh.zu.anjuke.com/fangyuan/caohejin/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('109', 'anjuke', '1', '长桥', 'https://sh.zu.anjuke.com/fangyuan/changqiao/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('110', 'anjuke', '1', '虹梅路', 'https://sh.zu.anjuke.com/fangyuan/hongmeilu/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('111', 'anjuke', '1', '华泾', 'https://sh.zu.anjuke.com/fangyuan/huajing/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('112', 'anjuke', '1', '华东理工', 'https://sh.zu.anjuke.com/fangyuan/huadongligong/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('113', 'anjuke', '1', '衡山路', 'https://sh.zu.anjuke.com/fangyuan/hengshanlu/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('114', 'anjuke', '1', '建国西路', 'https://sh.zu.anjuke.com/fangyuan/jianguoxilu/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('115', 'anjuke', '1', '康健', 'https://sh.zu.anjuke.com/fangyuan/kangjian/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('116', 'anjuke', '1', '龙华', 'https://sh.zu.anjuke.com/fangyuan/longhua/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('117', 'anjuke', '1', '上海南站', 'https://sh.zu.anjuke.com/fangyuan/shanghainanzhan/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('118', 'anjuke', '1', '田林', 'https://sh.zu.anjuke.com/fangyuan/tianlin/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('119', 'anjuke', '1', '万体馆', 'https://sh.zu.anjuke.com/fangyuan/wantiguan/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('120', 'anjuke', '1', '徐汇滨江', 'https://sh.zu.anjuke.com/fangyuan/xuhuibinjiang/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('121', 'anjuke', '1', '斜土路', 'https://sh.zu.anjuke.com/fangyuan/xietulu/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('122', 'anjuke', '1', '徐家汇', 'https://sh.zu.anjuke.com/fangyuan/xujiahui/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('123', 'anjuke', '1', '植物园', 'https://sh.zu.anjuke.com/fangyuan/zhiwuyuan/', '66', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('124', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('125', 'anjuke', '1', '北蔡', 'https://sh.zu.anjuke.com/fangyuan/beicai/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('126', 'anjuke', '1', '碧云', 'https://sh.zu.anjuke.com/fangyuan/biyun/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('127', 'anjuke', '1', '川沙', 'https://sh.zu.anjuke.com/fangyuan/chuansha/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('128', 'anjuke', '1', '曹路', 'https://sh.zu.anjuke.com/fangyuan/caolu/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('129', 'anjuke', '1', '大团', 'https://sh.zu.anjuke.com/fangyuan/datuan/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('130', 'anjuke', '1', '高东', 'https://sh.zu.anjuke.com/fangyuan/gaodong/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('131', 'anjuke', '1', '高行', 'https://sh.zu.anjuke.com/fangyuan/gaoxing/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('132', 'anjuke', '1', '惠南', 'https://sh.zu.anjuke.com/fangyuan/huinan/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('133', 'anjuke', '1', '航头', 'https://sh.zu.anjuke.com/fangyuan/hangtou/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('134', 'anjuke', '1', '合庆', 'https://sh.zu.anjuke.com/fangyuan/heqingg/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('135', 'anjuke', '1', '花木', 'https://sh.zu.anjuke.com/fangyuan/huamu/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('136', 'anjuke', '1', '金杨', 'https://sh.zu.anjuke.com/fangyuan/jinyangd/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('137', 'anjuke', '1', '金桥', 'https://sh.zu.anjuke.com/fangyuan/jinqiao/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('138', 'anjuke', '1', '康桥', 'https://sh.zu.anjuke.com/fangyuan/kangqiao/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('139', 'anjuke', '1', '芦潮港', 'https://sh.zu.anjuke.com/fangyuan/luchaogang/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('140', 'anjuke', '1', '老港', 'https://sh.zu.anjuke.com/fangyuan/laogang/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('141', 'anjuke', '1', '临港新城', 'https://sh.zu.anjuke.com/fangyuan/lingangxincheng/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('142', 'anjuke', '1', '联洋', 'https://sh.zu.anjuke.com/fangyuan/lianyang/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('143', 'anjuke', '1', '陆家嘴', 'https://sh.zu.anjuke.com/fangyuan/lujiazui/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('144', 'anjuke', '1', '泥城', 'https://sh.zu.anjuke.com/fangyuan/nicheng/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('145', 'anjuke', '1', '南码头', 'https://sh.zu.anjuke.com/fangyuan/nanmatou/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('146', 'anjuke', '1', '浦东机场', 'https://sh.zu.anjuke.com/fangyuan/pudongjichang/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('147', 'anjuke', '1', '书院', 'https://sh.zu.anjuke.com/fangyuan/shuyuan/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('148', 'anjuke', '1', '三林南', 'https://sh.zu.anjuke.com/fangyuan/sanlinnan/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('149', 'anjuke', '1', '孙桥', 'https://sh.zu.anjuke.com/fangyuan/sunqiao/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('150', 'anjuke', '1', '三林', 'https://sh.zu.anjuke.com/fangyuan/sanlin/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('151', 'anjuke', '1', '上南', 'https://sh.zu.anjuke.com/fangyuan/shangnan/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('152', 'anjuke', '1', '世博', 'https://sh.zu.anjuke.com/fangyuan/shiboa/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('153', 'anjuke', '1', '世纪公园', 'https://sh.zu.anjuke.com/fangyuan/shijigongyuan/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('154', 'anjuke', '1', '唐镇', 'https://sh.zu.anjuke.com/fangyuan/tangzhen/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('155', 'anjuke', '1', '塘桥', 'https://sh.zu.anjuke.com/fangyuan/tangqiao/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('156', 'anjuke', '1', '万祥', 'https://sh.zu.anjuke.com/fangyuan/wanxiang/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('157', 'anjuke', '1', '潍坊', 'https://sh.zu.anjuke.com/fangyuan/weifanga/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('158', 'anjuke', '1', '外高桥', 'https://sh.zu.anjuke.com/fangyuan/waigaoqiao/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('159', 'anjuke', '1', '宣桥', 'https://sh.zu.anjuke.com/fangyuan/xuanqiao/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('160', 'anjuke', '1', '新场', 'https://sh.zu.anjuke.com/fangyuan/xinchang/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('161', 'anjuke', '1', '杨思', 'https://sh.zu.anjuke.com/fangyuan/yangsi/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('162', 'anjuke', '1', '御桥', 'https://sh.zu.anjuke.com/fangyuan/yuqiaosh/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('163', 'anjuke', '1', '洋泾', 'https://sh.zu.anjuke.com/fangyuan/yangjing/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('164', 'anjuke', '1', '源深', 'https://sh.zu.anjuke.com/fangyuan/yuanshen/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('165', 'anjuke', '1', '杨东', 'https://sh.zu.anjuke.com/fangyuan/yangdong/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('166', 'anjuke', '1', '张江(东)', 'https://sh.zu.anjuke.com/fangyuan/zhangjiangdong/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('167', 'anjuke', '1', '周浦', 'https://sh.zu.anjuke.com/fangyuan/zhoupu/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('168', 'anjuke', '1', '张江', 'https://sh.zu.anjuke.com/fangyuan/zhangjiang/', '68', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('169', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('170', 'anjuke', '1', '北新泾', 'https://sh.zu.anjuke.com/fangyuan/beixinjing/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('171', 'anjuke', '1', '古北', 'https://sh.zu.anjuke.com/fangyuan/gubei/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('172', 'anjuke', '1', '虹桥机场', 'https://sh.zu.anjuke.com/fangyuan/hongqiaojichang/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('173', 'anjuke', '1', '虹桥', 'https://sh.zu.anjuke.com/fangyuan/hongqiaoz/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('174', 'anjuke', '1', '天山', 'https://sh.zu.anjuke.com/fangyuan/tianshan/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('175', 'anjuke', '1', '西郊', 'https://sh.zu.anjuke.com/fangyuan/xijiaod/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('176', 'anjuke', '1', '仙霞', 'https://sh.zu.anjuke.com/fangyuan/xianxia/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('177', 'anjuke', '1', '新华路', 'https://sh.zu.anjuke.com/fangyuan/xinhualu/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('178', 'anjuke', '1', '中山公园', 'https://sh.zu.anjuke.com/fangyuan/zhongshangongyuan/', '67', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('179', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('180', 'anjuke', '1', '鞍山', 'https://sh.zu.anjuke.com/fangyuan/anshan/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('181', 'anjuke', '1', '长白新村', 'https://sh.zu.anjuke.com/fangyuan/changbaixincun/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('182', 'anjuke', '1', '东外滩', 'https://sh.zu.anjuke.com/fangyuan/dongwaitan/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('183', 'anjuke', '1', '复兴岛', 'https://sh.zu.anjuke.com/fangyuan/fuxingdao/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('184', 'anjuke', '1', '黄兴公园', 'https://sh.zu.anjuke.com/fangyuan/huangxinggongyuan/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('185', 'anjuke', '1', '江湾体育场', 'https://sh.zu.anjuke.com/fangyuan/jiangwantiyuchang/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('186', 'anjuke', '1', '江浦路', 'https://sh.zu.anjuke.com/fangyuan/jiangpulu/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('187', 'anjuke', '1', '控江路', 'https://sh.zu.anjuke.com/fangyuan/kongjiangl/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('188', 'anjuke', '1', '五角场', 'https://sh.zu.anjuke.com/fangyuan/wujiaochang/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('189', 'anjuke', '1', '新江湾城', 'https://sh.zu.anjuke.com/fangyuan/xinjiangwancheng/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('190', 'anjuke', '1', '杨浦大桥', 'https://sh.zu.anjuke.com/fangyuan/yangpudaqiao/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('191', 'anjuke', '1', '中原', 'https://sh.zu.anjuke.com/fangyuan/zhongyuan/', '70', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('192', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('193', 'anjuke', '1', '北外滩', 'https://sh.zu.anjuke.com/fangyuan/beiwaitan/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('194', 'anjuke', '1', '大柏树', 'https://sh.zu.anjuke.com/fangyuan/dabaishu/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('195', 'anjuke', '1', '广中路', 'https://sh.zu.anjuke.com/fangyuan/guangzhonglu/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('196', 'anjuke', '1', '和平公园', 'https://sh.zu.anjuke.com/fangyuan/hepinggongyuan/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('197', 'anjuke', '1', '江湾镇', 'https://sh.zu.anjuke.com/fangyuan/jiangwanzhen/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('198', 'anjuke', '1', '凉城', 'https://sh.zu.anjuke.com/fangyuan/liangcheng/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('199', 'anjuke', '1', '鲁迅公园', 'https://sh.zu.anjuke.com/fangyuan/luxungongyuan/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('200', 'anjuke', '1', '临平路', 'https://sh.zu.anjuke.com/fangyuan/linpinglu/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('201', 'anjuke', '1', '曲阳', 'https://sh.zu.anjuke.com/fangyuan/quyang/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('202', 'anjuke', '1', '四川北路', 'https://sh.zu.anjuke.com/fangyuan/sichuanbeilu/', '69', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('203', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('204', 'anjuke', '1', '春申', 'https://sh.zu.anjuke.com/fangyuan/chunshen/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('205', 'anjuke', '1', '古北(闵行)', 'https://sh.zu.anjuke.com/fangyuan/gubeiminhang/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('206', 'anjuke', '1', '古美', 'https://sh.zu.anjuke.com/fangyuan/gumei/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('207', 'anjuke', '1', '航华', 'https://sh.zu.anjuke.com/fangyuan/hanghua/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('208', 'anjuke', '1', '华漕', 'https://sh.zu.anjuke.com/fangyuan/huacao/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('209', 'anjuke', '1', '金虹桥', 'https://sh.zu.anjuke.com/fangyuan/jinhongqiao/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('210', 'anjuke', '1', '静安新城', 'https://sh.zu.anjuke.com/fangyuan/jinganxincheng/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('211', 'anjuke', '1', '老闵行', 'https://sh.zu.anjuke.com/fangyuan/laominhang/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('212', 'anjuke', '1', '龙柏金汇', 'https://sh.zu.anjuke.com/fangyuan/longbaijinhui/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('213', 'anjuke', '1', '马桥', 'https://sh.zu.anjuke.com/fangyuan/maqiao/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('214', 'anjuke', '1', '梅陇', 'https://sh.zu.anjuke.com/fangyuan/meilong/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('215', 'anjuke', '1', '浦江镇', 'https://sh.zu.anjuke.com/fangyuan/pujiangzhen/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('216', 'anjuke', '1', '七宝', 'https://sh.zu.anjuke.com/fangyuan/qibao/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('217', 'anjuke', '1', '吴泾', 'https://sh.zu.anjuke.com/fangyuan/wujing/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('218', 'anjuke', '1', '莘庄', 'https://sh.zu.anjuke.com/fangyuan/xinzhuang/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('219', 'anjuke', '1', '颛桥', 'https://sh.zu.anjuke.com/fangyuan/zhuanqiao/', '72', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('220', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('221', 'anjuke', '1', '长征', 'https://sh.zu.anjuke.com/fangyuan/changzheng/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('222', 'anjuke', '1', '曹杨', 'https://sh.zu.anjuke.com/fangyuan/caoyang/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('223', 'anjuke', '1', '长风', 'https://sh.zu.anjuke.com/fangyuan/changfeng/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('224', 'anjuke', '1', '长寿', 'https://sh.zu.anjuke.com/fangyuan/changshoul/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('225', 'anjuke', '1', '光新', 'https://sh.zu.anjuke.com/fangyuan/guangxin/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('226', 'anjuke', '1', '甘泉宜川', 'https://sh.zu.anjuke.com/fangyuan/ganquanyichuan/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('227', 'anjuke', '1', '李子园', 'https://sh.zu.anjuke.com/fangyuan/liziyuan/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('228', 'anjuke', '1', '桃浦', 'https://sh.zu.anjuke.com/fangyuan/taopu/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('229', 'anjuke', '1', '万里', 'https://sh.zu.anjuke.com/fangyuan/wanli/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('230', 'anjuke', '1', '武宁', 'https://sh.zu.anjuke.com/fangyuan/wuning/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('231', 'anjuke', '1', '阳光威尼斯', 'https://sh.zu.anjuke.com/fangyuan/yangguangweinisi/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('232', 'anjuke', '1', '真如', 'https://sh.zu.anjuke.com/fangyuan/zhenru/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('233', 'anjuke', '1', '真光', 'https://sh.zu.anjuke.com/fangyuan/zhenguang/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('234', 'anjuke', '1', '中远两湾城', 'https://sh.zu.anjuke.com/fangyuan/zhongyuanliangwancheng/', '71', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('235', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('236', 'anjuke', '1', '安亭', 'https://sh.zu.anjuke.com/fangyuan/anting/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('237', 'anjuke', '1', '曹王', 'https://sh.zu.anjuke.com/fangyuan/caowang/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('238', 'anjuke', '1', '封浜', 'https://sh.zu.anjuke.com/fangyuan/fengbang/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('239', 'anjuke', '1', '方泰', 'https://sh.zu.anjuke.com/fangyuan/fangtai/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('240', 'anjuke', '1', '丰庄', 'https://sh.zu.anjuke.com/fangyuan/fengzhuang/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('241', 'anjuke', '1', '华亭', 'https://sh.zu.anjuke.com/fangyuan/huating/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('242', 'anjuke', '1', '菊园新区', 'https://sh.zu.anjuke.com/fangyuan/juyuanxinqu/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('243', 'anjuke', '1', '戬浜', 'https://sh.zu.anjuke.com/fangyuan/jianbang/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('244', 'anjuke', '1', '嘉定北', 'https://sh.zu.anjuke.com/fangyuan/jiadingbei/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('245', 'anjuke', '1', '嘉定新城', 'https://sh.zu.anjuke.com/fangyuan/jiadingxincheng/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('246', 'anjuke', '1', '江桥', 'https://sh.zu.anjuke.com/fangyuan/jiangqiao/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('247', 'anjuke', '1', '嘉定老城', 'https://sh.zu.anjuke.com/fangyuan/jiadinglaocheng/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('248', 'anjuke', '1', '马陆', 'https://sh.zu.anjuke.com/fangyuan/malu/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('249', 'anjuke', '1', '南翔新城', 'https://sh.zu.anjuke.com/fangyuan/nanxiangxincheng/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('250', 'anjuke', '1', '南翔', 'https://sh.zu.anjuke.com/fangyuan/nanxiang/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('251', 'anjuke', '1', '外冈', 'https://sh.zu.anjuke.com/fangyuan/waigang/', '74', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('252', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('253', 'anjuke', '1', '宝陈公路', 'https://sh.zu.anjuke.com/fangyuan/baochengonglu/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('254', 'anjuke', '1', '大场', 'https://sh.zu.anjuke.com/fangyuan/dachang/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('255', 'anjuke', '1', '大华', 'https://sh.zu.anjuke.com/fangyuan/dahua/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('256', 'anjuke', '1', '共富', 'https://sh.zu.anjuke.com/fangyuan/gongfu/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('257', 'anjuke', '1', '顾村', 'https://sh.zu.anjuke.com/fangyuan/gucun/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('258', 'anjuke', '1', '高境', 'https://sh.zu.anjuke.com/fangyuan/gaojing/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('259', 'anjuke', '1', '共康', 'https://sh.zu.anjuke.com/fangyuan/gongkang/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('260', 'anjuke', '1', '罗泾', 'https://sh.zu.anjuke.com/fangyuan/luojing/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('261', 'anjuke', '1', '罗店', 'https://sh.zu.anjuke.com/fangyuan/luodian/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('262', 'anjuke', '1', '淞宝', 'https://sh.zu.anjuke.com/fangyuan/songbao/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('263', 'anjuke', '1', '淞南', 'https://sh.zu.anjuke.com/fangyuan/songnan/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('264', 'anjuke', '1', '上大', 'https://sh.zu.anjuke.com/fangyuan/shangda/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('265', 'anjuke', '1', '通河', 'https://sh.zu.anjuke.com/fangyuan/tonghea/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('266', 'anjuke', '1', '杨行', 'https://sh.zu.anjuke.com/fangyuan/yanghang/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('267', 'anjuke', '1', '月浦', 'https://sh.zu.anjuke.com/fangyuan/yuepu/', '73', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('268', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('269', 'anjuke', '1', '海湾', 'https://sh.zu.anjuke.com/fangyuan/haiwana/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('270', 'anjuke', '1', '奉城', 'https://sh.zu.anjuke.com/fangyuan/fengcheng/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('271', 'anjuke', '1', '金汇', 'https://sh.zu.anjuke.com/fangyuan/jinhui/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('272', 'anjuke', '1', '南桥', 'https://sh.zu.anjuke.com/fangyuan/nanqiao/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('273', 'anjuke', '1', '平安', 'https://sh.zu.anjuke.com/fangyuan/pinganz/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('274', 'anjuke', '1', '青村南', 'https://sh.zu.anjuke.com/fangyuan/qingcunnan/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('275', 'anjuke', '1', '青村北', 'https://sh.zu.anjuke.com/fangyuan/qingcunbei/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('276', 'anjuke', '1', '四团', 'https://sh.zu.anjuke.com/fangyuan/situan/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('277', 'anjuke', '1', '西渡', 'https://sh.zu.anjuke.com/fangyuan/xidu/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('278', 'anjuke', '1', '庄行', 'https://sh.zu.anjuke.com/fangyuan/zhuanghang/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('279', 'anjuke', '1', '柘林', 'https://sh.zu.anjuke.com/fangyuan/zhelin/', '76', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('280', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('281', 'anjuke', '1', '车墩', 'https://sh.zu.anjuke.com/fangyuan/chedun/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('282', 'anjuke', '1', '洞泾', 'https://sh.zu.anjuke.com/fangyuan/dongjing/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('283', 'anjuke', '1', '九亭', 'https://sh.zu.anjuke.com/fangyuan/jiuting/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('284', 'anjuke', '1', '泖港', 'https://sh.zu.anjuke.com/fangyuan/maoxiang/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('285', 'anjuke', '1', '松江区其他', 'https://sh.zu.anjuke.com/fangyuan/songjiangquqita/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('286', 'anjuke', '1', '松江大学城', 'https://sh.zu.anjuke.com/fangyuan/songjiangdaxuecheng/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('287', 'anjuke', '1', '佘山', 'https://sh.zu.anjuke.com/fangyuan/sheshan/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('288', 'anjuke', '1', '松江老城', 'https://sh.zu.anjuke.com/fangyuan/songjianglaocheng/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('289', 'anjuke', '1', '泗泾', 'https://sh.zu.anjuke.com/fangyuan/sijing/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('290', 'anjuke', '1', '松江新城', 'https://sh.zu.anjuke.com/fangyuan/songjiangxincheng/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('291', 'anjuke', '1', '莘闵别墅区', 'https://sh.zu.anjuke.com/fangyuan/xinminbieshuqu/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('292', 'anjuke', '1', '新桥', 'https://sh.zu.anjuke.com/fangyuan/xinqiao/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('293', 'anjuke', '1', '叶榭', 'https://sh.zu.anjuke.com/fangyuan/yexiea/', '75', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('294', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('295', 'anjuke', '1', '白鹤', 'https://sh.zu.anjuke.com/fangyuan/baihe/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('296', 'anjuke', '1', '重固', 'https://sh.zu.anjuke.com/fangyuan/chonggu/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('297', 'anjuke', '1', '华新', 'https://sh.zu.anjuke.com/fangyuan/huanxin/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('298', 'anjuke', '1', '金泽', 'https://sh.zu.anjuke.com/fangyuan/jinzez/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('299', 'anjuke', '1', '青东农场', 'https://sh.zu.anjuke.com/fangyuan/qingdongnongchang/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('300', 'anjuke', '1', '青浦新城', 'https://sh.zu.anjuke.com/fangyuan/qingpuxincheng/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('301', 'anjuke', '1', '香花桥', 'https://sh.zu.anjuke.com/fangyuan/xianghuaqiao/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('302', 'anjuke', '1', '徐泾', 'https://sh.zu.anjuke.com/fangyuan/xujing/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('303', 'anjuke', '1', '朱家角', 'https://sh.zu.anjuke.com/fangyuan/zhujiajiao/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('304', 'anjuke', '1', '赵巷', 'https://sh.zu.anjuke.com/fangyuan/zhaoxiang/', '78', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('305', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('306', 'anjuke', '1', '漕泾', 'https://sh.zu.anjuke.com/fangyuan/caojing/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('307', 'anjuke', '1', '枫泾', 'https://sh.zu.anjuke.com/fangyuan/fengjing/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('308', 'anjuke', '1', '廊下', 'https://sh.zu.anjuke.com/fangyuan/langxiaz/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('309', 'anjuke', '1', '吕巷', 'https://sh.zu.anjuke.com/fangyuan/lvxiangz/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('310', 'anjuke', '1', '山阳', 'https://sh.zu.anjuke.com/fangyuan/shanyang/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('311', 'anjuke', '1', '石化', 'https://sh.zu.anjuke.com/fangyuan/shihua/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('312', 'anjuke', '1', '亭林', 'https://sh.zu.anjuke.com/fangyuan/tinglin/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('313', 'anjuke', '1', '朱行', 'https://sh.zu.anjuke.com/fangyuan/zhuhangz/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('314', 'anjuke', '1', '张堰', 'https://sh.zu.anjuke.com/fangyuan/zhangyand/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('315', 'anjuke', '1', '朱泾', 'https://sh.zu.anjuke.com/fangyuan/zhujing/', '77', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('316', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '80', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('317', 'anjuke', '1', '慈溪', 'https://sh.zu.anjuke.com/fangyuan/cixic/', '80', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('318', 'anjuke', '1', '湖州', 'https://sh.zu.anjuke.com/fangyuan/huzhouh/', '80', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('319', 'anjuke', '1', '嘉兴', 'https://sh.zu.anjuke.com/fangyuan/jiaxinga/', '80', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('320', 'anjuke', '1', '昆山', 'https://sh.zu.anjuke.com/fangyuan/kunshanc/', '80', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('321', 'anjuke', '1', '南通', 'https://sh.zu.anjuke.com/fangyuan/nantongnan/', '80', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('322', 'anjuke', '1', '苏州', 'https://sh.zu.anjuke.com/fangyuan/suzhoub/', '80', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('323', 'anjuke', '1', '全部', 'https://sh.zu.anjuke.com/fangyuan/p1/', '79', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('324', 'anjuke', '1', '长兴岛', 'https://sh.zu.anjuke.com/fangyuan/changxingdao/', '79', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('325', 'anjuke', '1', '崇明主城', 'https://sh.zu.anjuke.com/fangyuan/chongmingzhucheng/', '79', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('326', 'anjuke', '1', '横沙岛', 'https://sh.zu.anjuke.com/fangyuan/hengshadao/', '79', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('327', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('328', 'anjuke', '1', '武昌', 'https://wh.zu.anjuke.com/fangyuan/wuchanga/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('329', 'anjuke', '1', '洪山', 'https://wh.zu.anjuke.com/fangyuan/hongshana/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('330', 'anjuke', '1', '江岸', 'https://wh.zu.anjuke.com/fangyuan/jiangan/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('331', 'anjuke', '1', '汉阳', 'https://wh.zu.anjuke.com/fangyuan/hanyang/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('332', 'anjuke', '1', '东西湖', 'https://wh.zu.anjuke.com/fangyuan/dongxihu/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('333', 'anjuke', '1', '江夏', 'https://wh.zu.anjuke.com/fangyuan/jiangxiat/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('334', 'anjuke', '1', '江汉', 'https://wh.zu.anjuke.com/fangyuan/jianghana/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('335', 'anjuke', '1', '青山', 'https://wh.zu.anjuke.com/fangyuan/qingshan/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('336', 'anjuke', '1', '硚口', 'https://wh.zu.anjuke.com/fangyuan/qiaokou/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('337', 'anjuke', '1', '黄陂', 'https://wh.zu.anjuke.com/fangyuan/huangpiz/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('338', 'anjuke', '1', '沌口开发区', 'https://wh.zu.anjuke.com/fangyuan/zhuankoukaifaqu/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('339', 'anjuke', '1', '蔡甸', 'https://wh.zu.anjuke.com/fangyuan/caidianz/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('340', 'anjuke', '1', '新洲', 'https://wh.zu.anjuke.com/fangyuan/xinzhouz/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('341', 'anjuke', '1', '汉南', 'https://wh.zu.anjuke.com/fangyuan/hannanz/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('342', 'anjuke', '1', '其他', 'https://wh.zu.anjuke.com/fangyuan/qitao/', '2', '1', '1');
INSERT INTO `sm_renthouse_url` VALUES ('343', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('344', 'anjuke', '1', '白沙洲', 'https://wh.zu.anjuke.com/fangyuan/baishazhou/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('345', 'anjuke', '1', '陈家湾', 'https://wh.zu.anjuke.com/fangyuan/chenjiawan/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('346', 'anjuke', '1', '广埠屯', 'https://wh.zu.anjuke.com/fangyuan/guangbutun/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('347', 'anjuke', '1', '光谷关山', 'https://wh.zu.anjuke.com/fangyuan/guangguguanshan/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('348', 'anjuke', '1', '洪山周边', 'https://wh.zu.anjuke.com/fangyuan/hongshanzhoubian/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('349', 'anjuke', '1', '街道口', 'https://wh.zu.anjuke.com/fangyuan/jiedaokou/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('350', 'anjuke', '1', '珞狮南路', 'https://wh.zu.anjuke.com/fangyuan/luoshinanlu/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('351', 'anjuke', '1', '新南湖', 'https://wh.zu.anjuke.com/fangyuan/xinnanhu/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('352', 'anjuke', '1', '卓刀泉', 'https://wh.zu.anjuke.com/fangyuan/zhuodaoquan/', '329', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('353', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('354', 'anjuke', '1', '东湖东亭', 'https://wh.zu.anjuke.com/fangyuan/donghudongting/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('355', 'anjuke', '1', '傅家坡', 'https://wh.zu.anjuke.com/fangyuan/fujiapo/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('356', 'anjuke', '1', '积玉桥', 'https://wh.zu.anjuke.com/fangyuan/jiyuqiao/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('357', 'anjuke', '1', '粮道街', 'https://wh.zu.anjuke.com/fangyuan/liangdaojie/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('358', 'anjuke', '1', '南湖花园', 'https://wh.zu.anjuke.com/fangyuan/nanhuhuayuan/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('359', 'anjuke', '1', '司门口', 'https://wh.zu.anjuke.com/fangyuan/simenkou/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('360', 'anjuke', '1', '水果湖', 'https://wh.zu.anjuke.com/fangyuan/shuiguohu/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('361', 'anjuke', '1', '团结大道', 'https://wh.zu.anjuke.com/fangyuan/tuanjiedadao/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('362', 'anjuke', '1', '武昌周边', 'https://wh.zu.anjuke.com/fangyuan/wuchangzhoubian/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('363', 'anjuke', '1', '武昌火车站', 'https://wh.zu.anjuke.com/fangyuan/wuchanghuochezhan/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('364', 'anjuke', '1', '武泰闸烽火', 'https://wh.zu.anjuke.com/fangyuan/wutaizhafenghuo/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('365', 'anjuke', '1', '徐家棚', 'https://wh.zu.anjuke.com/fangyuan/xujiapeng/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('366', 'anjuke', '1', '徐东', 'https://wh.zu.anjuke.com/fangyuan/xudong/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('367', 'anjuke', '1', '小东门', 'https://wh.zu.anjuke.com/fangyuan/xiaodongmen/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('368', 'anjuke', '1', '杨园', 'https://wh.zu.anjuke.com/fangyuan/yangyuand/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('369', 'anjuke', '1', '阅马场首义', 'https://wh.zu.anjuke.com/fangyuan/yuemachangshouyi/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('370', 'anjuke', '1', '紫阳路', 'https://wh.zu.anjuke.com/fangyuan/ziyanglu/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('371', 'anjuke', '1', '中华路', 'https://wh.zu.anjuke.com/fangyuan/zhonghualud/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('372', 'anjuke', '1', '中南丁字桥', 'https://wh.zu.anjuke.com/fangyuan/zhongnandingziqiao/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('373', 'anjuke', '1', '中北路', 'https://wh.zu.anjuke.com/fangyuan/zhongbeilu/', '328', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('374', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('375', 'anjuke', '1', '蔡甸', 'https://wh.zu.anjuke.com/fangyuan/caidiana/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('376', 'anjuke', '1', '建港', 'https://wh.zu.anjuke.com/fangyuan/jiangangd/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('377', 'anjuke', '1', '七里庙', 'https://wh.zu.anjuke.com/fangyuan/qilimiao/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('378', 'anjuke', '1', '四新', 'https://wh.zu.anjuke.com/fangyuan/sixind/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('379', 'anjuke', '1', '升官渡', 'https://wh.zu.anjuke.com/fangyuan/shengguandu/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('380', 'anjuke', '1', '王家湾', 'https://wh.zu.anjuke.com/fangyuan/wangjiawan/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('381', 'anjuke', '1', '鹦鹉大道', 'https://wh.zu.anjuke.com/fangyuan/yingwudadao/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('382', 'anjuke', '1', '沌口', 'https://wh.zu.anjuke.com/fangyuan/zhuankou/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('383', 'anjuke', '1', '钟家村', 'https://wh.zu.anjuke.com/fangyuan/zhongjiacun/', '331', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('384', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('385', 'anjuke', '1', '大智路', 'https://wh.zu.anjuke.com/fangyuan/dazhilu/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('386', 'anjuke', '1', '二七百步亭', 'https://wh.zu.anjuke.com/fangyuan/erqibaibuting/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('387', 'anjuke', '1', '后湖', 'https://wh.zu.anjuke.com/fangyuan/houhu/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('388', 'anjuke', '1', '黄埔惠济', 'https://wh.zu.anjuke.com/fangyuan/huangpuhuiji/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('389', 'anjuke', '1', '建设大道', 'https://wh.zu.anjuke.com/fangyuan/jianshedadao/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('390', 'anjuke', '1', '江汉路', 'https://wh.zu.anjuke.com/fangyuan/jianghanlu/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('391', 'anjuke', '1', '球场街', 'https://wh.zu.anjuke.com/fangyuan/qiuchangjied/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('392', 'anjuke', '1', '三阳路', 'https://wh.zu.anjuke.com/fangyuan/sanyanglu/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('393', 'anjuke', '1', '台北香港路', 'https://wh.zu.anjuke.com/fangyuan/taibeixiangganglu/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('394', 'anjuke', '1', '永清街', 'https://wh.zu.anjuke.com/fangyuan/yongqingjie/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('395', 'anjuke', '1', '竹叶山花桥', 'https://wh.zu.anjuke.com/fangyuan/zhuyeshanhuaqiao/', '330', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('396', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('397', 'anjuke', '1', '藏龙岛', 'https://wh.zu.anjuke.com/fangyuan/canglongdao/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('398', 'anjuke', '1', '东湖高新', 'https://wh.zu.anjuke.com/fangyuan/donghugaoxin/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('399', 'anjuke', '1', '金口', 'https://wh.zu.anjuke.com/fangyuan/jinkou/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('400', 'anjuke', '1', '江夏周边', 'https://wh.zu.anjuke.com/fangyuan/jiangxiazhoubian/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('401', 'anjuke', '1', '流芳', 'https://wh.zu.anjuke.com/fangyuan/liufangt/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('402', 'anjuke', '1', '庙山', 'https://wh.zu.anjuke.com/fangyuan/miaoshan/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('403', 'anjuke', '1', '乌龙泉', 'https://wh.zu.anjuke.com/fangyuan/wulongquan/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('404', 'anjuke', '1', '银河湾', 'https://wh.zu.anjuke.com/fangyuan/yinhewan/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('405', 'anjuke', '1', '纸坊', 'https://wh.zu.anjuke.com/fangyuan/zhifang/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('406', 'anjuke', '1', '郑店', 'https://wh.zu.anjuke.com/fangyuan/zhengdiant/', '333', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('407', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '332', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('408', 'anjuke', '1', '常青花园', 'https://wh.zu.anjuke.com/fangyuan/changqinghuayuan/', '332', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('409', 'anjuke', '1', '将军路', 'https://wh.zu.anjuke.com/fangyuan/jiangjunlu/', '332', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('410', 'anjuke', '1', '金银湖', 'https://wh.zu.anjuke.com/fangyuan/jinyinhu/', '332', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('411', 'anjuke', '1', '吴家山', 'https://wh.zu.anjuke.com/fangyuan/wujiashan/', '332', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('412', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('413', 'anjuke', '1', '工业大道', 'https://wh.zu.anjuke.com/fangyuan/gongyedadaod/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('414', 'anjuke', '1', '钢都花园', 'https://wh.zu.anjuke.com/fangyuan/gangduhuayuan/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('415', 'anjuke', '1', '和平大道', 'https://wh.zu.anjuke.com/fangyuan/hepingdadao/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('416', 'anjuke', '1', '红钢城', 'https://wh.zu.anjuke.com/fangyuan/honggangcheng/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('417', 'anjuke', '1', '建设七路', 'https://wh.zu.anjuke.com/fangyuan/jiansheqilu/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('418', 'anjuke', '1', '建二', 'https://wh.zu.anjuke.com/fangyuan/jianer/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('419', 'anjuke', '1', '青山周边', 'https://wh.zu.anjuke.com/fangyuan/qingshanzhoubiand/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('420', 'anjuke', '1', '冶金大道', 'https://wh.zu.anjuke.com/fangyuan/yanjindadao/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('421', 'anjuke', '1', '余家头', 'https://wh.zu.anjuke.com/fangyuan/yujiatou/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('422', 'anjuke', '1', '友谊大道', 'https://wh.zu.anjuke.com/fangyuan/youyidadao/', '335', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('423', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('424', 'anjuke', '1', '复兴村常码头', 'https://wh.zu.anjuke.com/fangyuan/fuxingcunchangmatou/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('425', 'anjuke', '1', '红旗渠', 'https://wh.zu.anjuke.com/fangyuan/hongqiqu/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('426', 'anjuke', '1', '六渡桥', 'https://wh.zu.anjuke.com/fangyuan/liuduqiao/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('427', 'anjuke', '1', '唐家墩', 'https://wh.zu.anjuke.com/fangyuan/tangjiadun/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('428', 'anjuke', '1', '王家墩', 'https://wh.zu.anjuke.com/fangyuan/wangjiadun/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('429', 'anjuke', '1', '武广万松园', 'https://wh.zu.anjuke.com/fangyuan/wuguangwansongyuan/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('430', 'anjuke', '1', '新华路', 'https://wh.zu.anjuke.com/fangyuan/xinhualuj/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('431', 'anjuke', '1', '西北湖', 'https://wh.zu.anjuke.com/fangyuan/xibeihu/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('432', 'anjuke', '1', '杨汊湖', 'https://wh.zu.anjuke.com/fangyuan/yangchahu/', '334', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('433', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('434', 'anjuke', '1', '黄陂周边', 'https://wh.zu.anjuke.com/fangyuan/huangpizhoubian/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('435', 'anjuke', '1', '横店', 'https://wh.zu.anjuke.com/fangyuan/hengdianz/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('436', 'anjuke', '1', '汉口北', 'https://wh.zu.anjuke.com/fangyuan/hankoubei/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('437', 'anjuke', '1', '罗汉寺', 'https://wh.zu.anjuke.com/fangyuan/luohansi/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('438', 'anjuke', '1', '盘龙城', 'https://wh.zu.anjuke.com/fangyuan/panlongcheng/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('439', 'anjuke', '1', '祁家湾', 'https://wh.zu.anjuke.com/fangyuan/qijiawan/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('440', 'anjuke', '1', '前川', 'https://wh.zu.anjuke.com/fangyuan/qianchuan/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('441', 'anjuke', '1', '滠口', 'https://wh.zu.anjuke.com/fangyuan/shekouz/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('442', 'anjuke', '1', '天河', 'https://wh.zu.anjuke.com/fangyuan/tianhez/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('443', 'anjuke', '1', '武湖', 'https://wh.zu.anjuke.com/fangyuan/wuhuz/', '337', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('444', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '336', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('445', 'anjuke', '1', '宝丰崇仁', 'https://wh.zu.anjuke.com/fangyuan/baofengchongren/', '336', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('446', 'anjuke', '1', '古田', 'https://wh.zu.anjuke.com/fangyuan/gutian/', '336', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('447', 'anjuke', '1', '汉正街', 'https://wh.zu.anjuke.com/fangyuan/hanzhengjie/', '336', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('448', 'anjuke', '1', '武胜路', 'https://wh.zu.anjuke.com/fangyuan/wushenglu/', '336', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('449', 'anjuke', '1', '宗关简易', 'https://wh.zu.anjuke.com/fangyuan/zongguanjianyi/', '336', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('450', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '339', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('451', 'anjuke', '1', '蔡甸周边', 'https://wh.zu.anjuke.com/fangyuan/caidianzhoubian/', '339', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('452', 'anjuke', '1', '蔡甸城区', 'https://wh.zu.anjuke.com/fangyuan/caidianchengqu/', '339', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('453', 'anjuke', '1', '恒大绿洲', 'https://wh.zu.anjuke.com/fangyuan/hengdalvzhou/', '339', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('454', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '338', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('455', 'anjuke', '1', '郭徐岭广场', 'https://wh.zu.anjuke.com/fangyuan/guoxulingguangchang/', '338', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('456', 'anjuke', '1', '后官湖大道', 'https://wh.zu.anjuke.com/fangyuan/houguanhudadao/', '338', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('457', 'anjuke', '1', '金色港湾', 'https://wh.zu.anjuke.com/fangyuan/jinsegangwan/', '338', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('458', 'anjuke', '1', '江汉大学', 'https://wh.zu.anjuke.com/fangyuan/jianghandaxue/', '338', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('459', 'anjuke', '1', '体育中心', 'https://wh.zu.anjuke.com/fangyuan/tiyuzhongxinz/', '338', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('460', 'anjuke', '1', '沌口周边', 'https://wh.zu.anjuke.com/fangyuan/zhuankouzhoubian/', '338', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('461', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '341', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('462', 'anjuke', '1', '汉南', 'https://wh.zu.anjuke.com/fangyuan/hannany/', '341', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('463', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '340', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('464', 'anjuke', '1', '新洲', 'https://wh.zu.anjuke.com/fangyuan/xinzhouy/', '340', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('465', 'anjuke', '1', '全部', 'https://wh.zu.anjuke.com/fangyuan/p1/', '342', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('466', 'anjuke', '1', '蔡甸', 'https://wh.zu.anjuke.com/fangyuan/caidian/', '342', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('467', 'anjuke', '1', '汉南', 'https://wh.zu.anjuke.com/fangyuan/hannan/', '342', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('468', 'anjuke', '1', '黄陂', 'https://wh.zu.anjuke.com/fangyuan/huangpi/', '342', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('469', 'anjuke', '1', '江夏', 'https://wh.zu.anjuke.com/fangyuan/jiangxia/', '342', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('470', 'anjuke', '1', '其他', 'https://wh.zu.anjuke.com/fangyuan/qitap/', '342', '1', '2');
INSERT INTO `sm_renthouse_url` VALUES ('471', 'anjuke', '1', '新洲', 'https://wh.zu.anjuke.com/fangyuan/xinzhoua/', '342', '1', '2');

-- ----------------------------
-- Table structure for sm_renthouse_user
-- ----------------------------
DROP TABLE IF EXISTS `sm_renthouse_user`;
CREATE TABLE `sm_renthouse_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) DEFAULT NULL COMMENT '用户名',
  `password` varchar(225) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(60) DEFAULT NULL COMMENT '昵称',
  `email` varchar(225) DEFAULT NULL COMMENT '邮箱',
  `wx_openid` varchar(225) DEFAULT NULL COMMENT '微信用户唯一标识（小程序）',
  `yes_receive` char(1) DEFAULT NULL COMMENT '是否接受推送（1接受，0不接受）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_renthouse_user
-- ----------------------------
INSERT INTO `sm_renthouse_user` VALUES ('1', 'smalle', 'aezocn', 'smalle', 'oldinaction@qq.com', 'oDJ8P0b1z7GwfSzRx6AlkCP1gACM', '1');

-- ----------------------------
-- Table structure for sm_renthouse_user_search
-- ----------------------------
DROP TABLE IF EXISTS `sm_renthouse_user_search`;
CREATE TABLE `sm_renthouse_user_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `search_urlmd5_id` varchar(225) DEFAULT NULL COMMENT '查询房源urlmd5',
  `yes_send` char(1) DEFAULT NULL COMMENT '是否已经发送（1已发送，0未发送）',
  `yes_status` char(1) DEFAULT NULL COMMENT '是否有效（1有效，0无效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_renthouse_user_search
-- ----------------------------
INSERT INTO `sm_renthouse_user_search` VALUES ('1', '1', '1d0097908f09a6fbaa713a02cb972e45', '0', '1');
