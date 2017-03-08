/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : quanmingjieshang

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2017-01-17 17:15:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(200) DEFAULT NULL COMMENT '店铺名称',
  `store_xingzhi` varchar(32) DEFAULT NULL COMMENT '商店性质（个体或集体所有）',
  `store_yewu_fanwei` varchar(1000) DEFAULT NULL COMMENT '简要描述店铺经营范围',
  `store_huanyingci` varchar(1000) DEFAULT NULL COMMENT '欢迎词，店主对顾客的欢迎词',
  `store_fuzeren` varchar(64) DEFAULT NULL COMMENT '负责人',
  `store_fuzeren_id` varchar(32) DEFAULT NULL COMMENT '负责人身份证号',
  `store_fuzeren_sex` varchar(2) DEFAULT NULL COMMENT '负责人性别',
  `store_fuzeren_role` varchar(64) DEFAULT NULL COMMENT '负责人角色（农户、收购商）',
  `store_fuzeren_image` varchar(200) DEFAULT NULL COMMENT '负责人头像',
  `store_fuzeren_address` varchar(200) DEFAULT NULL COMMENT '身份证地址',
  `store_fuzeren_phone` varchar(32) DEFAULT NULL COMMENT '负责人电话',
  `store_fuzeren_email` varchar(64) DEFAULT NULL COMMENT '负责人邮箱',
  `store_address` varchar(200) DEFAULT NULL COMMENT '店铺地址',
  `store_longitude` varchar(32) DEFAULT NULL COMMENT '店铺经度',
  `store_latitude` varchar(32) DEFAULT NULL COMMENT '店铺纬度',
  `store_status` varchar(32) DEFAULT NULL COMMENT '店铺经营状态（正常经营、非法经营、暂停经营、停止经营）',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺信息';

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '云岩镇出水岩村店', '集体', '农副产品销售、食品店', '欢迎光临我村，祝您购物愉快、旅途平安！', '廖秉中', '440281196012143787', '男', '农民、村支书', '1', '广东省韶关市乐昌市云岩镇出水岩村12号', '13456248756', null, '广东省韶关市乐昌市云岩镇出水岩村广场1号', '113.101738', '25.120011', '正常经营', '1', '2017-01-17 11:37:17', '1', '2017-01-17 11:37:22');
INSERT INTO `store` VALUES ('2', '云岩镇开封村店', '集体', '农副产品销售、餐饮', '欢迎光临开封村，这不是包大人办案的开封，切记，嘻嘻。祝您旅途平安', '廖田佳', '440281199011117312', '男', '农民、大学生、创业青年', '2', '广东省韶关市乐昌市云岩镇开封村13号', '13045126545', '87548756@qq.com', '广东省韶关市乐昌市云岩镇开封村村委会', '113.119161', '25.089823', '正常经营', '1', '2017-01-17 11:54:01', '1', '2017-01-17 11:54:06');
INSERT INTO `store` VALUES ('3', '云岩镇岭脚下村店', '集体', '农副产品销售、餐饮', '欢迎远道而来的客人，祝您购物愉快', '廖林生', '440281199011037312', '男', '农民子弟、创业青年', '3', '广东省韶关市乐昌市云岩镇岭脚下村33号', '13564824587', '985465278@qq.com', '广东省韶关市乐昌市云岩镇岭脚下村大门口', '113.108804', '25.112012', '正常经营', '1', '2017-01-17 13:14:16', '1', '2017-01-17 13:14:21');

-- ----------------------------
-- Table structure for `ware`
-- ----------------------------
DROP TABLE IF EXISTS `ware`;
CREATE TABLE `ware` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '商店id',
  `ware_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `ware_type` varchar(32) DEFAULT NULL COMMENT '商品类型（农产品、农副产品）',
  `ware_exists` varchar(32) DEFAULT NULL COMMENT '是否有货',
  `ware_status` varchar(32) DEFAULT NULL COMMENT '商品状态（再售、下架）',
  `ware_kucun` double(8,2) DEFAULT NULL COMMENT '用来出售的商品的库存',
  `ware_unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `ware_is_yuding` varchar(32) DEFAULT NULL COMMENT '商品是否已经被预定',
  `ware_remark` varchar(1000) DEFAULT NULL COMMENT '商品说明',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- ----------------------------
-- Records of ware
-- ----------------------------
INSERT INTO `ware` VALUES ('1', '1', '青椒', '农产品', '1', null, '99999.00', 'kg', '0', '999号青椒，皮薄肉厚、小辣', '1', '2017-01-17 11:40:51', '1', '2017-01-17 11:40:55');
INSERT INTO `ware` VALUES ('2', '1', '茄子', '农产品', '1', null, '999999.00', 'kg', '0', '我说咋们村的茄子是最好的。尽管有点高调，但这是不争的事实', '1', '2017-01-17 11:43:01', '1', '2017-01-17 11:43:08');
INSERT INTO `ware` VALUES ('3', '2', '青椒', '农产品', '1', null, '88888.00', 'kg', '0', '很辣的小辣椒，你懂得', '1', '2017-01-17 11:56:40', '1', '2017-01-17 11:56:44');
INSERT INTO `ware` VALUES ('4', '2', '红皮番薯', '农产品', '1', null, '9999.00', 'kg', '0', '生吃很脆清甜水多，煮熟了很粉，板栗吃过吧，跟吃熟板栗差不多，想想就是上品啊', '1', '2017-01-17 13:08:33', '1', '2017-01-17 13:08:37');
INSERT INTO `ware` VALUES ('5', '3', '土豆', '农产品', '1', null, '98989.00', 'kg', '0', '不是我吹，我们村的土豆可好吃了，这土豆可不是马铃薯啊，个头不大，比那个马铃薯好吃N倍', '1', '2017-01-17 13:16:46', '1', '2017-01-17 13:16:50');

