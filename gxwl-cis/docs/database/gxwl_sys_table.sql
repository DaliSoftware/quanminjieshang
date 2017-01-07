/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : quanmingjieshang

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2016-12-30 10:14:40
*/

-- ----------------------------
-- Table structure for `gxwl_sys_attach`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_attach`;
CREATE TABLE `gxwl_sys_attach` (
  `ATTACH_ID` int(11) NOT NULL COMMENT '附件主键',
  `MODEL_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模块类型',
  `MODEL_ID` int(11) NOT NULL COMMENT '模块主键',
  `ATTACH_SHOW_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '附件显示名称',
  `ATTACH_SAVE_NAME` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '附件保存名称',
  `ATTACH_URL` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '附件地址',
  `DOC_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文件类型',
  `DOC_SIZE` double(20,2) NOT NULL COMMENT '文件大小，单位kb',
  `DOC_OPEN_PROGRAM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '默认打开方式',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ATTACH_ID`),
  KEY `FK_5hn33i304l3fl1rbvgf8g0996` (`CREATE_BY`),
  KEY `FK_p85cn55k3j3wabksnxi2ytxa7` (`LAST_UPDATE_BY`),
  CONSTRAINT `FK_5hn33i304l3fl1rbvgf8g0996` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_p85cn55k3j3wabksnxi2ytxa7` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of gxwl_sys_attach
-- ----------------------------

-- ----------------------------
-- Table structure for `gxwl_sys_client_version`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_client_version`;
CREATE TABLE `gxwl_sys_client_version` (
  `VERSION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `FILE_NUMBER` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件号',
  `CLIENT_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户端类型',
  `VERSION_DESC` text COMMENT '更新说明',
  `CLIENT_URL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '位置',
  `FILE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件名',
  `VERSION_NUMBER` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '版本号',
  `IS_LAST` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否当前版本',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`VERSION_ID`),
  UNIQUE KEY `UI_GXWL_SYS_CLIENT_VERSION01` (`FILE_NUMBER`,`VERSION_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='客户端更新记录';

-- ----------------------------
-- Records of gxwl_sys_client_version
-- ----------------------------
INSERT INTO `gxwl_sys_client_version` VALUES ('6', '200888', 'Android', '', '1668', 'gdgxwl-cis-2016-5-9.1.0.1.apk', '1.0.1', 'Y', '', '1', '2014-08-15 11:26:09', '1', '2016-05-09 17:01:26');

-- ----------------------------
-- Table structure for `gxwl_sys_coderule`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_coderule`;
CREATE TABLE `gxwl_sys_coderule` (
  `CODERULE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CODERULE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编码',
  `CODERULE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `PREFIX` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '前缀',
  `SUFFIX` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '后缀',
  `IS_RANDOM` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否随机串',
  `RANDOM_NUMBER` int(11) DEFAULT NULL COMMENT '随机串长度',
  `CYC_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '循环周期',
  `CYC_FORMAT` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '序号格式',
  `SERIAL_NUMBER` int(11) DEFAULT NULL COMMENT '流水号长度',
  `MIN_VALUE` int(11) DEFAULT NULL COMMENT '流水号最小值',
  `MAX_VALUE` int(11) DEFAULT NULL COMMENT '流水号最大值',
  `CURRENT_VALUE` int(11) DEFAULT NULL COMMENT '当前流水值',
  `SERIAL_STEP` int(11) DEFAULT NULL COMMENT '流水号增量',
  `VALID_DATE` date NOT NULL COMMENT '生效日期',
  `INVALID_DATE` date DEFAULT NULL COMMENT '失效日期',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`CODERULE_ID`),
  UNIQUE KEY `U_GXWL_SYS_CODERULE01` (`CODERULE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='自动编号';

-- ----------------------------
-- Records of gxwl_sys_coderule
-- ----------------------------
INSERT INTO `gxwl_sys_coderule` VALUES ('1', 'EA', '批文', 'EA', null, '', '6', null, 'yyyyMMdd', '4', '0', '9999', '161', '1', '2014-03-01', null, null, '1', '2014-03-14 00:00:00', '1', '2016-04-25 20:18:25');
INSERT INTO `gxwl_sys_coderule` VALUES ('2', 'AJXZ', '案件性质', 'AJXZ', null, null, '0', null, 'yyyy', '6', '0', '999999', '37', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2016-04-25 20:16:51');
INSERT INTO `gxwl_sys_coderule` VALUES ('3', 'AJWSLB', '案件文书类别', 'AJWSLB', null, null, '0', null, 'yyyy', '6', '0', '999999', '26', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-04-25 16:32:00');
INSERT INTO `gxwl_sys_coderule` VALUES ('4', 'JGYQ', '监管要求', 'JGYQ', null, null, '0', null, 'yyyy', '6', '0', '999999', '11', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-04-16 13:58:35');
INSERT INTO `gxwl_sys_coderule` VALUES ('5', 'FXJB', '风险级别', 'FXJB', null, null, '0', null, 'yyyy', '6', '0', '999999', '18', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-08-04 16:27:36');
INSERT INTO `gxwl_sys_coderule` VALUES ('6', 'HYLB', '行业类别', 'HYLB', null, null, '0', null, 'yyyy', '6', '0', '999999', '28', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-08-04 17:08:18');
INSERT INTO `gxwl_sys_coderule` VALUES ('7', 'AQSGXX', '安全事故信息', 'AQSGXX', null, null, '0', null, 'yyyy', '6', '0', '999999', '23', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-07-26 14:02:36');
INSERT INTO `gxwl_sys_coderule` VALUES ('8', 'AJXX', '案件线索', 'AJXX', null, null, '0', null, 'yyyy', '6', '0', '999999', '17', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-07-28 11:51:43');
INSERT INTO `gxwl_sys_coderule` VALUES ('9', 'AJJD', '案件进度', 'AJJD', null, null, '0', null, 'yyyy', '6', '0', '999999', '12', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-07-26 14:04:15');
INSERT INTO `gxwl_sys_coderule` VALUES ('10', 'WG', '网格', 'WG', null, null, '0', null, 'yyyy', '6', '0', '999999', '21', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-04-24 14:08:24');
INSERT INTO `gxwl_sys_coderule` VALUES ('11', 'XJSB', '巡检设备', 'XJSB', null, null, '0', null, 'yyyy', '6', '0', '999999', '42', '1', '2014-03-20', null, null, '1', '2014-03-20 00:00:00', '1', '2014-05-04 13:16:55');
INSERT INTO `gxwl_sys_coderule` VALUES ('12', 'SZSS', '市政设施', 'SZSS', null, null, '0', null, 'yyyy', '4', '0', '9999', '434', '1', '2016-04-25', null, null, '1', '2016-04-25 20:28:14', '1', '2016-08-09 09:56:49');
INSERT INTO `gxwl_sys_coderule` VALUES ('13', 'ZSK', '考核制度', 'ZSK', null, null, '0', null, 'yyyy', '4', '0', '999999', '63', '1', '2014-03-01', null, null, '1', '2016-04-25 20:28:14', '1', '2016-06-06 14:59:57');
INSERT INTO `gxwl_sys_coderule` VALUES ('14', 'SJDJ', '事件登记', 'SJDJ', null, null, '0', null, 'yyyy', '4', '0', '999999', '194', '1', '2014-03-01', null, null, '1', '2016-04-25 20:28:14', '1', '2016-08-08 11:58:36');
INSERT INTO `gxwl_sys_coderule` VALUES ('15', 'FWTD', '服务团队', 'FWTD', null, null, '0', null, 'yyyy', '4', '0', '999999', '107', '1', '2014-03-01', null, null, '1', '2016-04-25 20:28:14', '1', '2016-07-01 10:27:54');
INSERT INTO `gxwl_sys_coderule` VALUES ('16', 'PAPR', '党组织财产编号', 'PAPR', null, null, '0', null, 'yyyyMMdd', '6', '0', '999999', '56', '1', '2016-05-19', null, null, '1', '2016-05-19 09:38:38', '1', '2016-08-09 10:05:30');
INSERT INTO `gxwl_sys_coderule` VALUES ('17', 'PAFDN', '党组织固定计划编号', 'DRJH', null, null, '0', null, 'yyyy', '4', '0', '9999', '40', '1', '2016-05-20', null, null, '1', '2016-05-20 11:52:23', '1', '2016-08-10 10:52:24');

-- ----------------------------
-- Table structure for `gxwl_sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_config`;
CREATE TABLE `gxwl_sys_config` (
  `CONFIG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONFIG_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '配置类型',
  `CONFIG_CODE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '配置编码',
  `CONFIG_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '配置名称',
  `CONFIG_VALUE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '配置值',
  `ENABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '是否有效',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `UI_GXWL_SYS_CONFIG01` (`CONFIG_TYPE`,`CONFIG_CODE`),
  KEY `FK_r69lp8prlo2talx07rtybg1oy` (`CREATE_BY`),
  KEY `FK_okvm9a7a492vii4yrebtmaf84` (`LAST_UPDATE_BY`),
  CONSTRAINT `FK_okvm9a7a492vii4yrebtmaf84` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_r69lp8prlo2talx07rtybg1oy` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of gxwl_sys_config
-- ----------------------------
INSERT INTO `gxwl_sys_config` VALUES ('1', 'EmailConfig', 'username', '邮箱用户名', 'tester@nateiot.com', 'Y', '', '1', '2014-03-05 00:00:00', '1', '2016-05-05 17:54:48');
INSERT INTO `gxwl_sys_config` VALUES ('2', 'EmailConfig', 'password', '邮箱密码', '123456', 'Y', '', '1', '2014-03-05 17:57:30', '1', '2016-05-05 17:54:48');
INSERT INTO `gxwl_sys_config` VALUES ('3', 'EmailConfig', 'host', '邮件服务器主机', 'smtp.ym.163.com', 'Y', '', '1', '2014-03-05 18:03:21', '1', '2016-05-05 17:54:48');
INSERT INTO `gxwl_sys_config` VALUES ('4', 'EmailConfig', 'protocol', '邮件服务器协议', 'smtp', 'Y', '', '1', '2014-03-24 09:17:13', '1', '2016-05-05 17:54:48');
INSERT INTO `gxwl_sys_config` VALUES ('5', 'EmailConfig', 'port', '邮件服务器端口', '25', 'Y', '', '1', '2014-03-24 09:18:26', '1', '2016-05-05 17:54:48');
INSERT INTO `gxwl_sys_config` VALUES ('6', 'SysConfig', 'uploadFileRootPath', '上传文件保存位置', 'c:\\lciss\\LcissUpload', 'Y', '', '1', '2016-03-27 09:24:37', '1', '2016-05-05 17:54:48');
INSERT INTO `gxwl_sys_config` VALUES ('7', 'SysConfig', 'token', '微信令牌', 'gxwl2015', 'Y', '国信物联服务号', '1', '2015-09-08 12:00:00', '1', '2016-05-05 17:54:48');
INSERT INTO `gxwl_sys_config` VALUES ('8', 'SysConfig', 'appsecret', '微信应用密钥', '32d671b5f848e4a8b680e967b778129d', 'Y', '国信物联服务号', '1', '2015-08-11 08:00:00', '1', '2016-05-05 17:54:48');
INSERT INTO `gxwl_sys_config` VALUES ('9', 'SysConfig', 'appid', '微信应用ID', 'wx14e747268ded5f90', 'Y', '国信物联服务号', '1', '2015-08-11 08:00:00', '1', '2016-05-05 17:54:48');

-- ----------------------------
-- Table structure for `gxwl_sys_datap`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_datap`;
CREATE TABLE `gxwl_sys_datap` (
  `DATAP_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据权限主键ID',
  `RESOURCE_ID` int(11) NOT NULL COMMENT '资源id，只选择菜单类型的资源',
  `DATAP_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT ' list表示查询界面控制，view表示详细界面',
  `COLUMN_NAMES` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '以逗号隔开，保存字段名',
  `TITLE_NAMES` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '以逗号隔开，和列名个数一样',
  `SQL_WHERE` varchar(4000) DEFAULT NULL COMMENT '不需要要where  :user_id',
  `LIST_COLUMN_NAMES` varchar(4000) DEFAULT NULL COMMENT '列表页显示的列',
  `ENABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '是否有效',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ATTRIBUTE01` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段01',
  `ATTRIBUTE02` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段02',
  `ATTRIBUTE03` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段03',
  `ATTRIBUTE04` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段04',
  `ATTRIBUTE05` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段05',
  PRIMARY KEY (`DATAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限表';

-- ----------------------------
-- Records of gxwl_sys_datap
-- ----------------------------

-- ----------------------------
-- Table structure for `gxwl_sys_dict_h`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_dict_h`;
CREATE TABLE `gxwl_sys_dict_h` (
  `dict_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `DICT_TYPE_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据字典类型名称',
  `DICT_TYPE_CODE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据字典类型编码',
  `ENABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '是否有效',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_type_id`),
  KEY `UI_GXWL_SYS_DICT_H01` (`DICT_TYPE_CODE`),
  KEY `FK_tq1gp46m1cetcee9c3karw1o` (`CREATE_BY`),
  KEY `FK_gcw4h7da8pbdr9uty3nwmqqdx` (`LAST_UPDATE_BY`),
  CONSTRAINT `FK_gcw4h7da8pbdr9uty3nwmqqdx` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_tq1gp46m1cetcee9c3karw1o` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='数据字典主表';

-- ----------------------------
-- Records of gxwl_sys_dict_h
-- ----------------------------
INSERT INTO `gxwl_sys_dict_h` VALUES ('1', '是或否', 'YesOrNo', 'Y', '1', '2014-02-26 00:00:00', '1', '2014-07-03 15:32:25', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('2', '资源类型', 'resourceType', 'Y', '1', '2014-02-24 00:00:00', '1', '2016-01-13 10:55:44', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('3', '安全事故类型', 'AccidentType', 'Y', '1', '2014-02-25 15:34:24', '1', '2014-02-25 15:34:24', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('4', '单据状态', 'OrderStatus', 'Y', '1', '2014-02-25 15:54:29', '1', '2014-02-25 15:54:29', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('5', '特种设备类型', 'OtherEquipmentType', 'Y', '1', '2014-02-27 00:00:00', '1', '2014-02-27 00:00:00', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('6', '设备状态', 'EquipmentStatus', 'Y', '1', '2014-02-27 09:38:08', '1', '2014-02-27 09:38:08', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('9', '设备类型', 'EquipmentTypes', 'Y', '1', '2014-02-27 10:16:31', '1', '2014-02-27 10:16:31', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('10', '案件送达方式', 'SendType', 'Y', '1', '2014-03-05 00:00:00', '1', '2014-03-05 00:00:00', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('11', '风险等级', 'SisRiskLevel', 'Y', '1', '2014-03-07 11:48:47', '1', '2014-03-07 11:48:47', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('12', '经济户口认领状态', 'EnterpriseClaim', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('13', '通知接收者类型', 'NoticeAccepterType', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('14', '企业类型', 'EntType', 'Y', '1', '2014-04-24 00:00:00', '1', '2014-04-24 00:00:00', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('15', '企业经济性质', 'EntPro', 'Y', '1', '2014-04-24 00:00:00', '1', '2014-04-24 00:00:00', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('16', '企业状态', 'EntStatus', 'Y', '1', '2014-04-24 00:00:00', '1', '2014-04-24 00:00:00', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('26', '用户状态', 'UserStatus', 'Y', '1', '2014-05-05 00:00:00', '1', '2014-07-31 18:01:17', '34q');
INSERT INTO `gxwl_sys_dict_h` VALUES ('27', '客户端类型', 'SysClientType', 'Y', '1', '2014-08-14 09:34:23', '1', '2014-08-14 09:34:23', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('29', '民族', 'Nation', 'Y', '1', '2016-01-04 11:58:10', '1', '2016-05-08 10:29:31', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('30', '文化程度', 'Education', 'Y', '1', '2016-01-04 13:37:35', '1', '2016-05-08 14:53:56', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('31', '管理类型', 'ManageType', 'Y', '1', '2016-01-04 13:55:54', '1', '2016-06-02 17:46:47', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('32', '婚姻状况', 'maritalStatus', 'Y', '1', '2016-01-04 13:57:52', '1', '2016-01-04 13:57:52', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('33', '健康状况', 'healthStatus', 'Y', '1', '2016-01-04 13:59:06', '1', '2016-01-04 14:03:28', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('34', '职业', 'JobType', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('35', '宗教信仰', 'Religion', 'Y', '1', '2016-01-04 14:16:16', '1', '2016-05-08 15:17:20', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('36', '节育措施', 'birthControl', 'Y', '1', '2016-01-04 14:17:46', '1', '2016-01-04 14:17:46', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('37', '社会职务', 'socialFunction', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('38', '特长', 'SpecialityType', 'Y', '1', '2016-01-05 09:52:04', '1', '2016-05-08 14:42:45', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('39', '血型', 'bloodType', 'Y', '1', '2016-01-05 09:53:59', '1', '2016-01-18 17:06:57', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('40', '兵役状况', 'veteranStatus', 'Y', '1', '2016-01-05 09:58:02', '1', '2016-01-05 09:58:02', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('41', '户籍类型', 'residentType', 'Y', '1', '2016-01-05 09:59:54', '1', '2016-01-05 09:59:54', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('42', '政治面貌', 'politicsStatus', 'Y', '1', '2016-01-05 10:00:55', '1', '2016-01-05 10:00:55', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('44', '用户管理状态', 'userStatus', 'Y', '1', '2016-01-05 14:32:42', '1', '2016-01-05 14:32:51', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('45', '性别', 'Gender', 'Y', '1', '2016-01-06 17:59:33', '1', '2016-01-19 13:06:14', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('46', '司法调解类型', 'judicalType', 'Y', '1', '2016-01-08 13:25:52', '1', '2016-01-08 13:47:56', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('47', '司法受理情况', 'judicalSituation', 'Y', '1', '2016-01-08 13:27:53', '1', '2016-01-08 13:27:53', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('48', '养老保险类型', 'EndowmentInsuranceType', 'Y', '1', '2016-01-08 13:40:55', '1', '2016-05-08 15:18:10', '养老保险类型');
INSERT INTO `gxwl_sys_dict_h` VALUES ('49', '案件类型', 'caseType', 'Y', '1', '2016-01-08 13:42:01', '1', '2016-01-08 13:45:01', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('51', '单位性质', 'unitNature', 'Y', '1', '2016-01-08 13:59:41', '1', '2016-01-08 13:59:41', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('52', '门店行业类别', 'specialType', 'Y', '1', '2016-01-08 15:57:17', '1', '2016-01-08 16:01:07', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('53', '单位信息电子监控', 'monitor', 'Y', '1', '2016-01-08 16:31:45', '1', '2016-01-08 16:31:45', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('54', '单位信息电话报警', 'callThePolice', 'Y', '1', '2016-01-08 16:33:58', '1', '2016-01-08 16:33:58', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('55', '防盗门', 'securityDoor', 'Y', '1', '2016-01-08 16:35:08', '1', '2016-01-08 16:35:08', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('56', '纠纷类型', 'categoryOfConflicts', 'Y', '1', '2016-01-12 16:50:11', '1', '2016-01-12 16:50:11', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('57', '公共安全事故类型', 'puAccidentType', 'Y', '1', '2016-01-12 17:19:38', '1', '2016-01-12 17:19:38', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('58', '公共安全食品类型', 'saProductTypes', 'Y', '1', '2016-01-13 10:20:52', '1', '2016-01-13 10:20:52', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('59', '企业安全安全制度', 'securitySystem', 'Y', '1', '2016-01-15 10:22:45', '1', '2016-01-15 10:23:04', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('60', '医保类型', 'healthType', 'Y', '1', '2016-01-20 13:52:58', '1', '2016-05-08 15:43:18', '医保类型');
INSERT INTO `gxwl_sys_dict_h` VALUES ('61', '优抚类别', 'comfortType', 'Y', '1', '2016-01-21 17:58:11', '1', '2016-05-08 16:14:23', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('62', '低保类型', 'lowType', 'Y', '1', '2016-01-22 14:06:19', '1', '2016-05-08 16:01:07', '低保类型');
INSERT INTO `gxwl_sys_dict_h` VALUES ('63', '残疾类别', 'impairmentType', 'Y', '1', '2016-01-25 17:37:58', '1', '2016-05-08 16:59:51', '残疾类别');
INSERT INTO `gxwl_sys_dict_h` VALUES ('64', '残疾等级', 'disabilityLevel', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '残疾等级');
INSERT INTO `gxwl_sys_dict_h` VALUES ('65', '缓急程度', 'urgencyLevel', 'Y', '1', '2016-01-28 15:25:00', '1', '2016-01-28 15:25:00', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('66', '是否必办', 'shallbe', 'Y', '1', '2016-01-28 15:29:18', '1', '2016-01-28 15:30:07', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('67', '通知类型', 'noticeType', 'Y', '1', '2016-01-28 15:31:19', '1', '2016-01-28 15:31:19', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('68', '服刑类型', 'ImprisonType', 'Y', '1', '2016-01-29 16:23:53', '1', '2016-01-29 16:23:53', '服刑类型');
INSERT INTO `gxwl_sys_dict_h` VALUES ('69', '毒品类型', 'PoisonType', 'Y', '1', '2016-01-29 16:25:19', '1', '2016-01-29 16:25:19', '毒品类型');
INSERT INTO `gxwl_sys_dict_h` VALUES ('70', '社区矫正类型', 'CorrectionType', 'Y', '1', '2016-01-29 16:26:46', '1', '2016-01-29 16:26:46', '社区矫正类型');
INSERT INTO `gxwl_sys_dict_h` VALUES ('71', '经济状态', 'EconomicType', 'Y', '1', '2016-01-29 16:27:54', '1', '2016-05-08 16:25:50', '经济状态');
INSERT INTO `gxwl_sys_dict_h` VALUES ('72', '居住方式', 'livingType', 'Y', '1', '2016-01-29 16:28:44', '1', '2016-05-08 16:29:15', '居住方式');
INSERT INTO `gxwl_sys_dict_h` VALUES ('73', '服务需求 ', 'serviceType', 'Y', '1', '2016-01-29 16:31:54', '1', '2016-05-08 16:34:07', '服务需求 ');
INSERT INTO `gxwl_sys_dict_h` VALUES ('74', '在职状态', 'zaizhiStatus', 'Y', '1', '2016-03-22 09:38:00', '1', '2016-03-22 09:38:40', '服务团队队员在职状态');
INSERT INTO `gxwl_sys_dict_h` VALUES ('75', '民情日记', 'rijiStatus', 'Y', '1', '2016-03-22 15:40:17', '1', '2016-03-22 15:40:17', '民情日记状态');
INSERT INTO `gxwl_sys_dict_h` VALUES ('76', '风险级别', 'fengxianJibie', 'Y', '1', '2016-03-23 09:35:09', '1', '2016-03-23 09:35:09', '应急事件的风险级别');
INSERT INTO `gxwl_sys_dict_h` VALUES ('77', '房屋性质', 'HouseNature', 'Y', '1', '2016-03-23 16:44:34', '1', '2016-03-23 16:44:51', '房屋性质');
INSERT INTO `gxwl_sys_dict_h` VALUES ('78', '是否安装', 'IsIntall', 'Y', '1', '2016-03-23 16:48:12', '1', '2016-03-23 16:48:42', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('79', '项目类型', 'proBuildType', 'Y', '1', '2016-03-24 10:24:07', '1', '2016-03-24 10:24:07', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('80', '招商项目类型', 'proInvestType', 'Y', '1', '2016-03-24 10:27:00', '1', '2016-03-24 10:33:43', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('81', '知识库类型', 'knowledgeType', 'Y', '1', '2016-03-24 10:31:32', '1', '2016-04-19 10:55:21', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('82', '是否有效', 'enable', 'Y', '1', '2016-03-24 10:33:03', '1', '2016-03-24 10:33:03', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('83', '项目进度', 'proInvestPlan', 'Y', '1', '2016-03-24 10:37:45', '1', '2016-03-24 10:37:45', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('84', '消息类型', 'noticeClass', 'Y', '1', '2016-03-24 13:49:08', '1', '2016-03-24 13:49:12', '指挥中心消息公告消息类型');
INSERT INTO `gxwl_sys_dict_h` VALUES ('85', '消息等级', 'noticeLevel', 'Y', '1', '2016-03-24 13:52:58', '1', '2016-03-24 13:52:58', '指挥中心消息的紧急程度');
INSERT INTO `gxwl_sys_dict_h` VALUES ('86', '消息发送状态', 'sendStatus', 'Y', '1', '2016-03-24 13:52:58', '1', '2016-03-24 13:52:58', '指挥中心消息发送状态');
INSERT INTO `gxwl_sys_dict_h` VALUES ('88', '党组织类型', 'partyOrganizationType', 'Y', '1', '2016-03-25 17:39:43', '1', '2016-03-25 17:39:53', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('89', '选举方式', 'voteType', 'Y', '1', '2016-03-25 17:41:37', '1', '2016-03-25 17:41:37', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('92', '流动党员类型', 'floatingCommunists', 'Y', '1', '2016-03-29 17:32:20', '1', '2016-03-29 17:32:20', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('93', '直管党员', 'straightParty', 'Y', '1', '2016-03-29 17:33:49', '1', '2016-03-29 17:41:40', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('94', '困难党员', 'difficultMembers', 'Y', '1', '2016-03-29 17:35:09', '1', '2016-03-29 17:41:45', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('95', '党组织类别', 'organizationType', 'Y', '1', '2016-03-29 17:36:39', '1', '2016-03-29 17:41:28', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('96', '是否通过', 'passOrNot', 'Y', '1', '2016-03-30 15:05:42', '1', '2016-03-30 15:14:39', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('97', '家庭情况', 'familyCondition', 'Y', '1', '2016-03-31 14:58:44', '1', '2016-03-31 15:00:06', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('98', '自用或者出租', 'userOrLease', 'Y', '1', '2016-04-01 16:58:25', '1', '2016-04-01 16:58:35', '自用出租');
INSERT INTO `gxwl_sys_dict_h` VALUES ('99', '风险级别代表色', 'color', 'Y', '1', '2016-04-06 10:08:26', '1', '2016-04-06 10:08:26', '应急事件类型风险级别代表色');
INSERT INTO `gxwl_sys_dict_h` VALUES ('100', '建设性质', 'buildNature', 'Y', '1', '2016-04-13 11:26:26', '1', '2016-04-13 11:26:26', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('101', '招商类型', 'investType', 'Y', '1', '2016-04-13 11:40:41', '1', '2016-04-13 11:40:41', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('103', '审核状态', 'examineStatus', 'Y', '1', '2016-04-13 20:59:54', '1', '2016-04-13 20:59:54', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('104', '事件来源', 'shijianLaiyuan', 'Y', '1', '2016-04-14 18:28:00', '1', '2016-04-14 18:28:04', '应急事件来源');
INSERT INTO `gxwl_sys_dict_h` VALUES ('105', '处理进度', 'shijianStatus', 'Y', '1', '2016-04-14 18:34:02', '1', '2016-05-13 10:14:29', '事件处理进度');
INSERT INTO `gxwl_sys_dict_h` VALUES ('106', '事件所处阶段', 'shijianJieduan', 'Y', '1', '2016-04-14 18:42:29', '1', '2016-04-14 18:42:33', '应急事件所处阶段');
INSERT INTO `gxwl_sys_dict_h` VALUES ('107', '结束原因', 'EndReason', 'Y', '1', '2016-04-15 11:27:08', '1', '2016-04-15 11:27:08', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('108', '准生证类别', 'pregnancyPermitType', 'Y', '1', '2016-04-18 21:08:22', '1', '2016-04-18 21:08:22', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('109', '设备类型', 'facilityType', 'Y', '1', '2016-04-19 14:31:38', '1', '2016-04-19 14:31:57', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('110', ' 网格类型', 'MeshType', 'Y', '1', '2016-04-20 11:23:28', '1', '2016-05-07 10:54:01', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('111', '供养类别', 'gylbType', 'Y', '1', '2016-04-20 15:54:21', '1', '2016-04-20 15:54:21', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('112', '事件类型', 'eventType', 'Y', '1', '2016-04-20 16:51:59', '1', '2016-04-20 16:51:59', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('113', '事件来源', 'enrollSource', 'Y', '1', '2016-04-22 11:25:19', '1', '2016-04-22 13:32:22', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('114', '事件登记状态', 'enrollStatus', 'Y', '1', '2016-04-22 11:57:35', '1', '2016-05-06 16:07:36', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('115', '商品类型', 'ProductTypes', 'Y', '1', '2016-04-22 13:45:32', '1', '2016-04-22 13:45:32', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('116', '事故类型', 'AccidentType', 'Y', '1', '2016-04-22 15:08:46', '1', '2016-04-22 15:08:46', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('117', '纠纷类型', 'disputeType', 'Y', '1', '2016-04-22 15:29:39', '1', '2016-04-22 15:29:39', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('118', '事件类型事件进度', 'eventSchedule', 'Y', '1', '2016-04-22 18:32:26', '1', '2016-04-22 18:32:26', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('119', '事件类型红黄牌', 'redYellowCard', 'Y', '1', '2016-04-22 18:40:25', '1', '2016-04-22 19:33:08', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('120', '在职状态', 'jobStatus', 'Y', '1', '2016-04-27 20:03:15', '1', '2016-04-27 20:03:15', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('121', '日志状态', 'diaryStatus', 'Y', '1', '2016-04-27 21:07:49', '1', '2016-04-27 21:07:49', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('122', '评价等级', 'estimateLevel', 'Y', '1', '2016-04-28 11:25:53', '1', '2016-04-28 15:40:05', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('123', '信息类型', 'NewsType', 'Y', '1', '2015-08-25 14:44:34', '1', '2015-10-10 10:09:58', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('124', '发送状态', 'SendStatus', 'Y', '1', '2015-08-06 17:56:59', '1', '2015-10-26 15:03:07', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('125', '指令类型', 'InstructType', 'Y', '1', '2015-11-20 15:49:51', '1', '2015-11-20 15:49:51', '指令类型');
INSERT INTO `gxwl_sys_dict_h` VALUES ('126', '小区封闭情况', 'FBQK', 'Y', '1', '2016-05-08 10:14:55', '1', '2016-05-08 10:16:08', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('127', '与户主关系', 'familytree', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('128', '应急人员职位', 'yjryJob', 'Y', '1', '2016-05-13 10:48:20', '1', '2016-05-13 10:48:25', '应急人员职位');
INSERT INTO `gxwl_sys_dict_h` VALUES ('129', '党务制度', 'regimeType', 'Y', '1', '2016-05-17 15:34:57', '1', '2016-05-17 15:35:28', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('130', '财产类型', 'propertyType', 'Y', '1', '2016-05-18 16:40:13', '1', '2016-05-18 16:40:13', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('132', '招聘类型', 'RecruitmentType', 'Y', '1', '2016-05-19 09:30:45', '1', '2016-05-19 09:43:08', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('135', '职业类别', 'JobType', 'Y', '1', '2016-05-19 16:51:24', '1', '2016-05-19 16:51:24', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('136', '月份', 'month', 'Y', '1', '2016-05-20 11:15:03', '1', '2016-05-20 16:09:31', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('137', '两会分工类型', 'division', 'Y', '1', '2016-05-21 13:45:41', '1', '2016-05-21 14:55:20', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('138', '意见类型', 'SuggestType', 'Y', '1', '2016-05-31 13:49:25', '1', '2016-05-31 16:38:17', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('139', '新闻状态', 'NEWS_STATUS', 'Y', '1', '2016-05-31 13:57:21', '1', '2016-06-13 20:28:02', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('140', '图片状态', 'ImageState', 'Y', '1', '2016-06-03 13:39:51', '1', '2016-06-03 13:39:51', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('141', '图片位置', 'imageIocation', 'Y', '1', '2016-06-08 15:51:40', '1', '2016-06-08 15:51:40', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('142', '是否户主', 'HOUSEHOLDER', 'Y', '1', '2016-08-02 15:09:40', '1', '2016-08-02 15:10:03', '');
INSERT INTO `gxwl_sys_dict_h` VALUES ('143', '盘符', 'panfu', 'Y', '1', '2016-08-09 11:43:20', '1', '2016-08-09 11:43:20', null);
INSERT INTO `gxwl_sys_dict_h` VALUES ('144', '电影类型', 'tvType', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null);

-- ----------------------------
-- Table structure for `gxwl_sys_dict_l`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_dict_l`;
CREATE TABLE `gxwl_sys_dict_l` (
  `DICT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICT_TYPE_ID` int(11) DEFAULT NULL COMMENT '数据字典类型标识',
  `DICT_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据字典名称',
  `DICT_CODE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据字典编码',
  `SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `IS_DISPLAY` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '是否显示',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ATTRIBUTE01` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段01',
  `ATTRIBUTE02` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段02',
  `ATTRIBUTE03` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段03',
  `ATTRIBUTE04` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段04',
  `ATTRIBUTE05` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段05',
  PRIMARY KEY (`DICT_ID`),
  UNIQUE KEY `UI_GXWL_SYS_DICT_L01` (`DICT_CODE`,`DICT_TYPE_ID`),
  KEY `FK_REFERENCE_4` (`DICT_TYPE_ID`),
  KEY `FK_rnobxjyo0f4u8sm3x5ra0fm6r` (`CREATE_BY`),
  KEY `FK_r6pawehfbi0qpuavaysc3jik` (`LAST_UPDATE_BY`),
  CONSTRAINT `FK_REFERENCE_4` FOREIGN KEY (`DICT_TYPE_ID`) REFERENCES `gxwl_sys_dict_h` (`dict_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_r6pawehfbi0qpuavaysc3jik` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_rnobxjyo0f4u8sm3x5ra0fm6r` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8 COMMENT='数据字典行表';

-- ----------------------------
-- Records of gxwl_sys_dict_l
-- ----------------------------
INSERT INTO `gxwl_sys_dict_l` VALUES ('1', '1', '是', 'Y', '1', 'Y', '1', '2014-02-24 00:00:00', '1', '2014-07-03 15:32:25', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('2', '1', '否', 'N', '2', 'Y', '1', '2014-02-24 00:00:00', '1', '2014-07-03 15:32:25', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('3', '2', '菜单', 'menu', '2', 'Y', '1', '2014-02-24 00:00:00', '1', '2016-01-13 10:55:44', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('4', '2', '按钮', 'button', '3', 'Y', '1', '2014-02-24 00:00:00', '1', '2016-01-13 10:55:44', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('5', '3', '食品安全事故', 'FoodAccident', '1', 'Y', '1', '2014-02-25 15:39:28', '1', '2014-02-25 15:39:28', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('6', '3', '道路安全事故', 'WayAccident', '2', 'Y', '1', '2014-02-25 15:39:28', '1', '2014-02-25 15:39:28', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('7', '4', '草稿', 'Draft', '1', 'Y', '1', '2014-02-25 15:54:29', '1', '2014-02-25 15:54:29', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('8', '4', '已提交', 'Submitted', '2', 'Y', '1', '2014-02-25 15:54:29', '1', '2014-02-25 15:54:29', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('9', '4', '已批准', 'Approved', '3', 'Y', '1', '2014-02-25 15:54:29', '1', '2014-02-25 15:54:29', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('10', '5', '气瓶', 'Cylinder', '1', 'Y', '1', '2014-02-27 00:00:00', '1', '2014-02-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('11', '5', '电梯', 'Elevator', '2', 'Y', '1', '2014-02-27 00:00:00', '1', '2014-02-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('12', '5', '锅炉', 'Boiler', '3', 'Y', '1', '2014-02-27 00:00:00', '1', '2014-02-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('13', '5', '加油机', 'Tanker', '4', 'Y', '1', '2014-02-27 00:00:00', '1', '2014-02-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('14', '6', '启用中', 'using', '1', 'Y', '1', '2014-02-27 09:39:47', '1', '2014-02-27 09:39:55', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('15', '6', '已停用', 'offline', '2', 'Y', '1', '2014-02-27 09:40:36', '1', '2014-02-27 09:40:43', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('20', '9', '巡检手机', 'phone', '1', 'Y', '1', '2014-02-27 10:18:29', '1', '2014-02-27 10:18:34', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('21', '9', '巡检平板电脑', 'pad', '2', 'Y', '1', '2014-02-27 10:19:01', '1', '2014-02-27 10:19:06', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('22', '10', '邮寄', 'Post', '1', 'Y', '1', '2014-03-05 00:00:00', '1', '2014-03-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('23', '10', '自取', 'Invite', '2', 'Y', '1', '2014-03-05 00:00:00', '1', '2014-03-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('24', '11', 'A', '1', '1', 'Y', '1', '2014-03-07 11:48:47', '1', '2014-03-07 11:48:47', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('25', '11', 'B', '2', '2', 'Y', '1', '2014-03-07 11:48:47', '1', '2014-03-07 11:48:47', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('26', '11', 'C', '3', '3', 'Y', '1', '2014-03-07 11:48:47', '1', '2014-03-07 11:48:47', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('27', '11', 'D', '4', '4', 'Y', '1', '2014-03-07 11:48:47', '1', '2014-03-07 11:48:47', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('28', '11', 'E', '5', '5', 'Y', '1', '2014-03-07 11:48:47', '1', '2014-03-07 11:48:47', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('29', '11', 'F', '6', '6', 'Y', '1', '2014-03-07 11:48:47', '1', '2014-03-07 11:48:47', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('30', '12', '已认领', 'Claim', '1', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('31', '12', '未认领', 'NoClaim', '2', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('32', '13', '组织', 'Org', '1', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('33', '13', '个人', 'Person', '2', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('34', '9', '巡检笔记本电脑', 'computer', '3', 'Y', '1', '2014-04-21 00:00:00', '1', '2014-04-21 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('35', '14', '日用品', 'Daily', '1', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('36', '14', '科技', 'Science', '2', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('37', '14', '汽车', 'Automobile', '3', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('38', '14', '钢铁', 'Steel', '4', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('39', '15', '民营企业', 'Daily', '1', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('40', '15', '商铺', 'Science', '2', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('41', '16', '经营', 'Daily', '1', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('42', '16', '停产', 'Science', '2', 'Y', '1', '2014-03-11 00:00:00', '1', '2014-03-11 00:00:00', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('111', '26', '有效', 'enabled', '1', 'Y', '1', '2014-02-24 00:00:00', '1', '2014-07-31 18:01:17', '2', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('112', '26', '无效', 'disabled', '2', 'Y', '1', '2014-02-24 00:00:00', '1', '2014-07-31 18:01:17', '3', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('113', '27', '安卓', 'Android', '1', 'Y', '1', '2014-08-14 09:34:24', '1', '2014-08-14 09:34:24', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('125', '30', '中专', 'zhongzhuan', '5', 'Y', '1', '2016-01-04 13:37:35', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('126', '30', '高中', 'gaozhong', '4', 'Y', '1', '2016-01-04 13:37:35', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('127', '30', '初中', 'chuzhong', '3', 'Y', '1', '2016-01-04 13:37:35', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('128', '30', '小学', 'xiaoxue', '2', 'Y', '1', '2016-01-04 13:37:35', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('129', '30', '幼儿园', 'youeryuan', '1', 'Y', '1', '2016-01-04 13:37:35', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('130', '30', '大专', 'dazhuan', '6', 'Y', '1', '2016-01-04 13:38:35', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('131', '31', '常住', '4', '4', 'Y', '1', '2016-01-04 13:55:54', '1', '2016-06-02 17:46:47', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('132', '31', '流动（流出）', '3', '3', 'Y', '1', '2016-01-04 13:55:54', '1', '2016-06-02 17:46:47', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('133', '31', '流动（流入）', '2', '2', 'Y', '1', '2016-01-04 13:55:54', '1', '2016-06-02 17:46:47', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('134', '31', '空挂', '1', '1', 'Y', '1', '2016-01-04 13:55:54', '1', '2016-06-02 17:46:47', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('135', '32', '其他', '6', '6', 'Y', '1', '2016-01-04 13:57:52', '1', '2016-01-04 13:57:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('136', '32', '丧偶', '5', '5', 'Y', '1', '2016-01-04 13:57:52', '1', '2016-01-04 13:57:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('137', '32', '再婚', '4', '4', 'Y', '1', '2016-01-04 13:57:52', '1', '2016-01-04 13:57:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('138', '32', '离婚', '3', '3', 'Y', '1', '2016-01-04 13:57:52', '1', '2016-01-04 13:57:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('139', '32', '已婚', '2', '2', 'Y', '1', '2016-01-04 13:57:52', '1', '2016-01-04 13:57:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('140', '32', '未婚', '1', '1', 'Y', '1', '2016-01-04 13:57:52', '1', '2016-01-04 13:57:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('141', '33', '差', 'bad', '3', 'Y', '1', '2016-01-04 13:59:06', '1', '2016-01-04 14:03:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('142', '33', '一般', 'general', '2', 'Y', '1', '2016-01-04 13:59:06', '1', '2016-01-04 14:03:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('143', '33', '良好', 'well', '1', 'Y', '1', '2016-01-04 13:59:06', '1', '2016-01-04 14:03:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('144', '34', '其他', 'other', '9', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('145', '34', '个体', 'individual', '8', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('146', '34', '无业', 'unemployed', '7', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('147', '34', '儿童', 'children', '6', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('148', '34', '学生', 'student', '5', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('149', '34', '教师', 'teacher', '4', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('150', '34', '干部', 'cadre', '3', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('151', '34', '工人', 'woker', '2', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('152', '34', '农民', 'peasant', '1', 'Y', '1', '2016-01-04 14:14:51', '1', '2016-01-04 14:14:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('153', '35', '道教', '2', '2', 'Y', '1', '2016-01-04 14:16:16', '1', '2016-05-08 15:17:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('154', '35', '佛教', '1', '1', 'Y', '1', '2016-01-04 14:16:16', '1', '2016-05-08 15:17:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('155', '36', '其他', '4', '4', 'Y', '1', '2016-01-04 14:17:46', '1', '2016-01-04 14:17:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('156', '36', '结扎', '3', '3', 'Y', '1', '2016-01-04 14:17:46', '1', '2016-01-04 14:17:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('157', '36', '节育环', '2', '2', 'Y', '1', '2016-01-04 14:17:46', '1', '2016-01-04 14:17:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('158', '36', '药物', '1', '1', 'Y', '1', '2016-01-04 14:17:46', '1', '2016-01-04 14:17:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('159', '37', '其他', '0', '10', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('160', '37', '老党员', '9', '9', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('161', '37', '老干部', '8', '8', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('162', '37', '老教师', '7', '7', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('163', '37', '监督员', '6', '6', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('164', '37', '社会法官', '5', '5', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('165', '37', '政协委员', '4', '4', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('166', '37', '人大代表', '3', '3', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('167', '37', '居民组长', '2', '2', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('168', '37', '楼组长', '1', '1', 'Y', '1', '2016-01-05 09:47:39', '1', '2016-01-05 09:47:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('171', '39', '其他', 'other', '6', 'Y', '1', '2016-01-05 09:53:59', '1', '2016-01-18 17:06:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('172', '39', '未知', 'unknown', '5', 'Y', '1', '2016-01-05 09:53:59', '1', '2016-01-18 17:06:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('173', '39', 'O型', 'O', '4', 'Y', '1', '2016-01-05 09:53:59', '1', '2016-01-18 17:06:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('174', '39', 'AB型', 'AB', '3', 'Y', '1', '2016-01-05 09:53:59', '1', '2016-01-18 17:06:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('175', '39', 'B型', 'B', '2', 'Y', '1', '2016-01-05 09:53:59', '1', '2016-01-18 17:06:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('176', '39', 'A型', 'A', '1', 'Y', '1', '2016-01-05 09:53:59', '1', '2016-01-18 17:06:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('177', '40', '其他', '0', '6', 'Y', '1', '2016-01-05 09:58:02', '1', '2016-01-05 09:58:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('178', '40', '服现役', '5', '5', 'Y', '1', '2016-01-05 09:58:02', '1', '2016-01-05 09:58:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('179', '40', '军官预备役', '4', '4', 'Y', '1', '2016-01-05 09:58:02', '1', '2016-01-05 09:58:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('180', '40', '士官预备役', '3', '3', 'Y', '1', '2016-01-05 09:58:02', '1', '2016-01-05 09:58:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('181', '40', '退出现兵役', '2', '2', 'Y', '1', '2016-01-05 09:58:02', '1', '2016-01-05 09:58:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('182', '40', '未服兵役', '1', '1', 'Y', '1', '2016-01-05 09:58:02', '1', '2016-01-05 09:58:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('183', '41', '非农业户', '2', '2', 'Y', '1', '2016-01-05 09:59:54', '1', '2016-01-05 09:59:54', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('184', '41', '农业户', '1', '1', 'Y', '1', '2016-01-05 09:59:54', '1', '2016-01-05 09:59:54', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('185', '42', '民主党派', '4', '4', 'Y', '1', '2016-01-05 10:00:55', '1', '2016-01-05 10:00:55', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('186', '42', '党员', '3', '3', 'Y', '1', '2016-01-05 10:00:55', '1', '2016-01-05 10:00:55', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('187', '42', '团员', '2', '2', 'Y', '1', '2016-01-05 10:00:55', '1', '2016-01-05 10:00:55', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('188', '42', '一般群众', '1', '1', 'Y', '1', '2016-01-05 10:00:55', '1', '2016-01-05 10:00:55', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('191', '44', '无效', 'disable', '2', 'Y', '1', '2016-01-05 14:32:42', '1', '2016-01-05 14:32:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('192', '44', '有效', 'enable', '1', 'Y', '1', '2016-01-05 14:32:42', '1', '2016-01-05 14:32:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('193', '45', '男', 'male', '1', 'Y', '1', '2016-01-06 17:59:33', '1', '2016-01-19 13:06:14', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('194', '45', '女', 'female', '2', 'Y', '1', '2016-01-06 17:59:33', '1', '2016-01-19 13:06:14', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('195', '46', '普法依法治理', 'ruling', '3', 'Y', '1', '2016-01-08 13:25:52', '1', '2016-01-08 13:47:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('196', '46', '法律援助', 'aid', '2', 'Y', '1', '2016-01-08 13:25:52', '1', '2016-01-08 13:47:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('197', '46', '人民调解', 'mediation', '1', 'Y', '1', '2016-01-08 13:25:52', '1', '2016-01-08 13:47:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('198', '47', '处理中', 'I', '3', 'Y', '1', '2016-01-08 13:27:53', '1', '2016-01-08 13:27:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('199', '47', '未处理', 'N', '2', 'Y', '1', '2016-01-08 13:27:53', '1', '2016-01-08 13:27:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('200', '47', '已处理', 'Y', '1', 'Y', '1', '2016-01-08 13:27:53', '1', '2016-01-08 13:27:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('201', '48', '新农保', '472', '2', 'Y', '1', '2016-01-08 13:40:55', '1', '2016-05-08 15:18:10', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('202', '48', '未参加', '471', '1', 'Y', '1', '2016-01-08 13:40:55', '1', '2016-05-08 15:18:10', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('203', '49', '入室抢劫', 'burglary', '2', 'Y', '1', '2016-01-08 13:42:01', '1', '2016-01-08 13:45:01', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('204', '49', '两抢一盗', 'robbery', '1', 'Y', '1', '2016-01-08 13:42:01', '1', '2016-01-08 13:45:01', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('211', '51', '其他企业', 'others', '5', 'Y', '1', '2016-01-08 13:59:41', '1', '2016-01-08 13:59:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('212', '51', '行政事业单位', 'administrative', '4', 'Y', '1', '2016-01-08 13:59:41', '1', '2016-01-08 13:59:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('213', '51', '私营企业', 'private', '3', 'Y', '1', '2016-01-08 13:59:41', '1', '2016-01-08 13:59:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('214', '51', '外资企业', 'foreign', '2', 'Y', '1', '2016-01-08 13:59:41', '1', '2016-01-08 13:59:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('215', '51', '集体企业', 'collective', '1', 'Y', '1', '2016-01-08 13:59:41', '1', '2016-01-08 13:59:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('216', '52', '宾馆', 'guesthouse', '5', 'Y', '1', '2016-01-08 15:57:17', '1', '2016-01-08 16:01:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('217', '52', '酒店', 'hotel', '4', 'Y', '1', '2016-01-08 15:57:17', '1', '2016-01-08 16:01:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('218', '52', '洗浴中心', 'bath', '3', 'Y', '1', '2016-01-08 15:57:17', '1', '2016-01-08 16:01:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('219', '52', 'KTV', 'ktv', '2', 'Y', '1', '2016-01-08 15:57:17', '1', '2016-01-08 16:01:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('220', '52', '网吧', 'netbar', '1', 'Y', '1', '2016-01-08 15:57:17', '1', '2016-01-08 16:01:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('221', '53', '未安装', 'N', '2', 'Y', '1', '2016-01-08 16:31:45', '1', '2016-01-08 16:31:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('222', '53', '已安装', 'Y', '1', 'Y', '1', '2016-01-08 16:31:45', '1', '2016-01-08 16:31:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('223', '54', '未安装', 'N', '2', 'Y', '1', '2016-01-08 16:33:58', '1', '2016-01-08 16:33:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('224', '54', '已安装', 'Y', '1', 'Y', '1', '2016-01-08 16:33:58', '1', '2016-01-08 16:33:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('225', '55', '未安装', 'N', '2', 'Y', '1', '2016-01-08 16:35:08', '1', '2016-01-08 16:35:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('226', '55', '已安装', 'Y', '1', 'Y', '1', '2016-01-08 16:35:08', '1', '2016-01-08 16:35:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('227', '56', '违约', 'contract', '2', 'Y', '1', '2016-01-12 16:50:11', '1', '2016-01-12 16:50:11', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('228', '56', '侵权', 'tort', '1', 'Y', '1', '2016-01-12 16:50:11', '1', '2016-01-12 16:50:11', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('229', '57', '不当活动事故', 'noEvent', '1', 'Y', '1', '2016-01-12 17:19:38', '1', '2016-01-12 17:19:38', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('230', '57', '挤压、踩踏事故', 'tread', '2', 'Y', '1', '2016-01-12 17:19:38', '1', '2016-01-12 17:19:38', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('231', '57', '校园暴力事故', 'violence', '3', 'Y', '1', '2016-01-12 17:19:38', '1', '2016-01-12 17:19:38', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('232', '57', '自然灾害事故', 'disaster', '4', 'Y', '1', '2016-01-12 17:19:38', '1', '2016-01-12 17:19:38', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('233', '57', '卫生事故', 'medical', '5', 'Y', '1', '2016-01-12 17:19:38', '1', '2016-01-12 17:19:38', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('234', '57', '设施事故', 'facility', '6', 'Y', '1', '2016-01-12 17:19:38', '1', '2016-01-12 17:19:38', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('235', '58', '肉类', 'meat', '1', 'Y', '1', '2016-01-13 10:20:52', '1', '2016-01-13 10:20:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('236', '58', '蛋类', 'agg', '2', 'Y', '1', '2016-01-13 10:20:52', '1', '2016-01-13 10:20:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('237', '58', '蔬菜类', 'vegetable', '3', 'Y', '1', '2016-01-13 10:20:52', '1', '2016-01-13 10:20:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('238', '58', '水果类', 'fruits', '4', 'Y', '1', '2016-01-13 10:20:52', '1', '2016-01-13 10:20:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('239', '58', '点心类', 'dessert', '5', 'Y', '1', '2016-01-13 10:20:52', '1', '2016-01-13 10:20:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('240', '58', '其他', 'others', '6', 'Y', '1', '2016-01-13 10:20:52', '1', '2016-01-13 10:20:52', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('241', '2', '模块', 'module', '1', 'Y', '1', '2016-01-13 10:55:44', '1', '2016-01-13 10:55:44', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('242', '59', '否', 'N', '2', 'Y', '1', '2016-01-15 10:22:45', '1', '2016-01-15 10:23:04', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('243', '59', '是', 'Y', '1', 'Y', '1', '2016-01-15 10:22:45', '1', '2016-01-15 10:23:04', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('244', '60', '异地医保', '486', '4', 'Y', '1', '2016-01-20 13:52:58', '1', '2016-05-08 15:43:18', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('245', '60', '学生医保', '481', '3', 'Y', '1', '2016-01-20 13:52:58', '1', '2016-05-08 15:43:18', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('246', '60', '居民医保', '480', '2', 'Y', '1', '2016-01-20 13:52:58', '1', '2016-05-08 15:43:18', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('247', '60', '职工医保', '479', '1', 'Y', '1', '2016-01-20 13:52:58', '1', '2016-05-08 15:43:18', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('248', '61', '其他', '260', '5', 'Y', '1', '2016-01-21 17:58:11', '1', '2016-05-08 16:14:23', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('249', '61', '三属', '259', '4', 'Y', '1', '2016-01-21 17:58:11', '1', '2016-05-08 16:14:23', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('250', '61', '参战参试', '258', '3', 'Y', '1', '2016-01-21 17:58:11', '1', '2016-05-08 16:14:23', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('251', '61', '残疾军人', '257', '2', 'Y', '1', '2016-01-21 17:58:11', '1', '2016-05-08 16:14:23', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('252', '61', '老复员军人', '256', '1', 'Y', '1', '2016-01-21 17:58:11', '1', '2016-05-08 16:14:23', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('254', '62', '城市固定保障', '555', '1', 'Y', '1', '2016-01-22 14:06:19', '1', '2016-05-08 16:01:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('256', '63', '其他', '176', '5', 'Y', '1', '2016-01-25 17:37:58', '1', '2016-05-08 16:59:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('257', '63', '听力', '175', '4', 'Y', '1', '2016-01-25 17:37:58', '1', '2016-05-08 16:59:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('258', '63', '视力', '174', '3', 'Y', '1', '2016-01-25 17:37:58', '1', '2016-05-08 16:59:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('259', '63', '肢体', '173', '2', 'Y', '1', '2016-01-25 17:37:58', '1', '2016-05-08 16:59:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('260', '63', '精神', '172', '1', 'Y', '1', '2016-01-25 17:37:58', '1', '2016-05-08 16:59:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('261', '64', '十级', '187', '10', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('262', '64', '九级', '186', '9', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('263', '64', '八级', '185', '8', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('264', '64', '七级', '184', '7', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('265', '64', '六级', '183', '6', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('266', '64', '五级', '182', '5', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('267', '64', '四级', '181', '4', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('268', '64', '三级', '180', '3', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('269', '64', '二级', '179', '2', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('270', '64', '一级', '178', '1', 'Y', '1', '2016-01-25 17:40:27', '1', '2016-05-08 17:00:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('271', '65', '特急', 'veryUrgent', '3', 'Y', '1', '2016-01-28 15:25:00', '1', '2016-01-28 15:25:00', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('272', '65', '紧急', 'urgency', '2', 'Y', '1', '2016-01-28 15:25:00', '1', '2016-01-28 15:25:00', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('273', '65', '一般', 'common', '1', 'Y', '1', '2016-01-28 15:25:00', '1', '2016-01-28 15:25:00', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('274', '66', '否', 'N', '2', 'Y', '1', '2016-01-28 15:29:18', '1', '2016-01-28 15:30:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('275', '66', '是', 'Y', '1', 'Y', '1', '2016-01-28 15:29:18', '1', '2016-01-28 15:30:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('276', '67', '任务', 'mission', '2', 'Y', '1', '2016-01-28 15:31:19', '1', '2016-01-28 15:31:19', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('277', '67', '一般', 'common', '1', 'Y', '1', '2016-01-28 15:31:19', '1', '2016-01-28 15:31:19', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('278', '68', '剥夺政治权利', '5', '5', 'Y', '1', '2016-01-29 16:23:53', '1', '2016-01-29 16:23:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('279', '68', '暂予监外执行', '4', '4', 'Y', '1', '2016-01-29 16:23:53', '1', '2016-01-29 16:23:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('280', '68', '管制', '3', '3', 'Y', '1', '2016-01-29 16:23:53', '1', '2016-01-29 16:23:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('281', '68', '缓刑', '2', '2', 'Y', '1', '2016-01-29 16:23:53', '1', '2016-01-29 16:23:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('282', '68', '假释', '1', '1', 'Y', '1', '2016-01-29 16:23:53', '1', '2016-01-29 16:23:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('283', '69', '其他毒品', '4', '4', 'Y', '1', '2016-01-29 16:25:19', '1', '2016-01-29 16:25:19', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('284', '69', '埃托啡', '3', '3', 'Y', '1', '2016-01-29 16:25:19', '1', '2016-01-29 16:25:19', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('285', '69', '其他苯丙胺类毒', '2', '2', 'Y', '1', '2016-01-29 16:25:19', '1', '2016-01-29 16:25:19', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('286', '69', '摇头丸', '1', '1', 'Y', '1', '2016-01-29 16:25:19', '1', '2016-01-29 16:25:19', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('287', '70', '被暂予监外执行的', '5', '5', 'Y', '1', '2016-01-29 16:26:46', '1', '2016-01-29 16:26:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('288', '70', '被剥夺政治权利的', '4', '4', 'Y', '1', '2016-01-29 16:26:46', '1', '2016-01-29 16:26:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('289', '70', '被裁定假释的', '3', '3', 'Y', '1', '2016-01-29 16:26:46', '1', '2016-01-29 16:26:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('290', '70', '被宣告缓刑的', '2', '2', 'Y', '1', '2016-01-29 16:26:46', '1', '2016-01-29 16:26:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('291', '70', '被判管制的', '1', '1', 'Y', '1', '2016-01-29 16:26:46', '1', '2016-01-29 16:26:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('292', '71', '其他', '517', '6', 'Y', '1', '2016-01-29 16:27:54', '1', '2016-05-08 16:25:50', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('293', '71', '子女供养', '516', '5', 'Y', '1', '2016-01-29 16:27:54', '1', '2016-05-08 16:25:50', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('294', '71', '五保', '515', '4', 'Y', '1', '2016-01-29 16:27:54', '1', '2016-05-08 16:25:50', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('295', '71', '低保', '514', '3', 'Y', '1', '2016-01-29 16:27:54', '1', '2016-05-08 16:25:50', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('296', '71', '救济金', '513', '2', 'Y', '1', '2016-01-29 16:27:54', '1', '2016-05-08 16:25:50', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('297', '71', '退休金', '518', '1', 'Y', '1', '2016-01-29 16:27:54', '1', '2016-05-08 16:25:50', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('298', '72', '空巢', '522', '4', 'Y', '1', '2016-01-29 16:28:44', '1', '2016-05-08 16:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('299', '72', '与子女同住', '521', '3', 'Y', '1', '2016-01-29 16:28:44', '1', '2016-05-08 16:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('300', '72', '孤寡', '520', '2', 'Y', '1', '2016-01-29 16:28:44', '1', '2016-05-08 16:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('301', '72', '养老机构', '523', '1', 'Y', '1', '2016-01-29 16:28:44', '1', '2016-05-08 16:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('302', '73', '其他', '530', '6', 'Y', '1', '2016-01-29 16:31:54', '1', '2016-05-08 16:34:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('303', '73', '精神慰籍', '529', '5', 'Y', '1', '2016-01-29 16:31:54', '1', '2016-05-08 16:34:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('304', '73', '家政服务', '528', '4', 'Y', '1', '2016-01-29 16:31:54', '1', '2016-05-08 16:34:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('305', '73', '康复护理', '527', '3', 'Y', '1', '2016-01-29 16:31:54', '1', '2016-05-08 16:34:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('306', '73', '医疗保健', '526', '2', 'Y', '1', '2016-01-29 16:31:54', '1', '2016-05-08 16:34:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('307', '73', '生活照料', '525', '1', 'Y', '1', '2016-01-29 16:31:54', '1', '2016-05-08 16:34:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('308', '74', '在职', '0', '1', 'Y', '1', '2016-03-22 09:40:02', '1', '2016-03-22 09:40:02', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('309', '74', '申请离职', '1', '2', 'Y', '1', '2016-03-22 09:40:02', '1', '2016-03-22 09:40:02', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('310', '74', '离职', '9', '3', 'Y', '1', '2016-03-22 09:40:02', '1', '2016-03-22 09:40:02', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('311', '75', '草稿', '0', '1', 'Y', '1', '2016-03-22 15:40:17', '1', '2016-03-22 15:40:17', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('312', '75', '已发布', '1', '2', 'Y', '1', '2016-03-22 15:40:17', '1', '2016-03-22 15:40:17', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('313', '75', '已撤销', '9', '3', 'Y', '1', '2016-03-22 15:40:17', '1', '2016-03-22 15:40:17', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('314', '76', '一级风险', '1', '1', 'Y', '1', '2016-03-23 09:35:09', '1', '2016-03-23 09:35:09', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('315', '76', '二级风险', '2', '2', 'Y', '1', '2016-03-23 09:35:09', '1', '2016-03-23 09:35:09', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('316', '76', '三级风险', '3', '3', 'Y', '1', '2016-03-23 09:35:09', '1', '2016-03-23 09:35:09', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('317', '77', '房改房', 'fgf', '4', 'Y', '1', '2016-03-23 16:44:34', '1', '2016-03-23 16:44:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('318', '77', '租住房', 'zzf', '3', 'Y', '1', '2016-03-23 16:44:34', '1', '2016-03-23 16:44:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('319', '77', '单元楼', 'dyl', '2', 'Y', '1', '2016-03-23 16:44:34', '1', '2016-03-23 16:44:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('320', '77', '自建房', 'zjf', '1', 'Y', '1', '2016-03-23 16:44:34', '1', '2016-03-23 16:44:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('321', '78', '未安装', 'N', '1', 'Y', '1', '2016-03-23 16:48:12', '1', '2016-03-23 16:48:42', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('322', '78', '已安装', 'Y', '2', 'Y', '1', '2016-03-23 16:48:12', '1', '2016-03-23 16:48:42', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('323', '79', '城建重点项目', 'Y', '1', 'Y', '1', '2016-03-24 10:24:07', '1', '2016-03-24 10:24:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('324', '79', '工业项目', 'N', '2', 'Y', '1', '2016-03-24 10:24:07', '1', '2016-03-24 10:24:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('325', '79', '服务业项目', 'I', '3', 'Y', '1', '2016-03-24 10:24:07', '1', '2016-03-24 10:24:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('326', '79', '社会事业项目', 'U', '4', 'Y', '1', '2016-03-24 10:24:07', '1', '2016-03-24 10:24:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('327', '79', '城中村项目', 'O', '5', 'Y', '1', '2016-03-24 10:24:07', '1', '2016-03-24 10:24:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('328', '80', '项目招商', 'Y', '1', 'Y', '1', '2016-03-24 10:27:00', '1', '2016-03-24 10:33:43', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('329', '80', '企业招商', 'N', '2', 'Y', '1', '2016-03-24 10:27:00', '1', '2016-03-24 10:33:43', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('330', '80', '部门招商', 'I', '3', 'Y', '1', '2016-03-24 10:27:00', '1', '2016-03-24 10:33:43', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('331', '80', '组团招商', 'O', '4', 'Y', '1', '2016-03-24 10:27:00', '1', '2016-03-24 10:33:43', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('332', '80', '城中村项目', 'U', '5', 'Y', '1', '2016-03-24 10:27:00', '1', '2016-03-24 10:33:43', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('333', '81', '考核制度', 'examine', '1', 'Y', '1', '2016-03-24 10:31:32', '1', '2016-04-19 10:55:21', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('334', '81', '知识库', 'knowledge', '2', 'Y', '1', '2016-03-24 10:31:32', '1', '2016-04-19 10:55:21', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('336', '82', '有效', 'Y', '1', 'Y', '1', '2016-03-24 10:33:03', '1', '2016-03-24 10:33:03', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('337', '82', '无效', 'N', '2', 'Y', '1', '2016-03-24 10:33:03', '1', '2016-03-24 10:33:03', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('338', '83', '未开始', 'Y', '1', 'Y', '1', '2016-03-24 10:37:45', '1', '2016-03-24 10:37:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('339', '83', '进行中', 'N', '2', 'Y', '1', '2016-03-24 10:37:45', '1', '2016-03-24 10:37:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('340', '83', '已完成', 'I', '3', 'Y', '1', '2016-03-24 10:37:45', '1', '2016-03-24 10:37:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('341', '84', '消息型', '0', '1', 'Y', '1', '2016-03-24 13:50:55', '1', '2016-03-24 13:50:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('342', '84', '任务型', '1', '2', 'Y', '1', '2016-03-24 13:51:34', '1', '2016-03-24 13:51:39', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('343', '85', '特急', '1', '1', 'Y', '1', '2016-03-24 13:52:58', '1', '2016-03-24 13:52:58', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('344', '85', '必办', '2', '2', 'Y', '1', '2016-03-24 13:52:58', '1', '2016-03-24 13:52:58', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('345', '85', '一般', '3', '3', 'Y', '1', '2016-03-24 13:52:58', '1', '2016-03-24 13:52:58', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('346', '86', '未发送', '0', '1', 'Y', '1', '2016-03-24 13:52:58', '1', '2016-03-24 13:52:58', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('347', '86', '已发送', '1', '2', 'Y', '1', '2016-03-24 13:52:58', '1', '2016-03-24 13:52:58', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('353', '88', '非共党组织', 'fgdzz', '4', 'Y', '1', '2016-03-25 17:39:43', '1', '2016-03-25 17:39:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('354', '88', '党总支', 'dzz', '3', 'Y', '1', '2016-03-25 17:39:43', '1', '2016-03-25 17:39:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('355', '88', '党支部', 'dzb', '2', 'Y', '1', '2016-03-25 17:39:43', '1', '2016-03-25 17:39:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('356', '88', '党小组', 'dxz', '1', 'Y', '1', '2016-03-25 17:39:43', '1', '2016-03-25 17:39:53', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('357', '89', '差额选举', 'cexj', '3', 'Y', '1', '2016-03-25 17:41:37', '1', '2016-03-25 17:41:37', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('358', '89', '公推直选', 'gtzx', '2', 'Y', '1', '2016-03-25 17:41:37', '1', '2016-03-25 17:41:37', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('359', '89', '等额选举', 'dexj', '1', 'Y', '1', '2016-03-25 17:41:37', '1', '2016-03-25 17:41:37', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('373', '92', '流出', 'in', '1', 'Y', '1', '2016-03-29 17:32:20', '1', '2016-03-29 17:32:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('374', '92', '流入', 'out', '2', 'Y', '1', '2016-03-29 17:32:20', '1', '2016-03-29 17:32:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('375', '93', '离退休', 'retire', '2', 'Y', '1', '2016-03-29 17:33:49', '1', '2016-03-29 17:41:40', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('376', '93', '在职', 'onJob', '1', 'Y', '1', '2016-03-29 17:33:49', '1', '2016-03-29 17:41:40', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('377', '94', '优抚对象', 'care', '2', 'Y', '1', '2016-03-29 17:35:09', '1', '2016-03-29 17:41:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('378', '94', '享受低保', 'low', '1', 'Y', '1', '2016-03-29 17:35:09', '1', '2016-03-29 17:41:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('379', '95', '非公党组织', '4', '4', 'Y', '1', '2016-03-29 17:36:39', '1', '2016-03-29 17:41:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('380', '95', '党小组', '3', '3', 'Y', '1', '2016-03-29 17:36:39', '1', '2016-03-29 17:41:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('381', '95', '党支部', '2', '2', 'Y', '1', '2016-03-29 17:36:39', '1', '2016-03-29 17:41:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('382', '95', '党总支', '1', '1', 'Y', '1', '2016-03-29 17:36:39', '1', '2016-03-29 17:41:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('383', '96', '不通过', 'N', '2', 'Y', '1', '2016-03-30 15:05:42', '1', '2016-03-30 15:14:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('384', '96', '通过', 'Y', '1', 'Y', '1', '2016-03-30 15:05:42', '1', '2016-03-30 15:14:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('385', '97', '两型家庭', '3', '3', 'Y', '1', '2016-03-31 14:58:44', '1', '2016-03-31 15:00:06', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('386', '97', '和谐家庭', '2', '2', 'Y', '1', '2016-03-31 14:58:44', '1', '2016-03-31 15:00:06', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('387', '97', '文明家庭', '1', '1', 'Y', '1', '2016-03-31 14:58:44', '1', '2016-03-31 15:00:06', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('388', '98', '自用', '1', '1', 'Y', '1', '2016-04-01 16:58:25', '1', '2016-04-01 16:58:35', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('389', '98', '出租', '2', '2', 'Y', '1', '2016-04-01 16:58:25', '1', '2016-04-01 16:58:35', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('390', '99', '橙色', '#ffcc00', '4', 'Y', '1', '2016-04-06 10:08:26', '1', '2016-04-06 10:08:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('391', '99', '黄色', '#00ff00', '3', 'Y', '1', '2016-04-06 10:08:26', '1', '2016-04-06 10:08:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('392', '99', '蓝色', '#0000ff', '2', 'Y', '1', '2016-04-06 10:08:26', '1', '2016-04-06 10:08:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('393', '99', '红色', '#ff0000', '1', 'Y', '1', '2016-04-06 10:08:26', '1', '2016-04-06 10:08:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('395', '100', '新建', 'new', '1', 'Y', '1', '2016-04-13 11:26:26', '1', '2016-04-13 11:26:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('396', '100', '续建', 'continue', '2', 'Y', '1', '2016-04-13 11:26:26', '1', '2016-04-13 11:26:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('397', '101', '项目招商', 'Y', '1', 'Y', '1', '2016-04-13 11:40:41', '1', '2016-04-13 11:40:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('398', '101', '企业招商', 'N', '2', 'Y', '1', '2016-04-13 11:40:41', '1', '2016-04-13 11:40:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('399', '101', '部门招商', 'I', '3', 'Y', '1', '2016-04-13 11:40:41', '1', '2016-04-13 11:40:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('400', '101', '组团招商', 'O', '4', 'Y', '1', '2016-04-13 11:40:41', '1', '2016-04-13 11:40:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('401', '101', '城中村项目', 'U', '5', 'Y', '1', '2016-04-13 11:40:41', '1', '2016-04-13 11:40:41', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('403', '103', '草稿', 'draft', '1', 'Y', '1', '2016-04-13 20:59:54', '1', '2016-04-13 20:59:54', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('404', '103', '已提交', 'submit', '2', 'Y', '1', '2016-04-13 20:59:54', '1', '2016-04-13 20:59:54', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('405', '103', '已初评', 'assess', '3', 'Y', '1', '2016-04-13 20:59:54', '1', '2016-04-13 20:59:54', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('406', '103', '已复评', 'review', '4', 'Y', '1', '2016-04-13 20:59:54', '1', '2016-04-13 20:59:54', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('407', '103', '已审核', 'audit', '5', 'Y', '1', '2016-04-13 20:59:54', '1', '2016-04-13 20:59:54', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('408', '104', '系统', '0', '1', 'Y', '1', '2016-04-14 18:29:24', '1', '2016-04-14 18:29:28', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('409', '104', '电话', '1', '2', 'Y', '1', '2016-04-14 18:30:18', '1', '2016-04-14 18:30:30', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('410', '104', '微信', '2', '3', 'Y', '1', '2016-04-14 18:31:09', '1', '2016-04-14 18:31:13', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('411', '104', '其他', '9', '4', 'Y', '1', '2016-04-14 18:31:41', '1', '2016-04-14 18:31:45', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('412', '105', '草稿', '0', '1', 'Y', '1', '2016-04-14 18:35:01', '1', '2016-05-13 10:14:29', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('413', '105', '已提交', '1', '2', 'Y', '1', '2016-04-14 18:35:40', '1', '2016-05-13 10:14:29', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('414', '105', '已核查', '2', '3', 'Y', '1', '2016-04-14 18:35:51', '1', '2016-05-13 10:14:29', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('415', '105', '已审查', '3', '4', 'Y', '1', '2016-04-14 18:36:35', '1', '2016-05-13 10:14:29', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('416', '105', '现场跟进', '4', '5', 'Y', '1', '2016-04-14 18:37:17', '1', '2016-05-13 10:14:29', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('418', '106', '先期预报', '0', '1', 'Y', '1', '2016-04-14 19:06:00', '1', '2016-04-14 19:06:02', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('419', '106', '正在进行', '1', '2', 'Y', '1', '2016-04-14 19:06:48', '1', '2016-04-14 19:06:51', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('420', '106', '已发生', '2', '3', 'Y', '1', '2016-04-14 19:09:34', '1', '2016-04-14 19:09:38', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('421', '107', '期满解除', '1', '1', 'Y', '1', '2016-04-15 11:27:08', '1', '2016-04-15 11:27:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('422', '108', '二孩证', '2', '2', 'Y', '1', '2016-04-18 21:08:22', '1', '2016-04-18 21:08:22', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('423', '108', '一孩证', '1', '1', 'Y', '1', '2016-04-18 21:08:22', '1', '2016-04-18 21:08:22', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('424', '109', '市政井盖', 'szjg', '4', 'Y', '1', '2016-04-19 14:31:38', '1', '2016-04-19 14:31:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('425', '109', '路灯设施', 'ldss', '3', 'Y', '1', '2016-04-19 14:31:38', '1', '2016-04-19 14:31:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('426', '109', '道路设施', 'dlss', '2', 'Y', '1', '2016-04-19 14:31:38', '1', '2016-04-19 14:31:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('427', '109', '排水设施', 'psss', '1', 'Y', '1', '2016-04-19 14:31:38', '1', '2016-04-19 14:31:57', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('428', '110', '街道办', 'jiedaoban', '1', 'Y', '1', '2016-04-20 11:24:46', '1', '2016-05-07 10:54:01', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('429', '110', '社区', 'shequ', '2', 'Y', '1', '2016-04-20 11:24:46', '1', '2016-05-07 10:54:01', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('430', '110', '镇', 'zhen', '3', 'Y', '1', '2016-04-20 15:28:37', '1', '2016-05-07 10:54:01', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('431', '111', '分散供养', '2', '2', 'Y', '1', '2016-04-20 15:54:21', '1', '2016-04-20 15:54:21', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('432', '111', '集中供养', '1', '1', 'Y', '1', '2016-04-20 15:54:21', '1', '2016-04-20 15:54:21', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('433', '112', '服务办事', 'service', '1', 'Y', '1', '2016-04-20 16:51:59', '1', '2016-04-20 16:51:59', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('434', '112', '矛盾调处', 'contradiction', '2', 'Y', '1', '2016-04-20 16:51:59', '1', '2016-04-20 16:51:59', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('435', '112', '问题隐患', 'peril', '3', 'Y', '1', '2016-04-20 16:51:59', '1', '2016-04-20 16:51:59', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('436', '112', '城管事件', 'inspectors', '4', 'Y', '1', '2016-04-20 16:51:59', '1', '2016-04-20 16:51:59', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('437', '113', '电话', 'phone', '2', 'Y', '1', '2016-04-22 11:25:19', '1', '2016-04-22 13:32:22', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('438', '113', '网站反馈', 'feedback', '3', 'Y', '1', '2016-04-22 11:25:19', '1', '2016-04-22 13:32:22', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('439', '113', '微信', 'weChat', '1', 'Y', '1', '2016-04-22 11:52:44', '1', '2016-04-22 13:32:22', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('440', '114', '草稿', 'draft', '1', 'Y', '1', '2016-04-22 11:57:35', '1', '2016-05-06 16:07:36', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('441', '114', '已上报', 'appearIn', '2', 'Y', '1', '2016-04-22 11:57:35', '1', '2016-05-06 16:07:36', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('442', '114', '已签收', 'signFor', '3', 'Y', '1', '2016-04-22 11:57:35', '1', '2016-05-06 16:07:36', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('443', '114', '已交办', 'assign', '4', 'Y', '1', '2016-04-22 11:57:35', '1', '2016-05-06 16:07:36', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('444', '114', '已办理', 'transact', '5', 'Y', '1', '2016-04-22 11:57:35', '1', '2016-05-06 16:07:36', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('445', '114', '已评价', 'estimate', '6', 'Y', '1', '2016-04-22 11:57:35', '1', '2016-05-06 16:07:36', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('446', '115', '其他', 'other', '6', 'Y', '1', '2016-04-22 13:45:32', '1', '2016-04-22 13:45:32', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('447', '115', '点心类', 'dessert', '5', 'Y', '1', '2016-04-22 13:45:32', '1', '2016-04-22 13:45:32', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('448', '115', '水果类', 'fruit', '4', 'Y', '1', '2016-04-22 13:45:32', '1', '2016-04-22 13:45:32', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('449', '115', '蔬菜类', 'vegetable', '3', 'Y', '1', '2016-04-22 13:45:32', '1', '2016-04-22 13:45:32', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('450', '115', '蛋类', 'egg', '2', 'Y', '1', '2016-04-22 13:45:32', '1', '2016-04-22 13:45:32', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('451', '115', '肉类', 'meat', '1', 'Y', '1', '2016-04-22 13:45:32', '1', '2016-04-22 13:45:32', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('452', '116', '设施事故', '6', '6', 'Y', '1', '2016-04-22 15:08:46', '1', '2016-04-22 15:08:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('453', '116', '卫生事故', '5', '5', 'Y', '1', '2016-04-22 15:08:46', '1', '2016-04-22 15:08:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('454', '116', '自然灾害事故', '4', '4', 'Y', '1', '2016-04-22 15:08:46', '1', '2016-04-22 15:08:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('455', '116', '校园暴力事故', '3', '3', 'Y', '1', '2016-04-22 15:08:46', '1', '2016-04-22 15:08:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('456', '116', '挤压、践踏事故', '2', '2', 'Y', '1', '2016-04-22 15:08:46', '1', '2016-04-22 15:08:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('457', '116', '不当活动事故', '1', '1', 'Y', '1', '2016-04-22 15:08:46', '1', '2016-04-22 15:08:46', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('458', '117', '违约', 'contract', '2', 'Y', '1', '2016-04-22 15:29:39', '1', '2016-04-22 15:29:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('459', '117', '侵权', 'tort', '1', 'Y', '1', '2016-04-22 15:29:39', '1', '2016-04-22 15:29:39', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('460', '118', '签收', 'signFor', '1', 'Y', '1', '2016-04-22 18:32:26', '1', '2016-04-22 18:32:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('461', '118', '处理', 'deal', '2', 'Y', '1', '2016-04-22 18:32:26', '1', '2016-04-22 18:32:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('462', '118', '办结', 'clear', '3', 'Y', '1', '2016-04-22 18:32:26', '1', '2016-04-22 18:32:26', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('463', '119', '红牌', 'redCard', '1', 'Y', '1', '2016-04-22 18:40:25', '1', '2016-04-22 19:33:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('464', '119', '黄牌', 'yellowCard', '1', 'Y', '1', '2016-04-22 18:40:25', '1', '2016-04-22 19:33:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('465', '120', '离职', 'leaveOffice', '2', 'Y', '1', '2016-04-27 20:03:15', '1', '2016-04-27 20:03:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('466', '120', '在职', 'inJob', '1', 'Y', '1', '2016-04-27 20:03:15', '1', '2016-04-27 20:03:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('467', '121', '草稿', 'draft', '1', 'Y', '1', '2016-04-27 21:07:49', '1', '2016-04-27 21:07:49', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('468', '121', '提交', 'submit', '2', 'Y', '1', '2016-04-27 21:07:49', '1', '2016-04-27 21:07:49', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('469', '121', '评价', 'estimate', '3', 'Y', '1', '2016-04-27 21:07:49', '1', '2016-04-27 21:07:49', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('470', '29', '汉族', 'hanzu', '1', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('471', '29', '壮族', 'zhuangzu', '2', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('472', '29', '满族', 'manzu', '3', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('473', '29', '回族', 'huizu', '4', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('474', '29', '苗族', 'miaozu', '5', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('475', '29', '维吾尔族', 'weiwudongzu', '6', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('476', '29', '土家族', 'tujiazu', '7', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('477', '29', '彝族', 'yizu', '8', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('478', '29', '蒙古族', 'mengguzu', '9', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('479', '29', '藏族', 'cangzu', '10', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('480', '29', '布依族', 'buyizu', '11', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('481', '29', '侗族', 'dongzu', '12', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('482', '29', '瑶族', 'yaozu', '13', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('483', '29', '朝鲜族', 'chaoxianzu', '14', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('484', '29', '白族', 'baizu', '15', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('485', '29', '哈尼族', 'hanizu', '16', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('486', '29', '哈萨克族', 'hasakezu', '17', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('487', '29', '黎族', 'lizu', '18', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('488', '29', '傣族', 'daizu', '19', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('489', '29', '畲族', 'shezu', '20', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('490', '29', '僳僳族', 'susuzu', '21', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('491', '29', '仡佬族', 'yilaozu', '22', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('492', '29', '东乡族', 'dongxiangzu', '23', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('493', '29', '拉祜族', 'lahuzu', '24', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('494', '29', '水族', 'shuizu', '25', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('495', '29', '佤族', 'wazu', '26', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('496', '29', '纳西族', 'naxizu', '27', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('497', '29', '羌族', 'qiangzu', '28', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('498', '29', '土族', 'tuzu', '29', 'Y', '1', '2016-04-28 11:17:43', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('499', '29', '仫佬族', 'mulaizu', '30', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('500', '29', '锡伯族', 'xibozu', '31', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('501', '29', '柯尔克孜族', 'kedongkezizu', '32', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('502', '29', '达斡尔族', 'dawodongzu', '33', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('503', '29', '景颇族', 'jingpozu', '34', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('504', '29', '毛南族', 'maonanzu', '35', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('505', '29', '撒拉族', 'salazu', '36', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('506', '29', '布朗族', 'bulangzu', '37', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('507', '29', '塔吉克族', 'tajikezu', '38', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('508', '29', '阿昌族', 'achangzu', '39', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('509', '29', '普米族', 'pumizu', '40', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('510', '29', '鄂温克族', 'dongwenkezu', '41', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('511', '29', '怒族', 'nuzu', '42', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('512', '29', '京族', 'jingzu', '43', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('513', '29', '基诺族', 'jinuozu', '44', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('514', '29', '德昂族', 'deangzu', '45', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('515', '29', '保安族', 'baoanzu', '46', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('516', '29', '俄罗斯族', 'dongluosizu', '47', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('517', '29', '裕固族', 'yuguzu', '48', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('518', '29', '乌孜别克族', 'wuzibiekezu', '49', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('519', '29', '门巴族', 'menbazu', '50', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('520', '29', '鄂伦春族', 'donglunchunzu', '51', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('521', '29', '独龙族', 'donglongzu', '52', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('522', '29', '塔塔尔族', 'tatadongzu', '53', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('523', '29', '赫哲族', 'hezhezu', '54', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('524', '29', '高山族', 'gaoshanzu', '55', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('525', '29', '珞巴族', 'luobazu', '56', 'Y', '1', '2016-04-28 11:17:44', '1', '2016-05-08 10:29:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('528', '122', '优', 'diaryScoreA', '1', 'Y', '1', '2016-04-28 15:38:32', '1', '2016-04-28 15:40:05', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('529', '122', '良', 'diaryScoreB', '2', 'Y', '1', '2016-04-28 15:39:10', '1', '2016-04-28 15:40:05', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('530', '122', '差', 'diaryScoreD', '4', 'Y', '1', '2016-04-28 15:40:05', '1', '2016-04-28 15:40:05', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('531', '122', '中', 'diaryScoreC', '3', 'Y', '1', '2016-04-28 15:40:05', '1', '2016-04-28 15:40:05', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('532', '124', '草稿', 'NotSent', '1', 'Y', '1', '2015-08-06 17:56:59', '1', '2015-10-26 15:03:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('533', '124', '发布', 'HasSent', '2', 'Y', '1', '2015-08-06 17:56:59', '1', '2015-10-26 15:03:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('534', '124', '提交', 'SubSent', '3', 'Y', '1', '2015-10-26 15:03:07', '1', '2015-10-26 15:03:07', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('535', '123', '市监之窗', 'shiJianZhiChuang', '3', 'Y', '1', '2015-08-25 14:44:34', '1', '2015-10-10 10:09:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('536', '123', '安全生产', 'anQuanShengChan', '6', 'Y', '1', '2015-10-10 10:09:39', '1', '2015-10-10 10:09:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('537', '123', '法律法规', 'faLvFaGui', '5', 'Y', '1', '2015-08-25 14:44:34', '1', '2015-10-10 10:09:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('538', '123', '监管动态', 'jianGuanDongTai', '1', 'Y', '1', '2015-08-25 14:44:34', '1', '2015-10-10 10:09:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('539', '123', '诚信建设', 'chengXinJianShe', '2', 'Y', '1', '2015-08-25 14:44:34', '1', '2015-10-10 10:09:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('540', '123', '食品药品', 'shiPinYaoPin', '7', 'Y', '1', '2015-10-10 10:09:58', '1', '2015-10-10 10:09:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('541', '123', '办事指引', 'banShiZhiYin', '4', 'Y', '1', '2015-08-25 14:44:34', '1', '2015-10-10 10:09:58', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('542', '125', '文本', 'Text', '1', 'Y', '1', '2015-11-20 15:49:51', '1', '2015-11-20 15:49:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('543', '125', '链接', 'Link', '2', 'Y', '1', '2015-11-20 15:49:51', '1', '2015-11-20 15:49:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('544', '110', '县', 'xian', '4', 'Y', '1', '2016-05-07 10:47:27', '1', '2016-05-07 10:54:01', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('545', '110', '市', 'shi', '5', 'Y', '1', '2016-05-07 10:47:27', '1', '2016-05-07 10:54:01', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('546', '126', '全开放', 'qkf', '3', 'Y', '1', '2016-05-08 10:16:08', '1', '2016-05-08 10:16:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('547', '126', '半封闭', 'bfb', '2', 'Y', '1', '2016-05-08 10:16:08', '1', '2016-05-08 10:16:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('548', '126', '全封闭', 'qfb', '1', 'Y', '1', '2016-05-08 10:16:08', '1', '2016-05-08 10:16:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('549', '35', '基督教', ' 3', '3', 'Y', '1', '2016-05-08 11:39:21', '1', '2016-05-08 15:17:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('550', '35', '伊斯兰教', '4', '4', 'Y', '1', '2016-05-08 11:40:10', '1', '2016-05-08 15:17:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('551', '35', '天主教', '5', '5', 'Y', '1', '2016-05-08 11:40:37', '1', '2016-05-08 15:17:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('552', '38', '雕刻', '424', '13', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('553', '38', '打字', '423', '12', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('554', '38', '誊写', '422', '11', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('555', '38', '印刷', '421', '10', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('556', '38', '表演', '420', '9', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('557', '38', '书法', '419', '8', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('558', '38', '绘画', '418', '7', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('559', '38', '解剖', '417', '6', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('560', '38', '屠宰', '416', '5', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('561', '38', '枪械', '415', '4', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('562', '38', '射击', '414', '3', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('563', '38', '爆破', '413', '2', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('564', '38', '驾机', '412', '1', 'Y', '1', '2016-05-08 14:34:55', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('565', '38', '焊割', '431', '20', 'Y', '1', '2016-05-08 14:39:16', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('566', '38', '机床操作', '430', '19', 'Y', '1', '2016-05-08 14:39:16', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('567', '38', '钳工', '429', '18', 'Y', '1', '2016-05-08 14:39:16', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('568', '38', '缝纫', '428', '17', 'Y', '1', '2016-05-08 14:39:16', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('569', '38', '装潢设计', '427', '16', 'Y', '1', '2016-05-08 14:39:16', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('570', '38', '装潢', '426', '15', 'Y', '1', '2016-05-08 14:39:16', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('571', '38', '摄影', '425', '14', 'Y', '1', '2016-05-08 14:39:16', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('572', '38', '其它或无专长', '457', '46', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('573', '38', '模仿', '456', '45', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('574', '38', '民族语言', '455', '44', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('575', '38', '外语', '454', '43', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('576', '38', '巫术', '453', '42', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('577', '38', '魔术', '452', '41', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('578', '38', '武术', '451', '40', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('579', '38', '攀高', '450', '39', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('580', '38', '潜水', '449', '38', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('581', '38', '医药', '448', '37', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('582', '38', '化验', '447', '36', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('583', '38', '化妆', '446', '35', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('584', '38', '饰物制作', '445', '34', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('585', '38', '修锁', '444', '33', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('586', '38', '修非机动车', '443', '32', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('587', '38', '修机动车', '442', '31', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('588', '38', '修钟表', '441', '30', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('589', '38', '修电器', '440', '29', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('590', '38', '懂财务', '439', '28', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('591', '38', '懂计算机', '438', '27', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('592', '38', '通信', '437', '26', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('593', '38', '油漆工', '436', '25', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('594', '38', '电工', '435', '24', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('595', '38', '瓦工', '434', '23', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('596', '38', '木工', '433', '22', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('597', '38', '铸造', '432', '21', 'Y', '1', '2016-05-08 14:42:45', '1', '2016-05-08 14:42:45', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('598', '30', '博士后', 'boshihou', '10', 'Y', '1', '2016-05-08 14:53:56', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('599', '30', '博士', 'boshi', '9', 'Y', '1', '2016-05-08 14:53:56', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('600', '30', '硕士', 'shuoshi', '8', 'Y', '1', '2016-05-08 14:53:56', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('601', '30', '本科', 'benke', '7', 'Y', '1', '2016-05-08 14:53:56', '1', '2016-05-08 14:53:56', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('602', '48', '城居保', '473', '3', 'Y', '1', '2016-05-08 15:16:38', '1', '2016-05-08 15:18:10', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('603', '48', '个人缴费', '474', '4', 'Y', '1', '2016-05-08 15:16:53', '1', '2016-05-08 15:18:10', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('604', '35', '其他', '6', '6', 'Y', '1', '2016-05-08 15:17:20', '1', '2016-05-08 15:17:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('605', '48', '职工养老保险', '475', '5', 'Y', '1', '2016-05-08 15:17:29', '1', '2016-05-08 15:18:10', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('606', '48', '参保未续费', '476', '6', 'Y', '1', '2016-05-08 15:17:44', '1', '2016-05-08 15:18:10', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('607', '48', '机化职工养老保险', '477', '7', 'Y', '1', '2016-05-08 15:18:10', '1', '2016-05-08 15:18:10', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('609', '127', '其他', '10', '10', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('610', '127', '(重)孙媳(婿)', '9', '9', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('611', '127', '(重)孙', '8', '8', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('612', '127', '祖父母', '7', '7', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('613', '127', '(岳)父母', '6', '6', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('614', '127', '儿媳(婿)', '5', '5', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('615', '127', '兄弟姐妹', '4', '4', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('616', '127', '子女', '3', '3', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('617', '127', '配偶', '2', '2', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('618', '127', '户主', '1', '1', 'Y', '1', '2016-05-08 15:29:15', '1', '2016-05-08 15:29:15', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('619', '128', '成员', '1', '1', 'Y', '1', '2016-05-13 11:07:58', '1', '2016-05-13 11:07:58', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('620', '128', '领导', '2', '2', 'Y', '1', '2016-05-13 11:07:58', '1', '2016-05-13 11:07:58', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('621', '129', '入党程序', 'joinParty', '3', 'Y', '1', '2016-05-17 15:34:57', '1', '2016-05-17 15:35:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('622', '129', '三一课会', 'course', '4', 'Y', '1', '2016-05-17 15:34:57', '1', '2016-05-17 15:35:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('623', '129', '党务公开制度', 'puSystem', '1', 'Y', '1', '2016-05-17 15:35:28', '1', '2016-05-17 15:35:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('624', '129', '党支部工作职责', 'Wobranch', '2', 'Y', '1', '2016-05-17 15:35:28', '1', '2016-05-17 15:35:28', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('625', '130', '不动产', 'bdc', '1', 'Y', '1', '2016-05-18 16:40:13', '1', '2016-05-18 16:40:13', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('626', '130', '动产', 'dc', '2', 'Y', '1', '2016-05-18 16:40:13', '1', '2016-05-18 16:40:13', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('627', '130', '知识产权', 'zscq', '3', 'Y', '1', '2016-05-18 16:40:13', '1', '2016-05-18 16:40:13', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('628', '132', '校园招聘', 'xyzp', '1', 'Y', '1', '2016-05-19 09:42:37', '1', '2016-05-19 09:43:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('629', '132', '社会招聘', 'shzp', '2', 'Y', '1', '2016-05-19 09:42:37', '1', '2016-05-19 09:43:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('630', '132', '网络招聘', 'wlzp', '3', 'Y', '1', '2016-05-19 09:42:37', '1', '2016-05-19 09:43:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('631', '132', '内部招聘', 'nbzp', '4', 'Y', '1', '2016-05-19 09:42:37', '1', '2016-05-19 09:43:08', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('632', '136', '1月', '1', '1', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('633', '136', '2月', '2', '2', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('634', '136', '3月', '3', '3', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('635', '136', '4月', '4', '4', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('636', '136', '5月', '5', '5', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('637', '136', '6月', '6', '6', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('638', '136', '7月', '7', '7', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('639', '136', '8月', '8', '8', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('640', '136', '9月', '9', '9', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('641', '136', '10月', '10', '10', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('642', '136', '11月', '11', '11', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('643', '136', '12月', '12', '12', 'Y', '1', '2016-05-20 11:17:48', '1', '2016-05-20 16:09:31', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('644', '137', '党支部书记及其成员分工情况一览表', 'secretary', '1', 'Y', '1', '2016-05-21 13:45:41', '1', '2016-05-21 14:55:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('645', '137', '居委会主任及其成员分工情况一览表', 'director', '2', 'Y', '1', '2016-05-21 13:45:41', '1', '2016-05-21 14:55:20', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('648', '139', '已发布', 'Released', '1', 'Y', '1', '2016-05-31 13:57:21', '1', '2016-06-13 20:28:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('649', '139', '未发布', 'notReleased ', '2', 'Y', '1', '2016-05-31 13:57:21', '1', '2016-06-13 20:28:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('650', '138', '待审核', 'checkPending', '1', 'Y', '1', '2016-05-31 16:38:17', '1', '2016-05-31 16:38:17', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('651', '138', '已审核', 'CheckedAudited', '2', 'Y', '1', '2016-05-31 16:38:17', '1', '2016-05-31 16:38:17', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('652', '31', '零散户', '5', '5', 'Y', '1', '2016-06-02 17:46:01', '1', '2016-06-02 17:46:47', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('653', '140', '未更新', 'NotUpdated', '1', 'Y', '1', '2016-06-03 13:39:51', '1', '2016-06-03 13:39:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('654', '140', '已更新', 'IsUpdated', '2', 'Y', '1', '2016-06-03 13:39:51', '1', '2016-06-03 13:39:51', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('655', '141', '广告位1', 'AdPositionId1', '1', 'Y', '1', '2016-06-08 15:51:40', '1', '2016-06-08 15:51:40', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('656', '141', '广告位2', 'AdPositionId2', '2', 'Y', '1', '2016-06-08 15:51:40', '1', '2016-06-08 15:51:40', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('657', '139', '失效', 'failure', '3', 'Y', '1', '2016-06-13 20:28:02', '1', '2016-06-13 20:28:02', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('658', '142', '否', '0', '1', 'Y', '1', '2016-08-02 15:10:03', '1', '2016-08-02 15:10:03', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('659', '142', '是', '1', '0', 'Y', '1', '2016-08-02 15:10:03', '1', '2016-08-02 15:10:03', '', null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('660', '143', 'C盘', 'C', '0', 'Y', '1', '2016-08-09 11:43:20', '1', '2016-08-09 11:43:20', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('661', '143', 'D盘', 'D', '1', 'Y', '1', '2016-08-09 11:43:20', '1', '2016-08-09 11:43:20', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('662', '143', 'E盘', 'E', '2', 'Y', '1', '2016-08-09 11:43:20', '1', '2016-08-09 11:43:20', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('663', '143', 'F盘', 'F', '3', 'Y', '1', '2016-08-09 11:43:20', '1', '2016-08-09 11:43:20', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('664', '144', '动作电影', 'dzdy', '0', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('665', '144', '战争电影', 'zzdy', '1', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('666', '144', '爱情电影', 'aqdy', '2', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('667', '144', '喜剧电影', 'xjdy', '3', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('668', '144', '恐怖电影', 'kbdy', '4', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('669', '144', '悬疑电影', 'xydy', '5', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('670', '144', '科幻电影', 'khdy', '6', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('671', '144', '记录电影', 'jldy', '7', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('672', '144', '动漫电影', 'dmdy', '8', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('673', '144', '伦理电影', 'lldy', '9', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('674', '144', '犯罪电影', 'fzdy', '10', 'Y', '1', '2016-08-09 11:48:59', '1', '2016-08-09 11:48:59', null, null, null, null, null, null);
INSERT INTO `gxwl_sys_dict_l` VALUES ('675', '143', 'G盘', 'G', '4', 'Y', '1', '2016-08-16 17:56:46', '1', '2016-08-16 17:56:50', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `gxwl_sys_doc`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_doc`;
CREATE TABLE `gxwl_sys_doc` (
  `DOC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `DOC_SHOWNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文档显示名称',
  `DOC_FULLNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文档全名称',
  `DOC_EXTENSION` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文档扩展名',
  `DOC_URI` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '附件地址',
  `IS_TEMP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否临时文件',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `DOC_CONTENT_TYPE` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`DOC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2170 DEFAULT CHARSET=utf8 COMMENT='附件文档';

-- ----------------------------
-- Records of gxwl_sys_doc
-- ----------------------------
INSERT INTO `gxwl_sys_doc` VALUES ('590', 'secondarytile.png', '1458292368290.png', 'png', '/1458292368290.png', 'Y', null, '1', '2016-03-18 17:12:48', '1', '2016-03-18 17:12:48', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('591', 'QQ图片20160318103602.jpg', '1458293598072.jpg', 'jpg', '/1458293598072.jpg', 'Y', null, '1', '2016-03-18 17:34:48', '1', '2016-03-18 17:34:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('592', 'QQ图片20160317160628.jpg', '1458293880566.jpg', 'jpg', '/1458293880566.jpg', 'Y', null, '1', '2016-03-18 17:38:02', '1', '2016-03-18 17:38:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('593', 'QQ图片20160318103602.jpg', '1458293942585.jpg', 'jpg', '/1458293942585.jpg', 'Y', null, '1', '2016-03-18 17:39:40', '1', '2016-03-18 17:39:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('594', 'QQ图片20160317160628.jpg', '1458294533612.jpg', 'jpg', '/1458294533612.jpg', 'Y', null, '1', '2016-03-18 17:49:02', '1', '2016-03-18 17:49:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('595', 'QQ图片20160317160628.jpg', '1458294911148.jpg', 'jpg', '/1458294911148.jpg', 'Y', null, '1', '2016-03-18 17:55:12', '1', '2016-03-18 17:55:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('596', '0066ANipgw1f191c2hz8xj306209tmxq.jpg', '1458295314824.jpg', 'jpg', '/1458295314824.jpg', 'Y', null, '1', '2016-03-18 18:01:57', '1', '2016-03-18 18:01:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('597', '2016-03-21_up.jpg', '1458526519901.jpg', 'jpg', '/1458526519901.jpg', 'Y', null, '1', '2016-03-21 10:15:20', '1', '2016-03-21 10:15:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('598', '2016-03-21_up.jpg', '1458526971137.jpg', 'jpg', '/1458526971137.jpg', 'Y', null, '1', '2016-03-21 10:22:51', '1', '2016-03-21 10:22:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('599', '1458100748223.png', '1458528688449.png', 'png', '/1458528688449.png', 'Y', null, '1', '2016-03-21 10:51:28', '1', '2016-03-21 10:51:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('600', '2012121716537448.jpg', '1458540697166.jpg', 'jpg', '/1458540697166.jpg', 'Y', null, '1', '2016-03-21 14:11:37', '1', '2016-03-21 14:11:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('601', '2012121716537448.jpg', '1458540700951.jpg', 'jpg', '/1458540700951.jpg', 'Y', null, '1', '2016-03-21 14:11:41', '1', '2016-03-21 14:11:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('602', '软件部-单周工作计划.xlsx', '1458638536762.xlsx', 'xlsx', '/knowledge/1458638536762.xlsx', 'Y', null, '1', '2016-03-22 17:22:17', '1', '2016-03-22 17:22:17', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
INSERT INTO `gxwl_sys_doc` VALUES ('603', '工程参考网站.txt', '1458639087753.txt', 'txt', '/1458639087753.txt', 'Y', null, '1', '2016-03-22 17:31:28', '1', '2016-03-22 17:31:28', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('604', '内存溢出.txt', '1458640086705.txt', 'txt', '/knowledge/1458640086705.txt', 'Y', null, '1', '2016-03-22 17:48:07', '1', '2016-03-22 17:48:07', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('605', 'tomcat&&maven&&classpath.txt', '1458640104904.txt', 'txt', '/knowledge/1458640104904.txt', 'N', null, '1', '2016-03-22 17:48:25', '1', '2016-03-22 17:48:25', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('606', '社区信息建表.txt', '1458640114365.txt', 'txt', '/knowledge/1458640114365.txt', 'Y', null, '1', '2016-03-22 17:48:34', '1', '2016-03-22 17:48:34', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('607', 'SVN.docx', '1458700980610.docx', 'docx', '/knowledge/1458700980610.docx', 'Y', null, '1', '2016-03-23 10:43:01', '1', '2016-03-23 10:43:01', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
INSERT INTO `gxwl_sys_doc` VALUES ('608', 'tomcat&&maven&&classpath.txt', '1458721935136.txt', 'txt', '/proBuild/1458721935136.txt', 'N', null, '1', '2016-03-23 16:32:15', '1', '2016-03-23 16:32:15', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('609', '2016-03-17_up.jpg', '1459041604162.jpg', 'jpg', '/1459041604162.jpg', 'Y', null, '1', '2016-03-27 09:20:04', '1', '2016-03-27 09:20:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('610', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459042073246.jpg', 'jpg', '/1459042073246.jpg', 'Y', null, '1', '2016-03-27 09:27:53', '1', '2016-03-27 09:27:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('621', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046268599.jpg', 'jpg', '/1459046268599.jpg', 'Y', null, '1', '2016-03-27 10:37:49', '1', '2016-03-27 10:37:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('622', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046316557.jpg', 'jpg', '/knowledge/1459046316557.jpg', 'Y', null, '1', '2016-03-27 10:38:37', '1', '2016-03-27 10:38:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('623', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046358191.jpg', 'jpg', '/1459046358191.jpg', 'Y', null, '1', '2016-03-27 10:39:18', '1', '2016-03-27 10:39:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('624', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046395935.jpg', 'jpg', '/1459046395935.jpg', 'Y', null, '1', '2016-03-27 10:39:56', '1', '2016-03-27 10:39:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('625', 'QQ图片20160317160628.jpg', '1459046428927.jpg', 'jpg', '/1459046428927.jpg', 'Y', null, '1', '2016-03-27 10:40:29', '1', '2016-03-27 10:40:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('626', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046583443.jpg', 'jpg', '/1459046583443.jpg', 'Y', null, '1', '2016-03-27 10:43:03', '1', '2016-03-27 10:43:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('627', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046635338.jpg', 'jpg', '/1459046635338.jpg', 'Y', null, '1', '2016-03-27 10:43:55', '1', '2016-03-27 10:43:55', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('628', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046705992.jpg', 'jpg', '/1459046705992.jpg', 'Y', null, '1', '2016-03-27 10:45:06', '1', '2016-03-27 10:45:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('629', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046776141.jpg', 'jpg', '/1459046776141.jpg', 'Y', null, '1', '2016-03-27 10:46:16', '1', '2016-03-27 10:46:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('630', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046784431.jpg', 'jpg', '/1459046784431.jpg', 'Y', null, '1', '2016-03-27 10:46:24', '1', '2016-03-27 10:46:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('631', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046880955.jpg', 'jpg', '/1459046880955.jpg', 'Y', null, '1', '2016-03-27 10:48:01', '1', '2016-03-27 10:48:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('632', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459046891720.jpg', 'jpg', '/1459046891720.jpg', 'Y', null, '1', '2016-03-27 10:48:12', '1', '2016-03-27 10:48:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('633', 'QQ图片20160317160628.jpg', '1459046946796.jpg', 'jpg', '/1459046946796.jpg', 'Y', null, '1', '2016-03-27 10:49:07', '1', '2016-03-27 10:49:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('634', '八九八创新工厂 - 解决方案.docx', '1459046978631.docx', 'docx', '/knowledge/1459046978631.docx', 'Y', null, '1', '2016-03-27 10:49:39', '1', '2016-03-27 10:49:39', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
INSERT INTO `gxwl_sys_doc` VALUES ('635', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459047577626.jpg', 'jpg', '/photos/1459047577626.jpg', 'Y', null, '1', '2016-03-27 10:59:38', '1', '2016-03-27 10:59:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('636', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459048665059.jpg', 'jpg', '/photos/1459048665059.jpg', 'Y', null, '1', '2016-03-27 11:17:45', '1', '2016-03-27 11:17:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('637', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459056568294.jpg', 'jpg', '/photos/1459056568294.jpg', 'Y', null, '1', '2016-03-27 13:29:28', '1', '2016-03-27 13:29:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('638', 'QQ图片20160317160628.jpg', '1459056685822.jpg', 'jpg', '/photos/1459056685822.jpg', 'Y', null, '1', '2016-03-27 13:31:26', '1', '2016-03-27 13:31:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('639', 'c4ff9961gw1eyd62b11h3j20c83g37hb.jpg', '1459056694012.jpg', 'jpg', '/photos/1459056694012.jpg', 'Y', null, '1', '2016-03-27 13:31:34', '1', '2016-03-27 13:31:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('640', '2016-03-17_up.jpg', '1459062556438.jpg', 'jpg', '/1459062556438.jpg', 'Y', null, '1', '2016-03-27 15:09:16', '1', '2016-03-27 15:09:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('641', '2016-03-17_up.jpg', '1459062573947.jpg', 'jpg', '/1459062573947.jpg', 'Y', null, '1', '2016-03-27 15:09:34', '1', '2016-03-27 15:09:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('642', 'QQ图片20160317160628.jpg', '1459069216546.jpg', 'jpg', '/photos/1459069216546.jpg', 'Y', null, '1', '2016-03-27 17:00:17', '1', '2016-03-27 17:00:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('643', '项目SVN地址.png', '1459069889732.png', 'png', '/photos/1459069889732.png', 'Y', null, '1', '2016-03-27 17:11:30', '1', '2016-03-27 17:11:30', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('644', '??.jpg', '1459136553298.jpg', 'jpg', '/1459136553298.jpg', 'Y', null, '1', '2016-03-28 11:42:33', '1', '2016-03-28 11:42:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('645', '2016-03-21_up.jpg', '1459137671451.jpg', 'jpg', '/1459137671451.jpg', 'Y', null, '1', '2016-03-28 12:01:11', '1', '2016-03-28 12:01:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('646', '项目SVN地址.png', '1459142373327.png', 'png', '/photos/1459142373327.png', 'Y', null, '1', '2016-03-28 13:19:33', '1', '2016-03-28 13:19:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('647', '项目SVN地址.png', '1459146659882.png', 'png', '/photos/1459146659882.png', 'Y', null, '1', '2016-03-28 14:31:00', '1', '2016-03-28 14:31:00', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('648', 'QQ图片20160317160628.jpg', '1459146775376.jpg', 'jpg', '/photos/1459146775376.jpg', 'Y', null, '1', '2016-03-28 14:32:55', '1', '2016-03-28 14:32:55', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('649', '项目SVN地址.png', '1459147519728.png', 'png', '/photos/1459147519728.png', 'Y', null, '1', '2016-03-28 14:45:20', '1', '2016-03-28 14:45:20', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('650', '项目SVN地址.png', '1459147771591.png', 'png', '/photos/1459147771591.png', 'Y', null, '1', '2016-03-28 14:49:32', '1', '2016-03-28 14:49:32', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('651', '2016-03-21_up.jpg', '1459148093295.jpg', 'jpg', '/1459148093295.jpg', 'Y', null, '1', '2016-03-28 14:54:53', '1', '2016-03-28 14:54:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('652', '项目SVN地址.png', '1459148216042.png', 'png', '/photos/1459148216042.png', 'Y', null, '1', '2016-03-28 14:56:56', '1', '2016-03-28 14:56:56', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('653', '项目SVN地址.png', '1459149041161.png', 'png', '/knowledge/1459149041161.png', 'Y', null, '1', '2016-03-28 15:10:41', '1', '2016-03-28 15:10:41', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('654', '菜单.jpg', '1459149133149.jpg', 'jpg', '/knowledge/1459149133149.jpg', 'Y', null, '1', '2016-03-28 15:12:13', '1', '2016-03-28 15:12:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('655', '华兴融合IP对讲系统产品手册.pdf', '1459149480029.pdf', 'pdf', '/knowledge/1459149480029.pdf', 'Y', null, '1', '2016-03-28 15:18:00', '1', '2016-03-28 15:18:00', 'application/pdf');
INSERT INTO `gxwl_sys_doc` VALUES ('656', '2016-03-28_up.jpg', '1459149749493.jpg', 'jpg', '/1459149749493.jpg', 'Y', null, '1', '2016-03-28 15:22:29', '1', '2016-03-28 15:22:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('657', 'Screenshot_2016-03-01-13-49-24.png', '1459150526262.png', 'png', '/1459150526262.png', 'Y', null, '1', '2016-03-28 15:35:26', '1', '2016-03-28 15:35:26', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('658', 'econ_menu01.png', '1459150992149.png', 'png', '/photos/1459150992149.png', 'Y', null, '1', '2016-03-28 15:43:12', '1', '2016-03-28 15:43:12', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('659', '2016-03-28_up.jpg', '1459151081551.jpg', 'jpg', '/1459151081551.jpg', 'Y', null, '1', '2016-03-28 15:44:42', '1', '2016-03-28 15:44:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('660', 'frame1_p.png', '1459151288132.png', 'png', '/photos/1459151288132.png', 'Y', null, '1', '2016-03-28 15:48:08', '1', '2016-03-28 15:48:08', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('661', '2016-03-28_up.jpg', '1459151526785.jpg', 'jpg', '/1459151526785.jpg', 'Y', null, '1', '2016-03-28 15:52:07', '1', '2016-03-28 15:52:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('662', '内存溢出.txt', '1459329406050.txt', 'txt', '/proBuild/1459329406050.txt', 'N', null, '1', '2016-03-30 17:16:46', '1', '2016-03-30 17:16:46', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('663', '2016-03-28_up.jpg', '1459407327478.jpg', 'jpg', '/1459407327478.jpg', 'Y', null, '1', '2016-03-31 14:55:28', '1', '2016-03-31 14:55:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('664', 'econ_menu01.png', '1459407364704.png', 'png', '/1459407364704.png', 'Y', null, '1', '2016-03-31 14:56:05', '1', '2016-03-31 14:56:05', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('665', 'frame1_p.png', '1459407622153.png', 'png', '/photos/1459407622153.png', 'Y', null, '1', '2016-03-31 15:00:22', '1', '2016-03-31 15:00:22', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('666', 'QQ图片20160317160628.jpg', '1459407699683.jpg', 'jpg', '/photos/1459407699683.jpg', 'Y', null, '1', '2016-03-31 15:01:40', '1', '2016-03-31 15:01:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('667', 'econ_menu01.png', '1459410114686.png', 'png', '/1459410114686.png', 'Y', null, '1', '2016-03-31 15:41:55', '1', '2016-03-31 15:41:55', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('668', '1.png', '1459410230528.png', 'png', '/photos/1459410230528.png', 'Y', null, '1', '2016-03-31 15:43:51', '1', '2016-03-31 15:43:51', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('669', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1459410411729.jpg', 'jpg', '/photos/1459410411729.jpg', 'Y', null, '1', '2016-03-31 15:46:52', '1', '2016-03-31 15:46:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('670', 'frame1_p.png', '1459416507382.png', 'png', '/photos/1459416507382.png', 'Y', null, '1', '2016-03-31 17:28:27', '1', '2016-03-31 17:28:27', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('671', '2012121716537448.jpg', '1459417598703.jpg', 'jpg', '/photos/1459417598703.jpg', 'Y', null, '1', '2016-03-31 17:46:39', '1', '2016-03-31 17:46:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('672', 'xiaoxiaoniao.mp3', '1459475352890.mp3', 'mp3', '/photos/1459475352890.mp3', 'Y', null, '1', '2016-04-01 09:49:13', '1', '2016-04-01 09:49:13', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('673', 'xiaoxiaoniao.mp3', '1459475592595.mp3', 'mp3', '/photos/1459475592595.mp3', 'Y', null, '1', '2016-04-01 09:53:13', '1', '2016-04-01 09:53:13', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('674', 'xiaoxiaoniao.mp3', '1459475950816.mp3', 'mp3', '/photos/1459475950816.mp3', 'Y', null, '1', '2016-04-01 09:59:51', '1', '2016-04-01 09:59:53', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('675', '44f22b690feebe76bf370f9c6a72341e.mkv', '1459476117394.mkv', 'mkv', '/photos/1459476117394.mkv', 'Y', null, '1', '2016-04-01 10:01:58', '1', '2016-04-01 10:01:58', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('676', '44f22b690feebe76bf370f9c6a72341e.mkv', '1459476290833.mkv', 'mkv', '/photos/1459476290833.mkv', 'Y', null, '1', '2016-04-01 10:04:55', '1', '2016-04-01 10:04:55', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('677', '44f22b690feebe76bf370f9c6a72341e.mkv', '1459476386559.mkv', 'mkv', '/photos/1459476386559.mkv', 'Y', null, '1', '2016-04-01 10:06:28', '1', '2016-04-01 10:06:28', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('678', '2012121716537448.jpg', '1459479627557.jpg', 'jpg', '/1459479627557.jpg', 'Y', null, '1', '2016-04-01 11:00:28', '1', '2016-04-01 11:00:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('679', '44f22b690feebe76bf370f9c6a72341e.mkv', '1459483531381.mkv', 'mkv', '/1459483531381.mkv', 'Y', null, '1', '2016-04-01 12:05:32', '1', '2016-04-01 12:05:32', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('680', 'xiaoxiaoniao.mp3', '1459488223074.mp3', 'mp3', '/1459488223074.mp3', 'Y', null, '1', '2016-04-01 13:23:43', '1', '2016-04-01 13:23:43', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('681', 'xiaoxiaoniao.mp3', '1459489368077.mp3', 'mp3', '/1459489368077.mp3', 'Y', null, '1', '2016-04-01 13:42:48', '1', '2016-04-01 13:42:48', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('682', 'xiaoxiaoniao.mp3', '1459489453136.mp3', 'mp3', '/1459489453136.mp3', 'Y', null, '1', '2016-04-01 13:44:13', '1', '2016-04-01 13:44:13', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('683', 'xiaoxiaoniao.mp3', '1459489980719.mp3', 'mp3', '/1459489980719.mp3', 'Y', null, '1', '2016-04-01 13:53:01', '1', '2016-04-01 13:53:01', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('684', 'xiaoxiaoniao.mp3', '1459495339083.mp3', 'mp3', '/1459495339083.mp3', 'Y', null, '1', '2016-04-01 15:22:19', '1', '2016-04-01 15:22:19', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('685', 'xiaoxiaoniao.mp3', '1459498140041.mp3', 'mp3', '/1459498140041.mp3', 'Y', null, '1', '2016-04-01 16:09:00', '1', '2016-04-01 16:09:00', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('686', 'xiaoxiaoniao2.mp3', '1459498147724.mp3', 'mp3', '/1459498147724.mp3', 'Y', null, '1', '2016-04-01 16:09:08', '1', '2016-04-01 16:09:08', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('687', 'xiaoxiaoniao.mp3', '1459498628074.mp3', 'mp3', '/1459498628074.mp3', 'Y', null, '1', '2016-04-01 16:17:08', '1', '2016-04-01 16:17:08', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('688', 'xiaoxiaoniao.mp3', '1459499288014.mp3', 'mp3', '/1459499288014.mp3', 'Y', null, '1', '2016-04-01 16:28:08', '1', '2016-04-01 16:28:08', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('689', 'xiaoxiaoniao2.mp3', '1459499346573.mp3', 'mp3', '/1459499346573.mp3', 'Y', null, '1', '2016-04-01 16:29:07', '1', '2016-04-01 16:29:07', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('690', 'xiaoxiaoniao2.mp3', '1459499466412.mp3', 'mp3', '/1459499466412.mp3', 'Y', null, '1', '2016-04-01 16:31:06', '1', '2016-04-01 16:31:06', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('691', 'xiaoxiaoniao2.mp3', '1459499693153.mp3', 'mp3', '/1459499693153.mp3', 'Y', null, '1', '2016-04-01 16:34:53', '1', '2016-04-01 16:34:53', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('692', 'xiaoxiaoniao.mp3', '1459499799362.mp3', 'mp3', '/1459499799362.mp3', 'Y', null, '1', '2016-04-01 16:36:39', '1', '2016-04-01 16:36:39', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('693', 'xiaoxiaoniao.mp3', '1459499948208.mp3', 'mp3', '/1459499948208.mp3', 'Y', null, '1', '2016-04-01 16:39:08', '1', '2016-04-01 16:39:08', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('694', 'xiaoxiaoniao2.mp3', '1459500012336.mp3', 'mp3', '/1459500012336.mp3', 'Y', null, '1', '2016-04-01 16:40:12', '1', '2016-04-01 16:40:12', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('695', 'xiaoxiaoniao.mp3', '1459500038138.mp3', 'mp3', '/1459500038138.mp3', 'Y', null, '1', '2016-04-01 16:40:38', '1', '2016-04-01 16:40:38', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('696', 'xiaoxiaoniao.mp3', '1459500983147.mp3', 'mp3', '/1459500983147.mp3', 'Y', null, '1', '2016-04-01 16:56:23', '1', '2016-04-01 16:56:23', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('697', 'xiaoxiaoniao.mp3', '1459501011045.mp3', 'mp3', '/1459501011045.mp3', 'Y', null, '1', '2016-04-01 16:56:51', '1', '2016-04-01 16:56:51', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('698', 'xiaoxiaoniao2.mp3', '1459501020025.mp3', 'mp3', '/1459501020025.mp3', 'Y', null, '1', '2016-04-01 16:57:00', '1', '2016-04-01 16:57:00', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('699', '出入虎穴.mkv', '1459501448749.mkv', 'mkv', '/1459501448749.mkv', 'Y', null, '1', '2016-04-01 17:04:09', '1', '2016-04-01 17:04:09', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('700', '出入虎穴.mkv', '1459503867769.mkv', 'mkv', '/1459503867769.mkv', 'Y', null, '1', '2016-04-01 17:44:28', '1', '2016-04-01 17:44:28', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('701', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1459504144775.jpg', 'jpg', '/1459504144775.jpg', 'Y', null, '1', '2016-04-01 17:49:05', '1', '2016-04-01 17:49:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('702', '??.jpg', '1459921976839.jpg', 'jpg', '/1459921976839.jpg', 'Y', null, '1', '2016-04-06 13:52:57', '1', '2016-04-06 13:52:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('703', '2012121716537448.jpg', '1459923562940.jpg', 'jpg', '/1459923562940.jpg', 'Y', null, '1', '2016-04-06 14:19:23', '1', '2016-04-06 14:19:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('704', '1459151526785.jpg', '1459923622618.jpg', 'jpg', '/1459923622618.jpg', 'Y', null, '1', '2016-04-06 14:20:23', '1', '2016-04-06 14:20:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('705', 'frame1_p.png', '1459923853507.png', 'png', '/1459923853507.png', 'Y', null, '1', '2016-04-06 14:24:14', '1', '2016-04-06 14:24:14', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('706', '1459407364704.png', '1459924466331.png', 'png', '/1459924466331.png', 'Y', null, '1', '2016-04-06 14:34:26', '1', '2016-04-06 14:34:26', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('707', 'com.fuqi.camera.png', '1459924539559.png', 'png', '/1459924539559.png', 'Y', null, '1', '2016-04-06 14:35:40', '1', '2016-04-06 14:35:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('708', '2012121716537448.jpg', '1459924569144.jpg', 'jpg', '/1459924569144.jpg', 'Y', null, '1', '2016-04-06 14:36:09', '1', '2016-04-06 14:36:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('709', 'org.funship.findsomething.channel_91.png', '1459924587943.png', 'png', '/1459924587943.png', 'Y', null, '1', '2016-04-06 14:36:28', '1', '2016-04-06 14:36:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('710', '智慧社区-问题跟踪表（刘）.xlsx', '1459931861064.xlsx', 'xlsx', '/proBuild/1459931861064.xlsx', 'Y', null, '1', '2016-04-06 16:37:41', '1', '2016-04-06 16:37:41', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
INSERT INTO `gxwl_sys_doc` VALUES ('711', '软件部-单周工作计划 (1).xlsx', '1459932506878.xlsx', 'xlsx', '/proBuild/1459932506878.xlsx', 'Y', null, '1', '2016-04-06 16:48:27', '1', '2016-04-06 16:48:27', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
INSERT INTO `gxwl_sys_doc` VALUES ('712', '智慧社区-问题跟踪表（刘）.xlsx', '1459932511558.xlsx', 'xlsx', '/proBuild/1459932511558.xlsx', 'N', null, '1', '2016-04-06 16:48:32', '1', '2016-04-06 16:48:32', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
INSERT INTO `gxwl_sys_doc` VALUES ('713', '1459924569144.jpg', '1460168669404.jpg', 'jpg', '/1460168669404.jpg', 'Y', null, '1', '2016-04-09 10:24:29', '1', '2016-04-09 10:24:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('714', '工程参考网站.txt', '1460181299246.txt', 'txt', '/proBuild/1460181299246.txt', 'N', null, '1', '2016-04-09 13:54:59', '1', '2016-04-09 13:54:59', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('715', '内存溢出.txt', '1460194822627.txt', 'txt', '/knowledge/1460194822627.txt', 'N', null, '1', '2016-04-09 17:40:23', '1', '2016-04-09 17:40:23', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('716', 'AQL.txt', '1460194919013.txt', 'txt', '/knowledge/1460194919013.txt', 'N', null, '1', '2016-04-09 17:41:59', '1', '2016-04-09 17:41:59', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('717', 'QQ图片20160408132526.jpg', '1460336859984.jpg', 'jpg', '/1460336859984.jpg', 'Y', null, '1', '2016-04-11 09:07:40', '1', '2016-04-11 09:07:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('718', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460358477338.jpg', 'jpg', '/1460358477338.jpg', 'Y', null, '1', '2016-04-11 15:07:57', '1', '2016-04-11 15:07:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('719', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460358616804.jpg', 'jpg', '/1460358616804.jpg', 'Y', null, '1', '2016-04-11 15:10:17', '1', '2016-04-11 15:10:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('720', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1460358813018.jpg', 'jpg', '/1460358813018.jpg', 'Y', null, '1', '2016-04-11 15:13:33', '1', '2016-04-11 15:13:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('721', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1460358875078.jpg', 'jpg', '/photos/1460358875078.jpg', 'Y', null, '1', '2016-04-11 15:14:35', '1', '2016-04-11 15:14:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('722', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460358980845.jpg', 'jpg', '/1460358980845.jpg', 'Y', null, '1', '2016-04-11 15:16:21', '1', '2016-04-11 15:16:21', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('723', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460359781953.jpg', 'jpg', '/1460359781953.jpg', 'Y', null, '1', '2016-04-11 15:29:42', '1', '2016-04-11 15:29:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('724', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460360344305.jpg', 'jpg', '/photos/1460360344305.jpg', 'Y', null, '1', '2016-04-11 15:39:04', '1', '2016-04-11 15:39:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('725', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1460360383576.jpg', 'jpg', '/photos/1460360383576.jpg', 'Y', null, '1', '2016-04-11 15:39:44', '1', '2016-04-11 15:39:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('726', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460360478953.jpg', 'jpg', '/photos/1460360478953.jpg', 'Y', null, '1', '2016-04-11 15:41:19', '1', '2016-04-11 15:41:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('727', '2012121716537448.jpg', '1460427041873.jpg', 'jpg', '/1460427041873.jpg', 'Y', null, '1', '2016-04-12 10:10:42', '1', '2016-04-12 10:10:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('728', '智慧社区-问题跟踪表（刘）.xlsx', '1460427771867.xlsx', 'xlsx', '/proBuild/1460427771867.xlsx', 'Y', null, '1', '2016-04-12 10:22:52', '1', '2016-04-12 10:22:52', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
INSERT INTO `gxwl_sys_doc` VALUES ('729', '智慧社区-问题跟踪表（刘）.xlsx', '1460427802429.xlsx', 'xlsx', '/proBuild/1460427802429.xlsx', 'N', null, '1', '2016-04-12 10:23:22', '1', '2016-04-12 10:23:22', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
INSERT INTO `gxwl_sys_doc` VALUES ('730', '内存溢出.txt', '1460427821013.txt', 'txt', '/proBuild/1460427821013.txt', 'N', null, '1', '2016-04-12 10:23:41', '1', '2016-04-12 10:23:41', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('731', '7497767f179efbea577fa9f95e7288cc.gif', '1460438818061.gif', 'gif', '/proBuild/1460438818061.gif', 'Y', null, '1', '2016-04-12 13:26:58', '1', '2016-04-12 13:26:58', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('732', '7497767f179efbea577fa9f95e7288cc.gif', '1460438831759.gif', 'gif', '/proBuild/1460438831759.gif', 'Y', null, '1', '2016-04-12 13:27:12', '1', '2016-04-12 13:27:12', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('733', '7497767f179efbea577fa9f95e7288cc.gif', '1460438846105.gif', 'gif', '/proBuild/1460438846105.gif', 'N', null, '1', '2016-04-12 13:27:26', '1', '2016-04-12 13:27:26', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('734', '工程参考网站.txt', '1460438860416.txt', 'txt', '/proBuild/1460438860416.txt', 'N', null, '1', '2016-04-12 13:27:40', '1', '2016-04-12 13:27:40', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('735', 'a3c70a994ddad3a047555a423c0dc6af.jpg', '1460442286517.jpg', 'jpg', '/photos/1460442286517.jpg', 'Y', null, '1', '2016-04-12 14:24:47', '1', '2016-04-12 14:24:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('736', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460442428012.jpg', 'jpg', '/photos/1460442428012.jpg', 'Y', null, '1', '2016-04-12 14:27:08', '1', '2016-04-12 14:27:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('737', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460443293494.jpg', 'jpg', '/proBuild/1460443293494.jpg', 'Y', null, '1', '2016-04-12 14:41:33', '1', '2016-04-12 14:41:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('738', '2012121716537448.jpg', '1460443524691.jpg', 'jpg', '/photos/1460443524691.jpg', 'N', null, '1', '2016-04-12 14:45:25', '1', '2016-04-12 14:45:25', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('739', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460444243147.jpg', 'jpg', '/proBuild/1460444243147.jpg', 'Y', null, '1', '2016-04-12 14:57:23', '1', '2016-04-12 14:57:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('740', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460444343782.jpg', 'jpg', '/proBuild/1460444343782.jpg', 'Y', null, '1', '2016-04-12 14:59:04', '1', '2016-04-12 14:59:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('741', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460444457170.jpg', 'jpg', '/proBuild/1460444457170.jpg', 'Y', null, '1', '2016-04-12 15:00:57', '1', '2016-04-12 15:00:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('742', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460445897842.jpg', 'jpg', '/proBuild/1460445897842.jpg', 'Y', null, '1', '2016-04-12 15:24:58', '1', '2016-04-12 15:24:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('743', '备案图标.png', '1460446927741.png', 'png', '/proBuild/1460446927741.png', 'Y', null, '1', '2016-04-12 15:42:08', '1', '2016-04-12 15:42:08', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('744', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460447044727.jpg', 'jpg', '/proBuild/1460447044727.jpg', 'Y', null, '1', '2016-04-12 15:44:05', '1', '2016-04-12 15:44:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('745', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460447058067.jpg', 'jpg', '/proBuild/1460447058067.jpg', 'Y', null, '1', '2016-04-12 15:44:18', '1', '2016-04-12 15:44:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('746', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460447109785.jpg', 'jpg', '/proBuild/1460447109785.jpg', 'Y', null, '1', '2016-04-12 15:45:10', '1', '2016-04-12 15:45:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('747', '1.png', '1460448762285.png', 'png', '/proBuild/1460448762285.png', 'N', null, '1', '2016-04-12 16:12:42', '1', '2016-04-12 16:12:42', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('748', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460448882176.jpg', 'jpg', '/photos/1460448882176.jpg', 'Y', null, '1', '2016-04-12 16:14:42', '1', '2016-04-12 16:14:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('749', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460448943408.jpg', 'jpg', '/photos/1460448943408.jpg', 'Y', null, '1', '2016-04-12 16:15:43', '1', '2016-04-12 16:15:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('750', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460448947771.jpg', 'jpg', '/photos/1460448947771.jpg', 'Y', null, '1', '2016-04-12 16:15:48', '1', '2016-04-12 16:15:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('751', '1.png', '1460448956870.png', 'png', '/photos/1460448956870.png', 'Y', null, '1', '2016-04-12 16:15:57', '1', '2016-04-12 16:15:57', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('752', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460448959849.jpg', 'jpg', '/photos/1460448959849.jpg', 'Y', null, '1', '2016-04-12 16:16:00', '1', '2016-04-12 16:16:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('753', '1.png', '1460449034777.png', 'png', '/photos/1460449034777.png', 'Y', null, '1', '2016-04-12 16:17:15', '1', '2016-04-12 16:17:15', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('754', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460449036710.jpg', 'jpg', '/photos/1460449036710.jpg', 'Y', null, '1', '2016-04-12 16:17:17', '1', '2016-04-12 16:17:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('755', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460449073522.jpg', 'jpg', '/photos/1460449073522.jpg', 'Y', null, '1', '2016-04-12 16:17:54', '1', '2016-04-12 16:17:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('756', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460449703267.jpg', 'jpg', '/photos/1460449703267.jpg', 'N', null, '1', '2016-04-12 16:28:23', '1', '2016-04-12 16:28:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('757', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460449755940.jpg', 'jpg', '/photos/1460449755940.jpg', 'N', null, '1', '2016-04-12 16:29:16', '1', '2016-04-12 16:29:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('758', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460449778444.jpg', 'jpg', '/photos/1460449778444.jpg', 'N', null, '1', '2016-04-12 16:29:38', '1', '2016-04-12 16:29:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('759', '备案图标.png', '1460449839126.png', 'png', '/photos/1460449839126.png', 'N', null, '1', '2016-04-12 16:30:39', '1', '2016-04-12 16:30:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('760', '备案图标.png', '1460449991475.png', 'png', '/photos/1460449991475.png', 'Y', null, '1', '2016-04-12 16:33:11', '1', '2016-04-12 16:33:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('761', '备案图标.png', '1460450125402.png', 'png', '/photos/1460450125402.png', 'N', null, '1', '2016-04-12 16:35:25', '1', '2016-04-12 16:35:25', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('762', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460450137544.jpg', 'jpg', '/photos/1460450137544.jpg', 'Y', null, '1', '2016-04-12 16:35:38', '1', '2016-04-12 16:35:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('763', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460450156113.jpg', 'jpg', '/photos/1460450156113.jpg', 'Y', null, '1', '2016-04-12 16:35:56', '1', '2016-04-12 16:35:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('764', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460450163468.jpg', 'jpg', '/photos/1460450163468.jpg', 'N', null, '1', '2016-04-12 16:36:03', '1', '2016-04-12 16:36:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('765', '@PathVariable和@RequestParam的区别_百度知道.png', '1460450187309.png', 'png', '/photos/1460450187309.png', 'Y', null, '1', '2016-04-12 16:36:27', '1', '2016-04-12 16:36:27', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('766', '@PathVariable和@RequestParam的区别_百度知道.png', '1460450197172.png', 'png', '/photos/1460450197172.png', 'N', null, '1', '2016-04-12 16:36:37', '1', '2016-04-12 16:36:37', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('767', '@PathVariable和@RequestParam的区别_百度知道.png', '1460450209812.png', 'png', '/photos/1460450209812.png', 'N', null, '1', '2016-04-12 16:36:50', '1', '2016-04-12 16:36:50', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('768', '21494230A-0-lp.jpg', '1460450397166.jpg', 'jpg', '/photos/1460450397166.jpg', 'N', null, '1', '2016-04-12 16:39:57', '1', '2016-04-12 16:39:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('769', '1-121002122100a5.jpg', '1460450525469.jpg', 'jpg', '/photos/1460450525469.jpg', 'Y', null, '1', '2016-04-12 16:42:05', '1', '2016-04-12 16:42:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('770', '1-121002122100a5.jpg', '1460450544223.jpg', 'jpg', '/photos/1460450544223.jpg', 'N', null, '1', '2016-04-12 16:42:24', '1', '2016-04-12 16:42:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('771', '1-1511091256290-L.jpg', '1460450557611.jpg', 'jpg', '/photos/1460450557611.jpg', 'N', null, '1', '2016-04-12 16:42:38', '1', '2016-04-12 16:42:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('772', '1-151021004JV46.jpg', '1460450728383.jpg', 'jpg', '/photos/1460450728383.jpg', 'Y', null, '1', '2016-04-12 16:45:28', '1', '2016-04-12 16:45:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('773', '1-121002122100a5.jpg', '1460450751659.jpg', 'jpg', '/photos/1460450751659.jpg', 'N', null, '1', '2016-04-12 16:45:52', '1', '2016-04-12 16:45:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('774', '1-1511091256290-L.jpg', '1460452176380.jpg', 'jpg', '/photos/1460452176380.jpg', 'Y', null, '1', '2016-04-12 17:09:36', '1', '2016-04-12 17:09:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('775', '21494230A-0-lp.jpg', '1460453940413.jpg', 'jpg', '/photos/1460453940413.jpg', 'Y', null, '1', '2016-04-12 17:39:00', '1', '2016-04-12 17:39:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('776', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460453948094.jpg', 'jpg', '/photos/1460453948094.jpg', 'N', null, '1', '2016-04-12 17:39:08', '1', '2016-04-12 17:39:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('777', '1-151021004JV46.jpg', '1460454139116.jpg', 'jpg', '/photos/1460454139116.jpg', 'Y', null, '1', '2016-04-12 17:42:19', '1', '2016-04-12 17:42:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('778', '1-1511100044350-L.jpg', '1460454267035.jpg', 'jpg', '/photos/1460454267035.jpg', 'N', null, '1', '2016-04-12 17:44:27', '1', '2016-04-12 17:44:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('779', '1-1511100044350-L.jpg', '1460454517825.jpg', 'jpg', '/photos/1460454517825.jpg', 'Y', null, '1', '2016-04-12 17:48:38', '1', '2016-04-12 17:48:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('780', '1-121002122100a5 (1).jpg', '1460454521603.jpg', 'jpg', '/photos/1460454521603.jpg', 'N', null, '1', '2016-04-12 17:48:42', '1', '2016-04-12 17:48:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('781', '1-1511091256290-L.jpg', '1460454535963.jpg', 'jpg', '/photos/1460454535963.jpg', 'Y', null, '1', '2016-04-12 17:48:56', '1', '2016-04-12 17:48:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('782', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460454539179.jpg', 'jpg', '/photos/1460454539179.jpg', 'N', null, '1', '2016-04-12 17:48:59', '1', '2016-04-12 17:48:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('783', '1-121002122100a5 (1).jpg', '1460454879726.jpg', 'jpg', '/photos/1460454879726.jpg', 'N', null, '1', '2016-04-12 17:54:40', '1', '2016-04-12 17:54:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('784', '1-1511091256290-L.jpg', '1460454923065.jpg', 'jpg', '/photos/1460454923065.jpg', 'N', null, '1', '2016-04-12 17:55:23', '1', '2016-04-12 17:55:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('785', '21494230A-0-lp.jpg', '1460455029749.jpg', 'jpg', '/photos/1460455029749.jpg', 'Y', null, '1', '2016-04-12 17:57:10', '1', '2016-04-12 17:57:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('786', '1-1511091256290-L.jpg', '1460455197949.jpg', 'jpg', '/photos/1460455197949.jpg', 'Y', null, '1', '2016-04-12 17:59:58', '1', '2016-04-12 17:59:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('787', '1-1511091256290-L.jpg', '1460455276169.jpg', 'jpg', '/photos/1460455276169.jpg', 'N', null, '1', '2016-04-12 18:01:16', '1', '2016-04-12 18:01:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('788', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460455285904.jpg', 'jpg', '/photos/1460455285904.jpg', 'Y', null, '1', '2016-04-12 18:01:26', '1', '2016-04-12 18:01:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('789', '2012121716537448.jpg', '1460510557276.jpg', 'jpg', '/photos/1460510557276.jpg', 'Y', null, '1', '2016-04-13 09:22:37', '1', '2016-04-13 09:22:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('790', '2012121716537448.jpg', '1460510592615.jpg', 'jpg', '/photos/1460510592615.jpg', 'Y', null, '1', '2016-04-13 09:23:13', '1', '2016-04-13 09:23:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('792', '6f87a9e299152900d98c2ac463566e6e.jpg', '1460524802814.jpg', 'jpg', '/photos/1460524802814.jpg', 'N', null, '1', '2016-04-13 13:20:03', '1', '2016-04-13 13:20:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('793', '1-121002122100a5.jpg', '1460524831932.jpg', 'jpg', '/photos/1460524831932.jpg', 'N', null, '1', '2016-04-13 13:20:32', '1', '2016-04-13 13:20:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('794', '1459921976839.jpg', '1460525225181.jpg', 'jpg', '/1460525225181.jpg', 'Y', null, '1', '2016-04-13 13:27:05', '1', '2016-04-13 13:27:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('795', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460527377333.jpg', 'jpg', '/1460527377333.jpg', 'Y', null, '1', '2016-04-13 14:02:57', '1', '2016-04-13 14:02:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('796', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1460527434236.jpg', 'jpg', '/1460527434236.jpg', 'Y', null, '1', '2016-04-13 14:03:54', '1', '2016-04-13 14:03:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('797', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1460528023256.jpg', 'jpg', '/1460528023256.jpg', 'Y', null, '1', '2016-04-13 14:13:43', '1', '2016-04-13 14:13:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('798', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1460528213810.jpg', 'jpg', '/1460528213810.jpg', 'Y', null, '1', '2016-04-13 14:16:54', '1', '2016-04-13 14:16:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('799', '2012121716537448.jpg', '1460530793186.jpg', 'jpg', '/knowledge/1460530793186.jpg', 'N', null, '1', '2016-04-13 14:59:53', '1', '2016-04-13 14:59:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('801', '1459924569144.jpg', '1460533074136.jpg', 'jpg', '/1460533074136.jpg', 'Y', null, '1', '2016-04-13 15:37:54', '1', '2016-04-13 15:37:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('802', 'QQ截图20160413154955.jpg', '1460533821123.jpg', 'jpg', '/photos/1460533821123.jpg', 'Y', null, '1', '2016-04-13 15:50:21', '1', '2016-04-13 15:50:21', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('803', 'QQ截图20160413154955.jpg', '1460533892659.jpg', 'jpg', '/photos/1460533892659.jpg', 'N', null, '1', '2016-04-13 15:51:33', '1', '2016-04-13 15:51:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('804', '出入虎穴.mkv', '1460537233374.mkv', 'mkv', '/1460537233374.mkv', 'Y', null, '1', '2016-04-13 16:47:14', '1', '2016-04-13 16:47:14', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('805', 'xiaoxiaoniao.mp3', '1460537701086.mp3', 'mp3', '/1460537701086.mp3', 'Y', null, '1', '2016-04-13 16:55:01', '1', '2016-04-13 16:55:01', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('806', '马.jpg', '1460538279948.jpg', 'jpg', '/photos/1460538279948.jpg', 'Y', null, '1', '2016-04-13 17:04:40', '1', '2016-04-13 17:04:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('807', '枫叶.jpg', '1460539151759.jpg', 'jpg', '/photos/1460539151759.jpg', 'Y', null, '1', '2016-04-13 17:19:12', '1', '2016-04-13 17:19:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('808', '枫叶.jpg', '1460540371418.jpg', 'jpg', '/photos/1460540371418.jpg', 'N', null, '1', '2016-04-13 17:39:31', '1', '2016-04-13 17:39:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('809', '枫叶.jpg', '1460544728534.jpg', 'jpg', '/1460544728534.jpg', 'Y', null, '1', '2016-04-13 18:52:09', '1', '2016-04-13 18:52:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('810', 'QQ图片20160317160628.jpg', '1460554759637.jpg', 'jpg', '/photos/1460554759637.jpg', 'N', null, '1', '2016-04-13 21:39:20', '1', '2016-04-13 21:39:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('811', 'QQ图片20160317160628.jpg', '1460554793903.jpg', 'jpg', '/photos/1460554793903.jpg', 'N', null, '1', '2016-04-13 21:39:54', '1', '2016-04-13 21:39:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('812', 'QQ图片20160317160628.jpg', '1460555031707.jpg', 'jpg', '/photos/1460555031707.jpg', 'Y', null, '1', '2016-04-13 21:43:52', '1', '2016-04-13 21:43:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('813', '1-1511100044350-L.jpg', '1460596367903.jpg', 'jpg', '/photos/1460596367903.jpg', 'N', null, '1', '2016-04-14 09:12:48', '1', '2016-04-14 09:12:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('814', '600SAVE_20141112_244159.jpeg', '1460597050000.jpeg', 'jpeg', '/knowledge/1460597050000.jpeg', 'N', null, '1', '2016-04-14 09:24:10', '1', '2016-04-14 09:24:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('815', '2012121716537448.jpg', '1460599725027.jpg', 'jpg', '/photos/1460599725027.jpg', 'N', null, '1', '2016-04-14 10:08:45', '1', '2016-04-14 10:08:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('816', '枫叶.jpg', '1460632483253.jpg', 'jpg', '/photos/1460632483253.jpg', 'N', null, '1', '2016-04-14 19:14:43', '1', '2016-04-14 19:14:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('817', 'QQ截图20160414193044.jpg', '1460633451573.jpg', 'jpg', '/photos/1460633451573.jpg', 'N', null, '1', '2016-04-14 19:30:52', '1', '2016-04-14 19:30:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('818', 'QQ图片20160408132526.jpg', '1460713226979.jpg', 'jpg', '/1460713226979.jpg', 'Y', null, '1', '2016-04-15 17:40:27', '1', '2016-04-15 17:40:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('819', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1460713237636.png', 'png', '/1460713237636.png', 'Y', null, '1', '2016-04-15 17:40:38', '1', '2016-04-15 17:40:38', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('820', 'QQ图片20160408132526.jpg', '1460713388066.jpg', 'jpg', '/1460713388066.jpg', 'Y', null, '1', '2016-04-15 17:43:08', '1', '2016-04-15 17:43:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('821', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1460713450204.png', 'png', '/1460713450204.png', 'Y', null, '1', '2016-04-15 17:44:10', '1', '2016-04-15 17:44:10', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('822', 'xiaoxiaoniao.mp3', '1460714045614.mp3', 'mp3', '/1460714045614.mp3', 'Y', null, '1', '2016-04-15 17:54:06', '1', '2016-04-15 17:54:06', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('823', 'xiaoxiaoniao.mp3', '1460715319871.mp3', 'mp3', '/1460715319871.mp3', 'Y', null, '1', '2016-04-15 18:15:20', '1', '2016-04-15 18:15:20', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('824', 'xiaoxiaoniao2.mp3', '1460715363797.mp3', 'mp3', '/1460715363797.mp3', 'Y', null, '1', '2016-04-15 18:16:04', '1', '2016-04-15 18:16:04', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('825', 'xiaoxiaoniao.mp3', '1460715418833.mp3', 'mp3', '/1460715418833.mp3', 'Y', null, '1', '2016-04-15 18:16:59', '1', '2016-04-15 18:16:59', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('826', 'xiaoxiaoniao2.mp3', '1460715554685.mp3', 'mp3', '/1460715554685.mp3', 'Y', null, '1', '2016-04-15 18:19:15', '1', '2016-04-15 18:19:15', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('827', 'xiaoxiaoniao2.mp3', '1460715669096.mp3', 'mp3', '/1460715669096.mp3', 'Y', null, '1', '2016-04-15 18:21:09', '1', '2016-04-15 18:21:09', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('828', 'xiaoxiaoniao2.mp3', '1460716060846.mp3', 'mp3', '/1460716060846.mp3', 'Y', null, '1', '2016-04-15 18:27:41', '1', '2016-04-15 18:27:41', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('829', 'xiaoxiaoniao2.mp3', '1460716494168.mp3', 'mp3', '/1460716494168.mp3', 'Y', null, '1', '2016-04-15 18:34:54', '1', '2016-04-15 18:34:54', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('830', 'xiaoxiaoniao.mp3', '1460716527433.mp3', 'mp3', '/1460716527433.mp3', 'Y', null, '1', '2016-04-15 18:35:27', '1', '2016-04-15 18:35:27', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('831', 'xiaoxiaoniao.mp3', '1460717096087.mp3', 'mp3', '/1460717096087.mp3', 'Y', null, '1', '2016-04-15 18:44:56', '1', '2016-04-15 18:44:56', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('832', 'xiaoxiaoniao2.mp3', '1460717152969.mp3', 'mp3', '/1460717152969.mp3', 'Y', null, '1', '2016-04-15 18:45:53', '1', '2016-04-15 18:45:53', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('833', 'xiaoxiaoniao.mp3', '1460717219761.mp3', 'mp3', '/1460717219761.mp3', 'Y', null, '1', '2016-04-15 18:47:00', '1', '2016-04-15 18:47:00', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('834', 'xiaoxiaoniao2.mp3', '1460718631923.mp3', 'mp3', '/1460718631923.mp3', 'Y', null, '1', '2016-04-15 19:10:32', '1', '2016-04-15 19:10:32', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('835', 'xiaoxiaoniao.mp3', '1460718978469.mp3', 'mp3', '/1460718978469.mp3', 'Y', null, '1', '2016-04-15 19:16:18', '1', '2016-04-15 19:16:18', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('836', 'xiaoxiaoniao2.mp3', '1460718982954.mp3', 'mp3', '/1460718982954.mp3', 'Y', null, '1', '2016-04-15 19:16:23', '1', '2016-04-15 19:16:23', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('837', '枫叶.jpg', '1460727536578.jpg', 'jpg', '/photos/1460727536578.jpg', 'N', null, '1', '2016-04-15 21:38:57', '1', '2016-04-15 21:38:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('838', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1460771018794.jpg', 'jpg', '/1460771018794.jpg', 'Y', null, '1', '2016-04-16 09:43:39', '1', '2016-04-16 09:43:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('839', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460772116478.jpg', 'jpg', '/1460772116478.jpg', 'Y', null, '1', '2016-04-16 10:01:56', '1', '2016-04-16 10:01:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('840', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460776416285.jpg', 'jpg', '/1460776416285.jpg', 'Y', null, '1', '2016-04-16 11:13:36', '1', '2016-04-16 11:13:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('841', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1460776443387.jpg', 'jpg', '/1460776443387.jpg', 'Y', null, '1', '2016-04-16 11:14:03', '1', '2016-04-16 11:14:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('842', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1460947090790.jpg', 'jpg', '/1460947090790.jpg', 'Y', null, '1', '2016-04-18 10:38:11', '1', '2016-04-18 10:38:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('843', '1-1511100044350-L.jpg', '1460965101292.jpg', 'jpg', '/photos/1460965101292.jpg', 'Y', null, '1', '2016-04-18 15:38:21', '1', '2016-04-18 15:38:21', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('844', '1-1511100044350-L.jpg', '1460965106977.jpg', 'jpg', '/photos/1460965106977.jpg', 'N', null, '1', '2016-04-18 15:38:27', '1', '2016-04-18 15:38:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('845', '1-1511091256290-L.jpg', '1460965686778.jpg', 'jpg', '/photos/1460965686778.jpg', 'N', null, '1', '2016-04-18 15:48:07', '1', '2016-04-18 15:48:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('846', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460967315491.jpg', 'jpg', '/1460967315491.jpg', 'Y', null, '1', '2016-04-18 16:15:16', '1', '2016-04-18 16:15:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('848', '292377.jpg', '1460967774545.jpg', 'jpg', '/photos/1460967774545.jpg', 'Y', null, '1', '2016-04-18 16:22:55', '1', '2016-04-18 16:22:55', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('850', '1-151021004JV46.jpg', '1460967965287.jpg', 'jpg', '/photos/1460967965287.jpg', 'Y', null, '1', '2016-04-18 16:26:05', '1', '2016-04-18 16:26:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('851', '21494230A-0-lp.jpg', '1460967969115.jpg', 'jpg', '/photos/1460967969115.jpg', 'Y', null, '1', '2016-04-18 16:26:09', '1', '2016-04-18 16:26:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('852', '@PathVariable和@RequestParam的区别_百度知道.png', '1460967974649.png', 'png', '/photos/1460967974649.png', 'Y', null, '1', '2016-04-18 16:26:15', '1', '2016-04-18 16:26:15', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('853', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460968024261.jpg', 'jpg', '/1460968024261.jpg', 'Y', null, '1', '2016-04-18 16:27:04', '1', '2016-04-18 16:27:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('855', '@PathVariable和@RequestParam的区别_百度知道.png', '1460968186759.png', 'png', '/photos/1460968186759.png', 'Y', null, '1', '2016-04-18 16:29:47', '1', '2016-04-18 16:29:47', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('856', '292377.jpg', '1460968194137.jpg', 'jpg', '/photos/1460968194137.jpg', 'Y', null, '1', '2016-04-18 16:29:54', '1', '2016-04-18 16:29:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('857', '1-1511100044350-L.jpg', '1460968581887.jpg', 'jpg', '/knowledge/1460968581887.jpg', 'N', null, '1', '2016-04-18 16:36:22', '1', '2016-04-18 16:36:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('858', '2012121716537448.jpg', '1460976503989.jpg', 'jpg', '/knowledge/1460976503989.jpg', 'Y', null, '1', '2016-04-18 18:48:24', '1', '2016-04-18 18:48:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('859', '枫叶.jpg', '1460976762990.jpg', 'jpg', '/knowledge/1460976762990.jpg', 'N', null, '1', '2016-04-18 18:52:43', '1', '2016-04-18 18:52:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('860', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460980645794.jpg', 'jpg', '/1460980645794.jpg', 'Y', null, '1', '2016-04-18 19:57:26', '1', '2016-04-18 19:57:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('861', '2012121716537448.jpg', '1460982411267.jpg', 'jpg', '/photos/1460982411267.jpg', 'Y', null, '1', '2016-04-18 20:26:51', '1', '2016-04-18 20:26:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('862', '2012121716537448.jpg', '1460982418983.jpg', 'jpg', '/photos/1460982418983.jpg', 'N', null, '1', '2016-04-18 20:26:59', '1', '2016-04-18 20:26:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('863', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460984430081.jpg', 'jpg', '/1460984430081.jpg', 'Y', null, '1', '2016-04-18 21:00:30', '1', '2016-04-18 21:00:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('864', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460984550280.jpg', 'jpg', '/1460984550280.jpg', 'Y', null, '1', '2016-04-18 21:02:30', '1', '2016-04-18 21:02:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('865', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460984806854.jpg', 'jpg', '/1460984806854.jpg', 'Y', null, '1', '2016-04-18 21:06:47', '1', '2016-04-18 21:06:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('866', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1460985118243.jpg', 'jpg', '/1460985118243.jpg', 'Y', null, '1', '2016-04-18 21:11:58', '1', '2016-04-18 21:11:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('867', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460985179791.jpg', 'jpg', '/1460985179791.jpg', 'Y', null, '1', '2016-04-18 21:13:00', '1', '2016-04-18 21:13:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('868', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1460985359170.jpg', 'jpg', '/1460985359170.jpg', 'Y', null, '1', '2016-04-18 21:15:59', '1', '2016-04-18 21:15:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('869', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1460985529864.jpg', 'jpg', '/1460985529864.jpg', 'Y', null, '1', '2016-04-18 21:18:50', '1', '2016-04-18 21:18:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('870', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1460985577072.jpg', 'jpg', '/1460985577072.jpg', 'Y', null, '1', '2016-04-18 21:19:37', '1', '2016-04-18 21:19:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('872', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1460985705016.jpg', 'jpg', '/1460985705016.jpg', 'Y', null, '1', '2016-04-18 21:21:45', '1', '2016-04-18 21:21:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('873', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1460985732547.jpg', 'jpg', '/1460985732547.jpg', 'Y', null, '1', '2016-04-18 21:22:13', '1', '2016-04-18 21:22:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('874', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1460985797652.jpg', 'jpg', '/1460985797652.jpg', 'Y', null, '1', '2016-04-18 21:23:18', '1', '2016-04-18 21:23:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('875', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460985880744.jpg', 'jpg', '/1460985880744.jpg', 'Y', null, '1', '2016-04-18 21:24:41', '1', '2016-04-18 21:24:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('876', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1460985902273.jpg', 'jpg', '/1460985902273.jpg', 'Y', null, '1', '2016-04-18 21:25:02', '1', '2016-04-18 21:25:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('877', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460986038237.jpg', 'jpg', '/1460986038237.jpg', 'Y', null, '1', '2016-04-18 21:27:18', '1', '2016-04-18 21:27:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('878', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460986302196.jpg', 'jpg', '/1460986302196.jpg', 'Y', null, '1', '2016-04-18 21:31:42', '1', '2016-04-18 21:31:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('879', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1460986321365.jpg', 'jpg', '/1460986321365.jpg', 'Y', null, '1', '2016-04-18 21:32:01', '1', '2016-04-18 21:32:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('880', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460986635996.jpg', 'jpg', '/1460986635996.jpg', 'Y', null, '1', '2016-04-18 21:37:16', '1', '2016-04-18 21:37:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('881', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460986642045.jpg', 'jpg', '/1460986642045.jpg', 'Y', null, '1', '2016-04-18 21:37:22', '1', '2016-04-18 21:37:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('882', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1460986701862.jpg', 'jpg', '/1460986701862.jpg', 'Y', null, '1', '2016-04-18 21:38:22', '1', '2016-04-18 21:38:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('883', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1460986779006.jpg', 'jpg', '/1460986779006.jpg', 'Y', null, '1', '2016-04-18 21:39:39', '1', '2016-04-18 21:39:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('884', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460986793566.jpg', 'jpg', '/1460986793566.jpg', 'Y', null, '1', '2016-04-18 21:39:54', '1', '2016-04-18 21:39:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('885', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1460987352404.jpg', 'jpg', '/1460987352404.jpg', 'Y', null, '1', '2016-04-18 21:49:12', '1', '2016-04-18 21:49:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('886', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460987451662.jpg', 'jpg', '/1460987451662.jpg', 'Y', null, '1', '2016-04-18 21:50:52', '1', '2016-04-18 21:50:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('887', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460987482550.jpg', 'jpg', '/1460987482550.jpg', 'Y', null, '1', '2016-04-18 21:51:23', '1', '2016-04-18 21:51:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('888', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460987541877.jpg', 'jpg', '/1460987541877.jpg', 'Y', null, '1', '2016-04-18 21:52:22', '1', '2016-04-18 21:52:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('889', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1460987573290.jpg', 'jpg', '/1460987573290.jpg', 'Y', null, '1', '2016-04-18 21:52:53', '1', '2016-04-18 21:52:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('890', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1460987888515.jpg', 'jpg', '/1460987888515.jpg', 'Y', null, '1', '2016-04-18 21:58:09', '1', '2016-04-18 21:58:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('891', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1460987894987.jpg', 'jpg', '/1460987894987.jpg', 'Y', null, '1', '2016-04-18 21:58:15', '1', '2016-04-18 21:58:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('892', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1460987974614.jpg', 'jpg', '/1460987974614.jpg', 'Y', null, '1', '2016-04-18 21:59:35', '1', '2016-04-18 21:59:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('893', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461028344399.jpg', 'jpg', '/1461028344399.jpg', 'Y', null, '1', '2016-04-19 09:12:24', '1', '2016-04-19 09:12:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('894', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1461028389309.jpg', 'jpg', '/1461028389309.jpg', 'Y', null, '1', '2016-04-19 09:13:09', '1', '2016-04-19 09:13:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('895', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1461028753365.jpg', 'jpg', '/1461028753365.jpg', 'Y', null, '1', '2016-04-19 09:19:13', '1', '2016-04-19 09:19:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('896', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461028891092.jpg', 'jpg', '/1461028891092.jpg', 'Y', null, '1', '2016-04-19 09:21:31', '1', '2016-04-19 09:21:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('897', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461029868636.jpg', 'jpg', '/1461029868636.jpg', 'Y', null, '1', '2016-04-19 09:37:49', '1', '2016-04-19 09:37:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('898', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1461029872993.jpg', 'jpg', '/1461029872993.jpg', 'Y', null, '1', '2016-04-19 09:37:53', '1', '2016-04-19 09:37:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('899', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461029886924.jpg', 'jpg', '/1461029886924.jpg', 'Y', null, '1', '2016-04-19 09:38:07', '1', '2016-04-19 09:38:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('900', '枫叶.jpg', '1461030854616.jpg', 'jpg', '/photos/1461030854616.jpg', 'N', null, '1', '2016-04-19 09:54:15', '1', '2016-04-19 09:54:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('901', '马.jpg', '1461033874755.jpg', 'jpg', '/knowledge/1461033874755.jpg', 'N', null, '1', '2016-04-19 10:44:35', '1', '2016-04-19 10:44:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('902', '马.jpg', '1461034361007.jpg', 'jpg', '/knowledge/1461034361007.jpg', 'Y', null, '1', '2016-04-19 10:52:41', '1', '2016-04-19 10:52:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('903', '枫叶.jpg', '1461034364158.jpg', 'jpg', '/knowledge/1461034364158.jpg', 'N', null, '1', '2016-04-19 10:52:44', '1', '2016-04-19 10:52:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('904', 'xiaoxiaoniao.mp3', '1461034610134.mp3', 'mp3', '/photos/1461034610134.mp3', 'Y', null, '1', '2016-04-19 10:56:50', '1', '2016-04-19 10:56:50', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('905', 'xiaoxiaoniao.mp3', '1461034645427.mp3', 'mp3', '/photos/1461034645427.mp3', 'Y', null, '1', '2016-04-19 10:57:25', '1', '2016-04-19 10:57:25', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('907', 'xiaoxiaoniao2.mp3', '1461036831532.mp3', 'mp3', '/photos/1461036831532.mp3', 'Y', null, '1', '2016-04-19 11:33:52', '1', '2016-04-19 11:33:52', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('908', 'xiaoxiaoniao2.mp3', '1461037247232.mp3', 'mp3', '/photos/1461037247232.mp3', 'Y', null, '1', '2016-04-19 11:40:47', '1', '2016-04-19 11:40:47', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('909', 'xiaoxiaoniao2.mp3', '1461037937972.mp3', 'mp3', '/photos/1461037937972.mp3', 'Y', null, '1', '2016-04-19 11:52:18', '1', '2016-04-19 11:52:18', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('911', 'xiaoxiaoniao.mp3', '1461038292741.mp3', 'mp3', '/photos/1461038292741.mp3', 'Y', null, '1', '2016-04-19 11:58:13', '1', '2016-04-19 11:58:13', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('912', 'xiaoxiaoniao.mp3', '1461046347334.mp3', 'mp3', '/1461046347334.mp3', 'Y', null, '1', '2016-04-19 14:12:27', '1', '2016-04-19 14:12:27', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('913', 'xiaoxiaoniao2.mp3', '1461046372705.mp3', 'mp3', '/1461046372705.mp3', 'Y', null, '1', '2016-04-19 14:12:53', '1', '2016-04-19 14:12:53', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('914', 'QQ图片20160408132526.jpg', '1461046749288.jpg', 'jpg', '/1461046749288.jpg', 'Y', null, '1', '2016-04-19 14:19:09', '1', '2016-04-19 14:19:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('915', 'xiaoxiaoniao2.mp3', '1461047230716.mp3', 'mp3', '/1461047230716.mp3', 'Y', null, '1', '2016-04-19 14:27:11', '1', '2016-04-19 14:27:11', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('917', 'xiaoxiaoniao2.mp3', '1461050303102.mp3', 'mp3', '/1461050303102.mp3', 'Y', null, '1', '2016-04-19 15:18:23', '1', '2016-04-19 15:18:23', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('918', 'xiaoxiaoniao2.mp3', '1461050316218.mp3', 'mp3', '/1461050316218.mp3', 'Y', null, '1', '2016-04-19 15:18:36', '1', '2016-04-19 15:18:36', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('919', '出入虎穴.mkv', '1461050587381.mkv', 'mkv', '/1461050587381.mkv', 'Y', null, '1', '2016-04-19 15:23:08', '1', '2016-04-19 15:23:08', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('920', '出入虎穴.mkv', '1461052304379.mkv', 'mkv', '/1461052304379.mkv', 'Y', null, '1', '2016-04-19 15:51:45', '1', '2016-04-19 15:51:45', 'video/mkv');
INSERT INTO `gxwl_sys_doc` VALUES ('921', 'xiaoxiaoniao.mp3', '1461052849642.mp3', 'mp3', '/1461052849642.mp3', 'Y', null, '1', '2016-04-19 16:00:50', '1', '2016-04-19 16:00:50', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('926', 'xiaoxiaoniao2.mp3', '1461055429819.mp3', 'mp3', '/photos/1461055429819.mp3', 'Y', null, '1', '2016-04-19 16:43:50', '1', '2016-04-19 16:43:50', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('927', 'xiaoxiaoniao2.mp3', '1461055716085.mp3', 'mp3', '/photos/1461055716085.mp3', 'Y', null, '1', '2016-04-19 16:48:36', '1', '2016-04-19 16:48:36', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('928', 'xiaoxiaoniao.mp3', '1461065625180.mp3', 'mp3', '/1461065625180.mp3', 'Y', null, '1', '2016-04-19 19:33:45', '1', '2016-04-19 19:33:45', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('929', 'xiaoxiaoniao2.mp3', '1461065641467.mp3', 'mp3', '/1461065641467.mp3', 'Y', null, '1', '2016-04-19 19:34:01', '1', '2016-04-19 19:34:01', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('930', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1461066251486.jpg', 'jpg', '/photos/1461066251486.jpg', 'Y', null, '1', '2016-04-19 19:44:12', '1', '2016-04-19 19:44:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('931', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461066306439.jpg', 'jpg', '/photos/1461066306439.jpg', 'Y', null, '1', '2016-04-19 19:45:06', '1', '2016-04-19 19:45:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('932', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461073404998.jpg', 'jpg', '/photos/1461073404998.jpg', 'Y', null, '1', '2016-04-19 21:43:25', '1', '2016-04-19 21:43:25', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('933', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1461116036747.jpg', 'jpg', '/1461116036747.jpg', 'Y', null, '1', '2016-04-20 09:33:57', '1', '2016-04-20 09:33:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('934', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461116056919.jpg', 'jpg', '/1461116056919.jpg', 'Y', null, '1', '2016-04-20 09:34:17', '1', '2016-04-20 09:34:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('935', '枫叶.jpg', '1461118193846.jpg', 'jpg', '/1461118193846.jpg', 'Y', null, '1', '2016-04-20 10:09:54', '1', '2016-04-20 10:09:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('936', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461119586276.jpg', 'jpg', '/photos/1461119586276.jpg', 'Y', null, '1', '2016-04-20 10:33:06', '1', '2016-04-20 10:33:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('937', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461119627522.jpg', 'jpg', '/1461119627522.jpg', 'N', null, '1', '2016-04-20 10:33:48', '1', '2016-04-20 10:33:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('938', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1461119863871.jpg', 'jpg', '/1461119863871.jpg', 'Y', null, '1', '2016-04-20 10:37:44', '1', '2016-04-20 10:37:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('939', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461120068218.jpg', 'jpg', '/photos/1461120068218.jpg', 'Y', null, '1', '2016-04-20 10:41:08', '1', '2016-04-20 10:41:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('940', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461121860810.jpg', 'jpg', '/photos/1461121860810.jpg', 'Y', null, '1', '2016-04-20 11:11:01', '1', '2016-04-20 11:11:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('941', '枫叶.jpg', '1461135716982.jpg', 'jpg', '/photos/1461135716982.jpg', 'Y', null, '1', '2016-04-20 15:01:57', '1', '2016-04-20 15:01:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('942', 'QQ图片20160408132526.jpg', '1461135926695.jpg', 'jpg', '/photos/1461135926695.jpg', 'Y', null, '1', '2016-04-20 15:05:27', '1', '2016-04-20 15:05:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('943', '2012121716537448.jpg', '1461136793061.jpg', 'jpg', '/1461136793061.jpg', 'Y', null, '1', '2016-04-20 15:19:53', '1', '2016-04-20 15:19:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('944', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461138190019.jpg', 'jpg', '/1461138190019.jpg', 'Y', null, '1', '2016-04-20 15:43:10', '1', '2016-04-20 15:43:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('945', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1461138194008.jpg', 'jpg', '/1461138194008.jpg', 'Y', null, '1', '2016-04-20 15:43:14', '1', '2016-04-20 15:43:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('946', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1461138213127.jpg', 'jpg', '/1461138213127.jpg', 'Y', null, '1', '2016-04-20 15:43:33', '1', '2016-04-20 15:43:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('947', 'QQ图片20160408132526.jpg', '1461138519413.jpg', 'jpg', '/1461138519413.jpg', 'Y', null, '1', '2016-04-20 15:48:39', '1', '2016-04-20 15:48:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('948', 'QQ图片20160408132526.jpg', '1461138524007.jpg', 'jpg', '/1461138524007.jpg', 'Y', null, '1', '2016-04-20 15:48:44', '1', '2016-04-20 15:48:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('949', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1461138619846.png', 'png', '/1461138619846.png', 'Y', null, '1', '2016-04-20 15:50:20', '1', '2016-04-20 15:50:20', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('950', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1461138624226.png', 'png', '/1461138624226.png', 'N', null, '1', '2016-04-20 15:50:24', '1', '2016-04-20 15:50:24', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('951', 'QQ图片20160408132526.jpg', '1461138926076.jpg', 'jpg', '/photos/1461138926076.jpg', 'N', null, '1', '2016-04-20 15:55:26', '1', '2016-04-20 15:55:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('952', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461140833334.jpg', 'jpg', '/1461140833334.jpg', 'N', null, '1', '2016-04-20 16:27:13', '1', '2016-04-20 16:27:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('953', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1461140858130.jpg', 'jpg', '/1461140858130.jpg', 'N', null, '1', '2016-04-20 16:27:38', '1', '2016-04-20 16:27:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('954', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461141231235.jpg', 'jpg', '/1461141231235.jpg', 'N', null, '1', '2016-04-20 16:33:51', '1', '2016-04-20 16:33:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('955', 'QQ图片20160408132526.jpg', '1461141241661.jpg', 'jpg', '/photos/1461141241661.jpg', 'Y', null, '1', '2016-04-20 16:34:02', '1', '2016-04-20 16:34:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('956', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461144287601.jpg', 'jpg', '/photos/1461144287601.jpg', 'Y', null, '1', '2016-04-20 17:24:48', '1', '2016-04-20 17:24:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('957', 'QQ图片20160420133144.jpg', '1461145345532.jpg', 'jpg', '/1461145345532.jpg', 'Y', null, '1', '2016-04-20 17:42:26', '1', '2016-04-20 17:42:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('958', 'QQ图片20160317160628.jpg', '1461145349427.jpg', 'jpg', '/1461145349427.jpg', 'N', null, '1', '2016-04-20 17:42:29', '1', '2016-04-20 17:42:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('959', 'QQ图片20160420133144.jpg', '1461145369499.jpg', 'jpg', '/1461145369499.jpg', 'Y', null, '1', '2016-04-20 17:42:50', '1', '2016-04-20 17:42:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('960', 'QQ图片20160317160628.jpg', '1461145372232.jpg', 'jpg', '/1461145372232.jpg', 'N', null, '1', '2016-04-20 17:42:52', '1', '2016-04-20 17:42:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('961', 'QQ图片20160317160628.jpg', '1461145392394.jpg', 'jpg', '/1461145392394.jpg', 'N', null, '1', '2016-04-20 17:43:12', '1', '2016-04-20 17:43:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('962', 'QQ图片20160317160628.jpg', '1461145409664.jpg', 'jpg', '/1461145409664.jpg', 'N', null, '1', '2016-04-20 17:43:30', '1', '2016-04-20 17:43:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('963', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461145576775.jpg', 'jpg', '/photos/1461145576775.jpg', 'Y', null, '1', '2016-04-20 17:46:17', '1', '2016-04-20 17:46:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('964', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461145713141.jpg', 'jpg', '/photos/1461145713141.jpg', 'Y', null, '1', '2016-04-20 17:48:33', '1', '2016-04-20 17:48:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('965', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461145839079.jpg', 'jpg', '/photos/1461145839079.jpg', 'N', null, '1', '2016-04-20 17:50:39', '1', '2016-04-20 17:50:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('966', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1461145975528.jpg', 'jpg', '/photos/1461145975528.jpg', 'N', null, '1', '2016-04-20 17:52:56', '1', '2016-04-20 17:52:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('967', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461152382243.jpg', 'jpg', '/photos/1461152382243.jpg', 'N', null, '1', '2016-04-20 19:39:42', '1', '2016-04-20 19:39:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('968', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461158413826.jpg', 'jpg', '/photos/1461158413826.jpg', 'N', null, '1', '2016-04-20 21:20:14', '1', '2016-04-20 21:20:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('969', 'QQ图片20160317160628.jpg', '1461158570254.jpg', 'jpg', '/1461158570254.jpg', 'N', null, '1', '2016-04-20 21:22:50', '1', '2016-04-20 21:22:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('970', 'QQ图片20160408132526.jpg', '1461203076892.jpg', 'jpg', '/1461203076892.jpg', 'N', null, '1', '2016-04-21 09:44:37', '1', '2016-04-21 09:44:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('971', 'QQ图片20160408132526.jpg', '1461203088358.jpg', 'jpg', '/1461203088358.jpg', 'N', null, '1', '2016-04-21 09:44:48', '1', '2016-04-21 09:44:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('972', 'QQ图片20160408132526.jpg', '1461203214512.jpg', 'jpg', '/1461203214512.jpg', 'N', null, '1', '2016-04-21 09:46:55', '1', '2016-04-21 09:46:55', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('973', 're-share.png', '1461203557904.png', 'png', '/1461203557904.png', 'N', null, '1', '2016-04-21 09:52:38', '1', '2016-04-21 09:52:38', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('974', 'progress-light.png', '1461203816490.png', 'png', '/1461203816490.png', 'Y', null, '1', '2016-04-21 09:56:56', '1', '2016-04-21 09:56:56', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('975', '马.jpg', '1461205460196.jpg', 'jpg', '/1461205460196.jpg', 'Y', null, '1', '2016-04-21 10:24:20', '1', '2016-04-21 10:24:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('976', '马.jpg', '1461205520385.jpg', 'jpg', '/1461205520385.jpg', 'Y', null, '1', '2016-04-21 10:25:20', '1', '2016-04-21 10:25:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('977', '枫叶.jpg', '1461205590617.jpg', 'jpg', '/1461205590617.jpg', 'Y', null, '1', '2016-04-21 10:26:31', '1', '2016-04-21 10:26:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('978', '马.jpg', '1461205689121.jpg', 'jpg', '/photos/1461205689121.jpg', 'Y', null, '1', '2016-04-21 10:28:09', '1', '2016-04-21 10:28:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('979', '枫叶.jpg', '1461205697848.jpg', 'jpg', '/photos/1461205697848.jpg', 'Y', null, '1', '2016-04-21 10:28:18', '1', '2016-04-21 10:28:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('980', '2016-04-21_up.jpg', '1461206568414.jpg', 'jpg', '/1461206568414.jpg', 'Y', null, '1', '2016-04-21 10:42:48', '1', '2016-04-21 10:42:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('981', '枫叶.jpg', '1461206823145.jpg', 'jpg', '/1461206823145.jpg', 'Y', null, '1', '2016-04-21 10:47:03', '1', '2016-04-21 10:47:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('982', '2012121716537448.jpg', '1461206863418.jpg', 'jpg', '/1461206863418.jpg', 'Y', null, '1', '2016-04-21 10:47:43', '1', '2016-04-21 10:47:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('983', '马.jpg', '1461207216212.jpg', 'jpg', '/1461207216212.jpg', 'Y', null, '1', '2016-04-21 10:53:36', '1', '2016-04-21 10:53:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('984', '马.jpg', '1461207286737.jpg', 'jpg', '/1461207286737.jpg', 'Y', null, '1', '2016-04-21 10:54:47', '1', '2016-04-21 10:54:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('985', '马.jpg', '1461207314391.jpg', 'jpg', '/1461207314391.jpg', 'Y', null, '1', '2016-04-21 10:55:14', '1', '2016-04-21 10:55:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('986', 'QQ图片20160408132526.jpg', '1461218167235.jpg', 'jpg', '/1461218167235.jpg', 'N', null, '1', '2016-04-21 13:56:07', '1', '2016-04-21 13:56:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('987', '2012121716537448.jpg', '1461219009807.jpg', 'jpg', '/1461219009807.jpg', 'N', null, '1', '2016-04-21 14:10:10', '1', '2016-04-21 14:10:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('988', '2016-04-21_up.jpg', '1461220711538.jpg', 'jpg', '/1461220711538.jpg', 'Y', null, '1', '2016-04-21 14:38:32', '1', '2016-04-21 14:38:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('989', '2016-04-21_up.jpg', '1461220738747.jpg', 'jpg', '/1461220738747.jpg', 'Y', null, '1', '2016-04-21 14:38:59', '1', '2016-04-21 14:38:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('990', '2016-04-21_up.jpg', '1461220739024.jpg', 'jpg', '/1461220739024.jpg', 'Y', null, '1', '2016-04-21 14:38:59', '1', '2016-04-21 14:38:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('999', 'cisRecorder.mp4', '1461220887946.mp4', 'mp4', '/1461220887946.mp4', 'Y', null, '1', '2016-04-21 14:41:28', '1', '2016-04-21 14:41:28', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1000', '马.jpg', '1461222498017.jpg', 'jpg', '/photos/1461222498017.jpg', 'Y', null, '1', '2016-04-21 15:08:18', '1', '2016-04-21 15:08:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1001', 'cisRecorder.mp4', '1461226074012.mp4', 'mp4', '/1461226074012.mp4', 'Y', null, '1', '2016-04-21 16:07:54', '1', '2016-04-21 16:07:54', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1002', 'cisRecorder.mp4', '1461226092513.mp4', 'mp4', '/1461226092513.mp4', 'Y', null, '1', '2016-04-21 16:08:13', '1', '2016-04-21 16:08:13', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1003', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461226813639.jpg', 'jpg', '/1461226813639.jpg', 'Y', null, '1', '2016-04-21 16:20:14', '1', '2016-04-21 16:20:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1004', 'cisRecorder.mp4', '1461226922868.mp4', 'mp4', '/1461226922868.mp4', 'Y', null, '1', '2016-04-21 16:22:03', '1', '2016-04-21 16:22:03', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1005', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1461227015845.jpg', 'jpg', '/1461227015845.jpg', 'Y', null, '1', '2016-04-21 16:23:36', '1', '2016-04-21 16:23:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1006', 'QQ图片20160408132526.jpg', '1461227769406.jpg', 'jpg', '/1461227769406.jpg', 'N', null, '1', '2016-04-21 16:36:09', '1', '2016-04-21 16:36:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1007', 'QQ图片20160408132526.jpg', '1461227772516.jpg', 'jpg', '/1461227772516.jpg', 'N', null, '1', '2016-04-21 16:36:13', '1', '2016-04-21 16:36:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1008', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461228327292.jpg', 'jpg', '/1461228327292.jpg', 'N', null, '1', '2016-04-21 16:45:27', '1', '2016-04-21 16:45:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1010', 'cisRecorder.mp4', '1461228555512.mp4', 'mp4', '/1461228555512.mp4', 'Y', null, '1', '2016-04-21 16:49:16', '1', '2016-04-21 16:49:16', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1011', '马.jpg', '1461228612236.jpg', 'jpg', '/1461228612236.jpg', 'N', null, '1', '2016-04-21 16:50:12', '1', '2016-04-21 16:50:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1012', 'cisRecorder.mp4', '1461229397131.mp4', 'mp4', '/1461229397131.mp4', 'Y', null, '1', '2016-04-21 17:03:17', '1', '2016-04-21 17:03:17', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1013', '枫叶.jpg', '1461229439537.jpg', 'jpg', '/1461229439537.jpg', 'Y', null, '1', '2016-04-21 17:04:00', '1', '2016-04-21 17:04:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1014', 'cisRecorder.mp4', '1461229691885.mp4', 'mp4', '/1461229691885.mp4', 'Y', null, '1', '2016-04-21 17:08:12', '1', '2016-04-21 17:08:12', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1015', 'cisRecorder.mp4', '1461229836775.mp4', 'mp4', '/1461229836775.mp4', 'Y', null, '1', '2016-04-21 17:10:37', '1', '2016-04-21 17:10:37', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1016', 'cisRecorder.mp4', '1461229940034.mp4', 'mp4', '/1461229940034.mp4', 'Y', null, '1', '2016-04-21 17:12:20', '1', '2016-04-21 17:12:20', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1017', 'cisRecorder.mp4', '1461230119103.mp4', 'mp4', '/1461230119103.mp4', 'Y', null, '1', '2016-04-21 17:15:19', '1', '2016-04-21 17:15:19', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1018', 'cisRecorder.mp4', '1461230207778.mp4', 'mp4', '/1461230207778.mp4', 'Y', null, '1', '2016-04-21 17:16:48', '1', '2016-04-21 17:16:48', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1019', 'cisRecorder.mp4', '1461230284816.mp4', 'mp4', '/1461230284816.mp4', 'Y', null, '1', '2016-04-21 17:18:05', '1', '2016-04-21 17:18:05', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1020', 'cisRecorder.mp4', '1461230362947.mp4', 'mp4', '/1461230362947.mp4', 'Y', null, '1', '2016-04-21 17:19:23', '1', '2016-04-21 17:19:23', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1021', 'cisRecorder.mp4', '1461230555490.mp4', 'mp4', '/1461230555490.mp4', 'Y', null, '1', '2016-04-21 17:22:35', '1', '2016-04-21 17:22:35', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1022', 'QQ图片20160317160628.jpg', '1461230585596.jpg', 'jpg', '/photos/1461230585596.jpg', 'Y', null, '1', '2016-04-21 17:23:06', '1', '2016-04-21 17:23:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1023', 'cisRecorder.mp4', '1461230678335.mp4', 'mp4', '/1461230678335.mp4', 'Y', null, '1', '2016-04-21 17:24:38', '1', '2016-04-21 17:24:38', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1024', 'cisRecorder.mp4', '1461230771237.mp4', 'mp4', '/1461230771237.mp4', 'Y', null, '1', '2016-04-21 17:26:11', '1', '2016-04-21 17:26:11', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1025', 'cisRecorder.mp4', '1461230851099.mp4', 'mp4', '/1461230851099.mp4', 'Y', null, '1', '2016-04-21 17:27:31', '1', '2016-04-21 17:27:31', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1026', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1461230902620.png', 'png', '/1461230902620.png', 'N', null, '1', '2016-04-21 17:28:23', '1', '2016-04-21 17:28:23', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1032', 'cisRecorder.mp4', '1461232615790.mp4', 'mp4', '/1461232615790.mp4', 'Y', null, '1', '2016-04-21 17:56:56', '1', '2016-04-21 17:56:56', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1033', 'cisRecorder.mp4', '1461232866551.mp4', 'mp4', '/1461232866551.mp4', 'Y', null, '1', '2016-04-21 18:01:07', '1', '2016-04-21 18:01:07', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1034', 'cisRecorder.mp4', '1461233102566.mp4', 'mp4', '/1461233102566.mp4', 'Y', null, '1', '2016-04-21 18:05:03', '1', '2016-04-21 18:05:03', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1035', 'cisRecorder.mp4', '1461233385867.mp4', 'mp4', '/1461233385867.mp4', 'Y', null, '1', '2016-04-21 18:09:46', '1', '2016-04-21 18:09:46', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1036', 'cisRecorder.mp4', '1461233588923.mp4', 'mp4', '/1461233588923.mp4', 'N', null, '1', '2016-04-21 18:13:09', '1', '2016-04-21 18:13:09', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1037', 'cisRecorder.mp4', '1461233787884.mp4', 'mp4', '/1461233787884.mp4', 'N', null, '1', '2016-04-21 18:16:28', '1', '2016-04-21 18:16:28', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1038', 'cisRecorder.mp4', '1461234084572.mp4', 'mp4', '/1461234084572.mp4', 'N', null, '1', '2016-04-21 18:21:25', '1', '2016-04-21 18:21:25', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1039', 'cisRecorder.mp4', '1461234268102.mp4', 'mp4', '/1461234268102.mp4', 'N', null, '1', '2016-04-21 18:24:28', '1', '2016-04-21 18:24:28', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1040', 'QQ图片20160317160628.jpg', '1461241505138.jpg', 'jpg', '/photos/1461241505138.jpg', 'Y', null, '1', '2016-04-21 20:25:05', '1', '2016-04-21 20:25:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1041', 'QQ图片20160317160628.jpg', '1461241984470.jpg', 'jpg', '/photos/1461241984470.jpg', 'N', null, '1', '2016-04-21 20:33:04', '1', '2016-04-21 20:33:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1045', 'cisRecorder.mp4', '1461244389638.mp4', 'mp4', '/1461244389638.mp4', 'N', null, '1', '2016-04-21 21:13:10', '1', '2016-04-21 21:13:10', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1046', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1461290666646.jpg', 'jpg', '/1461290666646.jpg', 'N', null, '1', '2016-04-22 10:04:27', '1', '2016-04-22 10:04:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1047', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461290691077.jpg', 'jpg', '/1461290691077.jpg', 'N', null, '1', '2016-04-22 10:04:51', '1', '2016-04-22 10:04:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1048', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461290812930.jpg', 'jpg', '/1461290812930.jpg', 'N', null, '1', '2016-04-22 10:06:53', '1', '2016-04-22 10:06:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1049', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1461291502248.jpg', 'jpg', '/1461291502248.jpg', 'N', null, '1', '2016-04-22 10:18:22', '1', '2016-04-22 10:18:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1050', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1461291741378.jpg', 'jpg', '/1461291741378.jpg', 'N', null, '1', '2016-04-22 10:22:21', '1', '2016-04-22 10:22:21', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1051', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1461292328425.jpg', 'jpg', '/1461292328425.jpg', 'N', null, '1', '2016-04-22 10:32:08', '1', '2016-04-22 10:32:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1052', 'logo.png', '1461293380125.png', 'png', '/1461293380125.png', 'N', null, '1', '2016-04-22 10:49:40', '1', '2016-04-22 10:49:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1053', 'IMG_20160328_160810.jpg', '1461293734646.jpg', 'jpg', '/1461293734646.jpg', 'N', null, '1', '2016-04-22 10:55:35', '1', '2016-04-22 10:55:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1054', 'IMG_20160421_104253.jpg', '1461293838447.jpg', 'jpg', '/1461293838447.jpg', 'N', null, '1', '2016-04-22 10:57:18', '1', '2016-04-22 10:57:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1055', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1461294559233.png', 'png', '/1461294559233.png', 'N', null, '1', '2016-04-22 11:09:19', '1', '2016-04-22 11:09:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1059', 'IMG_20160328_160810.jpg', '1461295486395.jpg', 'jpg', '/1461295486395.jpg', 'Y', null, '1', '2016-04-22 11:24:46', '1', '2016-04-22 11:24:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1060', 'IMG_20160328_160810.jpg', '1461295589830.jpg', 'jpg', '/1461295589830.jpg', 'Y', null, '1', '2016-04-22 11:26:30', '1', '2016-04-22 11:26:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1061', 'logo.png', '1461295604839.png', 'png', '/1461295604839.png', 'Y', null, '1', '2016-04-22 11:26:45', '1', '2016-04-22 11:26:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1075', 'QQ??20160408132526.jpg', '1461304911838.jpg', 'jpg', '/1461304911838.jpg', 'Y', null, '1', '2016-04-22 14:01:52', '1', '2016-04-22 14:01:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1077', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461305853992.jpg', 'jpg', '/audio/1461305853992.jpg', 'Y', null, '1', '2016-04-22 14:17:34', '1', '2016-04-22 14:17:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1078', '292377.jpg', '1461305925062.jpg', 'jpg', '/audio/1461305925062.jpg', 'Y', null, '1', '2016-04-22 14:18:45', '1', '2016-04-22 14:18:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1079', '??.jpg', '1461305955787.jpg', 'jpg', '/1461305955787.jpg', 'Y', null, '1', '2016-04-22 14:19:16', '1', '2016-04-22 14:19:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1081', 'coupon-actdazhong.png', '1461306292135.png', 'png', '/1461306292135.png', 'Y', null, '1', '2016-04-22 14:24:52', '1', '2016-04-22 14:24:52', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1083', 'QQ??20160408132526.jpg', '1461306491469.jpg', 'jpg', '/1461306491469.jpg', 'N', null, '1', '2016-04-22 14:28:11', '1', '2016-04-22 14:28:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1084', '292377.jpg', '1461306572416.jpg', 'jpg', '/audio/1461306572416.jpg', 'Y', null, '1', '2016-04-22 14:29:32', '1', '2016-04-22 14:29:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1085', '1-121002122100a5.jpg', '1461306671476.jpg', 'jpg', '/audio/1461306671476.jpg', 'Y', null, '1', '2016-04-22 14:31:11', '1', '2016-04-22 14:31:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1086', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461306728982.jpg', 'jpg', '/photos/1461306728982.jpg', 'Y', null, '1', '2016-04-22 14:32:09', '1', '2016-04-22 14:32:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1087', '600SAVE_20141112_244159.jpeg', '1461306841760.jpeg', 'jpeg', '/photos/1461306841760.jpeg', 'Y', null, '1', '2016-04-22 14:34:02', '1', '2016-04-22 14:34:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1088', '600SAVE_20141112_244159 (1).jpeg', '1461306878763.jpeg', 'jpeg', '/photos/1461306878763.jpeg', 'Y', null, '1', '2016-04-22 14:34:39', '1', '2016-04-22 14:34:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1090', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461307421002.jpg', 'jpg', '/view/1461307421002.jpg', 'Y', null, '1', '2016-04-22 14:43:41', '1', '2016-04-22 14:43:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1091', '600SAVE_20141112_244159 (1).jpeg', '1461307428292.jpeg', 'jpeg', '/audio/1461307428292.jpeg', 'Y', null, '1', '2016-04-22 14:43:48', '1', '2016-04-22 14:43:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1092', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461307509788.jpg', 'jpg', '/audio/1461307509788.jpg', 'Y', null, '1', '2016-04-22 14:45:10', '1', '2016-04-22 14:45:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1093', '1-121002122100a5.jpg', '1461307512928.jpg', 'jpg', '/audio/1461307512928.jpg', 'Y', null, '1', '2016-04-22 14:45:13', '1', '2016-04-22 14:45:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1094', 'further.txt', '1461307529420.txt', 'txt', '/audio/1461307529420.txt', 'Y', null, '1', '2016-04-22 14:45:29', '1', '2016-04-22 14:45:29', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1095', '@PathVariable和@RequestParam的区别_百度知道.png', '1461307538872.png', 'png', '/audio/1461307538872.png', 'Y', null, '1', '2016-04-22 14:45:39', '1', '2016-04-22 14:45:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1096', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461307555808.jpg', 'jpg', '/audio/1461307555808.jpg', 'Y', null, '1', '2016-04-22 14:45:56', '1', '2016-04-22 14:45:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1097', '1-121002122100a5.jpg', '1461307597648.jpg', 'jpg', '/audio/1461307597648.jpg', 'Y', null, '1', '2016-04-22 14:46:38', '1', '2016-04-22 14:46:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1098', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461307618093.jpg', 'jpg', '/audio/1461307618093.jpg', 'Y', null, '1', '2016-04-22 14:46:58', '1', '2016-04-22 14:46:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1099', '292377.jpg', '1461307645745.jpg', 'jpg', '/audio/1461307645745.jpg', 'Y', null, '1', '2016-04-22 14:47:26', '1', '2016-04-22 14:47:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1100', '隐患数3表关系.png', '1461307723122.png', 'png', '/photos/1461307723122.png', 'Y', null, '1', '2016-04-22 14:48:43', '1', '2016-04-22 14:48:43', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1101', 'Y8)8IU2]%N(M]Z{6{4@8981.png', '1461307728162.png', 'png', '/view/1461307728162.png', 'Y', null, '1', '2016-04-22 14:48:48', '1', '2016-04-22 14:48:48', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1102', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461307746235.jpg', 'jpg', '/photos/1461307746235.jpg', 'N', null, '1', '2016-04-22 14:49:06', '1', '2016-04-22 14:49:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1103', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461307980943.jpg', 'jpg', '/audio/1461307980943.jpg', 'Y', null, '1', '2016-04-22 14:53:01', '1', '2016-04-22 14:53:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1104', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461307995691.jpg', 'jpg', '/view/1461307995691.jpg', 'Y', null, '1', '2016-04-22 14:53:16', '1', '2016-04-22 14:53:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1105', '292377.jpg', '1461308074787.jpg', 'jpg', '/audio/1461308074787.jpg', 'Y', null, '1', '2016-04-22 14:54:35', '1', '2016-04-22 14:54:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1110', 'cisRecorder.mp4', '1461308323992.mp4', 'mp4', '/1461308323992.mp4', 'N', null, '1', '2016-04-22 14:58:44', '1', '2016-04-22 14:58:44', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1111', 'VID20160309143642.mp4', '1461308394551.mp4', 'mp4', '/1461308394551.mp4', 'N', null, '1', '2016-04-22 14:59:55', '1', '2016-04-22 14:59:55', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1112', 'cisRecorder.mp4', '1461309052403.mp4', 'mp4', '/1461309052403.mp4', 'N', null, '1', '2016-04-22 15:10:52', '1', '2016-04-22 15:10:52', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1113', 'button-dz.bg.png', '1461309068421.png', 'png', '/1461309068421.png', 'N', null, '1', '2016-04-22 15:11:08', '1', '2016-04-22 15:11:08', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1114', '20160415_155706.mp4', '1461309080224.mp4', 'mp4', '/1461309080224.mp4', 'N', null, '1', '2016-04-22 15:11:20', '1', '2016-04-22 15:11:20', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1115', '1-1511100044350-L.jpg', '1461309455730.jpg', 'jpg', '/audio/1461309455730.jpg', 'Y', null, '1', '2016-04-22 15:17:36', '1', '2016-04-22 15:17:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1117', '交办.png', '1461310216625.png', 'png', '/audio/1461310216625.png', 'Y', null, '1', '2016-04-22 15:30:17', '1', '2016-04-22 15:30:17', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1118', '292377.jpg', '1461310493995.jpg', 'jpg', '/photos/1461310493995.jpg', 'N', null, '1', '2016-04-22 15:34:54', '1', '2016-04-22 15:34:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1119', '1-121002122100a5.jpg', '1461310522523.jpg', 'jpg', '/photos/1461310522523.jpg', 'N', null, '1', '2016-04-22 15:35:23', '1', '2016-04-22 15:35:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1120', '@PathVariable和@RequestParam的区别_百度知道.png', '1461310537071.png', 'png', '/photos/1461310537071.png', 'N', null, '1', '2016-04-22 15:35:37', '1', '2016-04-22 15:35:37', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1124', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461310844562.jpg', 'jpg', '/photos/1461310844562.jpg', 'N', null, '1', '2016-04-22 15:40:45', '1', '2016-04-22 15:40:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1130', '21494230A-0-lp.jpg', '1461311336366.jpg', 'jpg', '/audio/1461311336366.jpg', 'Y', null, '1', '2016-04-22 15:48:56', '1', '2016-04-22 15:48:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1133', '[MITQMGF5M6VCVS)T%UF$LB.png', '1461311972909.png', 'png', '/view/1461311972909.png', 'Y', null, '1', '2016-04-22 15:59:33', '1', '2016-04-22 15:59:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1135', '05 - 猜不透.mp3', '1461312009705.mp3', 'mp3', '/view/1461312009705.mp3', 'Y', null, '1', '2016-04-22 16:00:10', '1', '2016-04-22 16:00:10', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('1136', '292377.jpg', '1461312498773.jpg', 'jpg', '/view/1461312498773.jpg', 'Y', null, '1', '2016-04-22 16:08:19', '1', '2016-04-22 16:08:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1137', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461312548180.jpg', 'jpg', '/view/1461312548180.jpg', 'Y', null, '1', '2016-04-22 16:09:08', '1', '2016-04-22 16:09:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1143', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461313178610.jpg', 'jpg', '/audio/1461313178610.jpg', 'Y', null, '1', '2016-04-22 16:19:39', '1', '2016-04-22 16:19:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1144', '交办.png', '1461313202378.png', 'png', '/audio/1461313202378.png', 'Y', null, '1', '2016-04-22 16:20:02', '1', '2016-04-22 16:20:02', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1146', 'Screenshot_2015-06-28-21-43-19.png', '1461313352422.png', 'png', '/1461313352422.png', 'N', null, '1', '2016-04-22 16:22:32', '1', '2016-04-22 16:22:32', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1150', '事件类别列表.png', '1461313698267.png', 'png', '/photos/1461313698267.png', 'Y', null, '1', '2016-04-22 16:28:18', '1', '2016-04-22 16:28:18', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1151', 'Map2.jpg', '1461313831978.jpg', 'jpg', '/1461313831978.jpg', 'N', null, '1', '2016-04-22 16:30:32', '1', '2016-04-22 16:30:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1152', '1461306491469.jpg', '1461314024449.jpg', 'jpg', '/1461314024449.jpg', 'N', null, '1', '2016-04-22 16:33:44', '1', '2016-04-22 16:33:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1154', '2016-04-22_up.jpg', '1461314354773.jpg', 'jpg', '/1461314354773.jpg', 'N', null, '1', '2016-04-22 16:39:15', '1', '2016-04-22 16:39:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1155', 'IMG_20160401_192416.jpg', '1461314431110.jpg', 'jpg', '/1461314431110.jpg', 'N', null, '1', '2016-04-22 16:40:31', '1', '2016-04-22 16:40:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1156', 'IMG_20160401_192045.jpg', '1461314550913.jpg', 'jpg', '/1461314550913.jpg', 'Y', null, '1', '2016-04-22 16:42:31', '1', '2016-04-22 16:42:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1157', 'IMG_20160401_192416.jpg', '1461315029489.jpg', 'jpg', '/1461315029489.jpg', 'N', null, '1', '2016-04-22 16:50:29', '1', '2016-04-22 16:50:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1158', '1461306491469.jpg', '1461315056573.jpg', 'jpg', '/1461315056573.jpg', 'N', null, '1', '2016-04-22 16:50:57', '1', '2016-04-22 16:50:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1159', '?????.The.Big.Bang.Theory.S09E18.????.HDTVrip.1024X576.mp4', '1461315139658.mp4', 'mp4', '/1461315139658.mp4', 'N', null, '1', '2016-04-22 16:52:20', '1', '2016-04-22 16:52:20', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1160', '1461306491469.jpg', '1461315296221.jpg', 'jpg', '/1461315296221.jpg', 'N', null, '1', '2016-04-22 16:54:56', '1', '2016-04-22 16:54:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1173', '??.jpg', '1461316934453.jpg', 'jpg', '/1461316934453.jpg', 'N', null, '1', '2016-04-22 17:22:14', '1', '2016-04-22 17:22:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1174', '1461306491469.jpg', '1461316966854.jpg', 'jpg', '/1461316966854.jpg', 'N', null, '1', '2016-04-22 17:22:47', '1', '2016-04-22 17:22:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1175', '1459924587943.png', '1461317016702.png', 'png', '/1461317016702.png', 'N', null, '1', '2016-04-22 17:23:37', '1', '2016-04-22 17:23:37', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1176', '2012121716537448.jpg', '1461317055271.jpg', 'jpg', '/1461317055271.jpg', 'N', null, '1', '2016-04-22 17:24:15', '1', '2016-04-22 17:24:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1177', '1459150786792.jpg', '1461317083937.jpg', 'jpg', '/1461317083937.jpg', 'N', null, '1', '2016-04-22 17:24:44', '1', '2016-04-22 17:24:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1183', '2016-04-22_up.jpg', '1461319077962.jpg', 'jpg', '/1461319077962.jpg', 'Y', null, '1', '2016-04-22 17:57:58', '1', '2016-04-22 17:57:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1188', '2016-04-22_up.jpg', '1461320691012.jpg', 'jpg', '/1461320691012.jpg', 'N', null, '1', '2016-04-22 18:24:51', '1', '2016-04-22 18:24:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1189', 'QQ图片20160408132526.jpg', '1461320778702.jpg', 'jpg', '/photos/1461320778702.jpg', 'N', null, '1', '2016-04-22 18:26:19', '1', '2016-04-22 18:26:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1190', 'QQ图片20160408132526.jpg', '1461320882480.jpg', 'jpg', '/photos/1461320882480.jpg', 'N', null, '1', '2016-04-22 18:28:02', '1', '2016-04-22 18:28:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1191', 'QQ图片20160408132526.jpg', '1461323832671.jpg', 'jpg', '/photos/1461323832671.jpg', 'N', null, '1', '2016-04-22 19:17:13', '1', '2016-04-22 19:17:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1192', '2016-04-22_up.jpg', '1461324683252.jpg', 'jpg', '/1461324683252.jpg', 'Y', null, '1', '2016-04-22 19:31:23', '1', '2016-04-22 19:31:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1193', '1461306491469.jpg', '1461324753312.jpg', 'jpg', '/1461324753312.jpg', 'Y', null, '1', '2016-04-22 19:32:33', '1', '2016-04-22 19:32:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1194', '1461316966854.jpg', '1461324810004.jpg', 'jpg', '/1461324810004.jpg', 'Y', null, '1', '2016-04-22 19:33:30', '1', '2016-04-22 19:33:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1195', '1461203557904.png', '1461324932764.png', 'png', '/1461324932764.png', 'Y', null, '1', '2016-04-22 19:35:33', '1', '2016-04-22 19:35:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1196', '2016-04-22_up.jpg', '1461324948597.jpg', 'jpg', '/1461324948597.jpg', 'N', null, '1', '2016-04-22 19:35:49', '1', '2016-04-22 19:35:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1197', '1461306491469.jpg', '1461325178931.jpg', 'jpg', '/1461325178931.jpg', 'Y', null, '1', '2016-04-22 19:39:39', '1', '2016-04-22 19:39:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1198', '1461306491469.jpg', '1461325386937.jpg', 'jpg', '/1461325386937.jpg', 'Y', null, '1', '2016-04-22 19:43:07', '1', '2016-04-22 19:43:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1199', '1461306491469.jpg', '1461325780981.jpg', 'jpg', '/1461325780981.jpg', 'Y', null, '1', '2016-04-22 19:49:41', '1', '2016-04-22 19:49:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1200', '2016-04-22_up.jpg', '1461325805485.jpg', 'jpg', '/1461325805485.jpg', 'Y', null, '1', '2016-04-22 19:50:06', '1', '2016-04-22 19:50:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1201', 'QQ图片20160408132526.jpg', '1461326042450.jpg', 'jpg', '/photos/1461326042450.jpg', 'Y', null, '1', '2016-04-22 19:54:02', '1', '2016-04-22 19:54:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1202', '2016-04-22_up.jpg', '1461326067303.jpg', 'jpg', '/1461326067303.jpg', 'N', null, '1', '2016-04-22 19:54:27', '1', '2016-04-22 19:54:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1203', '1459924587943.png', '1461326164631.png', 'png', '/1461326164631.png', 'Y', null, '1', '2016-04-22 19:56:05', '1', '2016-04-22 19:56:05', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1204', '1461306491469.jpg', '1461326250876.jpg', 'jpg', '/1461326250876.jpg', 'N', null, '1', '2016-04-22 19:57:31', '1', '2016-04-22 19:57:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1205', '1459924587943.png', '1461326259791.png', 'png', '/1461326259791.png', 'N', null, '1', '2016-04-22 19:57:40', '1', '2016-04-22 19:57:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1206', '2016-04-22_up.jpg', '1461326289442.jpg', 'jpg', '/1461326289442.jpg', 'N', null, '1', '2016-04-22 19:58:09', '1', '2016-04-22 19:58:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1207', '1461306491469.jpg', '1461326302832.jpg', 'jpg', '/1461326302832.jpg', 'N', null, '1', '2016-04-22 19:58:23', '1', '2016-04-22 19:58:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1208', '2016-04-22_up.jpg', '1461326306514.jpg', 'jpg', '/1461326306514.jpg', 'N', null, '1', '2016-04-22 19:58:27', '1', '2016-04-22 19:58:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1209', '事件类别详情.png', '1461327096367.png', 'png', '/photos/1461327096367.png', 'Y', null, '1', '2016-04-22 20:11:36', '1', '2016-04-22 20:11:36', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1210', '事件类别.png', '1461327381759.png', 'png', '/photos/1461327381759.png', 'Y', null, '1', '2016-04-22 20:16:22', '1', '2016-04-22 20:16:22', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1211', '事件登记.png', '1461327419801.png', 'png', '/photos/1461327419801.png', 'Y', null, '1', '2016-04-22 20:17:00', '1', '2016-04-22 20:17:00', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1212', '交办.png', '1461327693460.png', 'png', '/photos/1461327693460.png', 'Y', null, '1', '2016-04-22 20:21:33', '1', '2016-04-22 20:21:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1213', '事件类别详情.png', '1461327717916.png', 'png', '/photos/1461327717916.png', 'Y', null, '1', '2016-04-22 20:21:58', '1', '2016-04-22 20:21:58', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1214', '提交.png', '1461327725539.png', 'png', '/photos/1461327725539.png', 'Y', null, '1', '2016-04-22 20:22:06', '1', '2016-04-22 20:22:06', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1215', '交办.png', '1461328385086.png', 'png', '/photos/1461328385086.png', 'Y', null, '1', '2016-04-22 20:33:05', '1', '2016-04-22 20:33:05', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1216', '交办.png', '1461328416175.png', 'png', '/photos/1461328416175.png', 'Y', null, '1', '2016-04-22 20:33:36', '1', '2016-04-22 20:33:36', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1217', '交办.png', '1461328432273.png', 'png', '/photos/1461328432273.png', 'Y', null, '1', '2016-04-22 20:33:52', '1', '2016-04-22 20:33:52', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1218', '事件类别列表.png', '1461328500654.png', 'png', '/photos/1461328500654.png', 'Y', null, '1', '2016-04-22 20:35:01', '1', '2016-04-22 20:35:01', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1219', '事件类别列表.png', '1461328662712.png', 'png', '/photos/1461328662712.png', 'Y', null, '1', '2016-04-22 20:37:43', '1', '2016-04-22 20:37:43', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1220', '事件类别.png', '1461328687262.png', 'png', '/photos/1461328687262.png', 'Y', null, '1', '2016-04-22 20:38:07', '1', '2016-04-22 20:38:07', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1221', '事件登记.png', '1461328747068.png', 'png', '/photos/1461328747068.png', 'Y', null, '1', '2016-04-22 20:39:07', '1', '2016-04-22 20:39:07', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1222', 'QQ图片20160408132526.jpg', '1461328765822.jpg', 'jpg', '/photos/1461328765822.jpg', 'Y', null, '1', '2016-04-22 20:39:26', '1', '2016-04-22 20:39:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1223', 'QQ图片20160408132526.jpg', '1461330521545.jpg', 'jpg', '/1461330521545.jpg', 'N', null, '1', '2016-04-22 21:08:42', '1', '2016-04-22 21:08:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1224', '2016-04-22_up.jpg', '1461330797869.jpg', 'jpg', '/1461330797869.jpg', 'N', null, '1', '2016-04-22 21:13:18', '1', '2016-04-22 21:13:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1225', '2016-04-22_up.jpg', '1461330982072.jpg', 'jpg', '/1461330982072.jpg', 'N', null, '1', '2016-04-22 21:16:22', '1', '2016-04-22 21:16:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1226', '1461306491469.jpg', '1461331115988.jpg', 'jpg', '/1461331115988.jpg', 'N', null, '1', '2016-04-22 21:18:36', '1', '2016-04-22 21:18:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1227', '1461306491469.jpg', '1461331148815.jpg', 'jpg', '/1461331148815.jpg', 'N', null, '1', '2016-04-22 21:19:09', '1', '2016-04-22 21:19:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1228', '2016-04-22_up.jpg', '1461331238944.jpg', 'jpg', '/1461331238944.jpg', 'N', null, '1', '2016-04-22 21:20:39', '1', '2016-04-22 21:20:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1229', '1461306491469.jpg', '1461331415460.jpg', 'jpg', '/1461331415460.jpg', 'N', null, '1', '2016-04-22 21:23:35', '1', '2016-04-22 21:23:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1230', '2016-04-22_up.jpg', '1461331817797.jpg', 'jpg', '/1461331817797.jpg', 'N', null, '1', '2016-04-22 21:30:18', '1', '2016-04-22 21:30:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1231', '1461306491469.jpg', '1461331842236.jpg', 'jpg', '/1461331842236.jpg', 'N', null, '1', '2016-04-22 21:30:42', '1', '2016-04-22 21:30:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1232', '交办.png', '1461332026641.png', 'png', '/photos/1461332026641.png', 'Y', null, '1', '2016-04-22 21:33:47', '1', '2016-04-22 21:33:47', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1233', '事件登记.png', '1461332043759.png', 'png', '/photos/1461332043759.png', 'Y', null, '1', '2016-04-22 21:34:04', '1', '2016-04-22 21:34:04', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1234', '1461306491469.jpg', '1461332745530.jpg', 'jpg', '/1461332745530.jpg', 'N', null, '1', '2016-04-22 21:45:46', '1', '2016-04-22 21:45:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1235', '2016-04-22_up.jpg', '1461332837575.jpg', 'jpg', '/1461332837575.jpg', 'N', null, '1', '2016-04-22 21:47:18', '1', '2016-04-22 21:47:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1236', '2016-04-22_up.jpg', '1461333019225.jpg', 'jpg', '/1461333019225.jpg', 'N', null, '1', '2016-04-22 21:50:19', '1', '2016-04-22 21:50:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1237', '交办.png', '1461374481361.png', 'png', '/photos/1461374481361.png', 'Y', null, '1', '2016-04-23 09:21:21', '1', '2016-04-23 09:21:21', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1238', '??????_??.jpg', '1461374937841.jpg', 'jpg', '/1461374937841.jpg', 'N', null, '1', '2016-04-23 09:28:58', '1', '2016-04-23 09:28:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1239', '1461306491469.jpg', '1461375070407.jpg', 'jpg', '/1461375070407.jpg', 'N', null, '1', '2016-04-23 09:31:10', '1', '2016-04-23 09:31:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1240', '291739323217867.png', '1461375136388.png', 'png', '/1461375136388.png', 'N', null, '1', '2016-04-23 09:32:16', '1', '2016-04-23 09:32:16', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1241', '2016-04-23_up.jpg', '1461375198690.jpg', 'jpg', '/1461375198690.jpg', 'N', null, '1', '2016-04-23 09:33:19', '1', '2016-04-23 09:33:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1242', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461375233606.jpg', 'jpg', '/photos/1461375233606.jpg', 'Y', null, '1', '2016-04-23 09:33:54', '1', '2016-04-23 09:33:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1243', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461375505834.jpg', 'jpg', '/1461375505834.jpg', 'Y', null, '1', '2016-04-23 09:38:26', '1', '2016-04-23 09:38:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1244', 'button-dz.bg.png', '1461375604604.png', 'png', '/1461375604604.png', 'N', null, '1', '2016-04-23 09:40:05', '1', '2016-04-23 09:40:05', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1245', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461375781795.jpg', 'jpg', '/photos/1461375781795.jpg', 'Y', null, '1', '2016-04-23 09:43:02', '1', '2016-04-23 09:43:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1246', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461375807376.jpg', 'jpg', '/photos/1461375807376.jpg', 'Y', null, '1', '2016-04-23 09:43:27', '1', '2016-04-23 09:43:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1247', '20160331105845748.jpg', '1461375864215.jpg', 'jpg', '/1461375864215.jpg', 'N', null, '1', '2016-04-23 09:44:24', '1', '2016-04-23 09:44:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1249', '事件类别详情.png', '1461375980016.png', 'png', '/photos/1461375980016.png', 'Y', null, '1', '2016-04-23 09:46:20', '1', '2016-04-23 09:46:20', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1250', '事件类别列表.png', '1461376061797.png', 'png', '/photos/1461376061797.png', 'Y', null, '1', '2016-04-23 09:47:42', '1', '2016-04-23 09:47:42', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1251', '??? - ?????.mp3', '1461376288414.mp3', 'mp3', '/1461376288414.mp3', 'N', null, '1', '2016-04-23 09:51:28', '1', '2016-04-23 09:51:28', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('1252', '交办.png', '1461377378602.png', 'png', '/photos/1461377378602.png', 'N', null, '1', '2016-04-23 10:09:39', '1', '2016-04-23 10:09:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1253', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461389374780.jpg', 'jpg', '/1461389374780.jpg', 'N', null, '1', '2016-04-23 13:29:35', '1', '2016-04-23 13:29:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1254', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461546946439.jpg', 'jpg', '/1461546946439.jpg', 'N', null, '1', '2016-04-25 09:15:46', '1', '2016-04-25 09:15:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1255', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461547351595.jpg', 'jpg', '/1461547351595.jpg', 'N', null, '1', '2016-04-25 09:22:32', '1', '2016-04-25 09:22:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1256', '交办.png', '1461550799685.png', 'png', '/1461550799685.png', 'N', null, '1', '2016-04-25 10:20:00', '1', '2016-04-25 10:20:00', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1257', '事件类别详情.png', '1461550811505.png', 'png', '/1461550811505.png', 'N', null, '1', '2016-04-25 10:20:12', '1', '2016-04-25 10:20:12', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1258', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461550875163.jpg', 'jpg', '/1461550875163.jpg', 'N', null, '1', '2016-04-25 10:21:15', '1', '2016-04-25 10:21:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1259', 'coupon-limit-count.png', '1461568430645.png', 'png', '/1461568430645.png', 'N', null, '1', '2016-04-25 15:13:51', '1', '2016-04-25 15:13:51', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1260', '新建文本文档.txt', '1461569471458.txt', 'txt', '/photos/1461569471458.txt', 'Y', null, '1', '2016-04-25 15:31:11', '1', '2016-04-25 15:31:11', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1261', '新建文本文档.txt', '1461569480114.txt', 'txt', '/photos/1461569480114.txt', 'Y', null, '1', '2016-04-25 15:31:20', '1', '2016-04-25 15:31:20', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1262', '1-1511100044350-L.jpg', '1461569892532.jpg', 'jpg', '/photos/1461569892532.jpg', 'Y', null, '1', '2016-04-25 15:38:13', '1', '2016-04-25 15:38:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1263', '1-1511091256290-L.jpg', '1461569895881.jpg', 'jpg', '/photos/1461569895881.jpg', 'Y', null, '1', '2016-04-25 15:38:16', '1', '2016-04-25 15:38:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1264', '提交.png', '1461569937860.png', 'png', '/photos/1461569937860.png', 'Y', null, '1', '2016-04-25 15:38:58', '1', '2016-04-25 15:38:58', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1265', '交办.png', '1461569948995.png', 'png', '/photos/1461569948995.png', 'Y', null, '1', '2016-04-25 15:39:09', '1', '2016-04-25 15:39:09', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1266', '提交.png', '1461570083145.png', 'png', '/photos/1461570083145.png', 'N', null, '1', '2016-04-25 15:41:23', '1', '2016-04-25 15:41:23', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1267', '交办.png', '1461570498656.png', 'png', '/photos/1461570498656.png', 'N', null, '1', '2016-04-25 15:48:19', '1', '2016-04-25 15:48:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1268', '交办.png', '1461570514951.png', 'png', '/photos/1461570514951.png', 'N', null, '1', '2016-04-25 15:48:35', '1', '2016-04-25 15:48:35', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1269', '事件登记.png', '1461570759781.png', 'png', '/photos/1461570759781.png', 'Y', null, '1', '2016-04-25 15:52:40', '1', '2016-04-25 15:52:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1270', '2012121716537448.jpg', '1461571315615.jpg', 'jpg', '/1461571315615.jpg', 'N', null, '1', '2016-04-25 16:01:56', '1', '2016-04-25 16:01:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1271', '生活大爆炸.The.Big.Bang.Theory.S09E17.中英字幕.HDTVrip.1024X576.mp4', '1461571348725.mp4', 'mp4', '/1461571348725.mp4', 'N', null, '1', '2016-04-25 16:02:29', '1', '2016-04-25 16:02:29', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1272', '提交.png', '1461571626794.png', 'png', '/photos/1461571626794.png', 'N', null, '1', '2016-04-25 16:07:07', '1', '2016-04-25 16:07:07', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1273', '提交.png', '1461571858320.png', 'png', '/photos/1461571858320.png', 'N', null, '1', '2016-04-25 16:10:58', '1', '2016-04-25 16:10:58', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1274', '事件类别.png', '1461571861966.png', 'png', '/photos/1461571861966.png', 'N', null, '1', '2016-04-25 16:11:02', '1', '2016-04-25 16:11:02', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1275', '交办.png', '1461572238395.png', 'png', '/photos/1461572238395.png', 'Y', null, '1', '2016-04-25 16:17:18', '1', '2016-04-25 16:17:18', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1276', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461572344608.jpg', 'jpg', '/photos/1461572344608.jpg', 'Y', null, '1', '2016-04-25 16:19:05', '1', '2016-04-25 16:19:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1277', '1-1511100044350-L.jpg', '1461572543367.jpg', 'jpg', '/photos/1461572543367.jpg', 'Y', null, '1', '2016-04-25 16:22:23', '1', '2016-04-25 16:22:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1278', '1-151021004JV46.jpg', '1461572940092.jpg', 'jpg', '/photos/1461572940092.jpg', 'Y', null, '1', '2016-04-25 16:29:00', '1', '2016-04-25 16:29:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1279', '21494230A-0-lp.jpg', '1461573058114.jpg', 'jpg', '/photos/1461573058114.jpg', 'Y', null, '1', '2016-04-25 16:30:58', '1', '2016-04-25 16:30:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1280', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461573133579.jpg', 'jpg', '/photos/1461573133579.jpg', 'Y', null, '1', '2016-04-25 16:32:14', '1', '2016-04-25 16:32:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1281', '05 - 猜不透.mp3', '1461573143318.mp3', 'mp3', '/photos/1461573143318.mp3', 'Y', null, '1', '2016-04-25 16:32:23', '1', '2016-04-25 16:32:23', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('1282', '05 - 猜不透.mp3', '1461573175486.mp3', 'mp3', '/photos/1461573175486.mp3', 'Y', null, '1', '2016-04-25 16:32:55', '1', '2016-04-25 16:32:55', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('1283', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461573432958.jpg', 'jpg', '/photos/1461573432958.jpg', 'Y', null, '1', '2016-04-25 16:37:13', '1', '2016-04-25 16:37:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1284', '1-1511100044350-L.jpg', '1461574447411.jpg', 'jpg', '/photos/1461574447411.jpg', 'N', null, '1', '2016-04-25 16:54:07', '1', '2016-04-25 16:54:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1285', '1-151021004JV46.jpg', '1461574519473.jpg', 'jpg', '/photos/1461574519473.jpg', 'Y', null, '1', '2016-04-25 16:55:19', '1', '2016-04-25 16:55:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1286', '1-1511091256290-L.jpg', '1461574566104.jpg', 'jpg', '/photos/1461574566104.jpg', 'N', null, '1', '2016-04-25 16:56:06', '1', '2016-04-25 16:56:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1287', '292377.jpg', '1461574585726.jpg', 'jpg', '/photos/1461574585726.jpg', 'N', null, '1', '2016-04-25 16:56:26', '1', '2016-04-25 16:56:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1288', '1-1511100044350-L.jpg', '1461574803359.jpg', 'jpg', '/photos/1461574803359.jpg', 'Y', null, '1', '2016-04-25 17:00:03', '1', '2016-04-25 17:00:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1289', '1-1511091256290-L.jpg', '1461575019789.jpg', 'jpg', '/photos/1461575019789.jpg', 'N', null, '1', '2016-04-25 17:03:40', '1', '2016-04-25 17:03:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1290', '@PathVariable和@RequestParam的区别_百度知道.png', '1461575279095.png', 'png', '/photos/1461575279095.png', 'N', null, '1', '2016-04-25 17:07:59', '1', '2016-04-25 17:07:59', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1291', '1-1511091256290-L.jpg', '1461577609797.jpg', 'jpg', '/photos/1461577609797.jpg', 'N', null, '1', '2016-04-25 17:46:50', '1', '2016-04-25 17:46:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1292', '2012121716537448.jpg', '1461577635402.jpg', 'jpg', '/photos/1461577635402.jpg', 'Y', null, '1', '2016-04-25 17:47:15', '1', '2016-04-25 17:47:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1295', '@PathVariable和@RequestParam的区别_百度知道.png', '1461577803152.png', 'png', '/photos/1461577803152.png', 'N', null, '1', '2016-04-25 17:50:03', '1', '2016-04-25 17:50:03', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1296', '枫叶.jpg', '1461578092942.jpg', 'jpg', '/photos/1461578092942.jpg', 'N', null, '1', '2016-04-25 17:54:53', '1', '2016-04-25 17:54:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1299', '1-1511091256290-L.jpg', '1461588370524.jpg', 'jpg', '/photos/1461588370524.jpg', 'N', null, '1', '2016-04-25 20:46:11', '1', '2016-04-25 20:46:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1300', '05 - 猜不透.mp3', '1461590747445.mp3', 'mp3', '/photos/1461590747445.mp3', 'N', null, '1', '2016-04-25 21:25:47', '1', '2016-04-25 21:25:47', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('1301', '1-1511091256290-L.jpg', '1461590795913.jpg', 'jpg', '/photos/1461590795913.jpg', 'N', null, '1', '2016-04-25 21:26:36', '1', '2016-04-25 21:26:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1302', 'QQ图片20160408132526.jpg', '1461591074389.jpg', 'jpg', '/photos/1461591074389.jpg', 'Y', null, '1', '2016-04-25 21:31:14', '1', '2016-04-25 21:31:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1303', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1461591114646.png', 'png', '/photos/1461591114646.png', 'Y', null, '1', '2016-04-25 21:31:55', '1', '2016-04-25 21:31:55', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1304', '05 - 猜不透.mp3', '1461641556789.mp3', 'mp3', '/photos/1461641556789.mp3', 'Y', null, '1', '2016-04-26 11:32:37', '1', '2016-04-26 11:32:37', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('1305', '6f87a9e299152900d98c2ac463566e6e.jpg', '1461650211992.jpg', 'jpg', '/photos/1461650211992.jpg', 'N', null, '1', '2016-04-26 13:56:52', '1', '2016-04-26 13:56:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1306', '1-1511100044350-L.jpg', '1461650213826.jpg', 'jpg', '/photos/1461650213826.jpg', 'N', null, '1', '2016-04-26 13:56:54', '1', '2016-04-26 13:56:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1307', '1-1511091256290-L.jpg', '1461651799551.jpg', 'jpg', '/photos/1461651799551.jpg', 'Y', null, '1', '2016-04-26 14:23:20', '1', '2016-04-26 14:23:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1308', '1-121002122100a5.jpg', '1461651886391.jpg', 'jpg', '/photos/1461651886391.jpg', 'N', null, '1', '2016-04-26 14:24:46', '1', '2016-04-26 14:24:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1309', '292377.jpg', '1461651889018.jpg', 'jpg', '/photos/1461651889018.jpg', 'N', null, '1', '2016-04-26 14:24:49', '1', '2016-04-26 14:24:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1310', '6f87a9e299152900d98c2ac463566e6e (1).jpg', '1461655975492.jpg', 'jpg', '/photos/1461655975492.jpg', 'Y', null, '1', '2016-04-26 15:32:56', '1', '2016-04-26 15:32:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1311', '292377 (1).jpg', '1461668007697.jpg', 'jpg', '/photos/1461668007697.jpg', 'Y', null, '1', '2016-04-26 18:53:28', '1', '2016-04-26 18:53:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1312', '292377 (1).jpg', '1461668044342.jpg', 'jpg', '/photos/1461668044342.jpg', 'N', null, '1', '2016-04-26 18:54:04', '1', '2016-04-26 18:54:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1313', '1-121002122100a5 (1).jpg', '1461668052064.jpg', 'jpg', '/photos/1461668052064.jpg', 'Y', null, '1', '2016-04-26 18:54:12', '1', '2016-04-26 18:54:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1314', '枫叶.jpg', '1461726756878.jpg', 'jpg', '/1461726756878.jpg', 'N', null, '1', '2016-04-27 11:12:37', '1', '2016-04-27 11:12:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1315', '马.jpg', '1461726883916.jpg', 'jpg', '/1461726883916.jpg', 'Y', null, '1', '2016-04-27 11:14:44', '1', '2016-04-27 11:14:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1316', '马544.jpg', '1461726893827.jpg', 'jpg', '/1461726893827.jpg', 'N', null, '1', '2016-04-27 11:14:54', '1', '2016-04-27 11:14:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1318', 'QQ图片20160408132526.jpg', '1461734440572.jpg', 'jpg', '/photos/1461734440572.jpg', 'Y', null, '1', '2016-04-27 13:20:41', '1', '2016-04-27 13:20:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1319', 'QQ图片20160408132526.jpg', '1461734464324.jpg', 'jpg', '/photos/1461734464324.jpg', 'N', null, '1', '2016-04-27 13:21:04', '1', '2016-04-27 13:21:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1320', 'QQ图片20160408132526.jpg', '1461734474899.jpg', 'jpg', '/photos/1461734474899.jpg', 'N', null, '1', '2016-04-27 13:21:15', '1', '2016-04-27 13:21:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1337', '18f40ad162d9f2d3f07c0bcaaaec8a136327cca2.jpg', '1461750088746.jpg', 'jpg', '/1461750088746.jpg', 'N', null, '1', '2016-04-27 17:41:29', '1', '2016-04-27 17:41:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1338', 're-share.png', '1461750154614.png', 'png', '/1461750154614.png', 'N', null, '1', '2016-04-27 17:42:35', '1', '2016-04-27 17:42:35', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1339', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461759765726.jpg', 'jpg', '/photos/1461759765726.jpg', 'Y', null, '1', '2016-04-27 20:22:46', '1', '2016-04-27 20:22:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1348', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461809348860.jpg', 'jpg', '/1461809348860.jpg', 'N', null, '1', '2016-04-28 10:09:09', '1', '2016-04-28 10:09:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1349', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1461809354535.jpg', 'jpg', '/1461809354535.jpg', 'N', null, '1', '2016-04-28 10:09:15', '1', '2016-04-28 10:09:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1350', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1461809357300.jpg', 'jpg', '/1461809357300.jpg', 'N', null, '1', '2016-04-28 10:09:17', '1', '2016-04-28 10:09:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1372', 'sub-search.png', '1461813492155.png', 'png', '/1461813492155.png', 'N', null, '1', '2016-04-28 11:18:12', '1', '2016-04-28 11:18:12', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1373', '291739323217867.png', '1461813519748.png', 'png', '/1461813519748.png', 'N', null, '1', '2016-04-28 11:18:40', '1', '2016-04-28 11:18:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1374', '160x126.png', '1461813553118.png', 'png', '/1461813553118.png', 'N', null, '1', '2016-04-28 11:19:13', '1', '2016-04-28 11:19:13', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1375', 'QQ图片20160408132526.jpg', '1461813760426.jpg', 'jpg', '/photos/1461813760426.jpg', 'Y', null, '1', '2016-04-28 11:22:40', '1', '2016-04-28 11:22:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1376', 'QQ图片20160408132526.jpg', '1461813775298.jpg', 'jpg', '/photos/1461813775298.jpg', 'N', null, '1', '2016-04-28 11:22:55', '1', '2016-04-28 11:22:55', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1377', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1461825886009.jpg', 'jpg', '/photos/1461825886009.jpg', 'N', null, '1', '2016-04-28 14:44:46', '1', '2016-04-28 14:44:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1378', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461826267437.jpg', 'jpg', '/photos/1461826267437.jpg', 'N', null, '1', '2016-04-28 14:51:07', '1', '2016-04-28 14:51:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1379', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461828038568.jpg', 'jpg', '/1461828038568.jpg', 'N', null, '1', '2016-04-28 15:20:39', '1', '2016-04-28 15:20:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1380', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461828043298.jpg', 'jpg', '/1461828043298.jpg', 'N', null, '1', '2016-04-28 15:20:43', '1', '2016-04-28 15:20:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1381', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461828660932.jpg', 'jpg', '/photos/1461828660932.jpg', 'N', null, '1', '2016-04-28 15:31:01', '1', '2016-04-28 15:31:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1382', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1461828713481.jpg', 'jpg', '/1461828713481.jpg', 'N', null, '1', '2016-04-28 15:31:53', '1', '2016-04-28 15:31:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1383', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1461828724861.jpg', 'jpg', '/1461828724861.jpg', 'N', null, '1', '2016-04-28 15:32:05', '1', '2016-04-28 15:32:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1384', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1461828750355.jpg', 'jpg', '/1461828750355.jpg', 'N', null, '1', '2016-04-28 15:32:30', '1', '2016-04-28 15:32:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1385', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461828774140.jpg', 'jpg', '/1461828774140.jpg', 'N', null, '1', '2016-04-28 15:32:54', '1', '2016-04-28 15:32:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1386', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1461828783772.jpg', 'jpg', '/1461828783772.jpg', 'N', null, '1', '2016-04-28 15:33:04', '1', '2016-04-28 15:33:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1387', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1461828824036.jpg', 'jpg', '/1461828824036.jpg', 'N', null, '1', '2016-04-28 15:33:44', '1', '2016-04-28 15:33:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1388', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1461829323919.jpg', 'jpg', '/1461829323919.jpg', 'N', null, '1', '2016-04-28 15:42:04', '1', '2016-04-28 15:42:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1389', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461829476663.jpg', 'jpg', '/1461829476663.jpg', 'N', null, '1', '2016-04-28 15:44:37', '1', '2016-04-28 15:44:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1390', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1461829796586.jpg', 'jpg', '/1461829796586.jpg', 'N', null, '1', '2016-04-28 15:49:57', '1', '2016-04-28 15:49:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1391', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1461830059205.jpg', 'jpg', '/1461830059205.jpg', 'N', null, '1', '2016-04-28 15:54:19', '1', '2016-04-28 15:54:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1392', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1461833725534.jpg', 'jpg', '/1461833725534.jpg', 'N', null, '1', '2016-04-28 16:55:26', '1', '2016-04-28 16:55:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1393', '美女.jpg', '1461894455419.jpg', 'jpg', '/1461894455419.jpg', 'N', null, '1', '2016-04-29 09:47:35', '1', '2016-04-29 09:47:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1394', '枫叶.jpg', '1461896425597.jpg', 'jpg', '/photos/1461896425597.jpg', 'N', null, '121', '2016-04-29 10:20:26', '121', '2016-04-29 10:20:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1395', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1461907948778.jpg', 'jpg', '/photos/1461907948778.jpg', 'Y', null, '1', '2016-04-29 13:32:29', '1', '2016-04-29 13:32:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1397', 'QQ图片20160408132526.jpg', '1461919037245.jpg', 'jpg', '/photos/1461919037245.jpg', 'Y', null, '1', '2016-04-29 16:37:17', '1', '2016-04-29 16:37:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1398', 'QQ图片20160408132526.jpg', '1461919088393.jpg', 'jpg', '/photos/1461919088393.jpg', 'Y', null, '1', '2016-04-29 16:38:08', '1', '2016-04-29 16:38:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1399', 'QQ图片20160408132526.jpg', '1461919119976.jpg', 'jpg', '/photos/1461919119976.jpg', 'Y', null, '1', '2016-04-29 16:38:40', '1', '2016-04-29 16:38:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1400', '新建文本文档.txt', '1461919167286.txt', 'txt', '/photos/1461919167286.txt', 'Y', null, '1', '2016-04-29 16:39:27', '1', '2016-04-29 16:39:27', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1401', 'QQ图片20160408132526.jpg', '1462237721417.jpg', 'jpg', '/photos/1462237721417.jpg', 'Y', null, '1', '2016-05-03 09:08:41', '1', '2016-05-03 09:08:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1402', '2016-05-03_up.jpg', '1462240452342.jpg', 'jpg', '/1462240452342.jpg', 'Y', null, '1', '2016-05-03 09:54:12', '1', '2016-05-03 09:54:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1403', '2016-05-03_up.jpg', '1462243448443.jpg', 'jpg', '/1462243448443.jpg', 'Y', null, '1', '2016-05-03 10:44:08', '1', '2016-05-03 10:44:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1404', 'QQ图片20160408132526.jpg', '1462243518608.jpg', 'jpg', '/photos/1462243518608.jpg', 'Y', null, '1', '2016-05-03 10:45:19', '1', '2016-05-03 10:45:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1405', 'QQ图片20160408132526.jpg', '1462243526366.jpg', 'jpg', '/photos/1462243526366.jpg', 'Y', null, '1', '2016-05-03 10:45:26', '1', '2016-05-03 10:45:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1406', '新建文本文档.txt', '1462243545834.txt', 'txt', '/photos/1462243545834.txt', 'Y', null, '1', '2016-05-03 10:45:46', '1', '2016-05-03 10:45:46', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1407', '新建文本文档.txt', '1462243602130.txt', 'txt', '/photos/1462243602130.txt', 'Y', null, '1', '2016-05-03 10:46:42', '1', '2016-05-03 10:46:42', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1430', '2016-05-04_up.jpg', '1462343905218.jpg', 'jpg', '/1462343905218.jpg', 'N', null, '1', '2016-05-04 14:38:25', '1', '2016-05-04 14:38:25', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1431', '600SAVE_20141112_244159 (2).jpeg', '1462353475623.jpeg', 'jpeg', '/photos/1462353475623.jpeg', 'Y', null, '1', '2016-05-04 17:17:56', '1', '2016-05-04 17:17:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1432', '[MITQMGF5M6VCVS)T%UF$LB.png', '1462353629829.png', 'png', '/photos/1462353629829.png', 'Y', null, '1', '2016-05-04 17:20:30', '1', '2016-05-04 17:20:30', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1433', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462353930946.jpg', 'jpg', '/photos/1462353930946.jpg', 'Y', null, '1', '2016-05-04 17:25:31', '1', '2016-05-04 17:25:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1434', '600SAVE_20141112_244159.jpeg', '1462353947043.jpeg', 'jpeg', '/photos/1462353947043.jpeg', 'Y', null, '1', '2016-05-04 17:25:47', '1', '2016-05-04 17:25:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1435', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462354195708.jpg', 'jpg', '/photos/1462354195708.jpg', 'Y', null, '1', '2016-05-04 17:29:56', '1', '2016-05-04 17:29:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1436', '292377.jpg', '1462355309330.jpg', 'jpg', '/photos/1462355309330.jpg', 'Y', null, '1', '2016-05-04 17:48:29', '1', '2016-05-04 17:48:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1437', '1-1511100044350-L.jpg', '1462355342238.jpg', 'jpg', '/photos/1462355342238.jpg', 'Y', null, '1', '2016-05-04 17:49:02', '1', '2016-05-04 17:49:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1438', '1461909306705.png', '1462355375675.png', 'png', '/1462355375675.png', 'N', null, '1', '2016-05-04 17:49:36', '1', '2016-05-04 17:49:36', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1439', '600SAVE_20141112_244159.jpeg', '1462355485313.jpeg', 'jpeg', '/photos/1462355485313.jpeg', 'Y', null, '1', '2016-05-04 17:51:25', '1', '2016-05-04 17:51:25', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1440', '1-151021004JV46.jpg', '1462355499960.jpg', 'jpg', '/photos/1462355499960.jpg', 'Y', null, '1', '2016-05-04 17:51:40', '1', '2016-05-04 17:51:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1441', '@PathVariable和@RequestParam的区别_百度知道.png', '1462355505679.png', 'png', '/photos/1462355505679.png', 'Y', null, '1', '2016-05-04 17:51:46', '1', '2016-05-04 17:51:46', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1442', '2016-05-04_up.jpg', '1462355562443.jpg', 'jpg', '/1462355562443.jpg', 'N', null, '1', '2016-05-04 17:52:42', '1', '2016-05-04 17:52:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1443', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462408902590.jpg', 'jpg', '/photos/1462408902590.jpg', 'Y', null, '1', '2016-05-05 08:41:43', '1', '2016-05-05 08:41:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1444', '21494230A-0-lp.jpg', '1462411440295.jpg', 'jpg', '/photos/1462411440295.jpg', 'Y', null, '1', '2016-05-05 09:24:00', '1', '2016-05-05 09:24:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1445', '600SAVE_20141112_244159.jpeg', '1462412766947.jpeg', 'jpeg', '/photos/1462412766947.jpeg', 'Y', null, '1', '2016-05-05 09:46:07', '1', '2016-05-05 09:46:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1446', '292377.jpg', '1462413918059.jpg', 'jpg', '/photos/1462413918059.jpg', 'Y', null, '1', '2016-05-05 10:05:18', '1', '2016-05-05 10:05:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1447', '郭华文个人周报及计划16.04.25-04.29.doc', '1462413921356.doc', 'doc', '/photos/1462413921356.doc', 'Y', null, '1', '2016-05-05 10:05:21', '1', '2016-05-05 10:05:21', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1448', '1-121002122100a5 (1).jpg', '1462414675743.jpg', 'jpg', '/photos/1462414675743.jpg', 'Y', null, '1', '2016-05-05 10:17:56', '1', '2016-05-05 10:17:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1449', '600SAVE_20141112_244159.jpeg', '1462414743745.jpeg', 'jpeg', '/photos/1462414743745.jpeg', 'Y', null, '1', '2016-05-05 10:19:04', '1', '2016-05-05 10:19:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1450', '1-1511100044350-L.jpg', '1462414819304.jpg', 'jpg', '/photos/1462414819304.jpg', 'Y', null, '1', '2016-05-05 10:20:19', '1', '2016-05-05 10:20:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1451', '1-121002122100a5.jpg', '1462414820918.jpg', 'jpg', '/photos/1462414820918.jpg', 'Y', null, '1', '2016-05-05 10:20:21', '1', '2016-05-05 10:20:21', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1452', '1-121002122100a5.jpg', '1462414931863.jpg', 'jpg', '/photos/1462414931863.jpg', 'Y', null, '1', '2016-05-05 10:22:12', '1', '2016-05-05 10:22:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1453', '1-1511091256290-L.jpg', '1462414933225.jpg', 'jpg', '/photos/1462414933225.jpg', 'Y', null, '1', '2016-05-05 10:22:13', '1', '2016-05-05 10:22:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1454', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462414934982.jpg', 'jpg', '/photos/1462414934982.jpg', 'Y', null, '1', '2016-05-05 10:22:15', '1', '2016-05-05 10:22:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1455', '600SAVE_20141112_244159.jpeg', '1462415058563.jpeg', 'jpeg', '/photos/1462415058563.jpeg', 'Y', null, '1', '2016-05-05 10:24:19', '1', '2016-05-05 10:24:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1456', '1-151021004JV46.jpg', '1462415060116.jpg', 'jpg', '/photos/1462415060116.jpg', 'Y', null, '1', '2016-05-05 10:24:20', '1', '2016-05-05 10:24:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1457', '1-121002122100a5.jpg', '1462415061727.jpg', 'jpg', '/photos/1462415061727.jpg', 'Y', null, '1', '2016-05-05 10:24:22', '1', '2016-05-05 10:24:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1458', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462415124262.jpg', 'jpg', '/photos/1462415124262.jpg', 'Y', null, '1', '2016-05-05 10:25:24', '1', '2016-05-05 10:25:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1459', '1-121002122100a5.jpg', '1462415125997.jpg', 'jpg', '/photos/1462415125997.jpg', 'Y', null, '1', '2016-05-05 10:25:26', '1', '2016-05-05 10:25:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1460', '1-1511091256290-L.jpg', '1462415127615.jpg', 'jpg', '/photos/1462415127615.jpg', 'Y', null, '1', '2016-05-05 10:25:28', '1', '2016-05-05 10:25:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1461', '1-121002122100a5.jpg', '1462415252407.jpg', 'jpg', '/photos/1462415252407.jpg', 'Y', null, '1', '2016-05-05 10:27:32', '1', '2016-05-05 10:27:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1462', '1-1511091256290-L.jpg', '1462415253856.jpg', 'jpg', '/photos/1462415253856.jpg', 'Y', null, '1', '2016-05-05 10:27:34', '1', '2016-05-05 10:27:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1463', '1-1511100044350-L.jpg', '1462415255479.jpg', 'jpg', '/photos/1462415255479.jpg', 'Y', null, '1', '2016-05-05 10:27:35', '1', '2016-05-05 10:27:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1464', '1-121002122100a5.jpg', '1462415398367.jpg', 'jpg', '/photos/1462415398367.jpg', 'Y', null, '1', '2016-05-05 10:29:58', '1', '2016-05-05 10:29:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1465', '1-1511091256290-L.jpg', '1462415400032.jpg', 'jpg', '/photos/1462415400032.jpg', 'Y', null, '1', '2016-05-05 10:30:00', '1', '2016-05-05 10:30:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1466', '1-121002122100a5 (1).jpg', '1462415402287.jpg', 'jpg', '/photos/1462415402287.jpg', 'Y', null, '1', '2016-05-05 10:30:02', '1', '2016-05-05 10:30:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1467', '1-1511100044350-L.jpg', '1462416399969.jpg', 'jpg', '/photos/1462416399969.jpg', 'Y', null, '1', '2016-05-05 10:46:40', '1', '2016-05-05 10:46:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1468', '1-121002122100a5.jpg', '1462416403087.jpg', 'jpg', '/photos/1462416403087.jpg', 'Y', null, '1', '2016-05-05 10:46:43', '1', '2016-05-05 10:46:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1469', '1-1511100044350-L.jpg', '1462417240772.jpg', 'jpg', '/photos/1462417240772.jpg', 'Y', null, '1', '2016-05-05 11:00:41', '1', '2016-05-05 11:00:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1470', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462417242354.jpg', 'jpg', '/photos/1462417242354.jpg', 'Y', null, '1', '2016-05-05 11:00:42', '1', '2016-05-05 11:00:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1471', '600SAVE_20141112_244159.jpeg', '1462417243874.jpeg', 'jpeg', '/photos/1462417243874.jpeg', 'Y', null, '1', '2016-05-05 11:00:44', '1', '2016-05-05 11:00:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1472', '292377.jpg', '1462417245674.jpg', 'jpg', '/photos/1462417245674.jpg', 'Y', null, '1', '2016-05-05 11:00:46', '1', '2016-05-05 11:00:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1473', '1-121002122100a5 (1).jpg', '1462420154886.jpg', 'jpg', '/photos/1462420154886.jpg', 'Y', null, '1', '2016-05-05 11:49:15', '1', '2016-05-05 11:49:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1474', '1-121002122100a5 (1).jpg', '1462420480047.jpg', 'jpg', '/photos/1462420480047.jpg', 'N', null, '1', '2016-05-05 11:54:40', '1', '2016-05-05 11:54:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1475', '1-121002122100a5.jpg', '1462420482555.jpg', 'jpg', '/photos/1462420482555.jpg', 'N', null, '1', '2016-05-05 11:54:43', '1', '2016-05-05 11:54:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1476', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462420487438.jpg', 'jpg', '/photos/1462420487438.jpg', 'N', null, '1', '2016-05-05 11:54:47', '1', '2016-05-05 11:54:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1477', '600SAVE_20141112_244159.jpeg', '1462420489059.jpeg', 'jpeg', '/photos/1462420489059.jpeg', 'N', null, '1', '2016-05-05 11:54:49', '1', '2016-05-05 11:54:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1478', '292377.jpg', '1462420490398.jpg', 'jpg', '/photos/1462420490398.jpg', 'N', null, '1', '2016-05-05 11:54:50', '1', '2016-05-05 11:54:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1479', '1-151021004JV46.jpg', '1462420492096.jpg', 'jpg', '/photos/1462420492096.jpg', 'N', null, '1', '2016-05-05 11:54:52', '1', '2016-05-05 11:54:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1480', '1-121002122100a5 (1).jpg', '1462420493786.jpg', 'jpg', '/photos/1462420493786.jpg', 'N', null, '1', '2016-05-05 11:54:54', '1', '2016-05-05 11:54:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1481', '软件部-单周工作计划.xlsx', '1462420498211.xlsx', 'xlsx', '/photos/1462420498211.xlsx', 'N', null, '1', '2016-05-05 11:54:58', '1', '2016-05-05 11:54:58', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
INSERT INTO `gxwl_sys_doc` VALUES ('1482', '21494230A-0-lp.jpg', '1462420500714.jpg', 'jpg', '/photos/1462420500714.jpg', 'N', null, '1', '2016-05-05 11:55:01', '1', '2016-05-05 11:55:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1483', '郭华文个人周报及计划16.04.25-04.29.doc', '1462420503158.doc', 'doc', '/photos/1462420503158.doc', 'N', null, '1', '2016-05-05 11:55:03', '1', '2016-05-05 11:55:03', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1484', '1-121002122100a5 (1).jpg', '1462420505469.jpg', 'jpg', '/photos/1462420505469.jpg', 'N', null, '1', '2016-05-05 11:55:05', '1', '2016-05-05 11:55:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1485', '[MITQMGF5M6VCVS)T%UF$LB.png', '1462420508035.png', 'png', '/photos/1462420508035.png', 'N', null, '1', '2016-05-05 11:55:08', '1', '2016-05-05 11:55:08', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1486', '1-1511100044350-L.jpg', '1462420857896.jpg', 'jpg', '/photos/1462420857896.jpg', 'N', null, '1', '2016-05-05 12:00:58', '1', '2016-05-05 12:00:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1487', '1-121002122100a5.jpg', '1462420859574.jpg', 'jpg', '/photos/1462420859574.jpg', 'N', null, '1', '2016-05-05 12:01:00', '1', '2016-05-05 12:01:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1488', '1-121002122100a5 (1).jpg', '1462420860997.jpg', 'jpg', '/photos/1462420860997.jpg', 'N', null, '1', '2016-05-05 12:01:01', '1', '2016-05-05 12:01:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1489', '1-121002122100a5.jpg', '1462422073882.jpg', 'jpg', '/photos/1462422073882.jpg', 'Y', null, '1', '2016-05-05 12:21:14', '1', '2016-05-05 12:21:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1490', '292377.jpg', '1462425232167.jpg', 'jpg', '/photos/1462425232167.jpg', 'Y', null, '1', '2016-05-05 13:13:52', '1', '2016-05-05 13:13:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1491', '1-121002122100a5 (1).jpg', '1462425234087.jpg', 'jpg', '/photos/1462425234087.jpg', 'Y', null, '1', '2016-05-05 13:13:54', '1', '2016-05-05 13:13:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1492', '1-1511091256290-L.jpg', '1462425235840.jpg', 'jpg', '/photos/1462425235840.jpg', 'Y', null, '1', '2016-05-05 13:13:56', '1', '2016-05-05 13:13:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1493', '1-121002122100a5 (1).jpg', '1462425322761.jpg', 'jpg', '/photos/1462425322761.jpg', 'Y', null, '1', '2016-05-05 13:15:23', '1', '2016-05-05 13:15:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1494', '1-121002122100a5 (1).jpg', '1462425583947.jpg', 'jpg', '/photos/1462425583947.jpg', 'N', null, '1', '2016-05-05 13:19:44', '1', '2016-05-05 13:19:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1495', '1-121002122100a5.jpg', '1462425585396.jpg', 'jpg', '/photos/1462425585396.jpg', 'N', null, '1', '2016-05-05 13:19:45', '1', '2016-05-05 13:19:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1496', '292377.jpg', '1462425862432.jpg', 'jpg', '/photos/1462425862432.jpg', 'N', null, '1', '2016-05-05 13:24:22', '1', '2016-05-05 13:24:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1497', '1-121002122100a5 (1).jpg', '1462426048265.jpg', 'jpg', '/photos/1462426048265.jpg', 'Y', null, '1', '2016-05-05 13:27:28', '1', '2016-05-05 13:27:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1498', '600SAVE_20141112_244159.jpeg', '1462426250281.jpeg', 'jpeg', '/photos/1462426250281.jpeg', 'Y', null, '1', '2016-05-05 13:30:50', '1', '2016-05-05 13:30:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1499', '292377.jpg', '1462426371111.jpg', 'jpg', '/photos/1462426371111.jpg', 'Y', null, '1', '2016-05-05 13:32:51', '1', '2016-05-05 13:32:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1500', '05 - 猜不透.mp3', '1462426586564.mp3', 'mp3', '/photos/1462426586564.mp3', 'Y', null, '1', '2016-05-05 13:36:27', '1', '2016-05-05 13:36:27', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('1501', '292377.jpg', '1462426692307.jpg', 'jpg', '/photos/1462426692307.jpg', 'Y', null, '1', '2016-05-05 13:38:12', '1', '2016-05-05 13:38:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1502', '600SAVE_20141112_244159.jpeg', '1462426851707.jpeg', 'jpeg', '/photos/1462426851707.jpeg', 'N', null, '1', '2016-05-05 13:40:52', '1', '2016-05-05 13:40:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1503', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462427128082.jpg', 'jpg', '/photos/1462427128082.jpg', 'Y', null, '1', '2016-05-05 13:45:28', '1', '2016-05-05 13:45:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1504', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462427294169.jpg', 'jpg', '/photos/1462427294169.jpg', 'Y', null, '1', '2016-05-05 13:48:14', '1', '2016-05-05 13:48:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1505', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462427459244.jpg', 'jpg', '/1462427459244.jpg', 'N', null, '1', '2016-05-05 13:50:59', '1', '2016-05-05 13:50:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1506', 'sa02.jpg', '1462429172110.jpg', 'jpg', '/photos/1462429172110.jpg', 'N', null, '1', '2016-05-05 14:19:32', '1', '2016-05-05 14:19:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1507', 'sa01.jpg', '1462429183047.jpg', 'jpg', '/photos/1462429183047.jpg', 'N', null, '1', '2016-05-05 14:19:43', '1', '2016-05-05 14:19:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1508', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462429455413.jpg', 'jpg', '/photos/1462429455413.jpg', 'Y', null, '1', '2016-05-05 14:24:15', '1', '2016-05-05 14:24:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1509', 'QQ图片20160408132526.jpg', '1462496174700.jpg', 'jpg', '/photos/1462496174700.jpg', 'Y', null, '1', '2016-05-06 08:56:15', '1', '2016-05-06 08:56:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1510', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462498340094.jpg', 'jpg', '/photos/1462498340094.jpg', 'Y', null, '1', '2016-05-06 09:32:20', '1', '2016-05-06 09:32:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1511', '马544.jpg', '1462525888360.jpg', 'jpg', '/photos/1462525888360.jpg', 'Y', null, '1', '2016-05-06 17:11:28', '1', '2016-05-06 17:11:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1512', '1-121002122100a5.jpg', '1462585585576.jpg', 'jpg', '/photos/1462585585576.jpg', 'N', null, '1', '2016-05-07 09:46:26', '1', '2016-05-07 09:46:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1514', 'QQ图片20160408132526.jpg', '1462671530916.jpg', 'jpg', '/photos/1462671530916.jpg', 'N', null, '1', '2016-05-08 09:38:51', '1', '2016-05-08 09:38:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1515', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1462671721526.png', 'png', '/photos/1462671721526.png', 'Y', null, '1', '2016-05-08 09:42:02', '1', '2016-05-08 09:42:02', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1516', 'sub-search.png', '1462672095428.png', 'png', '/1462672095428.png', 'N', null, '1', '2016-05-08 09:48:15', '1', '2016-05-08 09:48:15', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1517', 'progress-light.png', '1462672387267.png', 'png', '/1462672387267.png', 'N', null, '1', '2016-05-08 09:53:07', '1', '2016-05-08 09:53:07', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1518', 'QQ图片20160408132526.jpg', '1462672445924.jpg', 'jpg', '/photos/1462672445924.jpg', 'Y', null, '1', '2016-05-08 09:54:06', '1', '2016-05-08 09:54:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1519', '2016-05-08_up.jpg', '1462672650656.jpg', 'jpg', '/1462672650656.jpg', 'N', null, '1', '2016-05-08 09:57:31', '1', '2016-05-08 09:57:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1520', '2016-05-08_up.jpg', '1462672779892.jpg', 'jpg', '/1462672779892.jpg', 'N', null, '1', '2016-05-08 09:59:40', '1', '2016-05-08 09:59:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1523', 're-share.png', '1462673591491.png', 'png', '/1462673591491.png', 'N', null, '1', '2016-05-08 10:13:11', '1', '2016-05-08 10:13:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1524', '2016-05-08_up.jpg', '1462673693503.jpg', 'jpg', '/1462673693503.jpg', 'N', null, '1', '2016-05-08 10:14:54', '1', '2016-05-08 10:14:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1525', '2016-05-08_up.jpg', '1462673820935.jpg', 'jpg', '/1462673820935.jpg', 'N', null, '1', '2016-05-08 10:17:01', '1', '2016-05-08 10:17:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1526', '??.jpg', '1462674661489.jpg', 'jpg', '/1462674661489.jpg', 'N', null, '1', '2016-05-08 10:31:01', '1', '2016-05-08 10:31:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1527', '2016-04-23_up.jpg', '1462674819063.jpg', 'jpg', '/1462674819063.jpg', 'Y', null, '1', '2016-05-08 10:33:39', '1', '2016-05-08 10:33:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1528', '2012121716537448.jpg', '1462674843835.jpg', 'jpg', '/1462674843835.jpg', 'Y', null, '1', '2016-05-08 10:34:04', '1', '2016-05-08 10:34:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1529', '2016-04-22_up.jpg', '1462674873615.jpg', 'jpg', '/1462674873615.jpg', 'N', null, '1', '2016-05-08 10:34:34', '1', '2016-05-08 10:34:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1530', '2016-03-28_up.jpg', '1462675043581.jpg', 'jpg', '/1462675043581.jpg', 'N', null, '1', '2016-05-08 10:37:24', '1', '2016-05-08 10:37:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1531', '马544.jpg', '1462683345926.jpg', 'jpg', '/1462683345926.jpg', 'N', null, '121', '2016-05-08 12:55:46', '121', '2016-05-08 12:55:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1533', '2016-05-08_up.jpg', '1462710563459.jpg', 'jpg', '/1462710563459.jpg', 'Y', null, '1', '2016-05-08 20:29:24', '1', '2016-05-08 20:29:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1534', '人口信息表单.jpg', '1462710587820.jpg', 'jpg', '/photos/1462710587820.jpg', 'Y', null, '1', '2016-05-08 20:29:48', '1', '2016-05-08 20:29:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1535', 'QQ图片20160408132526.jpg', '1462710687809.jpg', 'jpg', '/photos/1462710687809.jpg', 'Y', null, '1', '2016-05-08 20:31:28', '1', '2016-05-08 20:31:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1536', '2016-05-08_up.jpg', '1462710749896.jpg', 'jpg', '/1462710749896.jpg', 'Y', null, '1', '2016-05-08 20:32:30', '1', '2016-05-08 20:32:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1537', '2016-05-08_up.jpg', '1462711866829.jpg', 'jpg', '/1462711866829.jpg', 'Y', null, '1', '2016-05-08 20:51:07', '1', '2016-05-08 20:51:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1538', '292377.jpg', '1462715487490.jpg', 'jpg', '/photos/1462715487490.jpg', 'N', null, '1', '2016-05-08 21:51:28', '1', '2016-05-08 21:51:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1539', '292377.jpg', '1462715508677.jpg', 'jpg', '/photos/1462715508677.jpg', 'N', null, '1', '2016-05-08 21:51:49', '1', '2016-05-08 21:51:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1540', 're-share.png', '1462716271186.png', 'png', '/1462716271186.png', 'Y', null, '1', '2016-05-08 22:04:31', '1', '2016-05-08 22:04:31', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1541', '[MITQMGF5M6VCVS)T%UF$LB.png', '1462716603102.png', 'png', '/photos/1462716603102.png', 'N', null, '1', '2016-05-08 22:10:03', '1', '2016-05-08 22:10:03', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1542', 'QQ图片20160408132526.jpg', '1462716661216.jpg', 'jpg', '/photos/1462716661216.jpg', 'N', null, '1', '2016-05-08 22:11:01', '1', '2016-05-08 22:11:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1543', '21494230A-0-lp.jpg', '1462716964704.jpg', 'jpg', '/photos/1462716964704.jpg', 'N', null, '1', '2016-05-08 22:16:05', '1', '2016-05-08 22:16:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1544', 're-share.png', '1462719753302.png', 'png', '/1462719753302.png', 'Y', null, '1', '2016-05-08 23:02:33', '1', '2016-05-08 23:02:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1545', 'QQ图片20160408132526.jpg', '1462720141930.jpg', 'jpg', '/photos/1462720141930.jpg', 'Y', null, '1', '2016-05-08 23:09:02', '1', '2016-05-08 23:09:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1546', 'logo.png', '1462720170046.png', 'png', '/photos/1462720170046.png', 'Y', null, '1', '2016-05-08 23:09:30', '1', '2016-05-08 23:09:30', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1547', 're-share.png', '1462720186414.png', 'png', '/1462720186414.png', 'Y', null, '1', '2016-05-08 23:09:46', '1', '2016-05-08 23:09:46', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1548', 're-share.png', '1462721495474.png', 'png', '/1462721495474.png', 'Y', null, '1', '2016-05-08 23:31:35', '1', '2016-05-08 23:31:35', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1549', 're-share.png', '1462721572371.png', 'png', '/1462721572371.png', 'Y', null, '1', '2016-05-08 23:32:52', '1', '2016-05-08 23:32:52', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1550', 're-share.png', '1462721800897.png', 'png', '/1462721800897.png', 'Y', null, '1', '2016-05-08 23:36:41', '1', '2016-05-08 23:36:41', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1551', 're-share.png', '1462721912675.png', 'png', '/1462721912675.png', 'Y', null, '1', '2016-05-08 23:38:33', '1', '2016-05-08 23:38:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1552', '2016-05-09_up.jpg', '1462758673558.jpg', 'jpg', '/1462758673558.jpg', 'Y', null, '1', '2016-05-09 09:51:14', '1', '2016-05-09 09:51:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1553', 'sub-search.png', '1462760125159.png', 'png', '/1462760125159.png', 'Y', null, '1', '2016-05-09 10:15:25', '1', '2016-05-09 10:15:25', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1554', 'sub-search.png', '1462760188328.png', 'png', '/1462760188328.png', 'Y', null, '1', '2016-05-09 10:16:28', '1', '2016-05-09 10:16:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1555', 're-share.png', '1462760188734.png', 'png', '/1462760188734.png', 'Y', null, '1', '2016-05-09 10:16:29', '1', '2016-05-09 10:16:29', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1556', 'sub-search.png', '1462760199251.png', 'png', '/1462760199251.png', 'Y', null, '1', '2016-05-09 10:16:39', '1', '2016-05-09 10:16:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1557', 're-share.png', '1462760199298.png', 'png', '/1462760199298.png', 'Y', null, '1', '2016-05-09 10:16:39', '1', '2016-05-09 10:16:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1558', 'coupon-limit-time.png', '1462760199423.png', 'png', '/1462760199423.png', 'Y', null, '1', '2016-05-09 10:16:39', '1', '2016-05-09 10:16:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1559', 'QQ图片20160408132526.jpg', '1462760895853.jpg', 'jpg', '/photos/1462760895853.jpg', 'Y', null, '1', '2016-05-09 10:28:16', '1', '2016-05-09 10:28:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1560', 're-share.png', '1462761197926.png', 'png', '/1462761197926.png', 'N', null, '1', '2016-05-09 10:33:18', '1', '2016-05-09 10:33:18', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1561', 're-share.png', '1462761250842.png', 'png', '/1462761250842.png', 'N', null, '1', '2016-05-09 10:34:11', '1', '2016-05-09 10:34:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1562', 're-share.png', '1462761290091.png', 'png', '/1462761290091.png', 'N', null, '1', '2016-05-09 10:34:50', '1', '2016-05-09 10:34:50', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1563', 're-share.png', '1462761315744.png', 'png', '/1462761315744.png', 'N', null, '1', '2016-05-09 10:35:16', '1', '2016-05-09 10:35:16', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1564', 're-share.png', '1462762586536.png', 'png', '/1462762586536.png', 'N', null, '1', '2016-05-09 10:56:27', '1', '2016-05-09 10:56:27', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1565', 'QQ图片20160408132526.jpg', '1462763091744.jpg', 'jpg', '/photos/1462763091744.jpg', 'Y', null, '1', '2016-05-09 11:04:52', '1', '2016-05-09 11:04:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1566', 're-share.png', '1462763150963.png', 'png', '/1462763150963.png', 'N', null, '1', '2016-05-09 11:05:51', '1', '2016-05-09 11:05:51', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1567', 're-share.png', '1462763633465.png', 'png', '/1462763633465.png', 'N', null, '1', '2016-05-09 11:13:53', '1', '2016-05-09 11:13:53', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1568', 'QQ图片20160408132526.jpg', '1462763818703.jpg', 'jpg', '/photos/1462763818703.jpg', 'Y', null, '1', '2016-05-09 11:16:59', '1', '2016-05-09 11:16:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1569', 'QQ图片20160408132526.jpg', '1462763912825.jpg', 'jpg', '/photos/1462763912825.jpg', 'Y', null, '1', '2016-05-09 11:18:33', '1', '2016-05-09 11:18:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1570', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462763989226.jpg', 'jpg', '/photos/1462763989226.jpg', 'Y', null, '1', '2016-05-09 11:19:49', '1', '2016-05-09 11:19:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1571', '1-1511091256290-L.jpg', '1462763991671.jpg', 'jpg', '/photos/1462763991671.jpg', 'Y', null, '1', '2016-05-09 11:19:52', '1', '2016-05-09 11:19:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1572', 'QQ图片20160408132526.jpg', '1462764004665.jpg', 'jpg', '/photos/1462764004665.jpg', 'Y', null, '1', '2016-05-09 11:20:05', '1', '2016-05-09 11:20:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1573', '600SAVE_20141112_244159.jpeg', '1462764068863.jpeg', 'jpeg', '/photos/1462764068863.jpeg', 'Y', null, '1', '2016-05-09 11:21:09', '1', '2016-05-09 11:21:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1574', '292377.jpg', '1462764073163.jpg', 'jpg', '/photos/1462764073163.jpg', 'Y', null, '1', '2016-05-09 11:21:13', '1', '2016-05-09 11:21:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1575', '21494230A-0-lp.jpg', '1462764074490.jpg', 'jpg', '/photos/1462764074490.jpg', 'Y', null, '1', '2016-05-09 11:21:15', '1', '2016-05-09 11:21:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1576', '1-121002122100a5 (1).jpg', '1462764076052.jpg', 'jpg', '/photos/1462764076052.jpg', 'Y', null, '1', '2016-05-09 11:21:16', '1', '2016-05-09 11:21:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1577', 'F~~LA%95VMMZ)[5O6POBO_U.png', '1462764099328.png', 'png', '/photos/1462764099328.png', 'Y', null, '1', '2016-05-09 11:21:39', '1', '2016-05-09 11:21:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1578', 'QQ图片20160408132526.jpg', '1462764129018.jpg', 'jpg', '/photos/1462764129018.jpg', 'Y', null, '1', '2016-05-09 11:22:09', '1', '2016-05-09 11:22:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1579', '1-121002122100a5.jpg', '1462764173095.jpg', 'jpg', '/photos/1462764173095.jpg', 'Y', null, '1', '2016-05-09 11:22:53', '1', '2016-05-09 11:22:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1580', 'logo.png', '1462764186710.png', 'png', '/photos/1462764186710.png', 'Y', null, '1', '2016-05-09 11:23:07', '1', '2016-05-09 11:23:07', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1581', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462764494645.jpg', 'jpg', '/photos/1462764494645.jpg', 'Y', null, '1', '2016-05-09 11:28:15', '1', '2016-05-09 11:28:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1582', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462764631120.jpg', 'jpg', '/photos/1462764631120.jpg', 'N', null, '1', '2016-05-09 11:30:31', '1', '2016-05-09 11:30:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1583', '1-1511091256290-L.jpg', '1462764632700.jpg', 'jpg', '/photos/1462764632700.jpg', 'N', null, '1', '2016-05-09 11:30:33', '1', '2016-05-09 11:30:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1584', 'QQ图片20160408132526.jpg', '1462764691191.jpg', 'jpg', '/photos/1462764691191.jpg', 'Y', null, '1', '2016-05-09 11:31:31', '1', '2016-05-09 11:31:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1585', '6f87a9e299152900d98c2ac463566e6e.jpg', '1462764724265.jpg', 'jpg', '/photos/1462764724265.jpg', 'N', null, '1', '2016-05-09 11:32:04', '1', '2016-05-09 11:32:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1586', '600SAVE_20141112_244159.jpeg', '1462764729111.jpeg', 'jpeg', '/photos/1462764729111.jpeg', 'N', null, '1', '2016-05-09 11:32:09', '1', '2016-05-09 11:32:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1587', 'QQ图片20160408132526.jpg', '1462764751695.jpg', 'jpg', '/photos/1462764751695.jpg', 'N', null, '1', '2016-05-09 11:32:32', '1', '2016-05-09 11:32:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1588', '2016-05-09_up.jpg', '1462764933161.jpg', 'jpg', '/1462764933161.jpg', 'Y', null, '1', '2016-05-09 11:35:33', '1', '2016-05-09 11:35:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1589', 'QQ图片20160408132526.jpg', '1462764990507.jpg', 'jpg', '/photos/1462764990507.jpg', 'Y', null, '1', '2016-05-09 11:36:31', '1', '2016-05-09 11:36:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1590', 'QQ图片20160408132526.jpg', '1462765054567.jpg', 'jpg', '/photos/1462765054567.jpg', 'N', null, '1', '2016-05-09 11:37:35', '1', '2016-05-09 11:37:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1591', '2016-05-09_up.jpg', '1462765155153.jpg', 'jpg', '/1462765155153.jpg', 'N', null, '1', '2016-05-09 11:39:15', '1', '2016-05-09 11:39:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1592', '2016-05-09_up.jpg', '1462765319395.jpg', 'jpg', '/1462765319395.jpg', 'N', null, '1', '2016-05-09 11:41:59', '1', '2016-05-09 11:41:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1593', '2016-05-09_up.jpg', '1462765370426.jpg', 'jpg', '/1462765370426.jpg', 'N', null, '1', '2016-05-09 11:42:50', '1', '2016-05-09 11:42:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1594', 'QQ图片20160408132526.jpg', '1462765560155.jpg', 'jpg', '/photos/1462765560155.jpg', 'N', null, '1', '2016-05-09 11:46:00', '1', '2016-05-09 11:46:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1595', '2016-05-09_up.jpg', '1462765676208.jpg', 'jpg', '/1462765676208.jpg', 'Y', null, '1', '2016-05-09 11:47:56', '1', '2016-05-09 11:47:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1596', '2016-05-09_up.jpg', '1462765796455.jpg', 'jpg', '/1462765796455.jpg', 'N', null, '1', '2016-05-09 11:49:56', '1', '2016-05-09 11:49:56', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1597', '2016-05-09_up.jpg', '1462765914555.jpg', 'jpg', '/1462765914555.jpg', 'N', null, '1', '2016-05-09 11:51:55', '1', '2016-05-09 11:51:55', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1598', '2016-05-09_up.jpg', '1462765933248.jpg', 'jpg', '/1462765933248.jpg', 'N', null, '1', '2016-05-09 11:52:13', '1', '2016-05-09 11:52:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1599', 'QQ图片20160408132526.jpg', '1462770438488.jpg', 'jpg', '/photos/1462770438488.jpg', 'Y', null, '1', '2016-05-09 13:07:18', '1', '2016-05-09 13:07:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1600', 'QQ图片20160408132526.jpg', '1462770491934.jpg', 'jpg', '/photos/1462770491934.jpg', 'Y', null, '1', '2016-05-09 13:08:12', '1', '2016-05-09 13:08:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1601', '2016-05-09_up.jpg', '1462770660298.jpg', 'jpg', '/1462770660298.jpg', 'Y', null, '1', '2016-05-09 13:11:00', '1', '2016-05-09 13:11:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1602', '2016-05-09_up.jpg', '1462770705071.jpg', 'jpg', '/1462770705071.jpg', 'Y', null, '1', '2016-05-09 13:11:45', '1', '2016-05-09 13:11:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1603', 'nmiss.apk', '1462771518924.apk', 'apk', '/photos/1462771518924.apk', 'N', null, '1', '2016-05-09 13:25:19', '1', '2016-05-09 13:25:19', 'application/octet-stream');
INSERT INTO `gxwl_sys_doc` VALUES ('1604', 'VID_20160509_133122.mp4', '1462771903975.mp4', 'mp4', '/1462771903975.mp4', 'Y', null, '1', '2016-05-09 13:31:44', '1', '2016-05-09 13:31:44', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1605', 'cisRecorder.mp4', '1462772335484.mp4', 'mp4', '/1462772335484.mp4', 'Y', null, '1', '2016-05-09 13:38:56', '1', '2016-05-09 13:38:56', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1606', 'cisRecorder.mp4', '1462772509353.mp4', 'mp4', '/1462772509353.mp4', 'Y', null, '1', '2016-05-09 13:41:49', '1', '2016-05-09 13:41:49', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1607', '2016-05-09_up.jpg', '1462772674972.jpg', 'jpg', '/1462772674972.jpg', 'Y', null, '1', '2016-05-09 13:44:35', '1', '2016-05-09 13:44:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1608', '2016-05-09_up.jpg', '1462773118291.jpg', 'jpg', '/1462773118291.jpg', 'Y', null, '1', '2016-05-09 13:51:58', '1', '2016-05-09 13:51:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1609', '2016-05-09 13:52:11_up.jpg', '1462773128515.jpg', 'jpg', '/1462773128515.jpg', 'Y', null, '1', '2016-05-09 13:52:09', '1', '2016-05-09 13:52:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1610', '2016-05-09 14:01:09_up.jpg', '1462773667596.jpg', 'jpg', '/1462773667596.jpg', 'Y', null, '1', '2016-05-09 14:01:08', '1', '2016-05-09 14:01:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1611', '2016-05-09_up.jpg', '1462773674270.jpg', 'jpg', '/1462773674270.jpg', 'Y', null, '1', '2016-05-09 14:01:14', '1', '2016-05-09 14:01:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1612', '20160509095121166.jpg', '1462773684229.jpg', 'jpg', '/1462773684229.jpg', 'Y', null, '1', '2016-05-09 14:01:24', '1', '2016-05-09 14:01:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1613', '2016-05-09 14:02:53_up.jpg', '1462773771273.jpg', 'jpg', '/1462773771273.jpg', 'Y', null, '1', '2016-05-09 14:02:51', '1', '2016-05-09 14:02:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1614', '20160508221349017.jpg', '1462773781640.jpg', 'jpg', '/1462773781640.jpg', 'Y', null, '1', '2016-05-09 14:03:02', '1', '2016-05-09 14:03:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1615', '20160509095121166.jpg', '1462773790978.jpg', 'jpg', '/1462773790978.jpg', 'Y', null, '1', '2016-05-09 14:03:11', '1', '2016-05-09 14:03:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1616', '2016-05-09 14:05:30_up.jpg', '1462773928316.jpg', 'jpg', '/1462773928316.jpg', 'Y', null, '1', '2016-05-09 14:05:28', '1', '2016-05-09 14:05:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1617', '2016-05-09 14:06:54_up.jpg', '1462774011960.jpg', 'jpg', '/1462774011960.jpg', 'Y', null, '1', '2016-05-09 14:06:52', '1', '2016-05-09 14:06:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1618', '20160509095121166.jpg', '1462774020477.jpg', 'jpg', '/1462774020477.jpg', 'Y', null, '1', '2016-05-09 14:07:00', '1', '2016-05-09 14:07:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1619', '2016-05-09 14:07:40_up.jpg', '1462774058472.jpg', 'jpg', '/1462774058472.jpg', 'Y', null, '1', '2016-05-09 14:07:38', '1', '2016-05-09 14:07:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1620', '2016-05-09 14:13:35_up.jpg', '1462774412964.jpg', 'jpg', '/1462774412964.jpg', 'Y', null, '1', '2016-05-09 14:13:33', '1', '2016-05-09 14:13:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1621', '2016-05-09_up.jpg', '1462774419737.jpg', 'jpg', '/1462774419737.jpg', 'Y', null, '1', '2016-05-09 14:13:40', '1', '2016-05-09 14:13:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1622', '2016-05-09 14:15:44_up.jpg', '1462774541721.jpg', 'jpg', '/1462774541721.jpg', 'Y', null, '1', '2016-05-09 14:15:42', '1', '2016-05-09 14:15:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1623', '2016-05-09 14:16:01_up.jpg', '1462774558626.jpg', 'jpg', '/1462774558626.jpg', 'Y', null, '1', '2016-05-09 14:15:59', '1', '2016-05-09 14:15:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1624', '2016-05-09 14:21:34_up.jpg', '1462774893422.jpg', 'jpg', '/1462774893422.jpg', 'Y', null, '1', '2016-05-09 14:21:33', '1', '2016-05-09 14:21:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1625', '2016-05-09_up.jpg', '1462774900218.jpg', 'jpg', '/1462774900218.jpg', 'Y', null, '1', '2016-05-09 14:21:40', '1', '2016-05-09 14:21:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1626', '20160509095121166.jpg', '1462774910081.jpg', 'jpg', '/1462774910081.jpg', 'Y', null, '1', '2016-05-09 14:21:50', '1', '2016-05-09 14:21:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1627', 'cisRecorder.mp4', '1462774917153.mp4', 'mp4', '/1462774917153.mp4', 'Y', null, '1', '2016-05-09 14:21:57', '1', '2016-05-09 14:21:57', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1628', '2016-05-09 14:22:08_up.jpg', '1462774926188.jpg', 'jpg', '/1462774926188.jpg', 'Y', null, '1', '2016-05-09 14:22:06', '1', '2016-05-09 14:22:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1629', 'VID_20160509_142219.mp4', '1462774951241.mp4', 'mp4', '/1462774951241.mp4', 'Y', null, '1', '2016-05-09 14:22:31', '1', '2016-05-09 14:22:31', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1630', 'cisRecorder.mp4', '1462775016563.mp4', 'mp4', '/1462775016563.mp4', 'N', null, '1', '2016-05-09 14:23:37', '1', '2016-05-09 14:23:37', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1631', '2016-05-09 14:23:46_up.jpg', '1462775024552.jpg', 'jpg', '/1462775024552.jpg', 'N', null, '1', '2016-05-09 14:23:45', '1', '2016-05-09 14:23:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1632', '2016-05-09_up.jpg', '1462775032468.jpg', 'jpg', '/1462775032468.jpg', 'N', null, '1', '2016-05-09 14:23:52', '1', '2016-05-09 14:23:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1633', 'VID_20160509_142425.mp4', '1462775068372.mp4', 'mp4', '/1462775068372.mp4', 'N', null, '1', '2016-05-09 14:24:28', '1', '2016-05-09 14:24:28', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1634', '2016-05-09 14:24:39_up.jpg', '1462775076853.jpg', 'jpg', '/1462775076853.jpg', 'N', null, '1', '2016-05-09 14:24:37', '1', '2016-05-09 14:24:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1635', '2016-05-09 15:15:31_up.jpg', '1462778129549.jpg', 'jpg', '/1462778129549.jpg', 'Y', null, '1', '2016-05-09 15:15:30', '1', '2016-05-09 15:15:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1636', '2016-05-09_up.jpg', '1462778135071.jpg', 'jpg', '/1462778135071.jpg', 'Y', null, '1', '2016-05-09 15:15:35', '1', '2016-05-09 15:15:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1637', '20160509095121166.jpg', '1462778141520.jpg', 'jpg', '/1462778141520.jpg', 'Y', null, '1', '2016-05-09 15:15:42', '1', '2016-05-09 15:15:42', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1638', 'VID_20160509_151552.mp4', '1462778158181.mp4', 'mp4', '/1462778158181.mp4', 'Y', null, '1', '2016-05-09 15:15:58', '1', '2016-05-09 15:15:58', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1639', '2016-05-08_up.jpg', '1462778181883.jpg', 'jpg', '/1462778181883.jpg', 'Y', null, '1', '2016-05-09 15:16:22', '1', '2016-05-09 15:16:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1640', '20160508202925645.jpg', '1462778194702.jpg', 'jpg', '/1462778194702.jpg', 'Y', null, '1', '2016-05-09 15:16:35', '1', '2016-05-09 15:16:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1641', 'cisRecorder.mp4', '1462778203540.mp4', 'mp4', '/1462778203540.mp4', 'Y', null, '1', '2016-05-09 15:16:44', '1', '2016-05-09 15:16:44', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1642', '1462674661489.jpg', '1462778212313.jpg', 'jpg', '/1462778212313.jpg', 'Y', null, '1', '2016-05-09 15:16:52', '1', '2016-05-09 15:16:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1643', '2016-05-09 15:39:40_up.jpg', '1462779577816.jpg', 'jpg', '/1462779577816.jpg', 'Y', null, '1', '2016-05-09 15:39:38', '1', '2016-05-09 15:39:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1644', 'cisRecorder.mp4', '1462779584352.mp4', 'mp4', '/1462779584352.mp4', 'Y', null, '1', '2016-05-09 15:39:44', '1', '2016-05-09 15:39:44', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1645', 'VID_20160509_153957.mp4', '1462779602610.mp4', 'mp4', '/1462779602610.mp4', 'Y', null, '1', '2016-05-09 15:40:03', '1', '2016-05-09 15:40:03', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1646', '2016-05-09 15:40:15_up.jpg', '1462779612921.jpg', 'jpg', '/1462779612921.jpg', 'Y', null, '1', '2016-05-09 15:40:13', '1', '2016-05-09 15:40:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1647', '2016-05-09 15:45:53_up.jpg', '1462779940924.jpg', 'jpg', '/1462779940924.jpg', 'Y', null, '1', '2016-05-09 15:45:41', '1', '2016-05-09 15:45:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1648', 'cisRecorder.mp4', '1462779946729.mp4', 'mp4', '/1462779946729.mp4', 'Y', null, '1', '2016-05-09 15:45:47', '1', '2016-05-09 15:45:47', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1649', 'VID_20160509_154607.mp4', '1462779960859.mp4', 'mp4', '/1462779960859.mp4', 'Y', null, '1', '2016-05-09 15:46:01', '1', '2016-05-09 15:46:01', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1650', '2016-05-09 15:51:26_up.jpg', '1462780274493.jpg', 'jpg', '/1462780274493.jpg', 'Y', null, '1', '2016-05-09 15:51:14', '1', '2016-05-09 15:51:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1651', 'cisRecorder.mp4', '1462780281244.mp4', 'mp4', '/1462780281244.mp4', 'Y', null, '1', '2016-05-09 15:51:21', '1', '2016-05-09 15:51:21', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1652', 'cisRecorder.mp4', '1462780288580.mp4', 'mp4', '/1462780288580.mp4', 'Y', null, '1', '2016-05-09 15:51:29', '1', '2016-05-09 15:51:29', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1653', 'VID_20160509_155153.mp4', '1462780307734.mp4', 'mp4', '/1462780307734.mp4', 'Y', null, '1', '2016-05-09 15:51:48', '1', '2016-05-09 15:51:48', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1654', '2016-05-09 15:52:08_up.jpg', '1462780318212.jpg', 'jpg', '/1462780318212.jpg', 'Y', null, '1', '2016-05-09 15:51:58', '1', '2016-05-09 15:51:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1655', '2016-05-09 15:52:22_up.jpg', '1462780330267.jpg', 'jpg', '/1462780330267.jpg', 'Y', null, '1', '2016-05-09 15:52:10', '1', '2016-05-09 15:52:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1656', '20160509095121166.jpg', '1462780337714.jpg', 'jpg', '/1462780337714.jpg', 'Y', null, '1', '2016-05-09 15:52:18', '1', '2016-05-09 15:52:18', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1657', '2016-05-08_up.jpg', '1462780345573.jpg', 'jpg', '/1462780345573.jpg', 'Y', null, '1', '2016-05-09 15:52:26', '1', '2016-05-09 15:52:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1658', '2016-05-09 15:52:49_up.jpg', '1462780357539.jpg', 'jpg', '/1462780357539.jpg', 'Y', null, '1', '2016-05-09 15:52:38', '1', '2016-05-09 15:52:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1659', '2016-05-09 15:52:59_up.jpg', '1462780367004.jpg', 'jpg', '/1462780367004.jpg', 'Y', null, '1', '2016-05-09 15:52:47', '1', '2016-05-09 15:52:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1660', '2016-05-09 15:53:10_up.jpg', '1462780378247.jpg', 'jpg', '/1462780378247.jpg', 'Y', null, '1', '2016-05-09 15:52:58', '1', '2016-05-09 15:52:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1661', '2016-05-09 15:53:24_up.jpg', '1462780392268.jpg', 'jpg', '/1462780392268.jpg', 'Y', null, '1', '2016-05-09 15:53:12', '1', '2016-05-09 15:53:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1662', '1462674661489.jpg', '1462780403937.jpg', 'jpg', '/1462780403937.jpg', 'Y', null, '1', '2016-05-09 15:53:24', '1', '2016-05-09 15:53:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1663', 'cisRecorder.mp4', '1462780416016.mp4', 'mp4', '/1462780416016.mp4', 'Y', null, '1', '2016-05-09 15:53:36', '1', '2016-05-09 15:53:36', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1664', '2016-05-09 16:03:59_up.jpg', '1462781027267.jpg', 'jpg', '/1462781027267.jpg', 'Y', null, '1', '2016-05-09 16:03:47', '1', '2016-05-09 16:03:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1665', 'VID_20160509_161300.mp4', '1462781571210.mp4', 'mp4', '/1462781571210.mp4', 'Y', null, '1', '2016-05-09 16:12:51', '1', '2016-05-09 16:12:51', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1666', '20160509095121166.jpg', '1462781580339.jpg', 'jpg', '/1462781580339.jpg', 'Y', null, '1', '2016-05-09 16:13:00', '1', '2016-05-09 16:13:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1667', 'gdgxwl-cis-2016-5-9.1.0.1.apk', '1462784420986.apk', 'apk', '/ClientVersionFile/1462784420986.apk', 'Y', null, '1', '2016-05-09 17:00:21', '1', '2016-05-09 17:00:21', 'application/octet-stream');
INSERT INTO `gxwl_sys_doc` VALUES ('1668', 'gdgxwl-cis-2016-5-9.1.0.1.apk', '1462784477442.apk', 'apk', '/ClientVersionFile/1462784477442.apk', 'N', null, '1', '2016-05-09 17:01:17', '1', '2016-05-09 17:01:17', 'application/octet-stream');
INSERT INTO `gxwl_sys_doc` VALUES ('1669', 'Asher Book - Here With You.mp3', '1462787301070.mp3', 'mp3', '/1462787301070.mp3', 'N', null, '1', '2016-05-09 17:48:21', '1', '2016-05-09 17:48:21', 'audio/mp3');
INSERT INTO `gxwl_sys_doc` VALUES ('1670', '2016-05-09 16:03:59_up.jpg', '1462865026564.jpg', 'jpg', '/1462865026564.jpg', 'Y', null, '1', '2016-05-10 15:23:47', '1', '2016-05-10 15:23:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1671', 'VID_20160510_152408.mp4', '1462865040144.mp4', 'mp4', '/1462865040144.mp4', 'Y', null, '1', '2016-05-10 15:24:00', '1', '2016-05-10 15:24:00', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1672', '2016-05-09 16:03:59_up.jpg', '1462868865919.jpg', 'jpg', '/1462868865919.jpg', 'Y', null, '1', '2016-05-10 16:27:46', '1', '2016-05-10 16:27:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1673', '2016-05-09 15:53:10_up.jpg', '1462869519749.jpg', 'jpg', '/1462869519749.jpg', 'Y', null, '1', '2016-05-10 16:38:40', '1', '2016-05-10 16:38:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1674', '2016-05-09 16:03:59_up.jpg', '1462869675847.jpg', 'jpg', '/1462869675847.jpg', 'Y', null, '1', '2016-05-10 16:41:16', '1', '2016-05-10 16:41:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1675', '2016-05-09 15:53:24_up.jpg', '1462869837116.jpg', 'jpg', '/1462869837116.jpg', 'Y', null, '1', '2016-05-10 16:43:57', '1', '2016-05-10 16:43:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1676', '2016-05-09 16:03:59_up.jpg', '1462869997398.jpg', 'jpg', '/1462869997398.jpg', 'Y', null, '1', '2016-05-10 16:46:37', '1', '2016-05-10 16:46:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1677', '2016-05-09 16:03:59_up.jpg', '1462870055014.jpg', 'jpg', '/1462870055014.jpg', 'Y', null, '1', '2016-05-10 16:47:35', '1', '2016-05-10 16:47:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1678', '2016-05-09 16:03:59_up.jpg', '1462870249973.jpg', 'jpg', '/1462870249973.jpg', 'Y', null, '1', '2016-05-10 16:50:50', '1', '2016-05-10 16:50:50', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1679', '2016-05-10 16:51:46_up.jpg', '1462870291632.jpg', 'jpg', '/1462870291632.jpg', 'Y', null, '1', '2016-05-10 16:51:32', '1', '2016-05-10 16:51:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1680', 'VID_20160510_170244.mp4', '1462870960224.mp4', 'mp4', '/1462870960224.mp4', 'Y', null, '1', '2016-05-10 17:02:40', '1', '2016-05-10 17:02:40', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1681', '292377.jpg', '1462929752310.jpg', 'jpg', '/knowledge/1462929752310.jpg', 'N', null, '1', '2016-05-11 09:22:32', '1', '2016-05-11 09:22:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1682', 'cisRecorder.mp4', '1462952681177.mp4', 'mp4', '/1462952681177.mp4', 'Y', null, '1', '2016-05-11 15:44:41', '1', '2016-05-11 15:44:41', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1683', 'progress-light.png', '1462952697458.png', 'png', '/1462952697458.png', 'Y', null, '1', '2016-05-11 15:44:57', '1', '2016-05-11 15:44:57', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1684', 'coupon-limit-time.png', '1462952727636.png', 'png', '/1462952727636.png', 'Y', null, '1', '2016-05-11 15:45:28', '1', '2016-05-11 15:45:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1685', '??.jpg', '1462952885910.jpg', 'jpg', '/1462952885910.jpg', 'Y', null, '1', '2016-05-11 15:48:06', '1', '2016-05-11 15:48:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1686', '??.jpg', '1462953180370.jpg', 'jpg', '/1462953180370.jpg', 'Y', null, '1', '2016-05-11 15:53:00', '1', '2016-05-11 15:53:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1687', '??.jpg', '1462953464572.jpg', 'jpg', '/1462953464572.jpg', 'Y', null, '1', '2016-05-11 15:57:45', '1', '2016-05-11 15:57:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1688', '2016-05-11_up.jpg', '1462953697610.jpg', 'jpg', '/1462953697610.jpg', 'Y', null, '1', '2016-05-11 16:01:38', '1', '2016-05-11 16:01:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1689', '2016-05-11_up.jpg', '1462953793641.jpg', 'jpg', '/1462953793641.jpg', 'Y', null, '1', '2016-05-11 16:03:14', '1', '2016-05-11 16:03:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1690', '2016-05-11_up.jpg', '1462954060634.jpg', 'jpg', '/1462954060634.jpg', 'Y', null, '1', '2016-05-11 16:07:41', '1', '2016-05-11 16:07:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1691', 'coupon-limit-time.png', '1462954244942.png', 'png', '/1462954244942.png', 'Y', null, '1', '2016-05-11 16:10:45', '1', '2016-05-11 16:10:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1692', 'coupon-limit-time.png', '1462954726729.png', 'png', '/1462954726729.png', 'N', null, '1', '2016-05-11 16:18:47', '1', '2016-05-11 16:18:47', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1693', '2016-05-11_up.jpg', '1462954788012.jpg', 'jpg', '/1462954788012.jpg', 'N', null, '1', '2016-05-11 16:19:48', '1', '2016-05-11 16:19:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1694', '??.jpg', '1462954822620.jpg', 'jpg', '/1462954822620.jpg', 'N', null, '1', '2016-05-11 16:20:23', '1', '2016-05-11 16:20:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1695', '2016-05-11_up.jpg', '1462955112453.jpg', 'jpg', '/1462955112453.jpg', 'N', null, '1', '2016-05-11 16:25:12', '1', '2016-05-11 16:25:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1696', '2016-05-11_up.jpg', '1462955337904.jpg', 'jpg', '/1462955337904.jpg', 'N', null, '1', '2016-05-11 16:28:58', '1', '2016-05-11 16:28:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1697', '??.jpg', '1462955672919.jpg', 'jpg', '/1462955672919.jpg', 'N', null, '1', '2016-05-11 16:34:33', '1', '2016-05-11 16:34:33', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1698', '2016-05-11_up.jpg', '1462955685752.jpg', 'jpg', '/1462955685752.jpg', 'N', null, '1', '2016-05-11 16:34:46', '1', '2016-05-11 16:34:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1699', '2016-05-11_up.jpg', '1462955700843.jpg', 'jpg', '/1462955700843.jpg', 'N', null, '1', '2016-05-11 16:35:01', '1', '2016-05-11 16:35:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1700', '??.jpg', '1462956253341.jpg', 'jpg', '/1462956253341.jpg', 'N', null, '1', '2016-05-11 16:44:13', '1', '2016-05-11 16:44:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1701', '??.jpg', '1462959124840.jpg', 'jpg', '/1462959124840.jpg', 'Y', null, '1', '2016-05-11 17:32:05', '1', '2016-05-11 17:32:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1702', 'VID_20160511_173216.mp4', '1462959148513.mp4', 'mp4', '/1462959148513.mp4', 'Y', null, '1', '2016-05-11 17:32:29', '1', '2016-05-11 17:32:29', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1703', 'VID_20160511_175102.mp4', '1462960269168.mp4', 'mp4', '/1462960269168.mp4', 'Y', null, '1', '2016-05-11 17:51:09', '1', '2016-05-11 17:51:09', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1704', 'VID_20160512_102700.mp4', '1463020030748.mp4', 'mp4', '/1463020030748.mp4', 'Y', null, '1', '2016-05-12 10:27:11', '1', '2016-05-12 10:27:11', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1705', '??.jpg', '1463035879027.jpg', 'jpg', '/1463035879027.jpg', 'Y', null, '1', '2016-05-12 14:51:19', '1', '2016-05-12 14:51:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1706', '??.jpg', '1463036727515.jpg', 'jpg', '/1463036727515.jpg', 'Y', null, '1', '2016-05-12 15:05:28', '1', '2016-05-12 15:05:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1707', '292377.jpg', '1463102654139.jpg', 'jpg', '/photos/1463102654139.jpg', 'Y', null, '1', '2016-05-13 09:24:14', '1', '2016-05-13 09:24:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1708', '292377.jpg', '1463102741047.jpg', 'jpg', '/photos/1463102741047.jpg', 'Y', null, '1', '2016-05-13 09:25:41', '1', '2016-05-13 09:25:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1709', '292377.jpg', '1463102766748.jpg', 'jpg', '/photos/1463102766748.jpg', 'Y', null, '1', '2016-05-13 09:26:07', '1', '2016-05-13 09:26:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1710', '292377.jpg', '1463102909570.jpg', 'jpg', '/photos/1463102909570.jpg', 'N', null, '1', '2016-05-13 09:28:30', '1', '2016-05-13 09:28:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1711', '1-1511091256290-L.jpg', '1463103031559.jpg', 'jpg', '/photos/1463103031559.jpg', 'Y', null, '1', '2016-05-13 09:30:32', '1', '2016-05-13 09:30:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1712', 'QQ图片20160408132526.jpg', '1463125713971.jpg', 'jpg', '/1463125713971.jpg', 'N', null, '1', '2016-05-13 15:48:34', '1', '2016-05-13 15:48:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1713', 'QQ图片20160408132526.jpg', '1463188678286.jpg', 'jpg', '/1463188678286.jpg', 'N', null, '1', '2016-05-14 09:17:58', '1', '2016-05-14 09:17:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1714', '291739323217867.png', '1463381191016.png', 'png', '/1463381191016.png', 'Y', null, '121', '2016-05-16 14:46:31', '121', '2016-05-16 14:46:31', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1715', '考核督办工作台.docx', '1463447160475.docx', 'docx', '/partyRegime/1463447160475.docx', 'Y', null, '1', '2016-05-17 09:06:00', '1', '2016-05-17 09:06:00', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
INSERT INTO `gxwl_sys_doc` VALUES ('1716', '考核督办工作台.docx', '1463447631026.docx', 'docx', '/partyRegime/1463447631026.docx', 'Y', null, '1', '2016-05-17 09:13:51', '1', '2016-05-17 09:13:51', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
INSERT INTO `gxwl_sys_doc` VALUES ('1722', '积分明细.txt', '1463449919001.txt', 'txt', '/partyRegime/1463449919001.txt', 'N', null, '1', '2016-05-17 09:51:59', '1', '2016-05-17 09:51:59', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1723', '工程参考网站.txt', '1463450010763.txt', 'txt', '/partyRegime/1463450010763.txt', 'N', null, '1', '2016-05-17 09:53:31', '1', '2016-05-17 09:53:31', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1724', '郭华文个人周报及计划16.05.09-05.14.doc', '1463471966365.doc', 'doc', '/partyRegime/1463471966365.doc', 'N', null, '1', '2016-05-17 15:59:26', '1', '2016-05-17 15:59:26', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1725', '郭华文个人周报及计划16.05.09-05.14.doc', '1463472417832.doc', 'doc', '/partyRegime/1463472417832.doc', 'N', null, '1', '2016-05-17 16:06:58', '1', '2016-05-17 16:06:58', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1726', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463472760302.jpg', 'jpg', '/1463472760302.jpg', 'Y', null, '1', '2016-05-17 16:12:40', '1', '2016-05-17 16:12:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1727', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463472815972.jpg', 'jpg', '/1463472815972.jpg', 'Y', null, '1', '2016-05-17 16:13:36', '1', '2016-05-17 16:13:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1728', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1463473472185.jpg', 'jpg', '/1463473472185.jpg', 'Y', null, '1', '2016-05-17 16:24:32', '1', '2016-05-17 16:24:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1729', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463473737639.jpg', 'jpg', '/1463473737639.jpg', 'Y', null, '1', '2016-05-17 16:28:58', '1', '2016-05-17 16:28:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1730', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463473813672.jpg', 'jpg', '/1463473813672.jpg', 'Y', null, '1', '2016-05-17 16:30:14', '1', '2016-05-17 16:30:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1731', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463474272830.jpg', 'jpg', '/1463474272830.jpg', 'Y', null, '1', '2016-05-17 16:37:53', '1', '2016-05-17 16:37:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1732', '工程参考网站.txt', '1463474586561.txt', 'txt', '/partyRegime/1463474586561.txt', 'N', null, '1', '2016-05-17 16:43:07', '1', '2016-05-17 16:43:07', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1733', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463474872032.jpg', 'jpg', '/1463474872032.jpg', 'Y', null, '1', '2016-05-17 16:47:52', '1', '2016-05-17 16:47:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1734', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475062322.jpg', 'jpg', '/1463475062322.jpg', 'Y', null, '1', '2016-05-17 16:51:02', '1', '2016-05-17 16:51:02', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1735', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475189991.jpg', 'jpg', '/1463475189991.jpg', 'Y', null, '1', '2016-05-17 16:53:10', '1', '2016-05-17 16:53:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1736', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1463475260962.jpg', 'jpg', '/1463475260962.jpg', 'Y', null, '1', '2016-05-17 16:54:21', '1', '2016-05-17 16:54:21', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1737', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475334467.jpg', 'jpg', '/1463475334467.jpg', 'Y', null, '1', '2016-05-17 16:55:34', '1', '2016-05-17 16:55:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1738', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475493848.jpg', 'jpg', '/1463475493848.jpg', 'Y', null, '1', '2016-05-17 16:58:14', '1', '2016-05-17 16:58:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1739', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1463475726802.jpg', 'jpg', '/1463475726802.jpg', 'Y', null, '1', '2016-05-17 17:02:07', '1', '2016-05-17 17:02:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1740', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475741279.jpg', 'jpg', '/1463475741279.jpg', 'Y', null, '1', '2016-05-17 17:02:21', '1', '2016-05-17 17:02:21', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1741', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475792422.jpg', 'jpg', '/1463475792422.jpg', 'Y', null, '1', '2016-05-17 17:03:12', '1', '2016-05-17 17:03:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1742', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475812312.jpg', 'jpg', '/1463475812312.jpg', 'Y', null, '1', '2016-05-17 17:03:32', '1', '2016-05-17 17:03:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1743', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475893246.jpg', 'jpg', '/1463475893246.jpg', 'Y', null, '1', '2016-05-17 17:04:53', '1', '2016-05-17 17:04:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1744', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463475949229.jpg', 'jpg', '/1463475949229.jpg', 'Y', null, '1', '2016-05-17 17:05:49', '1', '2016-05-17 17:05:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1745', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463476176352.jpg', 'jpg', '/1463476176352.jpg', 'Y', null, '1', '2016-05-17 17:09:36', '1', '2016-05-17 17:09:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1746', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463476196628.jpg', 'jpg', '/1463476196628.jpg', 'Y', null, '1', '2016-05-17 17:09:57', '1', '2016-05-17 17:09:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1747', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463476265045.jpg', 'jpg', '/1463476265045.jpg', 'Y', null, '1', '2016-05-17 17:11:05', '1', '2016-05-17 17:11:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1748', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463476438910.jpg', 'jpg', '/1463476438910.jpg', 'Y', null, '1', '2016-05-17 17:13:59', '1', '2016-05-17 17:13:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1749', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1463476656857.jpg', 'jpg', '/1463476656857.jpg', 'Y', null, '1', '2016-05-17 17:17:37', '1', '2016-05-17 17:17:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1750', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463476690203.jpg', 'jpg', '/1463476690203.jpg', 'Y', null, '1', '2016-05-17 17:18:10', '1', '2016-05-17 17:18:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1751', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463476743397.jpg', 'jpg', '/1463476743397.jpg', 'Y', null, '1', '2016-05-17 17:19:03', '1', '2016-05-17 17:19:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1752', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463476935461.jpg', 'jpg', '/1463476935461.jpg', 'Y', null, '1', '2016-05-17 17:22:15', '1', '2016-05-17 17:22:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1753', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463477023971.jpg', 'jpg', '/1463477023971.jpg', 'Y', null, '1', '2016-05-17 17:23:44', '1', '2016-05-17 17:23:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1754', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463477046480.jpg', 'jpg', '/1463477046480.jpg', 'Y', null, '1', '2016-05-17 17:24:06', '1', '2016-05-17 17:24:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1755', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463477225271.jpg', 'jpg', '/1463477225271.jpg', 'Y', null, '1', '2016-05-17 17:27:05', '1', '2016-05-17 17:27:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1756', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463477429934.jpg', 'jpg', '/1463477429934.jpg', 'Y', null, '1', '2016-05-17 17:30:30', '1', '2016-05-17 17:30:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1757', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1463477434018.jpg', 'jpg', '/1463477434018.jpg', 'Y', null, '1', '2016-05-17 17:30:34', '1', '2016-05-17 17:30:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1758', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463477617678.jpg', 'jpg', '/1463477617678.jpg', 'Y', null, '1', '2016-05-17 17:33:38', '1', '2016-05-17 17:33:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1759', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463479725397.jpg', 'jpg', '/1463479725397.jpg', 'Y', null, '1', '2016-05-17 18:08:45', '1', '2016-05-17 18:08:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1760', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463479829726.jpg', 'jpg', '/1463479829726.jpg', 'Y', null, '1', '2016-05-17 18:10:30', '1', '2016-05-17 18:10:30', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1761', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463479902594.jpg', 'jpg', '/1463479902594.jpg', 'Y', null, '1', '2016-05-17 18:11:43', '1', '2016-05-17 18:11:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1762', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463535187860.jpg', 'jpg', '/1463535187860.jpg', 'Y', null, '1', '2016-05-18 09:33:08', '1', '2016-05-18 09:33:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1763', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463535224611.jpg', 'jpg', '/1463535224611.jpg', 'Y', null, '1', '2016-05-18 09:33:45', '1', '2016-05-18 09:33:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1764', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463535414583.jpg', 'jpg', '/1463535414583.jpg', 'Y', null, '1', '2016-05-18 09:36:55', '1', '2016-05-18 09:36:55', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1765', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1463538678634.jpg', 'jpg', '/1463538678634.jpg', 'Y', null, '1', '2016-05-18 10:31:19', '1', '2016-05-18 10:31:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1767', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463543769089.jpg', 'jpg', '/photos/1463543769089.jpg', 'Y', null, '1', '2016-05-18 11:56:09', '1', '2016-05-18 11:56:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1768', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463547873705.jpg', 'jpg', '/photos/1463547873705.jpg', 'Y', null, '1', '2016-05-18 13:04:34', '1', '2016-05-18 13:04:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1769', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1463547954088.jpg', 'jpg', '/1463547954088.jpg', 'Y', null, '1', '2016-05-18 13:05:54', '1', '2016-05-18 13:05:54', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1772', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1463549076817.jpg', 'jpg', '/photos/1463549076817.jpg', 'Y', null, '1', '2016-05-18 13:24:37', '1', '2016-05-18 13:24:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1773', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1463549428832.jpg', 'jpg', '/photos/1463549428832.jpg', 'Y', null, '1', '2016-05-18 13:30:29', '1', '2016-05-18 13:30:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1776', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463549678483.jpg', 'jpg', '/photos/1463549678483.jpg', 'N', null, '1', '2016-05-18 13:34:38', '1', '2016-05-18 13:34:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1777', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463549950775.jpg', 'jpg', '/photos/1463549950775.jpg', 'N', null, '1', '2016-05-18 13:39:11', '1', '2016-05-18 13:39:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1780', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1463551099605.jpg', 'jpg', '/photos/1463551099605.jpg', 'Y', null, '1', '2016-05-18 13:58:20', '1', '2016-05-18 13:58:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1782', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1463551557959.jpg', 'jpg', '/photos/1463551557959.jpg', 'Y', null, '1', '2016-05-18 14:05:58', '1', '2016-05-18 14:05:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1783', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463551600646.jpg', 'jpg', '/photos/1463551600646.jpg', 'Y', null, '1', '2016-05-18 14:06:41', '1', '2016-05-18 14:06:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1786', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463551890764.jpg', 'jpg', '/photos/1463551890764.jpg', 'Y', null, '1', '2016-05-18 14:11:31', '1', '2016-05-18 14:11:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1787', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463552147640.jpg', 'jpg', '/photos/1463552147640.jpg', 'Y', null, '1', '2016-05-18 14:15:48', '1', '2016-05-18 14:15:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1788', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463552319347.jpg', 'jpg', '/photos/1463552319347.jpg', 'N', null, '1', '2016-05-18 14:18:39', '1', '2016-05-18 14:18:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1789', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1463552459566.jpg', 'jpg', '/photos/1463552459566.jpg', 'N', null, '1', '2016-05-18 14:21:00', '1', '2016-05-18 14:21:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1790', '291739323217867.png', '1463552614394.png', 'png', '/1463552614394.png', 'Y', null, '121', '2016-05-18 14:23:34', '121', '2016-05-18 14:23:34', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1791', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463552720347.jpg', 'jpg', '/photos/1463552720347.jpg', 'Y', null, '1', '2016-05-18 14:25:20', '1', '2016-05-18 14:25:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1794', 'VID_20160517_221632.mp4', '1463553405027.mp4', 'mp4', '/1463553405027.mp4', 'Y', null, '121', '2016-05-18 14:36:45', '121', '2016-05-18 14:36:45', 'video/mp4');
INSERT INTO `gxwl_sys_doc` VALUES ('1796', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463553627766.jpg', 'jpg', '/photos/1463553627766.jpg', 'Y', null, '1', '2016-05-18 14:40:28', '1', '2016-05-18 14:40:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1797', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463553697325.jpg', 'jpg', '/photos/1463553697325.jpg', 'Y', null, '1', '2016-05-18 14:41:37', '1', '2016-05-18 14:41:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1799', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463553891810.jpg', 'jpg', '/photos/1463553891810.jpg', 'N', null, '1', '2016-05-18 14:44:52', '1', '2016-05-18 14:44:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1801', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463555726351.jpg', 'jpg', '/photos/1463555726351.jpg', 'N', null, '1', '2016-05-18 15:15:26', '1', '2016-05-18 15:15:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1802', '291739323217867.png', '1463556031359.png', 'png', '/1463556031359.png', 'Y', null, '121', '2016-05-18 15:20:31', '121', '2016-05-18 15:20:31', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1804', '2016-05-17 23:38:58_up.jpg', '1463558345830.jpg', 'jpg', '/1463558345830.jpg', 'Y', null, '121', '2016-05-18 15:59:06', '121', '2016-05-18 15:59:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1805', '2016-05-17 23:39:22_up.jpg', '1463558370984.jpg', 'jpg', '/1463558370984.jpg', 'Y', null, '121', '2016-05-18 15:59:31', '121', '2016-05-18 15:59:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1807', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463564399420.jpg', 'jpg', '/photos/1463564399420.jpg', 'N', null, '1', '2016-05-18 17:39:59', '1', '2016-05-18 17:39:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1808', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1463564444587.jpg', 'jpg', '/photos/1463564444587.jpg', 'Y', null, '1', '2016-05-18 17:40:45', '1', '2016-05-18 17:40:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1809', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1463564483348.jpg', 'jpg', '/photos/1463564483348.jpg', 'Y', null, '1', '2016-05-18 17:41:23', '1', '2016-05-18 17:41:23', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1810', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1463564522683.jpg', 'jpg', '/photos/1463564522683.jpg', 'Y', null, '1', '2016-05-18 17:42:03', '1', '2016-05-18 17:42:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1811', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1463565759578.jpg', 'jpg', '/photos/1463565759578.jpg', 'Y', null, '1', '2016-05-18 18:02:40', '1', '2016-05-18 18:02:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1812', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463566305084.jpg', 'jpg', '/photos/1463566305084.jpg', 'N', null, '1', '2016-05-18 18:11:45', '1', '2016-05-18 18:11:45', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1813', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1463570105112.jpg', 'jpg', '/1463570105112.jpg', 'N', null, '1', '2016-05-18 19:15:05', '1', '2016-05-18 19:15:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1814', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1463570132017.jpg', 'jpg', '/1463570132017.jpg', 'N', null, '1', '2016-05-18 19:15:32', '1', '2016-05-18 19:15:32', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1815', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1463570152923.jpg', 'jpg', '/1463570152923.jpg', 'N', null, '1', '2016-05-18 19:15:53', '1', '2016-05-18 19:15:53', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1816', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463570226431.jpg', 'jpg', '/1463570226431.jpg', 'Y', null, '1', '2016-05-18 19:17:06', '1', '2016-05-18 19:17:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1817', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463570236974.jpg', 'jpg', '/1463570236974.jpg', 'N', null, '1', '2016-05-18 19:17:17', '1', '2016-05-18 19:17:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1818', '督查工作考核办法.doc', '1463576940560.doc', 'doc', '/photos/1463576940560.doc', 'Y', null, '1', '2016-05-18 21:09:01', '1', '2016-05-18 21:09:01', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1819', '工程参考网站.txt', '1463577086135.txt', 'txt', '/photos/1463577086135.txt', 'N', null, '1', '2016-05-18 21:11:26', '1', '2016-05-18 21:11:26', 'text/plain');
INSERT INTO `gxwl_sys_doc` VALUES ('1820', '夏广俊个人周报及计划16.05.02-05.08.doc', '1463644428671.doc', 'doc', '/vitae/1463644428671.doc', 'Y', null, '1', '2016-05-19 15:53:49', '1', '2016-05-19 15:53:49', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1821', '夏广俊个人周报及计划16.05.09-05.14.doc', '1463644495088.doc', 'doc', '/vitae/1463644495088.doc', 'Y', null, '1', '2016-05-19 15:54:55', '1', '2016-05-19 15:54:55', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1822', '夏广俊个人周报及计划16.05.09-05.14.doc', '1463644517334.doc', 'doc', '/vitae/1463644517334.doc', 'Y', null, '1', '2016-05-19 15:55:17', '1', '2016-05-19 15:55:17', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1823', '夏广俊个人周报及计划16.05.09-05.14.doc', '1463646227502.doc', 'doc', '/vitae/1463646227502.doc', 'N', null, '1', '2016-05-19 16:23:48', '1', '2016-05-19 16:23:48', 'application/msword');
INSERT INTO `gxwl_sys_doc` VALUES ('1824', '八九八创新工厂 - 解决方案.docx', '1463648110515.docx', 'docx', '/vitae/1463648110515.docx', 'N', null, '1', '2016-05-19 16:55:11', '1', '2016-05-19 16:55:11', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
INSERT INTO `gxwl_sys_doc` VALUES ('1825', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1463725023771.jpg', 'jpg', '/photos/1463725023771.jpg', 'N', null, '1', '2016-05-20 14:17:04', '1', '2016-05-20 14:17:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1826', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463725246293.jpg', 'jpg', '/1463725246293.jpg', 'N', null, '1', '2016-05-20 14:20:46', '1', '2016-05-20 14:20:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1827', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1463725364261.jpg', 'jpg', '/1463725364261.jpg', 'N', null, '1', '2016-05-20 14:22:44', '1', '2016-05-20 14:22:44', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1828', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1463725407640.jpg', 'jpg', '/1463725407640.jpg', 'N', null, '1', '2016-05-20 14:23:28', '1', '2016-05-20 14:23:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1829', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1463811853551.jpg', 'jpg', '/photos/1463811853551.jpg', 'N', null, '1', '2016-05-21 14:24:14', '1', '2016-05-21 14:24:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1830', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464078964261.jpg', 'jpg', '/1464078964261.jpg', 'N', null, '1', '2016-05-24 16:36:04', '1', '2016-05-24 16:36:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1831', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464138861722.jpg', 'jpg', '/1464138861722.jpg', 'Y', null, '1', '2016-05-25 09:14:22', '1', '2016-05-25 09:14:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1832', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1464138971438.jpg', 'jpg', '/1464138971438.jpg', 'Y', null, '1', '2016-05-25 09:16:11', '1', '2016-05-25 09:16:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1833', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464139134853.jpg', 'jpg', '/1464139134853.jpg', 'Y', null, '1', '2016-05-25 09:18:55', '1', '2016-05-25 09:18:55', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1834', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1464139475584.jpg', 'jpg', '/1464139475584.jpg', 'Y', null, '1', '2016-05-25 09:24:36', '1', '2016-05-25 09:24:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1835', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464141978848.jpg', 'jpg', '/1464141978848.jpg', 'Y', null, '1', '2016-05-25 10:06:19', '1', '2016-05-25 10:06:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1836', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1464144719725.jpg', 'jpg', '/1464144719725.jpg', 'Y', null, '1', '2016-05-25 10:52:00', '1', '2016-05-25 10:52:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1837', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1464147119478.jpg', 'jpg', '/1464147119478.jpg', 'N', null, '1', '2016-05-25 11:31:59', '1', '2016-05-25 11:31:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1838', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464147608152.jpg', 'jpg', '/1464147608152.jpg', 'N', null, '1', '2016-05-25 11:40:08', '1', '2016-05-25 11:40:08', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1839', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1464147676228.jpg', 'jpg', '/1464147676228.jpg', 'Y', null, '1', '2016-05-25 11:41:16', '1', '2016-05-25 11:41:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1840', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1464147695812.jpg', 'jpg', '/1464147695812.jpg', 'N', null, '1', '2016-05-25 11:41:36', '1', '2016-05-25 11:41:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1841', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1464148025533.jpg', 'jpg', '/1464148025533.jpg', 'Y', null, '1', '2016-05-25 11:47:06', '1', '2016-05-25 11:47:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1842', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1464148071239.jpg', 'jpg', '/1464148071239.jpg', 'Y', null, '1', '2016-05-25 11:47:51', '1', '2016-05-25 11:47:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1843', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1464148087270.jpg', 'jpg', '/1464148087270.jpg', 'Y', null, '1', '2016-05-25 11:48:07', '1', '2016-05-25 11:48:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1844', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1464148164299.jpg', 'jpg', '/1464148164299.jpg', 'Y', null, '1', '2016-05-25 11:49:24', '1', '2016-05-25 11:49:24', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1845', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1464148268673.jpg', 'jpg', '/1464148268673.jpg', 'Y', null, '1', '2016-05-25 11:51:09', '1', '2016-05-25 11:51:09', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1846', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464153319499.jpg', 'jpg', '/1464153319499.jpg', 'N', null, '1', '2016-05-25 13:15:20', '1', '2016-05-25 13:15:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1847', 'QQ图片20160408132526.jpg', '1464153640978.jpg', 'jpg', '/1464153640978.jpg', 'N', null, '1', '2016-05-25 13:20:41', '1', '2016-05-25 13:20:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1848', '马544.jpg', '1464155703531.jpg', 'jpg', '/1464155703531.jpg', 'Y', null, '1', '2016-05-25 13:55:04', '1', '2016-05-25 13:55:04', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1849', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464156146037.jpg', 'jpg', '/1464156146037.jpg', 'N', null, '1', '2016-05-25 14:02:26', '1', '2016-05-25 14:02:26', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1850', 'u=1608624642,1729855536&fm=11&gp=0.jpg', '1464156161212.jpg', 'jpg', '/1464156161212.jpg', 'Y', null, '1', '2016-05-25 14:02:41', '1', '2016-05-25 14:02:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1851', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464156276099.jpg', 'jpg', '/1464156276099.jpg', 'N', null, '1', '2016-05-25 14:04:36', '1', '2016-05-25 14:04:36', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1852', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1464156442264.jpg', 'jpg', '/1464156442264.jpg', 'Y', null, '1', '2016-05-25 14:07:22', '1', '2016-05-25 14:07:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1853', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1464157378781.jpg', 'jpg', '/1464157378781.jpg', 'Y', null, '1', '2016-05-25 14:22:59', '1', '2016-05-25 14:22:59', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1854', 'u=1188909027,3465994956&fm=21&gp=0.jpg', '1464157719774.jpg', 'jpg', '/1464157719774.jpg', 'N', null, '1', '2016-05-25 14:28:40', '1', '2016-05-25 14:28:40', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1855', 'u=27937615,2913035577&fm=21&gp=0.jpg', '1464157759663.jpg', 'jpg', '/1464157759663.jpg', 'N', null, '1', '2016-05-25 14:29:20', '1', '2016-05-25 14:29:20', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1858', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1464255075395.jpg', 'jpg', '/photos/1464255075395.jpg', 'N', null, '1', '2016-05-26 17:31:15', '1', '2016-05-26 17:31:15', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1859', 'QQ图片20160526165837.png', '1464615411798.png', 'png', '/photos/1464615411798.png', 'Y', null, '1', '2016-05-30 21:36:52', '1', '2016-05-30 21:36:52', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1860', 'QQ图片20160526165837.png', '1464615436737.png', 'png', '/photos/1464615436737.png', 'Y', null, '1', '2016-05-30 21:37:17', '1', '2016-05-30 21:37:17', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1861', 'QQ图片20160509133650.png', '1464615452279.png', 'png', '/photos/1464615452279.png', 'Y', null, '1', '2016-05-30 21:37:32', '1', '2016-05-30 21:37:32', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1862', 'QQ图片20160526165837.png', '1464615465297.png', 'png', '/photos/1464615465297.png', 'Y', null, '1', '2016-05-30 21:37:45', '1', '2016-05-30 21:37:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1863', 'QQ图片20160526165837.png', '1464615553393.png', 'png', '/newsImg/1464615553393.png', 'Y', null, '1', '2016-05-30 21:39:13', '1', '2016-05-30 21:39:13', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1864', 'QQ图片20160526165837.png', '1464615587145.png', 'png', '/newsImg/1464615587145.png', 'Y', null, '1', '2016-05-30 21:39:47', '1', '2016-05-30 21:39:47', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1865', 'QQ图片20160526165837.png', '1464615714614.png', 'png', '/newsImg/1464615714614.png', 'Y', null, '1', '2016-05-30 21:41:55', '1', '2016-05-30 21:41:55', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1866', 'QQ图片20160526165837.png', '1464615730884.png', 'png', '/newsImg/1464615730884.png', 'Y', null, '1', '2016-05-30 21:42:11', '1', '2016-05-30 21:42:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1867', 'QQ图片20160526165837.png', '1464615746208.png', 'png', '/newsImg/1464615746208.png', 'Y', null, '1', '2016-05-30 21:42:26', '1', '2016-05-30 21:42:26', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1868', 'QQ图片20160526165837.png', '1464615970147.png', 'png', '/newsImg/1464615970147.png', 'Y', null, '1', '2016-05-30 21:46:10', '1', '2016-05-30 21:46:10', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1869', 'QQ图片20160526165837.png', '1464616056676.png', 'png', '/newsImg/1464616056676.png', 'Y', null, '1', '2016-05-30 21:47:37', '1', '2016-05-30 21:47:37', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1870', 'QQ图片20160526165837.png', '1464616146079.png', 'png', '/newsImg/1464616146079.png', 'Y', null, '1', '2016-05-30 21:49:06', '1', '2016-05-30 21:49:06', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1871', 'QQ图片20160526165837.png', '1464657829872.png', 'png', '/newsImg/1464657829872.png', 'Y', null, '1', '2016-05-31 09:23:50', '1', '2016-05-31 09:23:50', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1872', 'QQ图片20160526165837.png', '1464657914620.png', 'png', '/newsImg/1464657914620.png', 'Y', null, '1', '2016-05-31 09:25:15', '1', '2016-05-31 09:25:15', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1873', 'QQ图片20160526165837.png', '1464657943133.png', 'png', '/newsImg/1464657943133.png', 'Y', null, '1', '2016-05-31 09:25:43', '1', '2016-05-31 09:25:43', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1874', 'QQ图片20160509133650.png', '1464657951420.png', 'png', '/newsImg/1464657951420.png', 'Y', null, '1', '2016-05-31 09:25:51', '1', '2016-05-31 09:25:51', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1875', 'QQ图片20160526165837.png', '1464657966264.png', 'png', '/newsImg/1464657966264.png', 'Y', null, '1', '2016-05-31 09:26:06', '1', '2016-05-31 09:26:06', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1876', 'QQ图片20160509133650.png', '1464658326499.png', 'png', '/newsImg/1464658326499.png', 'Y', null, '1', '2016-05-31 09:32:07', '1', '2016-05-31 09:32:07', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1877', 'QQ图片20160526165837.png', '1464658356508.png', 'png', '/newsImg/1464658356508.png', 'Y', null, '1', '2016-05-31 09:32:37', '1', '2016-05-31 09:32:37', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1878', 'QQ图片20160526165837.png', '1464658383143.png', 'png', '/newsImg/1464658383143.png', 'Y', null, '1', '2016-05-31 09:33:03', '1', '2016-05-31 09:33:03', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1879', 'QQ图片20160526165837.png', '1464658433181.png', 'png', '/newsImg/1464658433181.png', 'Y', null, '1', '2016-05-31 09:33:53', '1', '2016-05-31 09:33:53', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1880', 'QQ图片20160509133650.png', '1464658546576.png', 'png', '/newsImg/1464658546576.png', 'Y', null, '1', '2016-05-31 09:35:47', '1', '2016-05-31 09:35:47', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1881', 'QQ图片20160526165837.png', '1464658613835.png', 'png', '/newsImg/1464658613835.png', 'Y', null, '1', '2016-05-31 09:36:54', '1', '2016-05-31 09:36:54', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1882', 'QQ图片20160526165837.png', '1464658666616.png', 'png', '/newsImg/1464658666616.png', 'Y', null, '1', '2016-05-31 09:37:47', '1', '2016-05-31 09:37:47', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1883', 'QQ图片20160526165837.png', '1464658934887.png', 'png', '/newsImg/1464658934887.png', 'Y', null, '1', '2016-05-31 09:42:15', '1', '2016-05-31 09:42:15', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1884', 'QQ图片20160509133650.png', '1464658952523.png', 'png', '/newsImg/1464658952523.png', 'Y', null, '1', '2016-05-31 09:42:33', '1', '2016-05-31 09:42:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1885', 'QQ图片20160509133650.png', '1464659063422.png', 'png', '/newsImg/1464659063422.png', 'Y', null, '1', '2016-05-31 09:44:23', '1', '2016-05-31 09:44:23', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1886', 'QQ图片20160526165837.png', '1464659170842.png', 'png', '/newsImg/1464659170842.png', 'Y', null, '1', '2016-05-31 09:46:11', '1', '2016-05-31 09:46:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1887', 'QQ图片20160509133650.png', '1464665504958.png', 'png', '/newsImg/1464665504958.png', 'Y', null, '1', '2016-05-31 11:31:45', '1', '2016-05-31 11:31:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1888', 'QQ图片20160509133650.png', '1464665510924.png', 'png', '/newsImg/1464665510924.png', 'Y', null, '1', '2016-05-31 11:31:51', '1', '2016-05-31 11:31:51', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1889', 'u=1095484601,1082307260&fm=21&gp=0.jpg', '1464672660168.jpg', 'jpg', '/photos/1464672660168.jpg', 'Y', null, '1', '2016-05-31 13:31:00', '1', '2016-05-31 13:31:00', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1890', 'QQ图片20160509133650.png', '1464674747163.png', 'png', '/newsImg/1464674747163.png', 'Y', null, '1', '2016-05-31 14:05:47', '1', '2016-05-31 14:05:47', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1891', 'QQ图片20160526165837.png', '1464677290623.png', 'png', '/newsImg/1464677290623.png', 'Y', null, '1', '2016-05-31 14:48:11', '1', '2016-05-31 14:48:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1892', 'QQ图片20160509133650.png', '1464677428123.png', 'png', '/newsImg/1464677428123.png', 'Y', null, '1', '2016-05-31 14:50:28', '1', '2016-05-31 14:50:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1893', 'QQ图片20160526165837.png', '1464677718849.png', 'png', '/newsImg/1464677718849.png', 'Y', null, '1', '2016-05-31 14:55:19', '1', '2016-05-31 14:55:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1894', 'QQ图片20160509133650.png', '1464680214019.png', 'png', '/newsImg/1464680214019.png', 'Y', null, '1', '2016-05-31 15:36:54', '1', '2016-05-31 15:36:54', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1895', 'QQ图片20160526165837.png', '1464680275877.png', 'png', '/newsImg/1464680275877.png', 'N', null, '1', '2016-05-31 15:37:56', '1', '2016-05-31 15:37:56', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1896', 'QQ图片20160526165837.png', '1464680395912.png', 'png', '/newsImg/1464680395912.png', 'N', null, '1', '2016-05-31 15:39:56', '1', '2016-05-31 15:39:56', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1897', 'QQ图片20160526165837.png', '1464681864735.png', 'png', '/newsImg/1464681864735.png', 'N', null, '1', '2016-05-31 16:04:25', '1', '2016-05-31 16:04:25', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1898', 'QQ图片20160509133650.png', '1464681868326.png', 'png', '/newsImg/1464681868326.png', 'N', null, '1', '2016-05-31 16:04:28', '1', '2016-05-31 16:04:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1899', 'QQ截图20160601102435.png', '1464747888430.png', 'png', '/photos/1464747888430.png', 'Y', null, '1', '2016-06-01 10:24:48', '1', '2016-06-01 10:24:48', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1900', 'QQ截图20160601102435.png', '1464772090114.png', 'png', '/photos/1464772090114.png', 'Y', null, '1', '2016-06-01 17:08:10', '1', '2016-06-01 17:08:10', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1901', 'QQ截图20160601102435.png', '1464772099263.png', 'png', '/photos/1464772099263.png', 'Y', null, '1', '2016-06-01 17:08:19', '1', '2016-06-01 17:08:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1902', 'QQ截图20160601102435.png', '1464772621315.png', 'png', '/photos/1464772621315.png', 'Y', null, '1', '2016-06-01 17:17:01', '1', '2016-06-01 17:17:01', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1903', 'QQ截图20160601102435.png', '1464773424448.png', 'png', '/photos/1464773424448.png', 'Y', null, '1', '2016-06-01 17:30:24', '1', '2016-06-01 17:30:24', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1904', 'QQ截图20160601102435.png', '1464773652943.png', 'png', '/photos/1464773652943.png', 'Y', null, '1', '2016-06-01 17:34:13', '1', '2016-06-01 17:34:13', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1905', 'QQ截图20160601102435.png', '1464835620136.png', 'png', '/photos/1464835620136.png', 'Y', null, '1', '2016-06-02 10:47:00', '1', '2016-06-02 10:47:00', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1906', 'QQ截图20160601102435.png', '1464835784714.png', 'png', '/photos/1464835784714.png', 'Y', null, '1', '2016-06-02 10:49:45', '1', '2016-06-02 10:49:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1907', 'QQ截图20160601102435.png', '1464835884341.png', 'png', '/photos/1464835884341.png', 'Y', null, '1', '2016-06-02 10:51:24', '1', '2016-06-02 10:51:24', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1908', 'QQ截图20160601102435.png', '1464836034747.png', 'png', '/photos/1464836034747.png', 'Y', null, '1', '2016-06-02 10:53:55', '1', '2016-06-02 10:53:55', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1909', 'QQ截图20160601102435.png', '1464836043377.png', 'png', '/photos/1464836043377.png', 'Y', null, '1', '2016-06-02 10:54:03', '1', '2016-06-02 10:54:03', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1910', 'QQ截图20160601102435.png', '1464836449947.png', 'png', '/photos/1464836449947.png', 'Y', null, '1', '2016-06-02 11:00:50', '1', '2016-06-02 11:00:50', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1911', 'QQ图片20160526165837.png', '1464838819066.png', 'png', '/newsImg/1464838819066.png', 'N', null, '1', '2016-06-02 11:40:19', '1', '2016-06-02 11:40:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1912', 'u=3980017070,3868538258&fm=21&gp=0.jpg', '1464845751687.jpg', 'jpg', '/1464845751687.jpg', 'Y', null, '1', '2016-06-02 13:35:52', '1', '2016-06-02 13:35:52', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1913', 'QQ截图20160601102435.png', '1464849659171.png', 'png', '/photos/1464849659171.png', 'Y', null, '1', '2016-06-02 14:40:59', '1', '2016-06-02 14:40:59', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1914', 'QQ截图20160601102435.png', '1464849975047.png', 'png', '/photos/1464849975047.png', 'Y', null, '1', '2016-06-02 14:46:15', '1', '2016-06-02 14:46:15', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1915', 'QQ截图20160601102435.png', '1464850064262.png', 'png', '/photos/1464850064262.png', 'Y', null, '1', '2016-06-02 14:47:44', '1', '2016-06-02 14:47:44', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1916', 'QQ截图20160601102435.png', '1464850158214.png', 'png', '/photos/1464850158214.png', 'Y', null, '1', '2016-06-02 14:49:18', '1', '2016-06-02 14:49:18', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1917', 'QQ截图20160601102435.png', '1464850282923.png', 'png', '/photos/1464850282923.png', 'Y', null, '1', '2016-06-02 14:51:23', '1', '2016-06-02 14:51:23', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1918', 'QQ截图20160601102435.png', '1464850419528.png', 'png', '/photos/1464850419528.png', 'Y', null, '1', '2016-06-02 14:53:40', '1', '2016-06-02 14:53:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1919', 'QQ截图20160601102435.png', '1464850621230.png', 'png', '/photos/1464850621230.png', 'Y', null, '1', '2016-06-02 14:57:01', '1', '2016-06-02 14:57:01', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1920', 'QQ截图20160601102435.png', '1464850713113.png', 'png', '/photos/1464850713113.png', 'Y', null, '1', '2016-06-02 14:58:33', '1', '2016-06-02 14:58:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1921', 'QQ截图20160601102435.png', '1464850750609.png', 'png', '/photos/1464850750609.png', 'Y', null, '1', '2016-06-02 14:59:11', '1', '2016-06-02 14:59:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1922', 'QQ截图20160601102435.png', '1464851022969.png', 'png', '/photos/1464851022969.png', 'Y', null, '1', '2016-06-02 15:03:43', '1', '2016-06-02 15:03:43', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1923', 'QQ截图20160601102435.png', '1464851222615.png', 'png', '/photos/1464851222615.png', 'Y', null, '1', '2016-06-02 15:07:03', '1', '2016-06-02 15:07:03', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1924', 'QQ截图20160601102435.png', '1464851478717.png', 'png', '/photos/1464851478717.png', 'Y', null, '1', '2016-06-02 15:11:19', '1', '2016-06-02 15:11:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1925', 'QQ截图20160601102435.png', '1464851538867.png', 'png', '/photos/1464851538867.png', 'Y', null, '1', '2016-06-02 15:12:19', '1', '2016-06-02 15:12:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1926', 'QQ截图20160601102435.png', '1464851631779.png', 'png', '/photos/1464851631779.png', 'Y', null, '1', '2016-06-02 15:13:52', '1', '2016-06-02 15:13:52', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1927', 'QQ截图20160601102435.png', '1464851677361.png', 'png', '/photos/1464851677361.png', 'Y', null, '1', '2016-06-02 15:14:37', '1', '2016-06-02 15:14:37', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1928', 'QQ截图20160601102435.png', '1464854942111.png', 'png', '/photos/1464854942111.png', 'Y', null, '1', '2016-06-02 16:09:02', '1', '2016-06-02 16:09:02', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1929', 'QQ截图20160601102435.png', '1464855125440.png', 'png', '/newsImg/1464855125440.png', 'Y', null, '1', '2016-06-02 16:12:05', '1', '2016-06-02 16:12:05', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1930', 'QQ截图20160601102435.png', '1464856057002.png', 'png', '/photos/1464856057002.png', 'Y', null, '1', '2016-06-02 16:27:37', '1', '2016-06-02 16:27:37', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1931', 'QQ截图20160601102435.png', '1464856482458.png', 'png', '/photos/1464856482458.png', 'Y', null, '1', '2016-06-02 16:34:42', '1', '2016-06-02 16:34:42', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1932', 'QQ截图20160601102435.png', '1464856933549.png', 'png', '/photos/1464856933549.png', 'Y', null, '1', '2016-06-02 16:42:14', '1', '2016-06-02 16:42:14', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1933', 'QQ截图20160601102435.png', '1464857401317.png', 'png', '/photos/1464857401317.png', 'Y', null, '1', '2016-06-02 16:50:01', '1', '2016-06-02 16:50:01', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1934', 'QQ截图20160601102435.png', '1464857471343.png', 'png', '/photos/1464857471343.png', 'Y', null, '1', '2016-06-02 16:51:11', '1', '2016-06-02 16:51:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1935', 'QQ截图20160601102435.png', '1464858218264.png', 'png', '/photos/1464858218264.png', 'Y', null, '1', '2016-06-02 17:03:38', '1', '2016-06-02 17:03:38', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1936', 'QQ截图20160601102435.png', '1464858315734.png', 'png', '/photos/1464858315734.png', 'Y', null, '1', '2016-06-02 17:05:16', '1', '2016-06-02 17:05:16', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1937', '阿三.png', '1464859914649.png', 'png', '/photos/1464859914649.png', 'Y', null, '1', '2016-06-02 17:31:55', '1', '2016-06-02 17:31:55', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1938', '阿三.png', '1464859978846.png', 'png', '/photos/1464859978846.png', 'Y', null, '1', '2016-06-02 17:32:59', '1', '2016-06-02 17:32:59', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1939', '阿三.png', '1464860546273.png', 'png', '/photos/1464860546273.png', 'Y', null, '1', '2016-06-02 17:42:26', '1', '2016-06-02 17:42:26', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1940', '阿三.png', '1464860576862.png', 'png', '/photos/1464860576862.png', 'Y', null, '1', '2016-06-02 17:42:57', '1', '2016-06-02 17:42:57', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1941', '阿三.png', '1464860812900.png', 'png', '/photos/1464860812900.png', 'Y', null, '1', '2016-06-02 17:46:53', '1', '2016-06-02 17:46:53', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1942', 'QQ截图20160601102435.png', '1464860869289.png', 'png', '/photos/1464860869289.png', 'Y', null, '1', '2016-06-02 17:47:49', '1', '2016-06-02 17:47:49', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1943', 'QQ截图20160601102435.png', '1464861459207.png', 'png', '/photos/1464861459207.png', 'Y', null, '1', '2016-06-02 17:57:39', '1', '2016-06-02 17:57:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1944', '阿三.png', '1464861462572.png', 'png', '/photos/1464861462572.png', 'Y', null, '1', '2016-06-02 17:57:43', '1', '2016-06-02 17:57:43', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1945', 'QQ截图20160601102435.png', '1464861483063.png', 'png', '/photos/1464861483063.png', 'Y', null, '1', '2016-06-02 17:58:03', '1', '2016-06-02 17:58:03', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1946', '阿三.png', '1464861503140.png', 'png', '/photos/1464861503140.png', 'Y', null, '1', '2016-06-02 17:58:23', '1', '2016-06-02 17:58:23', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1947', 'QQ截图20160601102435.png', '1464861509753.png', 'png', '/photos/1464861509753.png', 'Y', null, '1', '2016-06-02 17:58:30', '1', '2016-06-02 17:58:30', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1948', 'QQ截图20160601102435.png', '1464861529042.png', 'png', '/photos/1464861529042.png', 'Y', null, '1', '2016-06-02 17:58:49', '1', '2016-06-02 17:58:49', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1949', 'QQ截图20160601102435.png', '1464916157469.png', 'png', '/photos/1464916157469.png', 'Y', null, '1', '2016-06-03 09:09:17', '1', '2016-06-03 09:09:17', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1950', 'QQ截图20160601102435.png', '1464916224411.png', 'png', '/photos/1464916224411.png', 'Y', null, '1', '2016-06-03 09:10:24', '1', '2016-06-03 09:10:24', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1951', '阿三.png', '1464916232589.png', 'png', '/photos/1464916232589.png', 'Y', null, '1', '2016-06-03 09:10:33', '1', '2016-06-03 09:10:33', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1952', 'QQ截图20160601102435.png', '1464920277563.png', 'png', '/photos/1464920277563.png', 'Y', null, '1', '2016-06-03 10:17:58', '1', '2016-06-03 10:17:58', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1953', '阿三.png', '1464920327783.png', 'png', '/photos/1464920327783.png', 'Y', null, '1', '2016-06-03 10:18:48', '1', '2016-06-03 10:18:48', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1954', 'QQ截图20160601102435.png', '1464920382877.png', 'png', '/photos/1464920382877.png', 'Y', null, '1', '2016-06-03 10:19:43', '1', '2016-06-03 10:19:43', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1955', 'QQ截图20160601102435.png', '1464920471323.png', 'png', '/photos/1464920471323.png', 'Y', null, '1', '2016-06-03 10:21:11', '1', '2016-06-03 10:21:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1956', '阿三.png', '1464920487788.png', 'png', '/photos/1464920487788.png', 'Y', null, '1', '2016-06-03 10:21:28', '1', '2016-06-03 10:21:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1957', 'QQ截图20160601102435.png', '1464920515802.png', 'png', '/photos/1464920515802.png', 'Y', null, '1', '2016-06-03 10:21:56', '1', '2016-06-03 10:21:56', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1958', '阿三.png', '1464920526936.png', 'png', '/photos/1464920526936.png', 'Y', null, '1', '2016-06-03 10:22:07', '1', '2016-06-03 10:22:07', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1959', 'QQ截图20160601102435.png', '1464921088616.png', 'png', '/photos/1464921088616.png', 'Y', null, '1', '2016-06-03 10:31:29', '1', '2016-06-03 10:31:29', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1960', 'QQ截图20160601102435.png', '1464931392924.png', 'png', '/photos/1464931392924.png', 'Y', null, '1', '2016-06-03 13:23:13', '1', '2016-06-03 13:23:13', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1961', 'QQ截图20160601102435.png', '1464939425653.png', 'png', '/photos/1464939425653.png', 'Y', null, '1', '2016-06-03 15:37:06', '1', '2016-06-03 15:37:06', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1962', '阿三.png', '1464939435811.png', 'png', '/photos/1464939435811.png', 'Y', null, '1', '2016-06-03 15:37:16', '1', '2016-06-03 15:37:16', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1963', 'QQ截图20160601102435.png', '1464939470630.png', 'png', '/photos/1464939470630.png', 'Y', null, '1', '2016-06-03 15:37:51', '1', '2016-06-03 15:37:51', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1964', 'QQ截图20160601102435.png', '1465182244361.png', 'png', '/partyRegime/1465182244361.png', 'Y', null, '1', '2016-06-06 11:04:04', '1', '2016-06-06 11:04:04', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1965', 'QQ图片20160526165837.png', '1465702095681.png', 'png', '/newsImg/1465702095681.png', 'N', null, '1', '2016-06-12 11:28:16', '1', '2016-06-12 11:28:16', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1966', 'QQ图片20160526165837.png', '1465703110936.png', 'png', '/newsImg/1465703110936.png', 'Y', null, '1', '2016-06-12 11:45:11', '1', '2016-06-12 11:45:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1967', 'QQ图片20160612101115.png', '1465703113398.png', 'png', '/newsImg/1465703113398.png', 'Y', null, '1', '2016-06-12 11:45:13', '1', '2016-06-12 11:45:13', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1968', 'QQ图片20160509133650.png', '1465703118822.png', 'png', '/newsImg/1465703118822.png', 'N', null, '1', '2016-06-12 11:45:19', '1', '2016-06-12 11:45:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1969', '第12期.jpg', '1465955046782.jpg', 'jpg', '/newsImg/1465955046782.jpg', 'N', null, '1', '2016-06-15 09:44:07', '1', '2016-06-15 09:44:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1970', 'QQ截图20160601102435.png', '1465986301859.png', 'png', '/photos/1465986301859.png', 'Y', null, '1', '2016-06-15 18:25:02', '1', '2016-06-15 18:25:02', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1971', '麦当劳.jpg', '1465986382235.jpg', 'jpg', '/photos/1465986382235.jpg', 'Y', null, '1', '2016-06-15 18:26:22', '1', '2016-06-15 18:26:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1972', '麦当劳.jpg', '1465986709291.jpg', 'jpg', '/photos/1465986709291.jpg', 'Y', null, '1', '2016-06-15 18:31:49', '1', '2016-06-15 18:31:49', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1973', 'index.jpg', '1466924726962.jpg', 'jpg', '/photos/1466924726962.jpg', 'N', null, '1', '2016-06-26 15:05:27', '1', '2016-06-26 15:05:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('1974', 'ds.gif', '1468807948746.gif', 'gif', '/photos/1468807948746.gif', 'Y', null, '1', '2016-07-18 10:12:29', '1', '2016-07-18 10:12:29', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1975', 'ds.gif', '1468808060658.gif', 'gif', '/photos/1468808060658.gif', 'Y', null, '1', '2016-07-18 10:14:21', '1', '2016-07-18 10:14:21', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1976', 'ds.gif', '1468808219863.gif', 'gif', '/photos/1468808219863.gif', 'Y', null, '1', '2016-07-18 10:17:00', '1', '2016-07-18 10:17:00', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1977', 'ds.gif', '1468809231362.gif', 'gif', '/photos/1468809231362.gif', 'Y', null, '1', '2016-07-18 10:33:51', '1', '2016-07-18 10:33:51', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1978', 'ds.gif', '1468809348857.gif', 'gif', '/photos/1468809348857.gif', 'Y', null, '1', '2016-07-18 10:35:49', '1', '2016-07-18 10:35:49', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1979', 'aa.png', '1468809604015.png', 'png', '/photos/1468809604015.png', 'Y', null, '1', '2016-07-18 10:40:04', '1', '2016-07-18 10:40:04', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1980', 'ds.gif', '1468810118246.gif', 'gif', '/photos/1468810118246.gif', 'Y', null, '1', '2016-07-18 10:48:38', '1', '2016-07-18 10:48:38', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1981', 'aa.png', '1468810122697.png', 'png', '/photos/1468810122697.png', 'Y', null, '1', '2016-07-18 10:48:43', '1', '2016-07-18 10:48:43', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1982', 'aa.png', '1468810127603.png', 'png', '/photos/1468810127603.png', 'Y', null, '1', '2016-07-18 10:48:48', '1', '2016-07-18 10:48:48', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1983', 'aa.png', '1468810886664.png', 'png', '/photos/1468810886664.png', 'Y', null, '1', '2016-07-18 11:01:27', '1', '2016-07-18 11:01:27', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1984', 'ds.gif', '1468810914796.gif', 'gif', '/photos/1468810914796.gif', 'Y', null, '1', '2016-07-18 11:01:55', '1', '2016-07-18 11:01:55', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1985', 'aa.png', '1468810919020.png', 'png', '/photos/1468810919020.png', 'Y', null, '1', '2016-07-18 11:01:59', '1', '2016-07-18 11:01:59', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1986', 'aa.png', '1468810936846.png', 'png', '/photos/1468810936846.png', 'Y', null, '1', '2016-07-18 11:02:17', '1', '2016-07-18 11:02:17', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1987', 'ds.gif', '1468810941991.gif', 'gif', '/photos/1468810941991.gif', 'Y', null, '1', '2016-07-18 11:02:22', '1', '2016-07-18 11:02:22', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1988', 'aa.png', '1468810958614.png', 'png', '/photos/1468810958614.png', 'Y', null, '1', '2016-07-18 11:02:39', '1', '2016-07-18 11:02:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1989', 'aa.png', '1468811000282.png', 'png', '/photos/1468811000282.png', 'Y', null, '1', '2016-07-18 11:03:20', '1', '2016-07-18 11:03:20', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1990', 'aa.png', '1468811017847.png', 'png', '/photos/1468811017847.png', 'Y', null, '1', '2016-07-18 11:03:38', '1', '2016-07-18 11:03:38', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1991', 'aa.png', '1468811130308.png', 'png', '/photos/1468811130308.png', 'Y', null, '1', '2016-07-18 11:05:30', '1', '2016-07-18 11:05:30', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1992', 'aa.png', '1468811505036.png', 'png', '/photos/1468811505036.png', 'Y', null, '1', '2016-07-18 11:11:45', '1', '2016-07-18 11:11:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1993', 'ds.gif', '1468811598089.gif', 'gif', '/photos/1468811598089.gif', 'Y', null, '1', '2016-07-18 11:13:18', '1', '2016-07-18 11:13:18', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1994', 'aa.png', '1468812280445.png', 'png', '/photos/1468812280445.png', 'Y', null, '1', '2016-07-18 11:24:40', '1', '2016-07-18 11:24:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1995', 'aa.png', '1468812330279.png', 'png', '/photos/1468812330279.png', 'Y', null, '1', '2016-07-18 11:25:30', '1', '2016-07-18 11:25:30', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('1996', 'ds.gif', '1468812345407.gif', 'gif', '/photos/1468812345407.gif', 'Y', null, '1', '2016-07-18 11:25:45', '1', '2016-07-18 11:25:45', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1997', 'ds.gif', '1468812385433.gif', 'gif', '/photos/1468812385433.gif', 'Y', null, '1', '2016-07-18 11:26:25', '1', '2016-07-18 11:26:25', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1998', 'ds.gif', '1468813101574.gif', 'gif', '/photos/1468813101574.gif', 'Y', null, '1', '2016-07-18 11:38:22', '1', '2016-07-18 11:38:22', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('1999', 'ds.gif', '1468813239103.gif', 'gif', '/photos/1468813239103.gif', 'Y', null, '1', '2016-07-18 11:40:39', '1', '2016-07-18 11:40:39', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2000', 'ds.gif', '1468813337983.gif', 'gif', '/photos/1468813337983.gif', 'Y', null, '1', '2016-07-18 11:42:18', '1', '2016-07-18 11:42:18', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2001', 'aa.png', '1468813377883.png', 'png', '/photos/1468813377883.png', 'Y', null, '1', '2016-07-18 11:42:58', '1', '2016-07-18 11:42:58', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2002', 'aa.png', '1468813890435.png', 'png', '/photos/1468813890435.png', 'Y', null, '1', '2016-07-18 11:51:30', '1', '2016-07-18 11:51:30', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2003', 'ds.gif', '1468813913555.gif', 'gif', '/photos/1468813913555.gif', 'Y', null, '1', '2016-07-18 11:51:54', '1', '2016-07-18 11:51:54', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2004', 'ds.gif', '1468813971412.gif', 'gif', '/photos/1468813971412.gif', 'Y', null, '1', '2016-07-18 11:52:51', '1', '2016-07-18 11:52:51', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2005', 'ds.gif', '1468814030321.gif', 'gif', '/photos/1468814030321.gif', 'Y', null, '1', '2016-07-18 11:53:50', '1', '2016-07-18 11:53:50', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2006', 'ds.gif', '1468814263457.gif', 'gif', '/photos/1468814263457.gif', 'Y', null, '1', '2016-07-18 11:57:43', '1', '2016-07-18 11:57:43', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2007', 'aa.png', '1468814282399.png', 'png', '/photos/1468814282399.png', 'Y', null, '1', '2016-07-18 11:58:02', '1', '2016-07-18 11:58:02', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2008', 'aa.png', '1468814338580.png', 'png', '/photos/1468814338580.png', 'Y', null, '1', '2016-07-18 11:58:59', '1', '2016-07-18 11:58:59', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2009', 'aa.png', '1468814360615.png', 'png', '/photos/1468814360615.png', 'Y', null, '1', '2016-07-18 11:59:21', '1', '2016-07-18 11:59:21', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2010', 'ds.gif', '1468819241478.gif', 'gif', '/images/gis/1468819241478.gif', 'Y', null, '1', '2016-07-18 13:20:41', '1', '2016-07-18 13:20:41', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2011', 'ds.gif', '1468819322386.gif', 'gif', '/images/gis/1468819322386.gif', 'Y', null, '1', '2016-07-18 13:22:02', '1', '2016-07-18 13:22:02', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2012', 'ds.gif', '1468819350522.gif', 'gif', '/images/gis/1468819350522.gif', 'Y', null, '1', '2016-07-18 13:22:31', '1', '2016-07-18 13:22:31', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2013', 'ds.gif', '1468819384279.gif', 'gif', '/images/gis/1468819384279.gif', 'Y', null, '1', '2016-07-18 13:23:04', '1', '2016-07-18 13:23:04', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2014', 'ds.gif', '1468819454560.gif', 'gif', '/images/gis/1468819454560.gif', 'Y', null, '1', '2016-07-18 13:24:15', '1', '2016-07-18 13:24:15', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2015', 'ds.gif', '1468819665186.gif', 'gif', '/images/gis/1468819665186.gif', 'Y', null, '1', '2016-07-18 13:27:45', '1', '2016-07-18 13:27:45', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2016', 'ds.gif', '1468819752379.gif', 'gif', '/images/gis/1468819752379.gif', 'Y', null, '1', '2016-07-18 13:29:12', '1', '2016-07-18 13:29:12', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2017', 'ds.gif', '1468820064946.gif', 'gif', '/images/gis/1468820064946.gif', 'Y', null, '1', '2016-07-18 13:34:25', '1', '2016-07-18 13:34:25', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2018', 'aa.png', '1468820171494.png', 'png', '/photos/1468820171494.png', 'Y', null, '1', '2016-07-18 13:36:11', '1', '2016-07-18 13:36:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2019', 'ds.gif', '1468820182033.gif', 'gif', '/images/gis/1468820182033.gif', 'Y', null, '1', '2016-07-18 13:36:22', '1', '2016-07-18 13:36:22', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2020', 'ds.gif', '1468820457687.gif', 'gif', '/images/gis/1468820457687.gif', 'Y', null, '1', '2016-07-18 13:40:58', '1', '2016-07-18 13:40:58', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2021', 'aa.png', '1468820465825.png', 'png', '/images/gis/1468820465825.png', 'Y', null, '1', '2016-07-18 13:41:06', '1', '2016-07-18 13:41:06', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2022', 'aa.png', '1468820530748.png', 'png', '/images/gis/1468820530748.png', 'Y', null, '1', '2016-07-18 13:42:11', '1', '2016-07-18 13:42:11', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2023', 'aa.png', '1468820551603.png', 'png', '/images/gis/1468820551603.png', 'Y', null, '1', '2016-07-18 13:42:32', '1', '2016-07-18 13:42:32', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2024', 'ds.gif', '1468820595425.gif', 'gif', '/images/gis/1468820595425.gif', 'Y', null, '1', '2016-07-18 13:43:15', '1', '2016-07-18 13:43:15', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2025', 'aa.png', '1468820684897.png', 'png', '/images/gis/1468820684897.png', 'Y', null, '1', '2016-07-18 13:44:45', '1', '2016-07-18 13:44:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2026', 'ds.gif', '1468820729489.gif', 'gif', '/images/gis/1468820729489.gif', 'Y', null, '1', '2016-07-18 13:45:29', '1', '2016-07-18 13:45:29', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2027', 'ds.gif', '1468820781712.gif', 'gif', '/images/gis/1468820781712.gif', 'Y', null, '1', '2016-07-18 13:46:22', '1', '2016-07-18 13:46:22', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2028', 'ds.gif', '1468820860440.gif', 'gif', '/images/gis/1468820860440.gif', 'Y', null, '1', '2016-07-18 13:47:40', '1', '2016-07-18 13:47:40', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2029', 'ds.gif', '1468820931522.gif', 'gif', '/images/gis/1468820931522.gif', 'Y', null, '1', '2016-07-18 13:48:52', '1', '2016-07-18 13:48:52', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2030', 'ds.gif', '1468821512839.gif', 'gif', '/images/gis/1468821512839.gif', 'Y', null, '1', '2016-07-18 13:58:33', '1', '2016-07-18 13:58:33', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2031', 'ds.gif', '1468821580775.gif', 'gif', '/images/gis/1468821580775.gif', 'Y', null, '1', '2016-07-18 13:59:41', '1', '2016-07-18 13:59:41', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2032', 'ds.gif', '1468821838855.gif', 'gif', '/resources/images/gis/1468821838855.gif', 'Y', null, '1', '2016-07-18 14:03:59', '1', '2016-07-18 14:03:59', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2033', 'ds.gif', '1468822015991.gif', 'gif', '/cisresources/images/gis/1468822015991.gif', 'Y', null, '1', '2016-07-18 14:06:56', '1', '2016-07-18 14:06:56', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2034', 'aa.png', '1468822058570.png', 'png', '/cisresources/images/gis/1468822058570.png', 'Y', null, '1', '2016-07-18 14:07:39', '1', '2016-07-18 14:07:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2035', 'aa.png', '1468822754206.png', 'png', '/resources/images/gis/1468822754206.png', 'Y', null, '1', '2016-07-18 14:19:14', '1', '2016-07-18 14:19:14', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2036', 'aa.png', '1468824426329.png', 'png', '/resources/images/gis/1468824426329.png', 'Y', null, '1', '2016-07-18 14:47:06', '1', '2016-07-18 14:47:06', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2037', 'ds.gif', '1468824433641.gif', 'gif', '/resources/images/gis/1468824433641.gif', 'Y', null, '1', '2016-07-18 14:47:14', '1', '2016-07-18 14:47:14', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2038', 'ds.gif', '1468824546508.gif', 'gif', '/resources/images/gis/1468824546508.gif', 'Y', null, '1', '2016-07-18 14:49:07', '1', '2016-07-18 14:49:07', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2039', 'ds.gif', '1468824989603.gif', 'gif', '/resources/images/gis/1468824989603.gif', 'Y', null, '1', '2016-07-18 14:56:30', '1', '2016-07-18 14:56:30', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2040', 'ds.gif', '1468825058041.gif', 'gif', '/resources/images/gis/1468825058041.gif', 'Y', null, '1', '2016-07-18 14:57:38', '1', '2016-07-18 14:57:38', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2041', 'aa.png', '1468825089670.png', 'png', '/photos/1468825089670.png', 'Y', null, '1', '2016-07-18 14:58:10', '1', '2016-07-18 14:58:10', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2042', 'aa.png', '1468825128888.png', 'png', '/photos/1468825128888.png', 'Y', null, '1', '2016-07-18 14:58:49', '1', '2016-07-18 14:58:49', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2043', 'ds.gif', '1468825185835.gif', 'gif', '/resources/images/gis/1468825185835.gif', 'Y', null, '1', '2016-07-18 14:59:46', '1', '2016-07-18 14:59:46', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2044', 'ds.gif', '1468825206232.gif', 'gif', '/resources/images/gis/1468825206232.gif', 'Y', null, '1', '2016-07-18 15:00:06', '1', '2016-07-18 15:00:06', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2045', 'aa.png', '1468825217448.png', 'png', '/resources/images/gis/1468825217448.png', 'Y', null, '1', '2016-07-18 15:00:17', '1', '2016-07-18 15:00:17', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2046', 'aa.png', '1468825256539.png', 'png', '/resources/images/gis/1468825256539.png', 'Y', null, '1', '2016-07-18 15:00:57', '1', '2016-07-18 15:00:57', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2047', 'ds.gif', '1468825264164.gif', 'gif', '/resources/images/gis/1468825264164.gif', 'Y', null, '1', '2016-07-18 15:01:04', '1', '2016-07-18 15:01:04', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2048', 'aa.png', '1468825370383.png', 'png', '/resources/images/gis/1468825370383.png', 'Y', null, '1', '2016-07-18 15:02:50', '1', '2016-07-18 15:02:50', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2049', 'aa.png', '1468826787887.png', 'png', '/photos/1468826787887.png', 'Y', null, '1', '2016-07-18 15:26:28', '1', '2016-07-18 15:26:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2050', 'ds.gif', '1468826879658.gif', 'gif', '/resources/images/gis/1468826879658.gif', 'Y', null, '1', '2016-07-18 15:28:00', '1', '2016-07-18 15:28:00', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2051', 'aa.png', '1468827065053.png', 'png', '/resources/images/gis/1468827065053.png', 'Y', null, '1', '2016-07-18 15:31:05', '1', '2016-07-18 15:31:05', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2052', 'ds.gif', '1468827073047.gif', 'gif', '/resources/images/gis/1468827073047.gif', 'Y', null, '1', '2016-07-18 15:31:13', '1', '2016-07-18 15:31:13', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2053', 'ds.gif', '1468827337873.gif', 'gif', '/resources/images/gis/1468827337873.gif', 'Y', null, '1', '2016-07-18 15:35:38', '1', '2016-07-18 15:35:38', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2054', 'ds.gif', '1468828202256.gif', 'gif', '/resources/images/gis/1468828202256.gif', 'Y', null, '1', '2016-07-18 15:50:02', '1', '2016-07-18 15:50:02', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2055', 'ds.gif', '1468828455214.gif', 'gif', '/resources/images/gis/1468828455214.gif', 'Y', null, '1', '2016-07-18 15:54:15', '1', '2016-07-18 15:54:15', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2056', 'ds.gif', '1468828774804.gif', 'gif', '/resources/images/gis/1468828774804.gif', 'Y', null, '1', '2016-07-18 15:59:35', '1', '2016-07-18 15:59:35', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2057', 'aa.png', '1468833661217.png', 'png', '/resources/images/gis/1468833661217.png', 'Y', null, '1', '2016-07-18 17:21:01', '1', '2016-07-18 17:21:01', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2058', 'aa.png', '1468833784482.png', 'png', '/resources/images/gis/1468833784482.png', 'Y', null, '1', '2016-07-18 17:23:04', '1', '2016-07-18 17:23:04', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2059', 'aa.png', '1468833863081.png', 'png', '/resources/images/gis/1468833863081.png', 'Y', null, '1', '2016-07-18 17:24:23', '1', '2016-07-18 17:24:23', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2060', 'ds.gif', '1468834739010.gif', 'gif', '/resources/images/gis/1468834739010.gif', 'Y', null, '1', '2016-07-18 17:38:59', '1', '2016-07-18 17:38:59', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2061', 'aa.png', '1468834844885.png', 'png', '/resources/images/gis/1468834844885.png', 'Y', null, '1', '2016-07-18 17:40:45', '1', '2016-07-18 17:40:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2062', 'aa.png', '1468834873463.png', 'png', '/resources/images/gis/1468834873463.png', 'Y', null, '1', '2016-07-18 17:41:13', '1', '2016-07-18 17:41:13', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2063', 'aa.png', '1468834899289.png', 'png', '/gis/1468834899289.png', 'Y', null, '1', '2016-07-18 17:41:39', '1', '2016-07-18 17:41:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2064', 'aa.png', '1468834905024.png', 'png', '/gis/1468834905024.png', 'Y', null, '1', '2016-07-18 17:41:45', '1', '2016-07-18 17:41:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2065', 'aa.png', '1468835009384.png', 'png', '/gis/1468835009384.png', 'Y', null, '1', '2016-07-18 17:43:29', '1', '2016-07-18 17:43:29', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2066', 'aa.png', '1468835021693.png', 'png', '/gis/1468835021693.png', 'Y', null, '1', '2016-07-18 17:43:42', '1', '2016-07-18 17:43:42', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2067', 'aa.png', '1468835459400.png', 'png', '/photos/1468835459400.png', 'Y', null, '1', '2016-07-18 17:50:59', '1', '2016-07-18 17:50:59', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2068', 'aa.png', '1468835823019.png', 'png', '/gis/1468835823019.png', 'Y', null, '1', '2016-07-18 17:57:03', '1', '2016-07-18 17:57:03', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2069', 'aa.png', '1468835836105.png', 'png', '/gis/1468835836105.png', 'Y', null, '1', '2016-07-18 17:57:16', '1', '2016-07-18 17:57:16', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2070', 'aa.png', '1468890644690.png', 'png', '/gis/1468890644690.png', 'Y', null, '1', '2016-07-19 09:10:45', '1', '2016-07-19 09:10:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2071', 'aa.png', '1468890726085.png', 'png', '/gis/1468890726085.png', 'Y', null, '1', '2016-07-19 09:12:06', '1', '2016-07-19 09:12:06', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2072', 'aa.png', '1468890781434.png', 'png', '/gis/1468890781434.png', 'Y', null, '1', '2016-07-19 09:13:01', '1', '2016-07-19 09:13:01', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2073', 'aa.png', '1468890814506.png', 'png', '/gis/1468890814506.png', 'Y', null, '1', '2016-07-19 09:13:35', '1', '2016-07-19 09:13:35', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2074', 'aa.png', '1468890859650.png', 'png', '/gis/1468890859650.png', 'Y', null, '1', '2016-07-19 09:14:20', '1', '2016-07-19 09:14:20', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2075', 'end-icon.png', '1468891139517.png', 'png', '/gis/1468891139517.png', 'Y', null, '1', '2016-07-19 09:19:00', '1', '2016-07-19 09:19:00', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2076', 'end-icon.png', '1468891184103.png', 'png', '/gis/1468891184103.png', 'Y', null, '1', '2016-07-19 09:19:44', '1', '2016-07-19 09:19:44', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2077', 'end-icon.png', '1468891249010.png', 'png', '/gis/1468891249010.png', 'Y', null, '1', '2016-07-19 09:20:49', '1', '2016-07-19 09:20:49', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2078', 'end-icon.png', '1468892117736.png', 'png', '/gis/1468892117736.png', 'Y', null, '1', '2016-07-19 09:35:18', '1', '2016-07-19 09:35:18', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2079', 'end-icon.png', '1468892139645.png', 'png', '/gis/1468892139645.png', 'Y', null, '1', '2016-07-19 09:35:40', '1', '2016-07-19 09:35:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2080', 'end-icon.png', '1468893638896.png', 'png', '/gis/1468893638896.png', 'Y', null, '1', '2016-07-19 10:00:39', '1', '2016-07-19 10:00:39', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2081', 'ds.gif', '1468897998831.gif', 'gif', '/gis/1468897998831.gif', 'Y', null, '1', '2016-07-19 11:13:19', '1', '2016-07-19 11:13:19', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2082', 'ds.gif', '1468898092552.gif', 'gif', '/gis/1468898092552.gif', 'Y', null, '1', '2016-07-19 11:14:53', '1', '2016-07-19 11:14:53', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2083', 'ss.png', '1468898139838.png', 'png', '/gis/1468898139838.png', 'Y', null, '1', '2016-07-19 11:15:40', '1', '2016-07-19 11:15:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2084', 'ss.png', '1468899105166.png', 'png', '/gis/1468899105166.png', 'Y', null, '1', '2016-07-19 11:31:45', '1', '2016-07-19 11:31:45', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2085', 'ds.gif', '1468899124954.gif', 'gif', '/gis/1468899124954.gif', 'Y', null, '1', '2016-07-19 11:32:05', '1', '2016-07-19 11:32:05', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2086', 'ss.png', '1468899311503.png', 'png', '/gis/1468899311503.png', 'Y', null, '1', '2016-07-19 11:35:12', '1', '2016-07-19 11:35:12', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2087', 'ss.png', '1468899403307.png', 'png', '/gis/1468899403307.png', 'Y', null, '1', '2016-07-19 11:36:43', '1', '2016-07-19 11:36:43', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2088', 'aa.png', '1468899415939.png', 'png', '/gis/1468899415939.png', 'Y', null, '1', '2016-07-19 11:36:56', '1', '2016-07-19 11:36:56', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2089', 'ss.png', '1468899476965.png', 'png', '/gis/1468899476965.png', 'Y', null, '1', '2016-07-19 11:37:57', '1', '2016-07-19 11:37:57', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2090', 'ss.png', '1468899488807.png', 'png', '/gis/1468899488807.png', 'Y', null, '1', '2016-07-19 11:38:09', '1', '2016-07-19 11:38:09', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2091', 'ss.png', '1468899593595.png', 'png', '/gis/1468899593595.png', 'Y', null, '1', '2016-07-19 11:39:54', '1', '2016-07-19 11:39:54', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2092', 'ds.gif', '1468899620342.gif', 'gif', '/gis/1468899620342.gif', 'Y', null, '1', '2016-07-19 11:40:20', '1', '2016-07-19 11:40:20', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2093', 'ss.png', '1468899635461.png', 'png', '/gis/1468899635461.png', 'Y', null, '1', '2016-07-19 11:40:35', '1', '2016-07-19 11:40:35', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2094', 'ss.png', '1468899766076.png', 'png', '/gis/1468899766076.png', 'Y', null, '1', '2016-07-19 11:42:46', '1', '2016-07-19 11:42:46', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2095', 'ss.png', '1468900217579.png', 'png', '/gis/1468900217579.png', 'Y', null, '1', '2016-07-19 11:50:18', '1', '2016-07-19 11:50:18', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2096', 'ss.png', '1468900470430.png', 'png', '/gis/1468900470430.png', 'Y', null, '1', '2016-07-19 11:54:30', '1', '2016-07-19 11:54:30', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2097', 'ds.gif', '1468900577999.gif', 'gif', '/gis/1468900577999.gif', 'Y', null, '1', '2016-07-19 11:56:18', '1', '2016-07-19 11:56:18', 'image/gif');
INSERT INTO `gxwl_sys_doc` VALUES ('2098', 'aa.png', '1468905289598.png', 'png', '/gis/1468905289598.png', 'Y', null, '1', '2016-07-19 13:14:50', '1', '2016-07-19 13:14:50', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2099', 'ss.png', '1468905293074.png', 'png', '/gis/1468905293074.png', 'Y', null, '1', '2016-07-19 13:14:53', '1', '2016-07-19 13:14:53', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2100', 'ss.png', '1468905499077.png', 'png', '/gis/1468905499077.png', 'Y', null, '1', '2016-07-19 13:18:19', '1', '2016-07-19 13:18:19', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2101', 'ss.png', '1468905556258.png', 'png', '/gis/1468905556258.png', 'Y', null, '1', '2016-07-19 13:19:16', '1', '2016-07-19 13:19:16', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2102', 'ss.png', '1468905561334.png', 'png', '/gis/1468905561334.png', 'Y', null, '1', '2016-07-19 13:19:21', '1', '2016-07-19 13:19:21', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2103', 'aa.png', '1468905564775.png', 'png', '/gis/1468905564775.png', 'Y', null, '1', '2016-07-19 13:19:25', '1', '2016-07-19 13:19:25', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2104', 'aa.png', '1468905567883.png', 'png', '/gis/1468905567883.png', 'Y', null, '1', '2016-07-19 13:19:28', '1', '2016-07-19 13:19:28', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2105', 'ss.png', '1468905710630.png', 'png', '/gis/1468905710630.png', 'Y', null, '1', '2016-07-19 13:21:51', '1', '2016-07-19 13:21:51', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2106', 'aa.png', '1468905714245.png', 'png', '/gis/1468905714245.png', 'Y', null, '1', '2016-07-19 13:21:54', '1', '2016-07-19 13:21:54', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2107', 'ss.png', '1468906088096.png', 'png', '/gis/1468906088096.png', 'Y', null, '1', '2016-07-19 13:28:08', '1', '2016-07-19 13:28:08', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2108', 'ss.png', '1468906229334.png', 'png', '/gis/1468906229334.png', 'Y', null, '1', '2016-07-19 13:30:29', '1', '2016-07-19 13:30:29', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2109', 'psb.jpg', '1468916618681.jpg', 'jpg', '/gis/1468916618681.jpg', 'Y', null, '1', '2016-07-19 16:23:39', '1', '2016-07-19 16:23:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2110', 'psb.jpg', '1468916700820.jpg', 'jpg', '/gis/1468916700820.jpg', 'Y', null, '1', '2016-07-19 16:25:01', '1', '2016-07-19 16:25:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2111', '1465182244361.png', '1468916787404.png', 'png', '/gis/1468916787404.png', 'Y', null, '1', '2016-07-19 16:26:27', '1', '2016-07-19 16:26:27', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2112', '1465182244361.png', '1468917442190.png', 'png', '/gis/1468917442190.png', 'N', null, '1', '2016-07-19 16:37:22', '1', '2016-07-19 16:37:22', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2113', '1.jpg', '1469165590675.jpg', 'jpg', '/1469165590675.jpg', 'N', null, '1', '2016-07-22 13:33:11', '1', '2016-07-22 13:33:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2114', '9a3a4da487a085088de0e342d53deead.jpg@1l.jpg', '1470798217394.jpg', 'jpg', '/photos/1470798217394.jpg', 'Y', null, '1', '2016-08-10 11:03:37', '1', '2016-08-10 11:03:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2115', 's_31de28e7_122ceda6024__7c3f.jpg', '1470798237486.jpg', 'jpg', '/photos/1470798237486.jpg', 'Y', null, '1', '2016-08-10 11:03:57', '1', '2016-08-10 11:03:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2116', '201607220954510.jpg', '1470798541080.jpg', 'jpg', '/photos/1470798541080.jpg', 'Y', null, '1', '2016-08-10 11:09:01', '1', '2016-08-10 11:09:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2117', 'fd44b5f4c03d0aeaa8a23ec4c26c68e9.jpg@1l.jpg', '1470798547044.jpg', 'jpg', '/photos/1470798547044.jpg', 'Y', null, '1', '2016-08-10 11:09:07', '1', '2016-08-10 11:09:07', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2118', 's_31de28e7_122ceda6024__7c3f.jpg', '1470798602704.jpg', 'jpg', '/photos/1470798602704.jpg', 'Y', null, '1', '2016-08-10 11:10:03', '1', '2016-08-10 11:10:03', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2119', 'index.jpg', '1470798612604.jpg', 'jpg', '/photos/1470798612604.jpg', 'Y', null, '1', '2016-08-10 11:10:13', '1', '2016-08-10 11:10:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2120', '9a3a4da487a085088de0e342d53deead.jpg@1l.jpg', '1470798619116.jpg', 'jpg', '/photos/1470798619116.jpg', 'Y', null, '1', '2016-08-10 11:10:19', '1', '2016-08-10 11:10:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2121', '200730hwbw8peppblhd58l.jpg', '1470798633817.jpg', 'jpg', '/photos/1470798633817.jpg', 'Y', null, '1', '2016-08-10 11:10:34', '1', '2016-08-10 11:10:34', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2122', 'index.jpg', '1470798665429.jpg', 'jpg', '/photos/1470798665429.jpg', 'Y', null, '1', '2016-08-10 11:11:05', '1', '2016-08-10 11:11:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2123', '201607220954510.jpg', '1470798672325.jpg', 'jpg', '/photos/1470798672325.jpg', 'Y', null, '1', '2016-08-10 11:11:12', '1', '2016-08-10 11:11:12', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2124', 'u=1711620639,1599790401&fm=21&gp=0.jpg', '1470798687849.jpg', 'jpg', '/photos/1470798687849.jpg', 'Y', null, '1', '2016-08-10 11:11:28', '1', '2016-08-10 11:11:28', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2125', '0df431adcbef76095060ff2328dda3cc7cd99e26.jpg', '1470799200559.jpg', 'jpg', '/photos/1470799200559.jpg', 'Y', null, '1', '2016-08-10 11:20:01', '1', '2016-08-10 11:20:01', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2126', 'b03533fa828ba61ef1f2af934734970a304e5969.jpg', '1470799213743.jpg', 'jpg', '/photos/1470799213743.jpg', 'Y', null, '1', '2016-08-10 11:20:14', '1', '2016-08-10 11:20:14', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2127', 'fc1f4134970a304e7b44c746d7c8a786c9175c23.jpg', '1470799221539.jpg', 'jpg', '/photos/1470799221539.jpg', 'Y', null, '1', '2016-08-10 11:20:22', '1', '2016-08-10 11:20:22', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2128', '377adab44aed2e7333cbe1908101a18b87d6fa68.jpg', '1470799226714.jpg', 'jpg', '/photos/1470799226714.jpg', 'Y', null, '1', '2016-08-10 11:20:27', '1', '2016-08-10 11:20:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2129', '1e30e924b899a9018abd3f8a1b950a7b0308f586.jpg', '1470799230556.jpg', 'jpg', '/photos/1470799230556.jpg', 'Y', null, '1', '2016-08-10 11:20:31', '1', '2016-08-10 11:20:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2130', '0df431adcbef76095060ff2328dda3cc7cd99e26.jpg', '1470799630777.jpg', 'jpg', '/photos/1470799630777.jpg', 'Y', null, '1', '2016-08-10 11:27:11', '1', '2016-08-10 11:27:11', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2131', '0df431adcbef76095060ff2328dda3cc7cd99e26.jpg', '1470799841051.jpg', 'jpg', '/photos/1470799841051.jpg', 'Y', null, '1', '2016-08-10 11:30:41', '1', '2016-08-10 11:30:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2132', '1e30e924b899a9018abd3f8a1b950a7b0308f586.jpg', '1470799910759.jpg', 'jpg', '/photos/1470799910759.jpg', 'Y', null, '1', '2016-08-10 11:31:51', '1', '2016-08-10 11:31:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2133', '0df431adcbef76095060ff2328dda3cc7cd99e26.jpg', '1470800037254.jpg', 'jpg', '/photos/1470800037254.jpg', 'Y', null, '1', '2016-08-10 11:33:57', '1', '2016-08-10 11:33:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2134', '1e30e924b899a9018abd3f8a1b950a7b0308f586.jpg', '1470800045579.jpg', 'jpg', '/photos/1470800045579.jpg', 'Y', null, '1', '2016-08-10 11:34:06', '1', '2016-08-10 11:34:06', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2135', '377adab44aed2e7333cbe1908101a18b87d6fa68.jpg', '1470800179307.jpg', 'jpg', '/photos/1470800179307.jpg', 'N', null, '1', '2016-08-10 11:36:19', '1', '2016-08-10 11:36:19', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2136', '0df431adcbef76095060ff2328dda3cc7cd99e26.jpg', '1470800246906.jpg', 'jpg', '/photos/1470800246906.jpg', 'N', null, '1', '2016-08-10 11:37:27', '1', '2016-08-10 11:37:27', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2137', '1e30e924b899a9018abd3f8a1b950a7b0308f586.jpg', '1470800258370.jpg', 'jpg', '/photos/1470800258370.jpg', 'N', null, '1', '2016-08-10 11:37:38', '1', '2016-08-10 11:37:38', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2138', '4afbfbedab64034fe587a5baa9c379310b551dc7.jpg', '1470800267688.jpg', 'jpg', '/photos/1470800267688.jpg', 'N', null, '1', '2016-08-10 11:37:48', '1', '2016-08-10 11:37:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2139', '1e30e924b899a9018abd3f8a1b950a7b0308f586.jpg', '1470808534970.jpg', 'jpg', '/photos/1470808534970.jpg', 'Y', null, '1', '2016-08-10 13:55:35', '1', '2016-08-10 13:55:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2140', '1e30e924b899a9018abd3f8a1b950a7b0308f586.jpg', '1470808577010.jpg', 'jpg', '/photos/1470808577010.jpg', 'Y', null, '1', '2016-08-10 13:56:17', '1', '2016-08-10 13:56:17', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2141', '1e30e924b899a9018abd3f8a1b950a7b0308f586.jpg', '1470809260733.jpg', 'jpg', '/photos/1470809260733.jpg', 'N', null, '1', '2016-08-10 14:07:41', '1', '2016-08-10 14:07:41', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2142', '377adab44aed2e7333cbe1908101a18b87d6fa68.jpg', '1470809652512.jpg', 'jpg', '/photos/1470809652512.jpg', 'Y', null, '1', '2016-08-10 14:14:13', '1', '2016-08-10 14:14:13', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2143', '377adab44aed2e7333cbe1908101a18b87d6fa68.jpg', '1470809795140.jpg', 'jpg', '/photos/1470809795140.jpg', 'Y', null, '1', '2016-08-10 14:16:35', '1', '2016-08-10 14:16:35', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2144', '377adab44aed2e7333cbe1908101a18b87d6fa68.jpg', '1470810090851.jpg', 'jpg', '/photos/1470810090851.jpg', 'Y', null, '1', '2016-08-10 14:21:31', '1', '2016-08-10 14:21:31', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2145', '4afbfbedab64034fe587a5baa9c379310b551dc7.jpg', '1470810116858.jpg', 'jpg', '/photos/1470810116858.jpg', 'Y', null, '1', '2016-08-10 14:21:57', '1', '2016-08-10 14:21:57', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2146', '377adab44aed2e7333cbe1908101a18b87d6fa68.jpg', '1470810166074.jpg', 'jpg', '/photos/1470810166074.jpg', 'Y', null, '1', '2016-08-10 14:22:46', '1', '2016-08-10 14:22:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2147', '4afbfbedab64034fe587a5baa9c379310b551dc7.jpg', '1470810170797.jpg', 'jpg', '/photos/1470810170797.jpg', 'Y', null, '1', '2016-08-10 14:22:51', '1', '2016-08-10 14:22:51', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2148', '9a3a4da487a085088de0e342d53deead.jpg@1l.jpg', '1470811118909.jpg', 'jpg', '/photos/1470811118909.jpg', 'Y', null, '1', '2016-08-10 14:38:39', '1', '2016-08-10 14:38:39', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2149', '9a3a4da487a085088de0e342d53deead.jpg@1l.jpg', '1471411246137.jpg', 'jpg', '/photos/1471411246137.jpg', 'Y', null, '1', '2016-08-17 13:20:46', '1', '2016-08-17 13:20:46', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2150', 'index.jpg', '1471411426989.jpg', 'jpg', '/photos/1471411426989.jpg', 'Y', null, '1', '2016-08-17 13:23:47', '1', '2016-08-17 13:23:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2151', '4afbfbedab64034fe587a5baa9c379310b551dc7.jpg', '1471412300864.jpg', 'jpg', '/photos/1471412300864.jpg', 'Y', null, '1', '2016-08-17 13:38:21', '1', '2016-08-17 13:38:21', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2152', '4afbfbedab64034fe587a5baa9c379310b551dc7.jpg', '1471412337685.jpg', 'jpg', '/photos/1471412337685.jpg', 'N', null, '1', '2016-08-17 13:38:58', '1', '2016-08-17 13:38:58', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2153', 's_31de28e7_122ceda6024__7c3f.jpg', '1471412836349.jpg', 'jpg', '/photos/1471412836349.jpg', 'Y', null, '1', '2016-08-17 13:47:16', '1', '2016-08-17 13:47:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2154', 's_31de28e7_122ceda6024__7c3f.jpg', '1471412867850.jpg', 'jpg', '/photos/1471412867850.jpg', 'Y', null, '1', '2016-08-17 13:47:48', '1', '2016-08-17 13:47:48', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2155', 's_31de28e7_122ceda6024__7c3f.jpg', '1471413076219.jpg', 'jpg', '/photos/1471413076219.jpg', 'Y', null, '1', '2016-08-17 13:51:16', '1', '2016-08-17 13:51:16', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2156', 's_31de28e7_122ceda6024__7c3f.jpg', '1471413343109.jpg', 'jpg', '/photos/1471413343109.jpg', 'Y', null, '1', '2016-08-17 13:55:43', '1', '2016-08-17 13:55:43', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2157', 's_31de28e7_122ceda6024__7c3f.jpg', '1471413628652.jpg', 'jpg', '/photos/1471413628652.jpg', 'Y', null, '1', '2016-08-17 14:00:29', '1', '2016-08-17 14:00:29', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2158', '9a3a4da487a085088de0e342d53deead.jpg@1l.jpg', '1471413789629.jpg', 'jpg', '/photos/1471413789629.jpg', 'Y', null, '1', '2016-08-17 14:03:10', '1', '2016-08-17 14:03:10', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2159', '9a3a4da487a085088de0e342d53deead.jpg@1l.jpg', '1471414024539.jpg', 'jpg', '/photos/1471414024539.jpg', 'Y', null, '1', '2016-08-17 14:07:05', '1', '2016-08-17 14:07:05', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2160', 'QQ图片20160817140623.png', '1471414061095.png', 'png', '/photos/1471414061095.png', 'Y', null, '1', '2016-08-17 14:07:41', '1', '2016-08-17 14:07:41', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2161', 'QQ图片20160817140623.png', '1471414155117.png', 'png', '/photos/1471414155117.png', 'Y', null, '1', '2016-08-17 14:09:15', '1', '2016-08-17 14:09:15', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2162', 'QQ图片20160817140623.png', '1471414344005.png', 'png', '/photos/1471414344005.png', 'Y', null, '1', '2016-08-17 14:12:24', '1', '2016-08-17 14:12:24', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2163', 'QQ图片20160817140623.png', '1471415629618.png', 'png', '/photos/1471415629618.png', 'Y', null, '1', '2016-08-17 14:33:50', '1', '2016-08-17 14:33:50', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2164', 'QQ图片20160817135851.png', '1471415652720.png', 'png', '/photos/1471415652720.png', 'Y', null, '1', '2016-08-17 14:34:13', '1', '2016-08-17 14:34:13', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2165', 'QQ图片20160817140623.png', '1471417779471.png', 'png', '/photos/1471417779471.png', 'Y', null, '1', '2016-08-17 15:09:40', '1', '2016-08-17 15:09:40', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2166', 'QQ图片20160817135851.png', '1471418771970.png', 'png', '/photos/1471418771970.png', 'Y', null, '1', '2016-08-17 15:26:12', '1', '2016-08-17 15:26:12', 'image/png');
INSERT INTO `gxwl_sys_doc` VALUES ('2167', '0df431adcbef76095060ff2328dda3cc7cd99e26.jpg', '1471422766542.jpg', 'jpg', '/photos/1471422766542.jpg', 'Y', null, '1', '2016-08-17 16:32:47', '1', '2016-08-17 16:32:47', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2168', '201607220954510.jpg', '1471425097125.jpg', 'jpg', '/photos/1471425097125.jpg', 'Y', null, '1', '2016-08-17 17:11:37', '1', '2016-08-17 17:11:37', 'image/jpeg');
INSERT INTO `gxwl_sys_doc` VALUES ('2169', '9a3a4da487a085088de0e342d53deead.jpg@1l.jpg', '1471425201428.jpg', 'jpg', '/photos/1471425201428.jpg', 'Y', null, '1', '2016-08-17 17:13:21', '1', '2016-08-17 17:13:21', 'image/jpeg');

-- ----------------------------
-- Table structure for `gxwl_sys_msg`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_msg`;
CREATE TABLE `gxwl_sys_msg` (
  `MSG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息主键',
  `MSG_TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `MSG_BODY` text COMMENT '内容',
  `MSG_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'M--EMAIL\n            D--DESKTOP\n            S--SMS MESSAGE',
  `SEND_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '系统内或系统外',
  `SEND_BY` int(11) DEFAULT NULL COMMENT '发信人',
  `SEND_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发信人地址',
  `IS_SENDED` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否已发送',
  `SENDED_TIME` datetime DEFAULT NULL COMMENT '发送完成时间',
  `FAIL_TIME` datetime DEFAULT NULL COMMENT '发送失败时间',
  `SOURCE_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '来源单据类型',
  `SOURCE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '来源单据编码',
  `SOURCE_ID` int(11) DEFAULT NULL COMMENT '来源单据id',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`MSG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gxwl_sys_msg
-- ----------------------------
INSERT INTO `gxwl_sys_msg` VALUES ('4', 'test', 'asdfasdf', '0', null, '1', null, 'Y', '2014-05-10 16:53:16', null, null, null, null, '1', '2014-05-10 16:53:17', '1', '2014-05-10 16:53:17');
INSERT INTO `gxwl_sys_msg` VALUES ('5', 'qwer', 'qwer', '0', null, null, 'test', 'Y', '2014-05-10 17:15:22', null, null, null, null, '1', '2014-05-10 17:15:22', '1', '2014-05-10 17:15:22');
INSERT INTO `gxwl_sys_msg` VALUES ('6', 'aaadf', 'dafasdfrefzcxv', '0', null, null, 'abc', 'Y', '2014-05-10 17:18:09', null, null, null, null, '1', '2014-05-10 17:18:15', '1', '2014-05-10 17:18:19');
INSERT INTO `gxwl_sys_msg` VALUES ('7', '1', '3', '0', null, '1', null, 'Y', '2014-05-14 13:11:43', null, null, null, null, '1', '2014-05-14 13:11:44', '1', '2014-05-14 13:11:44');

-- ----------------------------
-- Table structure for `gxwl_sys_msg_reciever`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_msg_reciever`;
CREATE TABLE `gxwl_sys_msg_reciever` (
  `RECEIVER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MSG_ID` int(11) DEFAULT NULL COMMENT '消息主键',
  `RECEIVER_BY` int(11) DEFAULT NULL COMMENT '接收人id',
  `RECEIVER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接收人姓名',
  `RECEIVER_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接收类型',
  `RECEIVER_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接收地址',
  `IS_SEND` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否成功发送',
  `SEND_TIME` datetime DEFAULT NULL COMMENT '发送时间',
  `IS_READ` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否已读',
  `READ_TIME` datetime DEFAULT NULL COMMENT '阅读时间',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`RECEIVER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='消息收件人';

-- ----------------------------
-- Records of gxwl_sys_msg_reciever
-- ----------------------------
INSERT INTO `gxwl_sys_msg_reciever` VALUES ('4', '4', null, null, null, 'test', 'Y', '2014-05-10 16:53:17', null, null, '1', '2014-05-10 16:53:17', '1', '2014-05-10 16:53:17');
INSERT INTO `gxwl_sys_msg_reciever` VALUES ('5', '4', null, null, null, 'aa', 'Y', '2014-05-10 16:53:17', null, null, '1', '2014-05-10 16:53:17', '1', '2014-05-10 16:53:17');
INSERT INTO `gxwl_sys_msg_reciever` VALUES ('6', '4', null, null, null, 'bb', 'Y', '2014-05-10 16:53:17', null, null, '1', '2014-05-10 16:53:17', '1', '2014-05-10 16:53:17');
INSERT INTO `gxwl_sys_msg_reciever` VALUES ('7', '5', '1', null, null, '', 'Y', '2014-05-10 17:15:22', null, null, '1', '2014-05-10 17:15:22', '1', '2014-05-10 17:15:22');
INSERT INTO `gxwl_sys_msg_reciever` VALUES ('8', '6', '1', null, null, null, 'Y', '2014-05-10 17:18:46', null, null, '1', '2014-05-10 17:18:50', '1', '2014-05-10 17:18:53');
INSERT INTO `gxwl_sys_msg_reciever` VALUES ('9', '7', null, null, null, 'test', 'Y', '2014-05-14 13:11:44', null, null, '1', '2014-05-14 13:11:44', '1', '2014-05-14 13:11:44');

-- ----------------------------
-- Table structure for `gxwl_sys_operatelog`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_operatelog`;
CREATE TABLE `gxwl_sys_operatelog` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `OPERATE_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '操作类型：登录、查询、修改、删除、插入等',
  `USER_ID` int(11) NOT NULL COMMENT '操作人',
  `LOG_DESC` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '操作说明',
  `OPERATE_TIME` datetime NOT NULL COMMENT '操作时间',
  `ORDER_ID` int(11) DEFAULT NULL COMMENT '记录id',
  `ORDER_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作单号',
  `RESOURCE_ID` int(11) DEFAULT NULL COMMENT '资源ID',
  `MODEL_TYPE` varchar(128) DEFAULT NULL COMMENT '模块类型',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of gxwl_sys_operatelog
-- ----------------------------

-- ----------------------------
-- Table structure for `gxwl_sys_org`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_org`;
CREATE TABLE `gxwl_sys_org` (
  `ORG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '行政组织ID',
  `ORG_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '部门编码',
  `ORG_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '部门名称',
  `ORG_FULLNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '部门全称',
  `PARENT_ORGID` int(11) DEFAULT NULL COMMENT '上级部门ID',
  `MANA_POSITION` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '主管岗位',
  `ORG_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '部门地址',
  `LINKMAN` int(11) DEFAULT NULL COMMENT '联系人',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮件地址',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `WEBURL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '公网地址',
  `FULLPATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全路径',
  `ORGTYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '部门类型',
  `ORGDETAILTYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '部门小类',
  `LINKTEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `ISLEAF` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否叶子节点,失效',
  `VALID_DATE` date NOT NULL COMMENT '生效日期',
  `INVALID_DATE` date DEFAULT NULL COMMENT '失效日期',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `DEL_SIGN` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ORG_ID`),
  KEY `UI_GXWL_SYS_ORG01` (`ORG_CODE`),
  KEY `FK_58sb3b2n9b5moiglb5xnj4soy` (`CREATE_BY`),
  KEY `FK_4kxwe6u1xnpbrxnd7dc3f51a4` (`LAST_UPDATE_BY`),
  KEY `FK_dvlusgf7xbvehak9iaglw4m2v` (`LINKMAN`),
  CONSTRAINT `FK_4kxwe6u1xnpbrxnd7dc3f51a4` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_58sb3b2n9b5moiglb5xnj4soy` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_dvlusgf7xbvehak9iaglw4m2v` FOREIGN KEY (`LINKMAN`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='行政组织表';

-- ----------------------------
-- Records of gxwl_sys_org
-- ----------------------------
INSERT INTO `gxwl_sys_org` VALUES ('1', 'XCQ', '青海', '青海', null, '', '', null, '', '', '', '1.', null, null, null, 'N', '2016-04-27', null, '1', '2015-04-29 21:10:31', '1', '2016-04-27 16:32:44', null);
INSERT INTO `gxwl_sys_org` VALUES ('73', 'XYJD', '西一路街道', '西一路街道', '1', '', '', null, '', '', '', '1.73.', null, null, null, 'N', '2016-03-10', null, '1', '2016-03-10 16:19:46', '1', '2016-03-10 16:29:04', null);
INSERT INTO `gxwl_sys_org` VALUES ('74', 'CLZLJD', '长乐中路街道', '长乐中路街道', '1', '', '', null, '', '', '', '1.74.', null, null, null, 'N', '2016-03-10', null, '1', '2016-03-10 16:20:09', '1', '2016-03-10 16:46:25', null);
INSERT INTO `gxwl_sys_org` VALUES ('75', 'ZSMJD', '中山门街道', '中山门街道', '1', '', '', null, '', '', '', '1.75.', null, null, null, 'N', '2016-05-11', null, '1', '2016-03-10 16:20:27', '1', '2016-05-11 17:50:58', null);
INSERT INTO `gxwl_sys_org` VALUES ('76', 'HSSJD', '韩森寨街道', '韩森寨街道', '1', '', '', null, '', '', '', '1.76.', null, null, null, 'N', '2016-03-10', null, '1', '2016-03-10 16:21:15', '1', '2016-03-10 17:02:46', null);
INSERT INTO `gxwl_sys_org` VALUES ('77', 'JFMJD', '解放门街道', '解放门街道', '1', '', '', null, '', '', '', '1.77.', null, null, null, 'N', '2016-03-10', null, '1', '2016-03-10 16:22:14', '1', '2016-03-10 17:06:03', null);
INSERT INTO `gxwl_sys_org` VALUES ('78', 'ZQLJD', '自强路街道', '自强路街道', '1', '', '', null, '', '', '', '1.78.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:22:33', '1', '2016-03-10 16:22:33', null);
INSERT INTO `gxwl_sys_org` VALUES ('79', 'THLJD', '太华路街道', '太华路街道', '1', '', '', null, '', '', '', '1.79.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:23:52', '1', '2016-03-10 16:23:52', null);
INSERT INTO `gxwl_sys_org` VALUES ('80', 'CLXJD', '长乐西路街道', '长乐西路街道', '1', '', '', null, '', '', '', '1.80.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:24:31', '1', '2016-03-10 16:24:31', null);
INSERT INTO `gxwl_sys_org` VALUES ('81', 'HJMJD', '胡家庙街道', '胡家庙街道', '1', '', '', null, '', '', '', '1.81.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:25:05', '1', '2016-03-10 16:25:05', null);
INSERT INTO `gxwl_sys_org` VALUES ('82', 'TD', '同德', '青海 西一路街道 同德', '73', '', '', null, '', '', '', '1.73.82.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:29:04', '1', '2016-03-10 16:29:04', null);
INSERT INTO `gxwl_sys_org` VALUES ('83', 'XM', '新民', '新民', '73', '', '', null, '', '', '', '1.73.83.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:31:21', '1', '2016-03-10 16:31:21', null);
INSERT INTO `gxwl_sys_org` VALUES ('84', 'XL', '兴乐', '兴乐', '73', '', '', null, '', '', '', '1.73.84.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:31:51', '1', '2016-03-10 16:31:51', null);
INSERT INTO `gxwl_sys_org` VALUES ('85', 'XSL', '西三路', '西三路', '73', '', '', null, '', '', '', '1.73.85.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:42:14', '1', '2016-03-10 16:42:14', null);
INSERT INTO `gxwl_sys_org` VALUES ('86', 'SP', '尚平', '尚平', '73', '', '', null, '', '', '', '1.73.86.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:45:44', '1', '2016-03-10 16:45:45', null);
INSERT INTO `gxwl_sys_org` VALUES ('87', 'KL', '昆仑', '昆仑', '74', '', '', null, '', '', '', '1.74.87.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:46:25', '1', '2016-03-10 16:46:25', null);
INSERT INTO `gxwl_sys_org` VALUES ('88', 'HH', '黄河', '黄河', '74', '', '', null, '', '', '', '1.74.88.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:47:24', '1', '2016-03-10 16:47:24', null);
INSERT INTO `gxwl_sys_org` VALUES ('89', 'HS', '华山', '华山', '74', '', '', null, '', '', '', '1.74.89.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:48:29', '1', '2016-03-10 16:48:29', null);
INSERT INTO `gxwl_sys_org` VALUES ('90', 'KL', '康乐', '康乐', '74', '', '', null, '', '', '', '1.74.90.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:48:47', '1', '2016-03-10 16:48:47', null);
INSERT INTO `gxwl_sys_org` VALUES ('91', 'XY', '向阳', '向阳', '74', '', '', null, '', '', '', '1.74.91.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:51:49', '1', '2016-03-10 16:51:49', null);
INSERT INTO `gxwl_sys_org` VALUES ('92', 'XF', '新风', '新风', '75', '', '', null, '', '', '', '1.75.92.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:52:53', '1', '2016-03-10 16:55:59', null);
INSERT INTO `gxwl_sys_org` VALUES ('94', 'XZ', '新中', '新中', '75', '', '', null, '', '', '', '1.75.94.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:56:08', '1', '2016-03-10 16:56:08', null);
INSERT INTO `gxwl_sys_org` VALUES ('95', 'DX', '东新', '东新', '75', '', '', null, '', '', '', '1.75.95.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:56:56', '1', '2016-03-10 16:56:57', null);
INSERT INTO `gxwl_sys_org` VALUES ('96', 'QCG', '群策巷', '群策巷', '75', '', '', null, '', '', '', '1.75.96.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 16:58:16', '1', '2016-03-10 16:58:16', null);
INSERT INTO `gxwl_sys_org` VALUES ('97', 'XD', '咸东', '咸东', '76', '', '', null, '', '', '', '1.76.97.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 17:02:46', '1', '2016-03-10 17:02:46', null);
INSERT INTO `gxwl_sys_org` VALUES ('98', 'AM', '爱民', '爱民', '76', '', '', null, '', '', '', '1.76.98.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 17:03:15', '1', '2016-03-10 17:03:15', null);
INSERT INTO `gxwl_sys_org` VALUES ('99', 'DBL', '东八路', '东八路', '77', '', '', null, '', '', '', '1.77.99.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 17:06:03', '1', '2016-03-10 17:06:03', null);
INSERT INTO `gxwl_sys_org` VALUES ('100', 'SDM', '尚德门', '尚德门', '77', '', '', null, '', '', '', '1.77.100.', null, null, null, 'Y', '2016-03-10', null, '1', '2016-03-10 17:09:26', '1', '2016-03-10 17:09:26', null);

-- ----------------------------
-- Table structure for `gxwl_sys_orguser`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_orguser`;
CREATE TABLE `gxwl_sys_orguser` (
  `RELA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `ORG_ID` int(11) DEFAULT NULL COMMENT '行政组织ID',
  `IS_MAIN` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否主要：Y/N',
  `IS_MANAGE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否主要：Y/N',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`RELA_ID`),
  KEY `UI_GXWL_SYS_ORGUSER01` (`USER_ID`,`ORG_ID`),
  KEY `FK_kvotlbghs52eiqglcuwme85bq` (`CREATE_BY`),
  KEY `FK_etoq3y03cl5t3v6bf713d32d8` (`LAST_UPDATE_BY`),
  CONSTRAINT `FK_etoq3y03cl5t3v6bf713d32d8` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_kvotlbghs52eiqglcuwme85bq` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='行政组织与人员关系表';

-- ----------------------------
-- Records of gxwl_sys_orguser
-- ----------------------------
INSERT INTO `gxwl_sys_orguser` VALUES ('1', '1', '2', null, null, '1', '2013-12-26 00:00:00', '1', '2013-12-26 00:00:00');
INSERT INTO `gxwl_sys_orguser` VALUES ('2', '29', '30', 'Y', 'Y', '1', '2013-12-26 00:00:00', '1', '2014-06-30 11:04:46');
INSERT INTO `gxwl_sys_orguser` VALUES ('3', '6', '30', 'Y', 'Y', '1', '2013-12-26 00:00:00', '1', '2014-06-30 11:04:46');
INSERT INTO `gxwl_sys_orguser` VALUES ('6', '68', '58', null, null, '1', '2013-12-26 00:00:00', '1', '2013-12-26 00:00:00');
INSERT INTO `gxwl_sys_orguser` VALUES ('12', '94', '25', 'N', 'N', '1', '2014-08-01 10:28:11', '1', '2014-08-01 10:28:11');
INSERT INTO `gxwl_sys_orguser` VALUES ('13', '95', '25', 'N', 'N', '1', '2014-08-01 10:28:11', '1', '2014-08-01 10:28:11');
INSERT INTO `gxwl_sys_orguser` VALUES ('14', '66', '81', 'Y', 'Y', '1', '2016-03-29 09:54:49', '1', '2016-03-29 09:54:52');
INSERT INTO `gxwl_sys_orguser` VALUES ('15', '80', '75', 'N', 'N', '1', '2016-04-05 15:41:05', '1', '2016-05-11 17:50:58');
INSERT INTO `gxwl_sys_orguser` VALUES ('16', '79', '1', 'N', 'N', '1', '2016-04-21 17:01:47', '1', '2016-04-27 16:32:44');
INSERT INTO `gxwl_sys_orguser` VALUES ('17', '81', '1', 'N', 'N', '1', '2016-04-21 17:01:47', '1', '2016-04-27 16:32:44');
INSERT INTO `gxwl_sys_orguser` VALUES ('18', '119', '1', 'N', 'N', '1', '2016-04-21 17:01:47', '1', '2016-04-27 16:32:44');
INSERT INTO `gxwl_sys_orguser` VALUES ('19', '29', '2', null, 'Y', '1', '2016-04-22 17:43:55', '1', '2016-04-22 17:43:58');

-- ----------------------------
-- Table structure for `gxwl_sys_resource`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_resource`;
CREATE TABLE `gxwl_sys_resource` (
  `RESOURCE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `RESOURCE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资源编码',
  `RESOURCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资源名称',
  `RESOURCE_LABEL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资源显示标题',
  `PARENT_RESOURCE_ID` int(11) DEFAULT NULL COMMENT '父ID',
  `RESOURCE_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资源类型',
  `SEQ` int(11) DEFAULT NULL COMMENT '显示顺序',
  `URL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'URL',
  `IMAGE_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '菜单图片路径',
  `OPEN_MODE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '打开方式',
  `FULLPATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全路径',
  `IS_BRANCH` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否分支节点',
  `ENABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '是否有效',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `SYSTEM_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '系统类型',
  `RESOURCE_DESC` text COMMENT '资源说明',
  `REMARK` text COMMENT '备注',
  PRIMARY KEY (`RESOURCE_ID`),
  UNIQUE KEY `UI_GXWL_SYS_RESOURCE01` (`RESOURCE_CODE`),
  KEY `FK_co0d2bga1ng9qgeqnt7kbxal8` (`CREATE_BY`),
  KEY `FK_cpe0e521i1mh0il8v2klqhs6m` (`LAST_UPDATE_BY`),
  CONSTRAINT `FK_co0d2bga1ng9qgeqnt7kbxal8` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_cpe0e521i1mh0il8v2klqhs6m` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8 COMMENT='资源配置';

-- ----------------------------
-- Records of gxwl_sys_resource
-- ----------------------------
INSERT INTO `gxwl_sys_resource` VALUES ('1', 'SYS', '系统管理', '系统管理', null, 'module', '20', '/sys', 'fa fa-cog', '', '1.', 'Y', 'Y', '1', '2014-02-10 15:12:12', '1', '2016-05-13 17:23:43', '', '系统管理', '');
INSERT INTO `gxwl_sys_resource` VALUES ('2', 'RESOURCE_LIST', '资源管理', '资源管理', '1', 'menu', '0', '/resource/list', 'fa fa-cubes', '', '1.2.', 'N', 'Y', '1', '2014-02-10 15:12:12', '1', '2016-04-01 15:59:03', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('3', 'USER_LIST', '用户管理', '用户管理', '1', 'menu', '5', '/user/list', 'fa fa-user', '', '1.3.', 'Y', 'Y', '1', '2014-02-11 09:34:26', '1', '2016-03-31 16:32:12', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('5', 'a3', '角色管理', '角色管理', '1', 'menu', '10', '/role/list', 'fa fa-users', '', '1.5.', 'N', 'Y', '1', '2014-02-11 14:27:45', '1', '2016-03-31 16:32:24', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('45', 'a4', '组织管理', '组织管理', '1', 'menu', '15', '/org/list', 'fa fa-sitemap', '', '1.45.', 'N', 'Y', '1', '2014-02-20 14:57:09', '1', '2016-04-09 13:53:14', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('65', 'USER_ADD', '新增', '新增', '3', 'button', '0', '', '', '', '1.3.65.', 'N', 'Y', '1', '2014-05-05 09:46:44', '1', '2014-05-05 15:23:47', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('67', 'USER_DEL', '删除', '删除', '3', 'button', '5', '', '', '', '1.3.67.', 'N', 'N', '1', '2014-05-05 09:52:01', '1', '2014-08-15 14:56:06', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('68', 'USER_EDIT', '修改', '修改', '3', 'button', '10', '', '', '', '1.3.68.', 'N', 'Y', '1', '2014-05-06 10:12:50', '1', '2014-05-06 10:12:50', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('71', 'USER_SAVE', '保存', '保存', '3', 'button', '15', '', '', '', '1.3.71.', 'N', 'Y', '1', '2014-05-22 17:08:35', '1', '2014-05-22 17:08:44', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('72', 'USER_RESETPASSWORD', '重置密码', '重置密码', '3', 'button', '20', '', '', '', '1.3.72.', 'N', 'Y', '1', '2014-05-23 11:51:43', '1', '2014-05-23 11:51:43', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('73', 'USER_PWD', '修改密码', '修改密码', '1', 'menu', '30', '/user/modifyPwd', 'fa fa-key', '', '1.73.', 'N', 'Y', '1', '2014-06-27 10:17:37', '1', '2016-03-31 16:32:58', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('74', 'DICT_LIST', '字典管理', '字典管理', '1', 'menu', '35', '/dict/list', 'fa fa-book', '', '1.74.', 'N', 'Y', '1', '2014-07-02 11:48:03', '1', '2016-03-31 16:33:20', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('142', 'LOG_LIST', '操作日志', '操作日志', '1', 'menu', '25', '/operatelog/list', 'fa fa-cogs', '', '1.142.', 'N', 'Y', '1', '2014-07-28 18:00:08', '1', '2016-03-31 16:31:17', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('192', 'CV_LIST', 'App版本管理', '版本管理', '1', 'menu', '45', '/clientversion/list', 'fa fa-road', '', '1.192.', 'N', 'Y', '1', '2014-08-13 16:19:11', '1', '2016-03-31 16:35:25', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('193', 'cue_card', '红黄牌时效设置', '红黄牌时效设置', '1', 'menu', '42', '', 'fa fa-warning', '', '1.193.', 'N', 'N', '1', '2016-01-13 10:46:38', '1', '2016-04-19 09:46:31', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('194', 'BM', '基础数据', '基础数据', null, 'module', '1', '/main/bm', 'fa fa-database', '', '194.', 'Y', 'Y', '1', '2016-01-13 10:48:05', '1', '2016-07-19 11:12:11', '', '基础数据', '');
INSERT INTO `gxwl_sys_resource` VALUES ('195', 'SW', '服务办事', '服务办事', null, 'module', '2', '/main/sw', 'fa fa-wrench', '', '195.', 'Y', 'Y', '1', '2016-01-13 10:56:58', '1', '2016-05-19 17:51:21', '', '服务办事', '');
INSERT INTO `gxwl_sys_resource` VALUES ('196', 'ER', '经济运行', '经济运行', null, 'module', '3', '/main/er', 'fa fa-line-chart', '', '196.', 'Y', 'Y', '1', '2016-01-13 11:03:43', '1', '2016-05-19 17:48:38', '', '经济运行', '');
INSERT INTO `gxwl_sys_resource` VALUES ('197', 'ES', '考核督办', '考核督办', null, 'module', '4', '/main/es', 'fa fa-balance-scale', '', '197.', 'Y', 'Y', '1', '2016-01-13 11:04:38', '1', '2016-04-05 10:27:19', null, '考核督办', null);
INSERT INTO `gxwl_sys_resource` VALUES ('198', 'CC', '指挥中心', '指挥中心', null, 'module', '5', '/main/cc', 'fa fa-flag', '', '198.', 'Y', 'Y', '1', '2016-01-13 11:05:31', '1', '2016-07-21 11:39:28', '', '指挥中心', '');
INSERT INTO `gxwl_sys_resource` VALUES ('199', 'EM', '应急管理', '应急管理', null, 'module', '6', '/main/em', 'fa fa-exclamation', '', '199.', 'Y', 'Y', '1', '2016-01-13 11:06:01', '1', '2016-04-05 10:28:43', null, '应急管理', null);
INSERT INTO `gxwl_sys_resource` VALUES ('200', 'AD', '辅助决策', '辅助决策', null, 'module', '7', '/main/ad', 'fa fa-group', '', '200.', 'Y', 'Y', '1', '2016-01-13 11:06:37', '1', '2016-04-26 14:37:46', null, '辅助决策', null);
INSERT INTO `gxwl_sys_resource` VALUES ('203', 'BM_Community', '社区信息', '社区信息', '194', 'menu', '0', '', '', '', '194.203.', 'Y', 'Y', '1', '2016-01-13 11:14:46', '1', '2016-01-13 11:30:57', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('204', 'BM_Party', '党群建设', '党群建设', '194', 'menu', '1', '', '', '', '194.204.', 'Y', 'Y', '1', '2016-01-13 11:16:05', '1', '2016-01-13 11:56:21', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('205', 'BM_PF', '人口计生', '人口计生', '194', 'menu', '2', '', '', '', '194.205.', 'Y', 'Y', '1', '2016-01-13 11:16:47', '1', '2016-04-08 11:57:10', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('206', 'BM_SP', '特殊人群', '特殊人群', '194', 'menu', '3', '', '', '', '194.206.', 'Y', 'Y', '1', '2016-01-13 11:17:45', '1', '2016-01-13 14:41:13', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('207', 'BM_SCA', '民政优抚', '民政优抚', '194', 'menu', '4', '', '', '', '194.207.', 'Y', 'Y', '1', '2016-01-13 11:19:55', '1', '2016-01-14 13:53:37', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('208', 'BM_CT', '综合治理', '综合治理', '194', 'menu', '5', '', '', '', '194.208.', 'Y', 'Y', '1', '2016-01-13 11:20:34', '1', '2016-01-14 13:53:42', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('209', 'BM_LSS', '劳动保障', '劳动保障', '194', 'menu', '6', '', '', '', '194.209.', 'Y', 'Y', '1', '2016-01-13 11:22:01', '1', '2016-05-09 11:13:39', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('210', 'BM_PS', '公共安全', '公共安全', '194', 'menu', '7', '', '', '', '194.210.', 'Y', 'Y', '1', '2016-01-13 11:23:12', '1', '2016-04-23 17:21:56', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('211', 'BM_Volunteering', '志愿服务', '志愿服务', '194', 'menu', '8', '', '', '', '194.211.', 'Y', 'Y', '1', '2016-01-13 11:24:08', '1', '2016-01-13 17:23:55', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('214', 'BM_Community_Mesh', '社区网格', '社区网格', '203', 'menu', '0', '/mesh/list', 'fa fa-star', '', '194.203.214.', 'N', 'Y', '1', '2016-01-13 11:30:57', '1', '2016-04-22 10:04:46', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('215', 'BM_Community_Community', '小区信息', '小区信息', '203', 'menu', '1', '/community/list', 'fa fa-reddit-alien', '', '194.203.215.', 'N', 'Y', '1', '2016-01-13 11:42:16', '1', '2016-04-06 17:24:59', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('217', 'BM_Community_Building', '楼栋信息', '楼栋信息', '203', 'menu', '2', '/buildingmsg/list', 'fa fa-building', '', '194.203.217.', 'N', 'Y', '1', '2016-01-13 11:46:43', '1', '2016-05-13 16:08:45', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('218', 'BM_Community_House', '房屋信息', '房屋信息', '203', 'menu', '3', '/house/list', 'fa fa-home', '', '194.203.218.', 'N', 'Y', '1', '2016-01-13 11:47:57', '1', '2016-04-08 10:53:35', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('219', 'BM_Community_People', '人口信息', '人口信息', '203', 'menu', '4', '/householder/list', 'fa fa-renren', '', '194.203.219.', 'N', 'Y', '1', '2016-01-13 11:49:38', '1', '2016-04-08 11:08:59', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('220', 'BM_Community_Units', '单位信息', '单位信息', '203', 'menu', '5', '/units/list', 'fa fa-industry', '', '194.203.220.', 'N', 'Y', '1', '2016-01-13 11:52:39', '1', '2016-04-15 13:19:20', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('221', 'BM_Community_School', '学校信息', '学校信息', '203', 'menu', '9', '/school/list', 'fa fa-graduation-cap', '', '194.203.221.', 'N', 'Y', '1', '2016-01-13 11:53:50', '1', '2016-04-08 11:40:45', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('222', 'BM_Community_Hospital', '医院信息', '医院信息', '203', 'menu', '10', '/hospital/list', 'fa fa-hospital-o', '', '194.203.222.', 'N', 'Y', '1', '2016-01-13 11:54:58', '1', '2016-04-08 17:42:58', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('223', 'BM_Party_Organization', '党组织信息', '党组织信息', '204', 'menu', '0', '/partyorg/list', 'fa fa-flag', '', '194.204.223.', 'N', 'Y', '1', '2016-01-13 11:56:21', '1', '2016-04-08 11:47:05', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('224', 'BM_Party_Member', '党员信息', '党员信息', '204', 'menu', '1', '/partymember/list', 'fa fa-star', '', '194.204.224.', 'N', 'Y', '1', '2016-01-13 11:57:24', '1', '2016-04-08 11:47:38', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('225', 'BM_Party_GuildOrgan', '工会组织信息', '工会组织信息', '204', 'menu', '2', '/guildorganinfo/list', 'fa fa-object-group', '', '194.204.225.', 'N', 'Y', '1', '2016-01-13 11:58:53', '1', '2016-04-08 11:48:11', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('227', 'BM_Party_League_Member', '团员信息', '团员信息', '204', 'menu', '4', '/member/list', 'fa fa-star-half-o', '', '194.204.227.', 'N', 'Y', '1', '2016-01-13 13:14:16', '1', '2016-04-08 11:49:12', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('230', 'BM_Party_inspect', '纪检信息', '纪检信息', '204', 'menu', '5', '/inspectmsg/list', 'fa fa-check-square', '', '194.204.230.', 'N', 'Y', '1', '2016-01-13 13:53:46', '1', '2016-04-08 11:51:20', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('231', 'BM_Party_Federation', '妇联信息', '妇联信息', '204', 'menu', '6', '/woman/list', 'fa fa-heart', '', '194.204.231.', 'N', 'Y', '1', '2016-01-13 14:01:41', '1', '2016-04-08 11:55:06', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('232', 'BM_PF_Women', '育龄妇女', '育龄妇女', '205', 'menu', '1', '/householder/fertileWoman', 'fa fa-female', '', '194.205.232.', 'N', 'Y', '1', '2016-01-13 14:08:05', '1', '2016-04-14 18:03:05', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('233', 'BM_PF_Birth', '生育证', '生育证', '205', 'menu', '1', '/birthCertificate/list', 'fa fa-credit-card', '', '194.205.233.', 'N', 'Y', '1', '2016-01-13 14:12:46', '1', '2016-04-08 11:59:48', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('234', 'BM_PF_Certificate', '流动人口婚育证', '流动人口婚育证', '205', 'menu', '2', '/ldrkhyz/list', 'fa fa-credit-card', '', '194.205.234.', 'N', 'Y', '1', '2016-01-13 14:21:54', '1', '2016-04-08 11:59:54', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('235', 'BM_PF_Contraceptives', '药具发放', '药具发放', '205', 'menu', '3', '/drugGrant/list', 'fa fa-medkit', '', '194.205.235.', 'N', 'Y', '1', '2016-01-13 14:27:13', '1', '2016-04-08 13:10:53', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('237', 'BM_SP_Children', '留守儿童', '留守儿童', '206', 'menu', '0', '/children/list', 'fa fa-child', '', '194.206.237.', 'N', 'Y', '1', '2016-01-13 14:41:13', '1', '2016-04-13 10:53:11', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('238', 'BM_SP_Juvenile', '违法青少年', '违法青少年', '206', 'menu', '1', '/wfjl/list', 'fa fa-odnoklassniki-square', '', '194.206.238.', 'N', 'Y', '1', '2016-01-13 14:46:51', '1', '2016-04-13 11:23:37', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('239', 'BM_SP_Heresy', '从事邪教人员', '从事邪教人员', '206', 'menu', '2', '/csxjry/list', 'fa fa-drupal', '', '194.206.239.', 'N', 'Y', '1', '2016-01-13 14:49:17', '1', '2016-04-13 13:56:14', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('240', 'executed', '服刑人员', '服刑人员', '206', 'menu', '3', '/fxry/list', 'fa fa-product-hunt', '', '194.206.240.', 'N', 'Y', '1', '2016-01-13 15:03:04', '1', '2016-04-14 15:02:06', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('241', 'BM_SP_Drug', '吸毒人员', '吸毒人员', '206', 'menu', '3', '/xdry/list', 'fa fa-fire', '', '194.206.241.', 'N', 'Y', '1', '2016-01-13 15:05:10', '1', '2016-04-13 14:44:39', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('242', 'BM_SP_Correctiontarget', '社区矫正对象', '社区矫正对象', '206', 'menu', '6', '/sqjzdx/list', 'fa fa-exclamation-triangle', '', '194.206.242.', 'N', 'Y', '1', '2016-01-13 15:14:37', '1', '2016-04-14 15:08:08', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('243', 'BM_SCA_LowSecurity', '低保人员', '低保人员', '207', 'menu', '0', '/lowpeople/list', 'fa fa-renren', '', '194.207.243.', 'N', 'Y', '1', '2016-01-13 15:25:20', '1', '2016-04-14 16:47:05', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('244', 'BM_SCA_Consoling', '优抚人员', '优抚人员', '207', 'menu', '1', '/comfort/list', 'fa fa-gratipay', '', '194.207.244.', 'N', 'Y', '1', '2016-01-13 15:29:02', '1', '2016-04-14 16:59:42', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('245', 'BM_SCA_Beneficiaries', '五保供养', '五保供养', '207', 'menu', '2', '/wbgy/list', 'fa fa-renren', '', '194.207.245.', 'N', 'Y', '1', '2016-01-13 15:29:55', '1', '2016-04-12 17:13:42', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('246', 'BM_SCA_Elderly', '老年人信息', '老年人信息', '207', 'menu', '3', '/oldpeople/list', 'fa fa-odnoklassniki', '', '194.207.246.', 'N', 'Y', '1', '2016-01-13 15:36:12', '1', '2016-04-20 20:31:17', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('247', 'BM_SCA_Handicapped', '残疾人', '残疾人', '207', 'menu', '4', '/handicappedPeople/list', 'fa fa-wheelchair', '', '194.207.247.', 'N', 'Y', '1', '2016-01-13 15:38:10', '1', '2016-04-14 17:19:20', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('248', 'BM_SCA_Orphan', '孤儿', '孤儿', '207', 'menu', '5', '/orphan/list', 'fa fa-child', '', '194.207.248.', 'N', 'Y', '1', '2016-01-13 15:43:54', '1', '2016-04-14 17:20:49', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('249', 'BM_CT_Judiciary', '司法事件管理', '司法事件管理', '208', 'menu', '0', '/judical/list', 'fa fa-user-secret', '', '194.208.249.', 'N', 'Y', '1', '2016-01-13 15:51:34', '1', '2016-04-08 15:04:48', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('250', 'BM_CT_Petition', '信访事件管理', '信访事件管理', '208', 'menu', '1', '/petition/list', 'fa fa-envelope-square', '', '194.208.250.', 'N', 'Y', '1', '2016-01-13 15:56:06', '1', '2016-04-08 15:05:22', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('251', 'BM_CT_Cause', '案发情况', '案发情况', '208', 'menu', '2', '/case/list', 'fa fa-exclamation-circle', '', '194.208.251.', 'N', 'Y', '1', '2016-01-13 15:58:48', '1', '2016-04-08 15:05:58', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('252', 'BM_CT_Patrol', '巡防队信息', '巡防队信息', '208', 'menu', '3', '/patrol/list', 'fa fa-users', '', '194.208.252.', 'N', 'Y', '1', '2016-01-13 16:04:57', '1', '2016-04-08 15:07:01', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('253', 'BM_CT_Safety', '技防信息', '技防信息', '208', 'menu', '4', '/safety/list', 'fa fa-video-camera', '', '194.208.253.', 'N', 'Y', '1', '2016-01-13 16:06:13', '1', '2016-04-08 15:25:01', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('254', 'BM_CT_Room', '值班室信息', '值班室信息', '208', 'menu', '5', '/duryroom/list', 'fa fa-fax', '', '194.208.254.', 'N', 'Y', '1', '2016-01-13 16:08:14', '1', '2016-04-08 15:08:44', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('256', 'BM_LSS_Train', '培训', '培训', '209', 'menu', '0', '/cultivate/list', 'fa fa-creative-commons', '', '194.209.256.', 'N', 'Y', '1', '2016-01-13 16:10:15', '1', '2016-05-17 17:42:49', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('257', 'BM_LSS_Socialinfo', '社保信息', '社保信息', '209', 'menu', '1', '/socialinfo/list', 'fa fa-umbrella', '', '194.209.257.', 'N', 'Y', '1', '2016-01-13 16:12:24', '1', '2016-05-18 14:20:51', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('258', 'BM_LSS_Medicare', '医保信息', '医保信息', '209', 'menu', '2', '/healthinSuranceinfo/list', 'fa fa-umbrella', '', '194.209.258.', 'N', 'Y', '1', '2016-01-13 16:13:44', '1', '2016-05-18 20:07:01', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('259', 'BM_LSS_Worker', '单位招聘', '单位招聘', '209', 'menu', '3', '/recruitment/list', 'fa fa-user-plus', '', '194.209.259.', 'N', 'Y', '1', '2016-01-13 16:31:56', '1', '2016-04-08 15:11:34', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('260', 'BM_LSS_Job', '求职登记', '求职登记', '209', 'menu', '4', '/jobRegistration/list', 'fa fa-search', '', '194.209.260.', 'N', 'Y', '1', '2016-01-13 16:45:38', '1', '2016-04-08 15:12:11', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('261', 'BM_LSS_Unemployment', '失业证办理', '失业证办理', '209', 'menu', '5', '/unemployment/list', 'fa fa-credit-card', '', '194.209.261.', 'N', 'Y', '1', '2016-01-13 16:47:21', '1', '2016-04-08 15:13:07', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('262', 'BM_LSS_Business', '创业商户', '创业商户', '209', 'menu', '6', '/entrepreneurShip/list', 'fa fa-industry', '', '194.209.262.', 'N', 'Y', '1', '2016-01-13 16:53:19', '1', '2016-04-08 15:14:18', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('263', 'BM_LSS_Star', '创业之星', '创业之星', '209', 'menu', '7', '/entrepreneurStar/list', 'fa fa-star', '', '194.209.263.', 'N', 'Y', '1', '2016-01-13 17:06:21', '1', '2016-04-08 15:13:35', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('264', 'BM_LSS_Loan', '小额担保贷款', '小额担保贷款', '209', 'menu', '8', '/guaranteedLoan/list', 'fa fa-money', '', '194.209.264.', 'N', 'Y', '1', '2016-01-13 17:07:12', '1', '2016-04-08 15:14:44', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('265', 'BM_PS_Saproduction', '企业安全', '企业安全', '210', 'menu', '0', '/enterpriseSafety/list', 'fa fa-fire', '', '194.210.265.', 'N', 'Y', '1', '2016-01-13 17:08:19', '1', '2016-04-08 16:50:35', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('266', 'BM_PS_Cofire', '消防信息', '消防信息', '210', 'menu', '1', '/fireControl/list', 'fa fa-fire-extinguisher', '', '194.210.266.', 'N', 'Y', '1', '2016-01-13 17:09:23', '1', '2016-04-08 15:26:06', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('268', 'BM_PS_Pusecurity', '治安信息', '治安信息', '210', 'menu', '2', '/puSecurity/list', 'fa fa-eye', '', '194.210.268.', 'N', 'Y', '1', '2016-01-13 17:13:31', '1', '2016-04-08 15:37:24', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('269', 'BM_PS_FoodSafe', '食品安全', '食品安全', '210', 'menu', '3', '/foodSafety/list', 'fa fa-cutlery', '', '194.210.269.', 'N', 'Y', '1', '2016-01-13 17:14:25', '1', '2016-04-08 15:37:48', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('270', 'BM_PS_Sacampus', '校园安全', '校园安全', '210', 'menu', '4', '/campusSafety/list', 'fa fa-graduation-cap', '', '194.210.270.', 'N', 'Y', '1', '2016-01-13 17:19:10', '1', '2016-04-08 15:38:10', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('271', 'BM_PS_HospitalDisputes', '医疗纠纷', '医疗纠纷', '210', 'menu', '5', '/hoDisputes/list', 'fa fa-stethoscope', '', '194.210.271.', 'N', 'Y', '1', '2016-01-13 17:21:59', '1', '2016-04-08 17:44:33', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('272', 'BM_Volunteering_Team', '志愿者服务队伍', '志愿者服务队伍', '211', 'menu', '0', '/volunteer/list', 'fa fa-users', '', '194.211.272.', 'N', 'Y', '1', '2016-01-13 17:23:55', '1', '2016-04-21 10:30:18', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('273', 'BM_Volunteering_Volunteer', '志愿者', '志愿者', '211', 'menu', '1', '/householder/volunteerPage', 'fa fa-user', '', '194.211.273.', 'N', 'Y', '1', '2016-01-13 17:24:44', '1', '2016-04-23 12:32:13', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('274', 'SW_Type', '事件类别管理', '事件类别管理', '195', 'menu', '0', '/eventType/list', 'fa fa-sitemap', '', '195.274.', 'N', 'Y', '1', '2016-01-13 17:26:26', '1', '2016-04-20 16:27:13', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('275', 'SW_Team', '服务团队', '服务团队', '195', 'menu', '1', '/serviceTeam/list', 'fa fa-users', '', '195.275.', 'N', 'Y', '1', '2016-01-13 17:26:49', '1', '2016-04-27 15:47:39', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('276', 'SW_Sinking_Person', '下沉人员管理', '下沉人员管理', '195', 'menu', '1', '/xiachenrenyuan/list', 'fa fa-user', '', '195.276.', 'N', 'N', '1', '2016-01-13 17:30:48', '1', '2016-04-23 14:26:42', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('277', 'SW_Register', '事件登记', '事件登记', '195', 'menu', '3', '/eventEnroll/list', 'fa fa-briefcase', '', '195.277.', 'N', 'Y', '1', '2016-01-13 17:31:35', '1', '2016-04-22 11:13:44', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('278', 'SW_Diary', '民情日记', '民情日记', '195', 'menu', '4', '/conditionsDiary/list', 'fa fa-pencil-square-o', '', '195.278.', 'N', 'Y', '1', '2016-01-13 17:32:38', '1', '2016-04-27 15:47:53', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('279', 'ER_Investment', '项目招商', '项目招商', '196', 'menu', '0', '/proInvest/list', 'fa fa-university', '', '196.279.', 'N', 'Y', '1', '2016-01-13 17:34:49', '1', '2016-04-08 17:58:23', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('280', 'ER_Construction', '项目建设', '项目建设', '196', 'menu', '1', '/proBuild/list', 'fa fa-gavel', '', '196.280.', 'N', 'Y', '1', '2016-01-13 17:35:35', '1', '2016-04-09 09:35:25', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('281', 'ER_Risk_Assessment', '项目风险评估', '项目风险评估', '196', 'menu', '2', '/risk/list', 'fa fa-exclamation-triangle', '', '196.281.', 'N', 'Y', '1', '2016-01-13 17:36:38', '1', '2016-04-08 18:01:44', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('282', 'ES_Knowledge', '考核制度', '考核制度', '197', 'menu', '0', '/knowledge/list/examine', 'fa fa-book', '', '197.282.', 'N', 'Y', '1', '2016-01-13 17:37:21', '1', '2016-04-19 09:12:22', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('287', 'ES_Supervision', '事件督办', '事件督办', '197', 'menu', '5', '/oversee/list', 'fa fa-eye', '', '197.287.', 'N', 'Y', '1', '2016-01-13 17:46:32', '1', '2016-04-15 13:20:18', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('288', 'ES_DiaryStatistics', '民情日记统计', '民情日记统计', '197', 'menu', '6', '/reportStatistics/diaryList', 'fa fa-list', '', '197.288.', 'N', 'Y', '1', '2016-01-13 17:48:42', '1', '2016-05-03 14:01:11', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('289', 'CC_Notice', '通知公告', '通知公告', '198', 'menu', null, '/notice/list', 'fa fa-bullhorn', '', '198.289.', 'N', 'Y', '1', '2016-01-13 17:50:21', '1', '2016-04-09 11:14:29', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('290', 'CC_Messages', '短信消息', '短信消息', '198', 'menu', '1', '/sms/list', 'fa fa-commenting', '', '198.290.', 'N', 'Y', '1', '2016-01-13 17:51:41', '1', '2016-04-09 11:15:08', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('291', 'EM_Type', '应急事件类型', '应急事件类型', '199', 'menu', '0', '/yjsjlx/list', 'fa fa-sitemap', '', '199.291.', 'N', 'Y', '1', '2016-01-13 17:52:25', '1', '2016-04-11 10:09:54', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('292', 'EM_People', '应急人员管理', '应急人员管理', '199', 'menu', '1', '/yingjirenyuan/list', 'fa fa-user', '', '199.292.', 'N', 'Y', '1', '2016-01-13 17:53:22', '1', '2016-04-21 10:32:42', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('293', 'EM_Plan', '应急预案管理', '应急预案管理', '199', 'menu', '2', '/yingjiplan/list', 'fa fa-road', '', '199.293.', 'N', 'Y', '1', '2016-01-13 17:54:13', '1', '2016-04-25 19:51:07', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('294', 'EM_Event', '应急事件管理', '应急事件管理', '199', 'menu', '3', '/yingjishijian/list', 'fa fa-tasks', '', '199.294.', 'N', 'Y', '1', '2016-01-13 17:55:08', '1', '2016-04-21 14:39:22', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('295', 'EM_Shelter', '避难场所管理', '避难场所管理', '199', 'menu', '4', '/emeplace/list', 'fa fa-square', '', '199.295.', 'N', 'Y', '1', '2016-01-13 17:58:41', '1', '2016-04-09 10:48:04', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('297', 'AD_Institution', '人口统计表', '人口统计表', '200', 'menu', '1', '/basicData/vitalStatistics', 'fa fa-bar-chart', '', '200.297.', 'N', 'Y', '1', '2016-01-13 18:00:29', '1', '2016-06-24 16:15:22', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('298', 'AD_Special', '特殊人群统计表', '特殊人群统计表', '200', 'menu', '3', '/basicData/specialCrowd', 'fa fa-bar-chart', '', '200.298.', 'N', 'Y', '1', '2016-01-13 18:01:27', '1', '2016-06-26 10:37:10', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('299', 'AD_Govern', '综合治理数据统计', '综合治理数据统计', '200', 'menu', '6', '/basicData/governance', 'fa fa-line-chart', '', '200.299.', 'N', 'Y', '1', '2016-01-13 18:03:05', '1', '2016-06-26 14:30:14', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('300', 'AD_Event', '红黄牌事件统计', '红黄牌事件统计', '200', 'menu', '7', '', 'fa fa-pie-chart', '', '200.300.', 'N', 'N', '1', '2016-01-13 18:03:59', '1', '2016-06-24 16:16:16', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('301', 'AD_PeopleEvent', '人员事件处理统计表', '人员事件处理统计表', '200', 'menu', '8', '/basicData/eventHandling', 'fa fa-bar-chart', '', '200.301.', 'N', 'Y', '1', '2016-01-13 18:04:48', '1', '2016-06-27 13:18:46', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('311', 'BM_SHOP_INFO', '门店信息', '门店信息', '203', 'menu', '6', '/shop/list', 'fa fa-cutlery', '', '194.203.311.', 'N', 'Y', '1', '2016-03-27 15:35:08', '1', '2016-04-08 11:21:39', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('312', 'BM_SPECIAL', '特殊行业', '特殊行业', '203', 'menu', '7', '/special/list', 'fa fa-suitcase ', '', '194.203.312.', 'N', 'Y', '1', '2016-03-27 16:44:35', '1', '2016-04-08 11:22:40', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('316', 'BM_Regime', '社会组织', '社会组织', '203', 'menu', '12', '', 'fa fa-asterisk', '', '194.203.316.', 'N', 'N', '1', '2016-04-13 11:25:10', '1', '2016-04-28 08:26:34', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('318', 'BM_Installation', '市政设施', '市政设施', '203', 'menu', '13', '/fac/list', 'fa fa-tags', '', '194.203.318.', 'N', 'Y', '1', '2016-04-13 11:25:50', '1', '2016-04-19 15:51:42', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('319', 'ES_Integral', '积分配置', '积分配置', '197', 'menu', '2', '/integal/list', 'fa fa-cog', '', '197.319.', 'N', 'Y', '1', '2016-04-15 11:58:10', '1', '2016-04-15 13:21:04', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('320', 'ES_Detail', '积分明细记录', '积分明细记录', '197', 'menu', '3', '/integalDetail/list', 'fa fa-list', '', '197.320.', 'N', 'Y', '1', '2016-04-15 11:58:43', '1', '2016-04-15 20:49:41', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('321', 'ES_Count', '积分统计', '积分统计', '197', 'menu', '4', '/reportStatistics/scoreList', 'fa fa-bar-chart', '', '197.321.', 'N', 'Y', '1', '2016-04-15 11:59:18', '1', '2016-05-03 14:01:25', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('326', 'HOUSEHOLD_REGIS', '户籍信息', '户籍信息', '203', 'menu', '0', '/householder/holderRegisList', 'fa fa-folder-open', '', '194.203.326.', 'N', 'Y', '1', '2016-04-23 10:58:37', '1', '2016-06-01 21:06:01', '', 'a', '');
INSERT INTO `gxwl_sys_resource` VALUES ('327', 'AD_Notice', '通知公告', '通知公告', '200', 'menu', '0', '/notice/list', 'fa fa-bullhorn', '', '200.327.', 'N', 'Y', '1', '2016-04-26 14:48:17', '1', '2016-04-26 14:57:12', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('328', 'adsf', '房屋统计表', '房屋统计表', '200', 'menu', '2', '/basicData/houseStatistics', '', '', '200.328.', 'N', 'Y', '1', '2016-04-26 14:57:54', '1', '2016-06-24 16:15:26', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('333', 'SYS_CONFIG', '配置管理', '配置管理', '1', 'menu', '50', '/config/list', '', '', '1.333.', 'N', 'Y', '1', '2016-05-05 12:02:31', '1', '2016-05-05 12:02:52', null, null, null);
INSERT INTO `gxwl_sys_resource` VALUES ('334', 'PA', '党务建设', '党务建设', null, 'module', '7', '/main/pa', 'fa fa-flag', '', '334.', 'Y', 'Y', '1', '2016-05-16 21:56:32', '1', '2016-05-19 17:49:43', '', '党务建设', '');
INSERT INTO `gxwl_sys_resource` VALUES ('335', 'PA_puSystem', '党务公开制度', '党务公开制度', '334', 'menu', '0', '/partyRegime/list/puSystem', 'fa fa-book', '', '334.335.', 'N', 'Y', '1', '2016-05-16 21:58:25', '1', '2016-05-17 10:00:22', '', '党务制度', '');
INSERT INTO `gxwl_sys_resource` VALUES ('338', 'PA_wobranch', '党支部工作职责', '党支部工作职责', '334', 'menu', '1', '/partyRegime/list/Wobranch', 'fa fa-book', '', '334.338.', 'N', 'Y', '1', '2016-05-17 10:00:15', '1', '2016-05-17 10:00:15', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('339', 'PA_joinParty', '入党程序', '入党程序', '334', 'menu', '2', '/partyRegime/list/joinParty', 'fa fa-book', '', '334.339.', 'N', 'Y', '1', '2016-05-17 10:01:09', '1', '2016-05-17 10:01:09', '', '入党程序', '');
INSERT INTO `gxwl_sys_resource` VALUES ('340', 'PA_course', '三会一课', '三会一课', '334', 'menu', '3', '/partyRegime/list/course', 'fa fa-book', '', '334.340.', 'N', 'Y', '1', '2016-05-17 10:01:51', '1', '2016-05-17 11:21:23', '', '三会一课', '');
INSERT INTO `gxwl_sys_resource` VALUES ('341', 'PA_property', '党组织财产信息', '党组织财产信息', '334', 'menu', '4', '/property/list', 'fa fa-book', '', '334.341.', 'N', 'Y', '1', '2016-05-17 10:33:18', '1', '2016-05-17 11:21:17', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('342', 'PA_communityDuty', '社区党务公开', '社区党务公开', '334', 'menu', '6', '/communityDuty/list', 'fa fa-book', '', '334.342.', 'N', 'Y', '1', '2016-05-17 14:10:29', '1', '2016-05-17 14:10:29', '', '社区党务公开', '');
INSERT INTO `gxwl_sys_resource` VALUES ('343', 'PA_trainMembers', '党员培训情况登记表', '党员培训情况登记表', '334', 'menu', '7', '/trainMembers/list', 'fa fa-book', '', '334.343.', 'N', 'Y', '1', '2016-05-17 17:30:09', '1', '2016-05-18 10:59:36', '', '党员培训情况登记表', '');
INSERT INTO `gxwl_sys_resource` VALUES ('344', 'PA_memberPromise', '党员公开承诺活动登记表', '党员公开承诺活动登记表', '334', 'menu', '8', '/memberPromise/list', 'fa fa-book', '', '334.344.', 'N', 'Y', '1', '2016-05-18 15:18:10', '1', '2016-05-18 15:18:36', '', '党员公开承诺活动登记表', '');
INSERT INTO `gxwl_sys_resource` VALUES ('345', 'PA_postDuty', '党员设岗定责登记表', '党员设岗定责登记表', '334', 'menu', '8', '/postDuty/list', 'fa fa-book', '', '334.345.', 'N', 'Y', '1', '2016-05-18 19:33:46', '1', '2016-05-18 19:33:46', '', '党员设岗定责登记表', '');
INSERT INTO `gxwl_sys_resource` VALUES ('346', 'PA_activity', '党组织开展活动登记表', '党组织开展活动登记表', '334', 'menu', '9', '/activity/list', 'fa fa-book', '', '334.346.', 'N', 'Y', '1', '2016-05-19 13:18:01', '1', '2016-05-19 13:18:01', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('347', 'PA_finaldangri', '固定党日计划', '固定党日计划', '334', 'menu', '11', '/finaldangri/list', '', '', '334.347.', 'N', 'Y', '1', '2016-05-19 17:42:28', '1', '2016-05-19 17:42:28', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('348', 'PA_divisionLabor', '两委分工', '两委分工', '334', 'menu', '12', '/division/list', 'fa fa-book', '', '334.348.', 'N', 'Y', '1', '2016-05-20 13:26:05', '1', '2016-05-20 13:26:05', '', '两委分工', '');
INSERT INTO `gxwl_sys_resource` VALUES ('354', 'AD_partyBuilding', '党群建设统计', '党群建设统计', '200', 'menu', '5', '/basicData/partyBuilding', 'fa fa-bar-chart', '', '200.354.', 'N', 'Y', '1', '2016-06-08 11:26:13', '1', '2016-06-24 16:16:05', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('355', 'AD_emergency', '应急管理统计表', '应急管理统计表', '200', 'menu', '9', '/basicData/emergencyManage', 'fa fa-bar-chart', '', '200.355.', 'N', 'Y', '1', '2016-06-08 15:25:06', '1', '2016-06-24 16:16:26', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('356', 'AD_member', '机构人员统计', '机构人员统计', '200', 'menu', '4', '/basicData/organization', 'fa fa-bar-chart', '', '200.356.', 'N', 'Y', '1', '2016-06-22 09:54:22', '1', '2016-06-24 16:15:41', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('362', 'BM_ziyuan', '资源管理', '资源管理', '194', 'menu', '9', '', '', '', '194.362.', 'Y', 'Y', '1', '2016-08-09 11:13:09', '1', '2016-08-09 11:22:31', '', '', '');
INSERT INTO `gxwl_sys_resource` VALUES ('363', 'BM_ZIYUAN_DIANYING', '电影管理', '电影管理', '362', 'menu', '0', '/dianying/list', '', '', '194.362.363.', 'N', 'Y', '1', '2016-08-09 11:22:31', '1', '2016-08-09 11:22:31', '', '', '');

-- ----------------------------
-- Table structure for `gxwl_sys_resourcep`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_resourcep`;
CREATE TABLE `gxwl_sys_resourcep` (
  `RESOURCEP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` bigint(20) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `LAST_UPDATE_BY` bigint(20) NOT NULL,
  `LAST_UPDATE_TIME` datetime NOT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `RESOURCEP_DESC` varchar(200) DEFAULT NULL,
  `RESOURCEP_NAME` varchar(50) DEFAULT NULL,
  `RESOURCEP_TYPE` varchar(128) DEFAULT NULL,
  `RESOURCEP_VALUE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RESOURCEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gxwl_sys_resourcep
-- ----------------------------

-- ----------------------------
-- Table structure for `gxwl_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_role`;
CREATE TABLE `gxwl_sys_role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色编码',
  `ROLE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `ROLE_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '角色类型',
  `ROLE_DESC` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '角色描述',
  `VALID_DATE` date NOT NULL COMMENT '生效日期',
  `INVALID_DATE` date DEFAULT NULL COMMENT '失效日期',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `UI_GXWL_SYS_ROLE01` (`ROLE_CODE`),
  KEY `FK_61gasijrc7jjxkce3euwhfp7b` (`CREATE_BY`),
  KEY `FK_fgvpcybf18y90ap6dsg1ctdbf` (`LAST_UPDATE_BY`),
  CONSTRAINT `FK_61gasijrc7jjxkce3euwhfp7b` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_fgvpcybf18y90ap6dsg1ctdbf` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of gxwl_sys_role
-- ----------------------------
INSERT INTO `gxwl_sys_role` VALUES ('1', 'super', '超级用户', 'super', '', '2016-08-09', null, '1', '2014-02-12 13:53:32', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_role` VALUES ('2', 'normal', '普通用户', 'normal', '', '2014-07-30', null, '1', '2014-02-12 13:53:08', '1', '2014-07-30 17:58:26');
INSERT INTO `gxwl_sys_role` VALUES ('4', '004', '004', '004', '', '2016-05-08', null, '1', '2014-02-12 13:47:03', '1', '2016-05-08 14:52:47');
INSERT INTO `gxwl_sys_role` VALUES ('5', '005', '005', '005', '', '2014-02-12', null, '1', '2014-02-12 13:47:13', '1', '2014-02-12 13:47:13');
INSERT INTO `gxwl_sys_role` VALUES ('8', '008', '008', '008', '', '2014-02-12', null, '1', '2014-02-12 13:48:22', '1', '2014-02-12 13:48:22');
INSERT INTO `gxwl_sys_role` VALUES ('9', '009', '009', '009', '', '2014-02-12', null, '1', '2014-02-12 13:48:27', '1', '2014-02-12 13:48:27');
INSERT INTO `gxwl_sys_role` VALUES ('10', '010', '010', '010', '', '2014-02-12', null, '1', '2014-02-12 13:48:34', '1', '2014-02-12 13:48:34');
INSERT INTO `gxwl_sys_role` VALUES ('11', '011', '011', '011', '', '2014-02-12', null, '1', '2014-02-12 13:48:38', '1', '2014-02-12 13:48:38');
INSERT INTO `gxwl_sys_role` VALUES ('15', '015', '安监执法人员', '用户', null, '2014-03-31', null, '1', '2014-03-31 00:00:00', '1', '2014-03-31 00:00:00');
INSERT INTO `gxwl_sys_role` VALUES ('16', '016', '安全监察部主任', '用户', null, '2014-03-31', null, '1', '2014-03-31 00:00:00', '1', '2014-03-31 00:00:00');
INSERT INTO `gxwl_sys_role` VALUES ('17', '017', '安全监察部内业人员', '用户', 'd', '2014-07-31', null, '1', '2014-03-31 00:00:00', '1', '2014-07-31 17:40:56');
INSERT INTO `gxwl_sys_role` VALUES ('18', '018', '安全监察部外业人员', '用户', 'q', '2014-07-31', null, '1', '2014-03-31 00:00:00', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_role` VALUES ('19', '019', '安全生产行政执法专员', '用户', null, '2014-03-31', null, '1', '2014-03-31 00:00:00', '1', '2014-03-31 00:00:00');
INSERT INTO `gxwl_sys_role` VALUES ('20', '020', '文化市场行政执法专员', '用户', '', '2014-07-30', null, '1', '2014-03-31 00:00:00', '1', '2014-07-30 17:25:23');
INSERT INTO `gxwl_sys_role` VALUES ('21', '021', '质量技术监督执法专员', '用户', 'er', '2014-08-01', null, '1', '2014-03-31 00:00:00', '1', '2014-08-01 13:45:11');
INSERT INTO `gxwl_sys_role` VALUES ('22', '022', '基层分局行政执法专员', '用户', 'dfaa.dqqqd', '2014-08-01', null, '1', '2014-03-31 00:00:00', '1', '2014-08-01 13:45:20');

-- ----------------------------
-- Table structure for `gxwl_sys_roleorg`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_roleorg`;
CREATE TABLE `gxwl_sys_roleorg` (
  `RELA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ORG_ID` int(11) DEFAULT NULL COMMENT '行政组织ID',
  `ROLE_ID` int(11) NOT NULL COMMENT '角色ID',
  `IS_GRANTED` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N' COMMENT '角色是否可授出',
  `IS_INHERITED` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分配关系可继承',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`RELA_ID`),
  KEY `UI_GXWL_SYS_ROLEORG01` (`ROLE_ID`,`ORG_ID`),
  KEY `FK_f40jbb8kna71iawdb154k7k5m` (`CREATE_BY`),
  KEY `FK_g7s9ppd4yo9h4bxp010ppa7u1` (`LAST_UPDATE_BY`),
  CONSTRAINT `FK_f40jbb8kna71iawdb154k7k5m` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_g7s9ppd4yo9h4bxp010ppa7u1` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色和组织对应关系表';

-- ----------------------------
-- Records of gxwl_sys_roleorg
-- ----------------------------
INSERT INTO `gxwl_sys_roleorg` VALUES ('1', '58', '1', 'N', 'Y', null, '1', '2013-12-26 00:00:00', '1', '2013-12-26 00:00:00');
INSERT INTO `gxwl_sys_roleorg` VALUES ('3', '30', '1', 'Y', 'Y', '', '1', '2014-04-14 00:00:00', '1', '2014-06-30 11:04:46');

-- ----------------------------
-- Table structure for `gxwl_sys_roleredatap`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_roleredatap`;
CREATE TABLE `gxwl_sys_roleredatap` (
  `RELA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ROLE_ID` int(11) NOT NULL COMMENT '角色ID',
  `DATAP_ID` int(11) NOT NULL COMMENT '数据权限主键ID',
  `ENABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '是否有效',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`RELA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色对应数据权限';

-- ----------------------------
-- Records of gxwl_sys_roleredatap
-- ----------------------------

-- ----------------------------
-- Table structure for `gxwl_sys_roleresource`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_roleresource`;
CREATE TABLE `gxwl_sys_roleresource` (
  `RELA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色ID',
  `RESOURCE_ID` int(11) DEFAULT NULL COMMENT '资源ID',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`RELA_ID`),
  UNIQUE KEY `UI_GXWL_SYS_ROLERESOURCE01` (`ROLE_ID`,`RESOURCE_ID`),
  KEY `FK_REFERENCE_7` (`RESOURCE_ID`),
  CONSTRAINT `FK_REFERENCE_7` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `gxwl_sys_resource` (`RESOURCE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REFERENCE_8` FOREIGN KEY (`ROLE_ID`) REFERENCES `gxwl_sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=utf8 COMMENT='角色对应资源';

-- ----------------------------
-- Records of gxwl_sys_roleresource
-- ----------------------------
INSERT INTO `gxwl_sys_roleresource` VALUES ('1', '1', '1', '1', '2014-04-16 00:00:00', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('2', '1', '2', '1', '2014-04-16 00:00:00', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('4', '1', '5', '1', '2014-04-17 15:25:27', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('5', '1', '45', '1', '2014-04-17 15:25:48', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('119', '1', '3', '1', '2014-05-05 11:04:27', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('124', '1', '68', '1', '2014-05-06 10:41:29', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('127', '1', '71', '1', '2014-05-22 17:09:01', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('128', '1', '72', '1', '2014-05-23 11:52:03', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('129', '1', '73', '1', '2014-06-27 10:17:51', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('132', '1', '74', '1', '2014-07-02 11:48:27', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('135', '1', '142', '1', '2014-07-28 18:01:47', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('136', '2', '1', '1', '2014-07-30 17:58:26', '1', '2014-07-30 17:58:26');
INSERT INTO `gxwl_sys_roleresource` VALUES ('137', '2', '73', '1', '2014-07-30 17:58:26', '1', '2014-07-30 17:58:26');
INSERT INTO `gxwl_sys_roleresource` VALUES ('232', '18', '1', '1', '2014-07-31 17:41:14', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('233', '18', '2', '1', '2014-07-31 17:41:14', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('234', '18', '3', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('235', '18', '65', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('236', '18', '67', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('237', '18', '68', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('238', '18', '71', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('239', '18', '72', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('240', '18', '5', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('241', '18', '45', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('243', '18', '142', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('244', '18', '73', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('245', '18', '74', '1', '2014-07-31 17:41:33', '1', '2014-07-31 17:41:33');
INSERT INTO `gxwl_sys_roleresource` VALUES ('310', '1', '192', '1', '2014-08-13 16:19:36', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('311', '1', '65', '1', '2014-08-15 14:55:46', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('375', '1', '194', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('376', '1', '203', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('377', '1', '214', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('378', '1', '215', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('379', '1', '217', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('380', '1', '218', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('381', '1', '219', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('382', '1', '220', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('383', '1', '221', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('384', '1', '222', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('385', '1', '204', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('386', '1', '223', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('387', '1', '224', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('388', '1', '225', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('390', '1', '227', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('391', '1', '230', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('392', '1', '231', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('393', '1', '205', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('394', '1', '232', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('395', '1', '233', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('396', '1', '234', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('397', '1', '235', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('398', '1', '206', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('399', '1', '237', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('400', '1', '207', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('401', '1', '208', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('403', '1', '210', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('404', '1', '211', '1', '2016-01-13 14:39:28', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('407', '1', '238', '1', '2016-01-13 14:49:45', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('408', '1', '239', '1', '2016-01-13 14:49:45', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('410', '1', '240', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('411', '1', '241', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('412', '1', '242', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('413', '1', '243', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('414', '1', '244', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('415', '1', '245', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('416', '1', '246', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('417', '1', '247', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('418', '1', '248', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('419', '1', '249', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('420', '1', '250', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('421', '1', '251', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('422', '1', '252', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('423', '1', '253', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('424', '1', '254', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('434', '1', '265', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('435', '1', '266', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('436', '1', '268', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('437', '1', '269', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('438', '1', '270', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('439', '1', '271', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('440', '1', '272', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('441', '1', '273', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('442', '1', '195', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('443', '1', '274', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('444', '1', '275', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('446', '1', '277', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('447', '1', '278', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('448', '1', '196', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('449', '1', '279', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('450', '1', '280', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('451', '1', '281', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('452', '1', '197', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('453', '1', '282', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('458', '1', '287', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('459', '1', '288', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('463', '1', '199', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('464', '1', '291', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('465', '1', '292', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('466', '1', '293', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('467', '1', '294', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('468', '1', '295', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('469', '1', '200', '1', '2016-01-14 13:54:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('471', '1', '297', '1', '2016-01-14 13:54:51', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('486', '1', '311', '1', '2016-03-27 15:35:47', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('487', '1', '312', '1', '2016-03-27 16:45:11', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('489', '1', '319', '1', '2016-04-15 13:28:32', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('490', '1', '320', '1', '2016-04-15 13:28:32', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('491', '1', '321', '1', '2016-04-15 13:28:32', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('498', '1', '318', '1', '2016-04-19 09:55:23', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('499', '1', '326', '1', '2016-04-23 11:19:17', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('500', '1', '327', '1', '2016-04-26 14:48:50', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('501', '1', '328', '1', '2016-04-26 14:58:18', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('506', '1', '333', '1', '2016-05-05 12:03:07', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('507', '4', '199', '1', '2016-05-08 14:52:47', '1', '2016-05-08 14:52:47');
INSERT INTO `gxwl_sys_roleresource` VALUES ('508', '4', '291', '1', '2016-05-08 14:52:47', '1', '2016-05-08 14:52:47');
INSERT INTO `gxwl_sys_roleresource` VALUES ('509', '4', '292', '1', '2016-05-08 14:52:47', '1', '2016-05-08 14:52:47');
INSERT INTO `gxwl_sys_roleresource` VALUES ('510', '4', '293', '1', '2016-05-08 14:52:47', '1', '2016-05-08 14:52:47');
INSERT INTO `gxwl_sys_roleresource` VALUES ('511', '4', '294', '1', '2016-05-08 14:52:47', '1', '2016-05-08 14:52:47');
INSERT INTO `gxwl_sys_roleresource` VALUES ('512', '4', '295', '1', '2016-05-08 14:52:47', '1', '2016-05-08 14:52:47');
INSERT INTO `gxwl_sys_roleresource` VALUES ('513', '1', '209', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('514', '1', '256', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('515', '1', '257', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('516', '1', '258', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('517', '1', '259', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('518', '1', '260', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('519', '1', '261', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('520', '1', '262', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('521', '1', '263', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('522', '1', '264', '1', '2016-05-09 11:13:58', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('523', '1', '334', '1', '2016-05-16 21:59:12', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('524', '1', '335', '1', '2016-05-16 21:59:12', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('525', '1', '338', '1', '2016-05-17 10:02:03', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('526', '1', '339', '1', '2016-05-17 10:02:03', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('527', '1', '340', '1', '2016-05-17 10:02:03', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('528', '1', '341', '1', '2016-05-17 11:24:32', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('529', '1', '342', '1', '2016-05-17 14:10:39', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('530', '1', '343', '1', '2016-05-17 17:30:18', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('531', '1', '344', '1', '2016-05-18 15:18:19', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('532', '1', '345', '1', '2016-05-18 19:33:55', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('533', '1', '346', '1', '2016-05-19 13:18:45', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('534', '1', '347', '1', '2016-05-19 17:42:55', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('535', '1', '348', '1', '2016-05-20 13:26:15', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('541', '1', '301', '1', '2016-06-07 14:40:14', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('542', '1', '354', '1', '2016-06-08 11:29:06', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('543', '1', '355', '1', '2016-06-08 15:26:30', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('544', '1', '356', '1', '2016-06-22 09:56:10', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('546', '1', '298', '1', '2016-06-26 10:37:25', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('547', '1', '299', '1', '2016-06-26 14:30:53', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('553', '1', '198', '1', '2016-07-21 11:39:56', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('554', '1', '289', '1', '2016-07-21 11:39:56', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('555', '1', '290', '1', '2016-07-21 11:39:56', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('556', '1', '362', '1', '2016-08-09 11:17:25', '1', '2016-08-09 11:22:50');
INSERT INTO `gxwl_sys_roleresource` VALUES ('557', '1', '363', '1', '2016-08-09 11:22:50', '1', '2016-08-09 11:22:50');

-- ----------------------------
-- Table structure for `gxwl_sys_roleuser`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_roleuser`;
CREATE TABLE `gxwl_sys_roleuser` (
  `RELA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色ID',
  `IS_GRANTED` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N' COMMENT '角色是否可授出',
  `REMARK` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`RELA_ID`),
  KEY `UI_GXWL_SYS_ROLEUSER01` (`USER_ID`,`ROLE_ID`),
  KEY `FK_nicph4h3hnr4hf68tj7pjfnp0` (`CREATE_BY`),
  KEY `FK_b56f8apph4lq46yw8k1sjmm2p` (`LAST_UPDATE_BY`),
  KEY `FK_1ab5vee9jcyg20b6lskav26j4` (`ROLE_ID`),
  KEY `FK_7oy7yxqaqycn0t2uckn2iy8if` (`USER_ID`),
  CONSTRAINT `FK_1ab5vee9jcyg20b6lskav26j4` FOREIGN KEY (`ROLE_ID`) REFERENCES `gxwl_sys_role` (`ROLE_ID`),
  CONSTRAINT `FK_7oy7yxqaqycn0t2uckn2iy8if` FOREIGN KEY (`USER_ID`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_b56f8apph4lq46yw8k1sjmm2p` FOREIGN KEY (`LAST_UPDATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`),
  CONSTRAINT `FK_nicph4h3hnr4hf68tj7pjfnp0` FOREIGN KEY (`CREATE_BY`) REFERENCES `gxwl_sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='角色和用户对应关系表';

-- ----------------------------
-- Records of gxwl_sys_roleuser
-- ----------------------------
INSERT INTO `gxwl_sys_roleuser` VALUES ('70', '66', '10', 'Y', '', '1', '2014-03-20 16:46:08', '1', '2016-05-08 14:53:38');
INSERT INTO `gxwl_sys_roleuser` VALUES ('85', '70', '15', 'Y', '', '1', '2014-03-31 15:34:57', '1', '2014-07-31 16:54:28');
INSERT INTO `gxwl_sys_roleuser` VALUES ('87', '71', '18', 'Y', '', '1', '2014-03-31 15:36:38', '1', '2014-03-31 15:36:48');
INSERT INTO `gxwl_sys_roleuser` VALUES ('88', '72', '16', 'Y', '', '1', '2014-03-31 15:37:31', '1', '2014-09-24 10:48:24');
INSERT INTO `gxwl_sys_roleuser` VALUES ('89', '73', '17', 'Y', '', '1', '2014-03-31 15:38:12', '1', '2014-07-15 10:34:51');
INSERT INTO `gxwl_sys_roleuser` VALUES ('90', '74', '22', 'Y', null, '1', '2014-03-31 15:39:12', '1', '2014-03-31 15:39:12');
INSERT INTO `gxwl_sys_roleuser` VALUES ('91', '75', '21', 'Y', '', '1', '2014-03-31 15:46:40', '1', '2014-07-30 15:49:58');
INSERT INTO `gxwl_sys_roleuser` VALUES ('92', '76', '20', 'Y', '', '1', '2014-03-31 15:47:25', '1', '2014-07-30 15:11:55');
INSERT INTO `gxwl_sys_roleuser` VALUES ('93', '77', '19', 'Y', '', '1', '2014-03-31 15:47:56', '1', '2014-09-22 15:41:47');
INSERT INTO `gxwl_sys_roleuser` VALUES ('94', '78', '18', 'Y', '', '1', '2014-03-31 15:48:40', '1', '2016-04-18 15:45:15');
INSERT INTO `gxwl_sys_roleuser` VALUES ('95', '79', '17', 'Y', '', '1', '2014-03-31 15:49:42', '1', '2014-09-22 12:01:24');
INSERT INTO `gxwl_sys_roleuser` VALUES ('96', '80', '20', 'Y', 'dfasdf', '1', '2014-03-31 15:50:16', '1', '2016-04-19 18:25:19');
INSERT INTO `gxwl_sys_roleuser` VALUES ('98', '1', '1', 'Y', '', '1', '2014-04-17 15:22:41', '1', '2016-08-09 11:18:55');
INSERT INTO `gxwl_sys_roleuser` VALUES ('111', '1', '21', 'Y', '', '1', '2014-04-22 17:21:47', '1', '2016-08-09 11:18:55');
INSERT INTO `gxwl_sys_roleuser` VALUES ('112', '1', '22', 'Y', '', '1', '2014-04-22 17:21:47', '1', '2016-08-09 11:18:55');
INSERT INTO `gxwl_sys_roleuser` VALUES ('114', '80', '18', 'Y', '44', '1', '2014-06-26 15:21:21', '1', '2016-04-19 18:25:19');
INSERT INTO `gxwl_sys_roleuser` VALUES ('115', '81', '22', 'Y', '', '1', '2014-06-26 15:35:40', '1', '2014-07-31 16:48:38');
INSERT INTO `gxwl_sys_roleuser` VALUES ('117', '81', '18', 'Y', '', '1', '2014-07-03 16:49:34', '1', '2014-07-31 16:48:38');
INSERT INTO `gxwl_sys_roleuser` VALUES ('118', '81', '15', 'Y', '', '1', '2014-07-03 16:49:34', '1', '2014-07-31 16:48:38');
INSERT INTO `gxwl_sys_roleuser` VALUES ('119', '44', '18', 'Y', null, '1', '2014-07-29 11:23:01', '1', '2014-07-29 11:23:01');
INSERT INTO `gxwl_sys_roleuser` VALUES ('120', '30', '1', 'Y', '', '1', '2014-07-31 15:13:54', '1', '2014-09-19 11:26:15');
INSERT INTO `gxwl_sys_roleuser` VALUES ('121', '80', '1', 'Y', null, '1', '2016-04-19 18:25:19', '1', '2016-04-19 18:25:19');
INSERT INTO `gxwl_sys_roleuser` VALUES ('122', '121', '1', 'Y', null, '1', '2016-04-29 10:10:24', '1', '2016-04-29 10:10:24');
INSERT INTO `gxwl_sys_roleuser` VALUES ('136', '153', '1', 'Y', null, '1', '2016-05-08 11:59:31', '1', '2016-05-08 11:59:31');
INSERT INTO `gxwl_sys_roleuser` VALUES ('137', '66', '4', 'Y', null, '1', '2016-05-08 14:53:38', '1', '2016-05-08 14:53:38');

-- ----------------------------
-- Table structure for `gxwl_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `gxwl_sys_user`;
CREATE TABLE `gxwl_sys_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户登录名称',
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `AUTHMODE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '认证模式',
  `STATUS` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `LASTLOGIN` date DEFAULT NULL COMMENT '最近登录日期',
  `ERRCOUNT` int(11) DEFAULT NULL COMMENT '出错次数',
  `VALID_DATE` date NOT NULL COMMENT '生效日期',
  `INVALID_DATE` date DEFAULT NULL COMMENT '失效日期',
  `VALID_TIMES` int(11) DEFAULT NULL COMMENT '允许操作时间',
  `MAC_CODE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '允许的MAC',
  `IP_ADDRESS` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '允许的IP',
  `EMPCODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '员工编号',
  `EMPNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '员工姓名',
  `REALNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `GENDER` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `BIRTHDATE` date DEFAULT NULL COMMENT '出生日期',
  `POSITION` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职位',
  `EMPSTATUS` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '在职状态',
  `CARDTYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `CARDNO` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `INDATE` date DEFAULT NULL COMMENT '入职日期',
  `OUTDATE` date DEFAULT NULL COMMENT '离职日期',
  `OTEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `OADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '办公地址',
  `OZIPCODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `FAXNO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `MOBILENO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '移动电话',
  `MSN` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '不再使用',
  `QQ` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'QQ',
  `HTEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `HADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `POSITION_LEVEL` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职级',
  `POSITION_RANK` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职等',
  `NATIONALITY` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '国籍',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `CREATE_BY` int(11) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_UPDATE_BY` int(11) NOT NULL COMMENT '最后修改人',
  `LAST_UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `SALT` varchar(128) NOT NULL COMMENT '盐',
  `USER_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型',
  PRIMARY KEY (`USER_ID`),
  KEY `UI_GXWL_SYS_USER01` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of gxwl_sys_user
-- ----------------------------
INSERT INTO `gxwl_sys_user` VALUES ('1', 'super', '8bb44f2a31fe05eb6333c80351b4a26a5c25939b2109253821c547648d791817', null, 'enabled', null, null, '2016-08-09', null, '0', null, null, '', null, '超级用户', null, null, '', null, null, null, null, null, '', '', '', null, '1', null, null, null, '', null, null, null, '', '1', '2014-01-16 13:52:43', '1', '2016-08-09 11:18:55', '451a4fa12f61c5e8d088049b949c6bb8', null);
INSERT INTO `gxwl_sys_user` VALUES ('6', 'test2', '8bb44f2a31fe05eb6333c80351b4a26a5c25939b2109253821c547648d791817', null, 'enabled', null, null, '2014-09-17', null, '0', null, null, '', null, 'test2', null, null, '', null, null, null, null, null, '', '', '', null, '2', null, null, null, '', null, null, null, '', '1', '2014-01-16 14:09:17', '1', '2014-09-17 15:22:03', 'f75e24b21c3c601c6102349623eceb3f', null);
INSERT INTO `gxwl_sys_user` VALUES ('7', 'test7', '20a02150927962cb39d8e72d7877983062bf2aa228761c61be110c2caa574330', null, 'disabled', null, null, '2014-09-19', null, '0', null, null, '', null, 'test7', null, null, '', null, null, null, null, null, '', '', '', null, '7', null, null, null, '', null, null, null, '', '1', '2014-01-01 00:00:00', '1', '2014-09-19 11:25:36', '7d8bef2663627314132d29a23c770dd8', null);
INSERT INTO `gxwl_sys_user` VALUES ('30', 'lisi', 'c8acf99c743c58c9bcad8e2c19bcb7c46c288f0983e4024b1f61243b308840f5', null, 'enabled', null, null, '2014-09-19', null, '0', null, null, '123', null, '李四', null, null, '', null, null, null, null, null, '', '', '', null, '13', null, null, null, '', null, null, null, '', '1', '2014-02-24 17:29:22', '1', '2014-09-19 11:26:15', '66df8c55127b5e4000741c682d08853d', null);
INSERT INTO `gxwl_sys_user` VALUES ('44', 'abcc', '123', null, 'disabled', null, null, '2014-07-29', null, '0', null, null, '', null, 'abcc', null, null, '', null, null, null, null, null, '', '', '', null, 'qw', null, null, null, '', null, null, null, '', '1', '2014-03-19 09:19:08', '1', '2014-07-29 11:23:01', '', null);
INSERT INTO `gxwl_sys_user` VALUES ('66', 'Kimi', '57045ce35758b4e79310ed6aa185c3dbc10339bb656efa2c56b2e07705147189', null, 'enabled', null, null, '2016-05-08', null, '0', null, null, '', null, '黑米', null, null, '', null, null, null, null, null, '', '', '', null, '1345687985', null, null, null, '', null, null, null, '', '1', '2014-03-20 16:46:08', '1', '2016-05-08 14:53:38', 'a4aed39bec2e7a93b279f6b7d27b47d4', null);
INSERT INTO `gxwl_sys_user` VALUES ('68', 'abc1398236515001', '123', null, 'disabled', null, null, '2014-03-01', null, '0', null, null, null, null, '34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '2014-03-25 11:39:36', '1', '2014-04-23 15:01:55', '', null);
INSERT INTO `gxwl_sys_user` VALUES ('70', 'wanglili', '3327098801d3ba29205615310c7b34c1b0fbc8e863e00349d3feac1a44c4121a', null, 'disabled', null, null, '2014-07-31', null, '0', null, null, '', null, '王莉莉', null, null, '', null, null, null, null, null, '', '', '', null, 'gggg', null, null, null, '', null, null, null, '', '1', '2014-03-31 15:34:57', '1', '2014-07-31 16:54:28', '82fac43db282aecad0a7a8dd88380b0c', null);
INSERT INTO `gxwl_sys_user` VALUES ('71', 'chentianqiang', '3b48175c71eb866ca4800d75083cd8c18baf27010a1723f4cc75eca159f44a81', null, 'disabled', null, null, '2014-03-31', null, '0', null, null, null, null, '陈天强', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '2014-03-31 15:36:08', '1', '2014-04-01 17:21:31', 'adf3dafb397b477dbac305eba7a72f61', null);
INSERT INTO `gxwl_sys_user` VALUES ('72', 'yangguowei', '8998f450a575981496585beff44c6a4d144e5012cc0ac7f1f1e8d5d2c7f9d636', null, 'disabled', null, null, '2014-09-24', null, '0', null, null, 'asdfasdf', null, '杨国伟', null, null, '', null, null, null, null, null, '', '', '', null, '232323', null, null, null, '', null, null, null, '', '1', '2014-03-31 15:37:31', '1', '2014-09-24 10:48:24', '70936a4b0c6728dbc5a7bc0cc481e5ea', null);
INSERT INTO `gxwl_sys_user` VALUES ('73', 'zhangchunhua', '9427b7319a5eb8c84c68e1e956ae646f6bb04537e73bb0989943fe4a118f45cd', null, 'disabled', null, null, '2014-03-31', null, '0', null, null, '', null, '张春华', null, null, '', null, null, null, null, null, '', '', '', null, '13876894532', null, null, null, '', null, null, null, '', '1', '2014-03-31 15:38:12', '1', '2014-07-15 10:34:51', '9d79c8a4f347950121c4f506a6ed7061', null);
INSERT INTO `gxwl_sys_user` VALUES ('74', 'zhuguangtao', 'c2460c06f84f6755e9bf7b1a3bb5613339b45e317c8af57ceaf99f947e1d01a9', null, 'disabled', null, null, '2014-03-20', null, '0', null, null, null, null, '朱广涛', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '2014-03-31 15:39:12', '1', '2014-04-01 17:22:00', '636cf4505c12e5abf4cd30b64a7d272d', null);
INSERT INTO `gxwl_sys_user` VALUES ('75', 'fanyadong', '404ba583f59398750abbb8164af5928f288b5c38c0589cbcfc9e14bb5989f6b8', null, 'disabled', null, null, '2014-07-30', null, '0', null, null, '', null, '范亚东', null, null, '', null, null, null, null, null, '', '', '', null, 'qqqq', null, null, null, '', null, null, null, '', '1', '2014-03-31 15:46:40', '1', '2014-07-30 15:49:58', 'aabf1b35e06f755604aa5c3cdfdcc3b3', null);
INSERT INTO `gxwl_sys_user` VALUES ('76', 'lianglidong', 'eb9ba1bf7d24147b50ec8beceb261fb6d451c0b409da2cedb5c80a4cb173959c', null, 'disabled', null, null, '2014-07-30', null, '0', null, null, '', null, '梁立东', null, null, '', null, null, null, null, null, '', '', '', null, '', null, null, null, '', null, null, null, '', '1', '2014-03-31 15:47:25', '1', '2014-07-30 15:11:55', '6ca93b4f9f89a1a5fe88cb22ffade014', null);
INSERT INTO `gxwl_sys_user` VALUES ('77', 'zhangzheng', '7a97799bb5e5892fd31e97e061916206b8906bc467262f54659ed99199bd3790', null, 'disabled', null, null, '2014-09-22', null, '0', null, null, '', null, '张峥', null, null, '', null, null, null, null, null, '', '', '', null, '13988888888', null, null, null, '', null, null, null, '', '1', '2014-03-31 15:47:56', '1', '2014-09-22 15:41:47', '15ec02679044f3285fb3d2409aba182c', null);
INSERT INTO `gxwl_sys_user` VALUES ('78', 'zhangyang', '9d203e66f0c6251d82fc8b9c1f4c383e5bb67c68144b47c01bc0220116cc631a', null, 'enabled', null, null, '2016-04-18', null, '0', null, null, '', null, '张洋', null, null, '', null, null, null, null, null, '', '', '', null, 'rf', null, null, null, '', null, null, null, '', '1', '2014-03-31 15:48:40', '1', '2016-04-18 15:45:15', 'a3059d736b685f92b20d1328bba6f7a0', null);
INSERT INTO `gxwl_sys_user` VALUES ('79', 'guanmin', '50dd41df157d333db3b4fef097d8d93632759267af69644c7e750a530ed61f17', null, 'enabled', null, null, '2014-09-22', null, '0', null, null, '', null, '关敏', null, null, '', null, null, null, null, null, '', '', '', null, '132', null, null, null, '', null, null, null, '', '1', '2014-03-31 15:49:42', '1', '2014-09-22 12:01:24', '3fbc6aedda96d6e3133827eff609f311', null);
INSERT INTO `gxwl_sys_user` VALUES ('80', 'zhoujuan', '3b165a6d3dfc588b6f9fe75b9de5a21d2f90f682d0d2ae6ec6b7c8ca13de8f3e', null, 'enabled', null, null, '2016-04-19', null, '0', null, null, '', null, '周娟', null, null, '', null, null, null, null, null, '', '', '', null, '13313331333', null, null, null, '', null, null, null, 'qqqqqqqqqqqqqqq', '1', '2014-03-31 15:50:16', '1', '2016-04-19 18:25:21', '9784c977c663714ead74e96a76f0875d', null);
INSERT INTO `gxwl_sys_user` VALUES ('81', 'zhangshangbin', '123', null, 'enabled', null, null, '2014-07-31', null, '0', null, null, '', null, '张尚彬', null, null, '', null, null, null, null, null, 'd', '', '', null, '13343563436', null, null, null, 'dffffa', null, null, null, '', '1', '2014-03-31 15:50:55', '1', '2014-07-31 16:48:38', '49d9a9825f3b8eee105d528159219624', null);
INSERT INTO `gxwl_sys_user` VALUES ('119', 'text', 'fd491fe7eb6315c22c6a229e2e733afdbd8603fc4fb99a00ba60247488599a45', null, 'enable', null, null, '2016-01-06', null, '0', null, null, '4660', null, '测试用户213', 'male', null, null, null, null, null, null, null, '123', '广东分公司的', null, null, '123', null, null, null, '广东分公司的', null, null, null, '123@163.com', '1', '2016-01-05 15:47:53', '1', '2016-01-06 14:12:06', '301dbadb5bce0582fd575ac7e8982d65', null);
INSERT INTO `gxwl_sys_user` VALUES ('120', 'aa', '3cca5656dcfd2879b31a58cc4f3e59a17881197262b59f6ca6a6f829d3713a44', null, 'enabled', null, null, '2016-04-19', null, '0', null, null, '', null, 'aa', null, null, '', null, null, null, null, null, '', '', '', null, 'ddd', null, null, null, '', null, null, null, '', '1', '2016-04-19 17:32:25', '1', '2016-05-08 14:47:35', '9047c655308359be7cdcb3e0aef5f281', null);
INSERT INTO `gxwl_sys_user` VALUES ('121', 'admin', '02491275fc5ec399c225e49ab39f60600481a4b139e11bc18660c7718e6068b6', null, 'enabled', null, null, '2016-04-29', null, '0', null, null, '', null, '管理员', null, null, '', null, null, null, null, null, '', '', '', null, '111', null, null, null, '', null, null, null, '', '1', '2016-04-29 09:51:32', '1', '2016-05-08 14:47:27', '1138bfe262f86d8fc1709a75b825247d', null);
INSERT INTO `gxwl_sys_user` VALUES ('153', 'zhangsan', '4197edbcd8d8e9071a57e3a5baad878b8e140c143c49c8ea11cce4b5454ee0d2', null, 'enabled', null, null, '2016-05-08', null, '0', null, null, '', null, '张三', null, null, '', null, null, null, null, null, '', '', '', null, '5255', null, null, null, '', null, null, null, '', '1', '2014-01-17 17:47:20', '1', '2016-05-08 14:48:07', '836d73a4168a480c545c3cc44b2e2b38', null);

-- ----------------------------
-- View structure for `v_gxwl_sys_orgrole`
-- ----------------------------
DROP VIEW IF EXISTS `v_gxwl_sys_orgrole`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_gxwl_sys_orgrole` AS select `o`.`ORG_ID` AS `ORG_ID`,`rg`.`ROLE_ID` AS `ROLE_ID`,`rg`.`IS_GRANTED` AS `IS_GRANTED` from (`gxwl_sys_roleorg` `rg` join `gxwl_sys_org` `o`) where ((`o`.`FULLPATH` like concat(`rg`.`ORG_ID`,'.%')) and (if(isnull(`rg`.`IS_INHERITED`),'N',`rg`.`IS_INHERITED`) = 'Y')) union select `gxwl_sys_roleorg`.`ORG_ID` AS `ORG_ID`,`gxwl_sys_roleorg`.`ROLE_ID` AS `ROLE_ID`,`gxwl_sys_roleorg`.`IS_GRANTED` AS `IS_GRANTED` from `gxwl_sys_roleorg` where (if(isnull(`gxwl_sys_roleorg`.`IS_INHERITED`),'N',`gxwl_sys_roleorg`.`IS_INHERITED`) = 'N') ;

-- ----------------------------
-- View structure for `v_gxwl_sys_userrole`
-- ----------------------------
DROP VIEW IF EXISTS `v_gxwl_sys_userrole`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_gxwl_sys_userrole` AS select `t2`.`USER_ID` AS `USER_ID`,`t1`.`ROLE_ID` AS `ROLE_ID`,`t1`.`IS_GRANTED` AS `IS_GRANTED` from (`v_gxwl_sys_orgrole` `t1` join `gxwl_sys_orguser` `t2`) where (`t1`.`ORG_ID` = `t2`.`ORG_ID`) union select `t3`.`USER_ID` AS `USER_ID`,`t3`.`ROLE_ID` AS `ROLE_ID`,`t3`.`IS_GRANTED` AS `IS_GRANTED` from `gxwl_sys_roleuser` `t3` ;

-- ----------------------------
-- View structure for `v_gxwl_sys_userresource`
-- ----------------------------
DROP VIEW IF EXISTS `v_gxwl_sys_userresource`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_gxwl_sys_userresource` AS select distinct `ur`.`USER_ID` AS `USER_ID`,`rr`.`RESOURCE_ID` AS `RESOURCE_ID`,`r`.`RESOURCE_CODE` AS `RESOURCE_CODE`,`r`.`RESOURCE_NAME` AS `RESOURCE_NAME`,`r`.`RESOURCE_LABEL` AS `RESOURCE_LABEL`,`r`.`PARENT_RESOURCE_ID` AS `PARENT_RESOURCE_ID`,`r`.`RESOURCE_TYPE` AS `RESOURCE_TYPE`,`r`.`URL` AS `URL`,`r`.`SEQ` AS `SEQ`,`r`.`IMAGE_PATH` AS `IMAGE_PATH`,`r`.`OPEN_MODE` AS `OPEN_MODE`,`r`.`FULLPATH` AS `FULLPATH`,`r`.`ENABLE` AS `ENABLE`,`r`.`IS_BRANCH` AS `IS_BRANCH`,`r`.`SYSTEM_TYPE` AS `SYSTEM_TYPE`,`r`.`RESOURCE_DESC` AS `RESOURCE_DESC`,`r`.`REMARK` AS `REMARK` from ((`v_gxwl_sys_userrole` `ur` join `gxwl_sys_roleresource` `rr`) join `gxwl_sys_resource` `r`) where ((`ur`.`ROLE_ID` = `rr`.`ROLE_ID`) and (`rr`.`RESOURCE_ID` = `r`.`RESOURCE_ID`) and (if(isnull(`r`.`ENABLE`),'N',`r`.`ENABLE`) = 'Y')) ;

-- ----------------------------
-- Procedure structure for `updateAge`
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateAge`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `updateAge`()
BEGIN
	
	 update cis_bm_householder h1  left join  ( SELECT  
		  h.HOUSEHOLDER_ID,
		 (YEAR(CURDATE())-YEAR(h.BIRTH_DATE)) as age, 
		 MONTH(CURDATE())- MONTH(h.BIRTH_DATE) AS m ,
		 day(CURDATE())- day(h.BIRTH_DATE) AS d 
		 from cis_bm_householder h 
		 )t  on t.HOUSEHOLDER_ID=h1.HOUSEHOLDER_ID set h1.age = (case when t.m>0  THEN   t.age 
		when t.m<0  then t.age-1 
		when t.m=0 and t.d>0 THEN   t.age  
	 else t.age -1 END )  where   h1.BIRTH_DATE is not null and h1.DEL_SIGN <> 'Y' ;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `CamelCase`
-- ----------------------------
DROP FUNCTION IF EXISTS `CamelCase`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `CamelCase`(src VARCHAR(255)) RETURNS varchar(255) CHARSET utf8
BEGIN  
	DECLARE i INT DEFAULT 1;
	DECLARE t VARCHAR(255) DEFAULT '';
	DECLARE s VARCHAR(255) DEFAULT '';
	myloop:LOOP  
		SET t = SUBSTRING(src,i,1);
		IF t = '_' THEN
			SET s = CONCAT(s,UPPER(SUBSTRING(src,i+1,1)));
			SET i = i + 1;
		ELSE
			SET s = CONCAT(s,SUBSTRING(src,i,1));
		END IF;
		
		SET i = i + 1;
		  
		IF i = length(src) + 1 THEN 
			LEAVE myloop;  
		END IF;  
	END LOOP myloop;  
	RETURN s;  
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `even_updateAge`
-- ----------------------------
DROP EVENT IF EXISTS `even_updateAge`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `even_updateAge` ON SCHEDULE EVERY 1 DAY STARTS '2016-05-13 00:00:00' ON COMPLETION PRESERVE ENABLE DO call updateAge()
;;
DELIMITER ;
