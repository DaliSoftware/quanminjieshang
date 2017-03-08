/*
Navicat MySQL Data Transfer

Source Server         : ��������
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
  `store_name` varchar(200) DEFAULT NULL COMMENT '��������',
  `store_xingzhi` varchar(32) DEFAULT NULL COMMENT '�̵����ʣ�����������У�',
  `store_yewu_fanwei` varchar(1000) DEFAULT NULL COMMENT '��Ҫ�������̾�Ӫ��Χ',
  `store_huanyingci` varchar(1000) DEFAULT NULL COMMENT '��ӭ�ʣ������Թ˿͵Ļ�ӭ��',
  `store_fuzeren` varchar(64) DEFAULT NULL COMMENT '������',
  `store_fuzeren_id` varchar(32) DEFAULT NULL COMMENT '���������֤��',
  `store_fuzeren_sex` varchar(2) DEFAULT NULL COMMENT '�������Ա�',
  `store_fuzeren_role` varchar(64) DEFAULT NULL COMMENT '�����˽�ɫ��ũ�����չ��̣�',
  `store_fuzeren_image` varchar(200) DEFAULT NULL COMMENT '������ͷ��',
  `store_fuzeren_address` varchar(200) DEFAULT NULL COMMENT '���֤��ַ',
  `store_fuzeren_phone` varchar(32) DEFAULT NULL COMMENT '�����˵绰',
  `store_fuzeren_email` varchar(64) DEFAULT NULL COMMENT '����������',
  `store_address` varchar(200) DEFAULT NULL COMMENT '���̵�ַ',
  `store_longitude` varchar(32) DEFAULT NULL COMMENT '���̾���',
  `store_latitude` varchar(32) DEFAULT NULL COMMENT '����γ��',
  `store_status` varchar(32) DEFAULT NULL COMMENT '���̾�Ӫ״̬��������Ӫ���Ƿ���Ӫ����ͣ��Ӫ��ֹͣ��Ӫ��',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='������Ϣ';

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '�������ˮ�Ҵ��', '����', 'ũ����Ʒ���ۡ�ʳƷ��', '��ӭ�����Ҵ壬ף��������졢��;ƽ����', '�α���', '440281196012143787', '��', 'ũ�񡢴�֧��', '1', '�㶫ʡ�ع����ֲ����������ˮ�Ҵ�12��', '13456248756', null, '�㶫ʡ�ع����ֲ����������ˮ�Ҵ�㳡1��', '113.101738', '25.120011', '������Ӫ', '1', '2017-01-17 11:37:17', '1', '2017-01-17 11:37:22');
INSERT INTO `store` VALUES ('2', '�����򿪷���', '����', 'ũ����Ʒ���ۡ�����', '��ӭ���ٿ���壬�ⲻ�ǰ����˰참�Ŀ��⣬�мǣ�������ף����;ƽ��', '�����', '440281199011117312', '��', 'ũ�񡢴�ѧ������ҵ����', '2', '�㶫ʡ�ع����ֲ��������򿪷��13��', '13045126545', '87548756@qq.com', '�㶫ʡ�ع����ֲ��������򿪷���ί��', '113.119161', '25.089823', '������Ӫ', '1', '2017-01-17 11:54:01', '1', '2017-01-17 11:54:06');
INSERT INTO `store` VALUES ('3', '����������´��', '����', 'ũ����Ʒ���ۡ�����', '��ӭԶ�������Ŀ��ˣ�ף���������', '������', '440281199011037312', '��', 'ũ���ӵܡ���ҵ����', '3', '�㶫ʡ�ع����ֲ�������������´�33��', '13564824587', '985465278@qq.com', '�㶫ʡ�ع����ֲ�������������´���ſ�', '113.108804', '25.112012', '������Ӫ', '1', '2017-01-17 13:14:16', '1', '2017-01-17 13:14:21');

-- ----------------------------
-- Table structure for `ware`
-- ----------------------------
DROP TABLE IF EXISTS `ware`;
CREATE TABLE `ware` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '�̵�id',
  `ware_name` varchar(64) DEFAULT NULL COMMENT '��Ʒ����',
  `ware_type` varchar(32) DEFAULT NULL COMMENT '��Ʒ���ͣ�ũ��Ʒ��ũ����Ʒ��',
  `ware_exists` varchar(32) DEFAULT NULL COMMENT '�Ƿ��л�',
  `ware_status` varchar(32) DEFAULT NULL COMMENT '��Ʒ״̬�����ۡ��¼ܣ�',
  `ware_kucun` double(8,2) DEFAULT NULL COMMENT '�������۵���Ʒ�Ŀ��',
  `ware_unit` varchar(32) DEFAULT NULL COMMENT '��λ',
  `ware_is_yuding` varchar(32) DEFAULT NULL COMMENT '��Ʒ�Ƿ��Ѿ���Ԥ��',
  `ware_remark` varchar(1000) DEFAULT NULL COMMENT '��Ʒ˵��',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='��Ʒ��Ϣ';

-- ----------------------------
-- Records of ware
-- ----------------------------
INSERT INTO `ware` VALUES ('1', '1', '�ཷ', 'ũ��Ʒ', '1', null, '99999.00', 'kg', '0', '999���ཷ��Ƥ�����С��', '1', '2017-01-17 11:40:51', '1', '2017-01-17 11:40:55');
INSERT INTO `ware` VALUES ('2', '1', '����', 'ũ��Ʒ', '1', null, '999999.00', 'kg', '0', '��˵զ�Ǵ����������õġ������е�ߵ��������ǲ�������ʵ', '1', '2017-01-17 11:43:01', '1', '2017-01-17 11:43:08');
INSERT INTO `ware` VALUES ('3', '2', '�ཷ', 'ũ��Ʒ', '1', null, '88888.00', 'kg', '0', '������С�������㶮��', '1', '2017-01-17 11:56:40', '1', '2017-01-17 11:56:44');
INSERT INTO `ware` VALUES ('4', '2', '��Ƥ����', 'ũ��Ʒ', '1', null, '9999.00', 'kg', '0', '���Ժܴ�����ˮ�࣬�����˺ܷۣ������Թ��ɣ������������࣬���������Ʒ��', '1', '2017-01-17 13:08:33', '1', '2017-01-17 13:08:37');
INSERT INTO `ware` VALUES ('5', '3', '����', 'ũ��Ʒ', '1', null, '98989.00', 'kg', '0', '�����Ҵ������Ǵ�������ɺó��ˣ��������ɲ�������������ͷ���󣬱��Ǹ�������ó�N��', '1', '2017-01-17 13:16:46', '1', '2017-01-17 13:16:50');

-- ----------------------------
-- Table structure for `ware_show`
-- ----------------------------
DROP TABLE IF EXISTS `ware_show`;
CREATE TABLE `ware_show` (
  `wshow_id` int(11) NOT NULL AUTO_INCREMENT,
  `wshow_ware_id` int(11) DEFAULT NULL COMMENT '��Ʒid',
  `wshow_image` varchar(500) DEFAULT NULL COMMENT 'ͼƬid',
  `wshow_remark` varchar(1000) DEFAULT NULL COMMENT 'ͼƬ˵��',
  `wshow_jidu` int(3) DEFAULT NULL COMMENT '���ȣ���������һ�η���������ص���Ϣ������Ϊ1���ڶ����ٴ˷���ʱ������Ϊ2���Դ�����,ͨ������Ʒ����ʱ���ø�ֵ',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wshow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='��Ʒչʾ��Ϣ�������ϴ����ڷ�����ʾ��Ʒչʾ��Ϣ��';

-- ----------------------------
-- Records of ware_show
-- ----------------------------
INSERT INTO `ware_show` VALUES ('1', '1', '100', '�ֵ��˴���ʱ���ˣ�����զ�Ǵ��ũ����æʲô����ʼ���������أ��ڴ������к��ճ�', '1', '1', '2017-01-17 13:22:50', '1', '2017-01-17 13:22:55');
INSERT INTO `ware_show` VALUES ('2', '1', '101', 'ת�������Ѿ���׳�ɳ�Ϊ�ߴ���������ˣ�����������ļһ￪ʼ�����', '1', '1', '2017-01-17 13:25:00', '1', '2017-01-17 13:25:04');
INSERT INTO `ware_show` VALUES ('3', '1', '102', '�ۣ�������Ư����������ĵ�һ���أ�ϣ��������ü�Ǯ��Ҳϣ��Զ���Ŀ���ǰ����ժ����Ӵ', '1', '1', '2017-01-17 13:26:22', '1', '2017-01-17 13:26:26');
INSERT INTO `ware_show` VALUES ('4', '1', '103', 'ũ�񲮲����ճ�������', '1', '1', '2017-01-17 13:27:48', '1', '2017-01-17 13:27:52');
INSERT INTO `ware_show` VALUES ('5', '1', '104', 'ũ�񲮲����ճ�����ҩ��', '1', '1', '2017-01-17 13:28:39', '1', '2017-01-17 13:28:44');
INSERT INTO `ware_show` VALUES ('6', '1', '105', 'ũ�񲮲����ճ�����ժ', '1', '1', '2017-01-17 13:29:29', '1', '2017-01-17 13:29:32');
INSERT INTO `ware_show` VALUES ('7', '2', '106', '�ֵ��˴���ʱ���ˣ�����զ�Ǵ��ũ����æʲô����ʼ���������أ��ڴ������к��ճ�', '1', '1', '2017-01-17 13:22:50', '1', '2017-01-17 13:22:55');
INSERT INTO `ware_show` VALUES ('8', '2', '107', 'ת�������Ѿ���׳�ɳ�Ϊ�ߴ���������ˣ�����������ļһ￪ʼ�����', '1', '1', '2017-01-17 13:25:00', '1', '2017-01-17 13:25:04');
INSERT INTO `ware_show` VALUES ('9', '2', '108', '�ۣ�������Ư����������ĵ�һ���أ�ϣ��������ü�Ǯ��Ҳϣ��Զ���Ŀ���ǰ����ժ����Ӵ', '1', '1', '2017-01-17 13:26:22', '1', '2017-01-17 13:26:26');
INSERT INTO `ware_show` VALUES ('10', '2', '109', 'ũ�񲮲����ճ�������', '1', '1', '2017-01-17 13:27:48', '1', '2017-01-17 13:27:52');
INSERT INTO `ware_show` VALUES ('11', '2', '110', 'ũ�񲮲����ճ�����ҩ��', '1', '1', '2017-01-17 13:28:39', '1', '2017-01-17 13:28:44');
INSERT INTO `ware_show` VALUES ('12', '2', '111', 'ũ�񲮲����ճ�����ժ', '1', '1', '2017-01-17 13:29:29', '1', '2017-01-17 13:29:32');

-- ----------------------------
-- Table structure for `xiaoshou_celve`
-- ----------------------------
DROP TABLE IF EXISTS `xiaoshou_celve`;
CREATE TABLE `xiaoshou_celve` (
  `xscl_id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '��Ʒid',
  `xscl_name` varchar(200) DEFAULT NULL COMMENT '��������',
  `xscl_celve` varchar(1000) DEFAULT NULL COMMENT '�������',
  `xscl_begin_time` datetime DEFAULT NULL COMMENT '��ʼ����',
  `xscl_end_time` datetime DEFAULT NULL COMMENT 'ʧЧ����',
  `xscl_status` varchar(32) DEFAULT NULL COMMENT '�Ƿ���Ч',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`xscl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���۲���';

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
  `register_date` datetime DEFAULT NULL COMMENT 'ע������',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'ע���û����豸��ip',
  `register_phone` varchar(32) DEFAULT NULL COMMENT '����֤���ֻ���',
  `phone_error_count` int(2) DEFAULT NULL COMMENT '�ֻ���֤�������',
  `phone_verify_result` int(1) DEFAULT NULL COMMENT '�ֻ���֤���',
  `image_value` varchar(16) DEFAULT NULL COMMENT 'ͼ����֤���Ӧ����֤��',
  `image_verify_result` int(1) DEFAULT NULL COMMENT 'ͼ����֤����֤���',
  `image_error_count` int(2) DEFAULT NULL COMMENT 'ͼ����֤��������',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register_record
-- ----------------------------