-- ----------------------------
-- Table structure for `ware_show`
-- ----------------------------
DROP TABLE IF EXISTS `ware_show`;
CREATE TABLE `ware_show` (
  `wshow_id` int(11) NOT NULL AUTO_INCREMENT,
  `wshow_ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `wshow_image` varchar(500) DEFAULT NULL COMMENT '图片id',
  `wshow_remark` varchar(1000) DEFAULT NULL COMMENT '图片说明',
  `wshow_jidu` int(3) DEFAULT NULL COMMENT '季度，比如今年第一次发布土豆相关的信息，季度为1，第二年再此发布时，季度为2，以此类推,通常在商品售完时设置该值',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wshow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品展示信息（根据上传日期分组显示商品展示信息）';

-- ----------------------------
-- Records of ware_show
-- ----------------------------
INSERT INTO `ware_show` VALUES ('1', '1', '100', '又到了春耕时节了，看看咋们村的农民在忙什么？开始播辣椒种呢，期待今年有好收成', '1', '1', '2017-01-17 13:22:50', '1', '2017-01-17 13:22:55');
INSERT INTO `ware_show` VALUES ('2', '1', '101', '转眼种子已经茁壮成长为高大的辣椒树了，看个别早熟的家伙开始结果嘞', '1', '1', '2017-01-17 13:25:00', '1', '2017-01-17 13:25:04');
INSERT INTO `ware_show` VALUES ('3', '1', '102', '哇，这辣椒漂亮咯，今年的第一批呢，希望能买个好价钱。也希望远方的客人前来采摘购买哟', '1', '1', '2017-01-17 13:26:22', '1', '2017-01-17 13:26:26');
INSERT INTO `ware_show` VALUES ('4', '1', '103', '农民伯伯的日常，锄草', '1', '1', '2017-01-17 13:27:48', '1', '2017-01-17 13:27:52');
INSERT INTO `ware_show` VALUES ('5', '1', '104', '农民伯伯的日常，大药。', '1', '1', '2017-01-17 13:28:39', '1', '2017-01-17 13:28:44');
INSERT INTO `ware_show` VALUES ('6', '1', '105', '农民伯伯的日常，采摘', '1', '1', '2017-01-17 13:29:29', '1', '2017-01-17 13:29:32');
INSERT INTO `ware_show` VALUES ('7', '2', '106', '又到了春耕时节了，看看咋们村的农民在忙什么？开始播茄子种呢，期待今年有好收成', '1', '1', '2017-01-17 13:22:50', '1', '2017-01-17 13:22:55');
INSERT INTO `ware_show` VALUES ('8', '2', '107', '转眼种子已经茁壮成长为高大的茄子树了，看个别早熟的家伙开始结果嘞', '1', '1', '2017-01-17 13:25:00', '1', '2017-01-17 13:25:04');
INSERT INTO `ware_show` VALUES ('9', '2', '108', '哇，这茄子漂亮咯，今年的第一批呢，希望能买个好价钱。也希望远方的客人前来采摘购买哟', '1', '1', '2017-01-17 13:26:22', '1', '2017-01-17 13:26:26');
INSERT INTO `ware_show` VALUES ('10', '2', '109', '农民伯伯的日常，锄草', '1', '1', '2017-01-17 13:27:48', '1', '2017-01-17 13:27:52');
INSERT INTO `ware_show` VALUES ('11', '2', '110', '农民伯伯的日常，大药。', '1', '1', '2017-01-17 13:28:39', '1', '2017-01-17 13:28:44');
INSERT INTO `ware_show` VALUES ('12', '2', '111', '农民伯伯的日常，采摘', '1', '1', '2017-01-17 13:29:29', '1', '2017-01-17 13:29:32');

-- ----------------------------
-- Table structure for `xiaoshou_celve`
-- ----------------------------
DROP TABLE IF EXISTS `xiaoshou_celve`;
CREATE TABLE `xiaoshou_celve` (
  `xscl_id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `xscl_name` varchar(200) DEFAULT NULL COMMENT '策略名称',
  `xscl_celve` varchar(1000) DEFAULT NULL COMMENT '具体策略',
  `xscl_begin_time` datetime DEFAULT NULL COMMENT '开始日期',
  `xscl_end_time` datetime DEFAULT NULL COMMENT '失效日期',
  `xscl_status` varchar(32) DEFAULT NULL COMMENT '是否生效',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`xscl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售策略';

-- ----------------------------
-- Records of xiaoshou_celve
-- ----------------------------



SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `register_record`
-- ----------------------------
DROP TABLE IF EXISTS `register_record`;
CREATE TABLE `register_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_date` datetime DEFAULT NULL COMMENT '注册日期',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT '注册用户的设备的ip',
  `register_phone` varchar(32) DEFAULT NULL COMMENT '被验证的手机号',
  `phone_error_count` int(2) DEFAULT NULL COMMENT '手机验证错误次数',
  `phone_verify_result` int(1) DEFAULT NULL COMMENT '手机验证结果',
  `image_value` varchar(16) DEFAULT NULL COMMENT '图像验证码对应的验证码',
  `image_verify_result` int(1) DEFAULT NULL COMMENT '图像验证码验证结果',
  `image_error_count` int(2) DEFAULT NULL COMMENT '图像验证码错误次数',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register_record
-- ----------------------------

