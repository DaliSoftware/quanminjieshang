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
