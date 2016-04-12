<<<<<<< HEAD
/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50618
Source Host           : 127.0.0.1:3306
Source Database       : fhadmin

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2016-01-28 00:16:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
<<<<<<< HEAD
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', 'ï¿½ï¿½Ô±ï¿½ï¿½', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('ead1f56708e4409c8d071e0a699e5633', 'a2', 'bcbe3365e6ac95ea2c0343a2395834dd', 'ï¿½ï¿½Ô±ï¿½ï¿½', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '', '', '', '2015-12-01', '2015-12-24', '1', '121', '978336446@qq.com');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½Ô¼ï¿½',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `TITLE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790', '2016-01-16 23:20:36', 'ï¿½ï¿½Å¥È¨ï¿½ï¿½');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,30Q313596790NAME_EN,fh,String,fh,Ó¢ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,50Q313596790BIANMA,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,50Q313596790PARENT_ID,fh,String,fh,ï¿½Ï¼ï¿½ID,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,100Q313596790BZ,fh,String,fh,ï¿½ï¿½×¢,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790HEADMAN,fh,String,fh,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,30Q313596790TEL,fh,String,fh,ï¿½ç»°,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,50Q313596790FUNCTIONS,fh,String,fh,ï¿½ï¿½ï¿½ï¿½Ö°ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790ADDRESS,fh,String,fh,ï¿½ï¿½Ö·,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790', '2015-12-20 01:49:25', 'ï¿½ï¿½Ö¯ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `sys_createcode` VALUES ('d514dbd2474d4b6c8b6ab9904cc9cc7c', 'new', 'News', 'TB_,fh,NEWS', 'TITLE,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790', '2016-01-25 16:38:14', 'ï¿½ï¿½ï¿½Å¹ï¿½ï¿½ï¿½');
INSERT INTO `sys_createcode` VALUES ('dbd7b8330d774dcabd184eca8668a295', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,1000Q313596790TYPE,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,5Q313596790TO_USERNAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790FROM_USERNAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790SEND_TIME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,100Q313596790STATUS,fh,String,fh,×´Ì¬,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,5Q313596790SANME_ID,fh,String,fh,ï¿½ï¿½Í¬ID,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,100Q313596790', '2016-01-23 01:44:15', 'Õ¾ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,30Q313596790QX_NAME,fh,String,fh,È¨ï¿½Þ±ï¿½Ê¶,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,50Q313596790BZ,fh,String,fh,ï¿½ï¿½×¢,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790', '2016-01-15 18:38:40', 'ï¿½ï¿½Å¥ï¿½ï¿½ï¿½ï¿½');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ó¢ï¿½ï¿½',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT 'ï¿½Ï¼ï¿½ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `TEL` varchar(50) DEFAULT NULL COMMENT 'ï¿½ç»°',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ö°ï¿½ï¿½',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Ö·',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', 'ï¿½ï¿½ï¿½Û»ï¿½ï¿½', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', 'ï¿½É±ï¿½ï¿½ï¿½ï¿½', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'Bï¿½ï¿½Ë¾', 'b', '002', '0', 'Ò±ï¿½ï¿½', 'ï¿½ï¿½ï¿½ï¿½', '112', 'Ò±ï¿½ï¿½', 'ï¿½Ó±ï¿½');
INSERT INTO `sys_department` VALUES ('83a25761c618457cae2fa1211bd8696d', 'ï¿½ï¿½ï¿½ï¿½Bï¿½ï¿½', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', 'ï¿½ï¿½ï¿½ï¿½', '', '', '');
INSERT INTO `sys_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', 'ï¿½ï¿½ï¿½ï¿½Aï¿½ï¿½', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', 'ï¿½ï¿½ï¿½ï¿½', '0201212', '', '');
INSERT INTO `sys_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1ï¿½ï¿½', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', 'Ð¡ï¿½ï¿½', '12356989', '', '');
INSERT INTO `sys_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'Aï¿½ï¿½Ë¾', 'a', '001', '0', 'ï¿½ï¿½Ãº', 'ï¿½ï¿½ï¿½ï¿½', '110', 'ï¿½ï¿½Ãºï¿½ï¿½', 'É½ï¿½ï¿½');
INSERT INTO `sys_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', 'ï¿½ï¿½ï¿½Û²ï¿½', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ·', 'Ð¡ï¿½ï¿½', '11236', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ·', '909ï¿½ì¹«ï¿½ï¿½');
INSERT INTO `sys_department` VALUES ('d41af567914a409893d011aa53eda797', 'ï¿½ï¿½ï¿½ï¿½', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'ï¿½ï¿½ï¿½ð·¢¹ï¿½ï¿½ï¿½', 'ï¿½ï¿½ï¿½ï¿½', '11236', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '308ï¿½ì¹«ï¿½ï¿½');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ó¢ï¿½ï¿½',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `ORDER_BY` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT 'ï¿½Ï¼ï¿½ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT 'ï¿½Å²ï¿½ï¿½',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', 'ï¿½ï¿½ï¿½ï¿½', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', 'ï¿½ï¿½ï¿½ï¿½', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', 'ï¿½ï¿½ï¿½ï¿½', 'fenlei', '001', '1', '0', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', 'ï¿½ï¿½ï¿½ï¿½', 'diqu', '003', '3', '0', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', 'ï¿½ï¿½É«', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', 'ï¿½ï¿½É«', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', 'ï¿½ï¿½É«', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', 'ï¿½ï¿½É«', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', 'ï¿½Ïºï¿½', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', 'ï¿½Ïºï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', 'ï¿½Î³ï¿½', 'kecheng', '002', '2', '0', 'ï¿½Î³ï¿½', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT 'È¨ï¿½Þ±ï¿½Ê¶',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', 'ï¿½ï¿½ï¿½ï¿½EXCEL', 'toExcel', 'ï¿½ï¿½ï¿½ï¿½EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', 'ï¿½ï¿½ï¿½Ê¼ï¿½', 'email', 'ï¿½ï¿½ï¿½Íµï¿½ï¿½ï¿½ï¿½Ê¼ï¿½');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', 'ï¿½ï¿½ï¿½ï¿½EXCEL', 'FromExcel', 'ï¿½ï¿½ï¿½ï¿½EXCELï¿½ï¿½ÏµÍ³ï¿½Ã»ï¿½');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'sms', 'ï¿½ï¿½ï¿½Í¶ï¿½ï¿½ï¿½');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', 'Õ¾ï¿½ï¿½ï¿½ï¿½', 'FHSMS', 'ï¿½ï¿½ï¿½ï¿½Õ¾ï¿½ï¿½ï¿½ï¿½');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `TYPE` varchar(5) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '×´Ì¬',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', 'ï¿½ï¿½ï¿½', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', 'ï¿½ï¿½ï¿½', '2', 'san', 'admin', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', 'ï¿½ï¿½ï¿½', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', 'ï¿½ï¿½ï¿½', '1', 'admin', 'san', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', 'ï¿½ï¿½ï¿½', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½ï¿½', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', 'ï¿½ï¿½Ò²ï¿½ï¿½', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', 'ï¿½ï¿½ï¿½', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (1,'ÏµÍ³ï¿½ï¿½ï¿½ï¿½','#','0','1','menu-icon fa fa-desktop blue','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (2,'È¨ï¿½Þ¹ï¿½ï¿½ï¿½','#','1','1','menu-icon fa fa-lock black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (6,'ï¿½ï¿½Ï¢ï¿½ï¿½ï¿½ï¿½','#','0','5','menu-icon fa fa-credit-card green','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (7,'Í¼Æ¬ï¿½ï¿½ï¿½ï¿½','pictures/list.do','6','1','menu-icon fa fa-folder-o pink','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (8,'ï¿½ï¿½ï¿½Ü¼ï¿½ï¿½','druid/index.html','9','1','menu-icon fa fa-tachometer red','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (9,'ÏµÍ³ï¿½ï¿½ï¿½ï¿½','#','0','3','menu-icon fa fa-cog black','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (10,'ï¿½Ó¿Ú²ï¿½ï¿½ï¿½','tool/interfaceTest.do','9','2','menu-icon fa fa-exchange green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (11,'ï¿½ï¿½ï¿½ï¿½ï¿½Ê¼ï¿½','tool/goSendEmail.do','9','3','menu-icon fa fa-envelope-o green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (12,'ï¿½Ã¶ï¿½Î¬ï¿½ï¿½','tool/goTwoDimensionCode.do','9','4','menu-icon fa fa-barcode green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (14,'ï¿½ï¿½Í¼ï¿½ï¿½ï¿½ï¿½','tool/map.do','9','6','menu-icon fa fa-globe black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (15,'Î¢ï¿½Å¹ï¿½ï¿½ï¿½','#','0','4','menu-icon fa fa-comments purple','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (16,'ï¿½Ä±ï¿½ï¿½Ø¸ï¿½','textmsg/list.do','15','2','menu-icon fa fa-comment green','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (17,'Ó¦ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½','command/list.do','15','4','menu-icon fa fa-comment grey','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (18,'Í¼ï¿½Ä»Ø¸ï¿½','imgmsg/list.do','15','3','menu-icon fa fa-comment pink','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (19,'ï¿½ï¿½×¢ï¿½Ø¸ï¿½','textmsg/goSubscribe.do','15','1','menu-icon fa fa-comment orange','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (20,'ï¿½ï¿½ï¿½ß¹ï¿½ï¿½ï¿½','onlinemanager/list.do','1','6','menu-icon fa fa-laptop green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (21,'ï¿½ï¿½Ó¡ï¿½ï¿½ï¿½ï¿½','tool/printTest.do','9','7','menu-icon fa fa-hdd-o grey','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (22,'Ò»ï¿½ï¿½ï¿½Ëµï¿½','#','0','6','menu-icon fa fa-fire orange','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (23,'ï¿½ï¿½ï¿½ï¿½ï¿½Ëµï¿½','#','22','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (34,'ï¿½ï¿½ï¿½ï¿½ï¿½Ëµï¿½2','login_default.do','31','2','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (35,'ï¿½Ä¼ï¿½ï¿½Ëµï¿½2','login_default.do','24','2','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (36,'ï¿½ï¿½É«(ï¿½ï¿½ï¿½ï¿½È¨ï¿½ï¿½)','role.do','2','1','menu-icon fa fa-key orange','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (37,'ï¿½ï¿½Å¥È¨ï¿½ï¿½','buttonrights/list.do','2','2','menu-icon fa fa-key green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (38,'ï¿½Ëµï¿½ï¿½ï¿½ï¿½ï¿½','menu/listAllMenu.do','1','3','menu-icon fa fa-folder-open-o brown','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (39,'ï¿½ï¿½Å¥ï¿½ï¿½ï¿½ï¿½','fhbutton/list.do','1','2','menu-icon fa fa-download orange','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (40,'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½ï¿½','#','0','2','menu-icon fa fa-users blue','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (41,'ÏµÍ³ï¿½Ã»ï¿½','user/listUsers.do','40','1','menu-icon fa fa-users green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (42,'ï¿½ï¿½Ô±ï¿½ï¿½ï¿½ï¿½','happuser/listUsers.do','40','2','menu-icon fa fa-users orange','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (43,'ï¿½ï¿½ï¿½ï¿½ï¿½Öµï¿½','dictionaries/listAllDict.do?DICTIONARIES_ID=0','1','4','menu-icon fa fa-book purple','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (44,'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½','createCode/list.do','9','0','menu-icon fa fa-cogs brown','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (47,'ï¿½Ë¼ï¿½ï¿½Ëµï¿½','login_default.do','45','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (48,'Í¼ï¿½ï¿½ï¿½ï¿½',' tool/fusionchartsdemo.do','9','5','menu-icon fa fa-bar-chart-o black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (49,'ï¿½ï¿½Ö¯ï¿½ï¿½ï¿½ï¿½','department/listAllDepartment.do?DEPARTMENT_ID=0','1','5','menu-icon fa fa-users blue','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (50,'Õ¾ï¿½ï¿½ï¿½ï¿½','fhsms/list.do','6','2','menu-icon fa fa-envelope green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (51,'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ï¢ï¿½ï¿½ï¿½ï¿½','article/list.do','6','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (72,'ï¿½ï¿½ï¿½ï¿½×²Í¹ï¿½ï¿½ï¿½','checkuppackage/listAll.do','6','2','menu-icon fa fa-leaf black','1',1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ÏµÍ³ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '2251798773489606', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', 'ï¿½Ð¼ï¿½ï¿½ï¿½Ô±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', 'ï¿½ï¿½Ô±ï¿½ï¿½', '498', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', 'Ò»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô±', '2251798773489606', '1', '2251798773489606', '2251798773489606', '1125898866646982', '2251798773489606');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', 'Ö°Î»ï¿½ï¿½', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', 'ï¿½ï¿½ï¿½ï¿½', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô±', '2251798773489606', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', 'ï¿½ï¿½ï¿½ï¿½', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', 'ï¿½ß¼ï¿½ï¿½ï¿½Ô±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', 'ï¿½é³¤', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', 'ï¿½Ü¼ï¿½', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô±', '2251798773489606', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `ï¿½ï¿½É«ï¿½ï¿½ï¿½ï¿½ï¿½` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('14b5c28ea6ae4508b57d2d272ab3d5f1', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('3768e60edd1c4b5c9f1dd861188ae2f9', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('9412d1d05162464c83658c7f89ab03f0', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('96567633dd3548c9b75d28f430adf5a3', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('a1478f27c852459fa9cad04b642f4fb7', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('ba6696b8761044618e44c7e02c9ba89e', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT 'ï¿½Ã»ï¿½id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT 'È¨ï¿½ï¿½',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½É«id',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Â¼Ê±ï¿½ï¿½',
  `IP` varchar(15) DEFAULT NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½Â¼ipï¿½ï¿½Ö·',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL COMMENT 'Æ¤ï¿½ï¿½',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ê¼ï¿½',
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL COMMENT 'ï¿½ç»°',
  `OPENID` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Ó¦Î¢ï¿½ï¿½OPENID',
  `ALIAS` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ç³ï¿½',
  `BIRTHDAY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `SEX` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ô±ï¿½',
  `BIRTHPLACE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `LIVEPLACE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¡ï¿½ï¿½',
  `MARRIAGESTATUS` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½×´Ì¬',
  `CAREER` varchar(255) DEFAULT NULL COMMENT 'Ö°Òµ',
  `DEGREE` varchar(255) DEFAULT NULL COMMENT 'Ñ§ï¿½ï¿½',
  `AVATAR` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ã»ï¿½Í¼ï¿½ï¿½',
  `HEIGHT` int(11) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `WEIGHT` int(11) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`,`OPENID`,`ALIAS`,`BIRTHDAY`,`SEX`,`BIRTHPLACE`,`LIVEPLACE`,`MARRIAGESTATUS`,`CAREER`,`DEGREE`,`AVATAR`,`HEIGHT`,`WEIGHT`) values ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','ÏµÍ³ï¿½ï¿½ï¿½ï¿½Ô±','1133671055321055258374707980945218933803269864762743594642571294','1','2016-04-10 22:38:14','0:0:0:0:0:0:0:1','0','ï¿½ï¿½ï¿½Í³ï¿½ï¿½ï¿½ï¿½',NULL,'QQ313596790@main.com','001','18788888888',NULL,'ÏµÍ³ï¿½ï¿½ï¿½ï¿½Ô±',NULL,'ï¿½ï¿½','ï¿½É¶ï¿½','ï¿½É¶ï¿½','Î´ï¿½ï¿½','ï¿½ß¼ï¿½ï¿½Ü¹ï¿½Ê¦','ï¿½ï¿½ï¿½ï¿½','img/logo.jpg',188,50),('69177258a06e4927b4639ab1684c3320','san','47c4a8dc64ac2f0bb46bbd8813b037c9718f9349','ï¿½ï¿½','3264c8e83d0248bb9e3ea6195b4c0216','1','2016-04-10 21:12:04','0:0:0:0:0:0:0:1','0','111',NULL,'978336446@qq.com','333','13562202556',NULL,'ï¿½ï¿½ï¿½ï¿½ï¿½Ã»ï¿½',NULL,'ï¿½ï¿½','ï¿½É¶ï¿½','ï¿½É¶ï¿½','ï¿½Ñ»ï¿½','ï¿½ï¿½ï¿½ï¿½Ô±','×¨ï¿½ï¿½','img/logo.jpg',188,60),('9991f4d7782a4ccfb8a65bd96ea7aafa','lisi','2612ade71c1e48cd7150b5f4df152faa699cedfe','ï¿½ï¿½ï¿½ï¿½','3264c8e83d0248bb9e3ea6195b4c0216','1','2016-01-06 01:24:26','127.0.0.1','0','Ð¡ï¿½ï¿½',NULL,'313596790@qq.com','1102','13566233663',NULL,'ï¿½ï¿½',NULL,'ï¿½ï¿½','ï¿½Ïºï¿½','ï¿½Ïºï¿½','Î´ï¿½ï¿½','ï¿½ï¿½ï¿½ï¿½','ï¿½ï¿½Ê¿','img/logo.jpg',198,67),('d28812dffc7b4c91924dd73c8487a86c','admin123','c9f55b944bbd496ff462196310dcb383586b4a5e','Ä¬Ä¬','','3264c8e83d0248bb9e3ea6195b4c0216','','','0','Òªï¿½ÙºÙºï¿½Ã´','default','828777292@qq.com','1001','13567899876',NULL,'Ë«ï¿½Ú¹ï¿½','1992-08-20','ï¿½ï¿½','ï¿½É¶ï¿½','ï¿½É¶ï¿½','Î´ï¿½ï¿½','ï¿½ï¿½ï¿½ï¿½Ô±','ï¿½ï¿½×³','image/logo.jpg',189,89),('e29149962e944589bb7da23ad18ddeed','zhangsan','c2da1419caf053885c492e10ebde421581cdc03f','ï¿½ï¿½ï¿½ï¿½','3264c8e83d0248bb9e3ea6195b4c0216','0',NULL,NULL,NULL,'Ð£ï¿½ï¿½',NULL,'zhangsan@www.com','1101','2147483647',NULL,'ï¿½ï¿½',NULL,'ï¿½ï¿½','ï¿½ï¿½ï¿½ï¿½','ï¿½ï¿½ï¿½ï¿½','Î´ï¿½ï¿½','ï¿½ï¿½ï¿½ï¿½','Ð¡Ñ§','img/logo.jpg',178,56);
-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ä¼ï¿½ï¿½ï¿½',
  `PATH` varchar(255) DEFAULT NULL COMMENT 'Â·ï¿½ï¿½',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('b06010340ee54cfab49b8bfbe2387557', 'Í¼Æ¬', '5e6ba5ad3067482e9a8063b0627ee983.png', '20160125/5e6ba5ad3067482e9a8063b0627ee983.png', '2016-01-25 16:49:44', '1', 'Í¼Æ¬ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½');
INSERT INTO `tb_pictures` VALUES ('c9f1eca620c94c27bfa7028c66911f41', 'Í¼Æ¬', '928da750ec8542ceb7b2495f45ea6a9e.jpg', '20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg', '2016-01-25 16:49:44', '1', 'Í¼Æ¬ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ø¼ï¿½ï¿½ï¿½',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT 'Ó¦ï¿½ï¿½Â·ï¿½ï¿½',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `STATUS` int(1) NOT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', 'ï¿½Ø±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', 'ï¿½Ø±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', 'ï¿½Ø±ï¿½QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', 'ï¿½Ø±ï¿½QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', 'ï¿½ï¿½QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', 'ï¿½ï¿½QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ø¼ï¿½ï¿½ï¿½',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `STATUS` int(11) NOT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', 'ï¿½ï¿½Ò³', '2015-05-10 20:51:09', '1', 'Í¼ï¿½Ä»Ø¸ï¿½', 'Í¼ï¿½Ä»Ø¸ï¿½ï¿½ï¿½ï¿½ï¿½', 'Í¼ï¿½Ä»Ø¸ï¿½ï¿½ï¿½ï¿½ï¿½', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ø¼ï¿½ï¿½ï¿½',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `STATUS` int(2) DEFAULT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('63681adbe7144f10b66d6863e07f23c2', 'ï¿½ï¿½ï¿½', 'ï¿½ï¿½Ò²ï¿½ï¿½', '2015-05-09 02:39:23', '1', 'ï¿½Ä±ï¿½ï¿½Ø¸ï¿½');
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', 'ï¿½Ô·ï¿½', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '2015-05-10 22:52:27', '1', 'ï¿½Ä±ï¿½ï¿½Ø¸ï¿½');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', 'ï¿½ï¿½×¢', 'ï¿½ï¿½ï¿½ï¿½ï¿½Ç¹ï¿½×¢ï¿½ï¿½Ø¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '2015-05-11 02:12:36', '1', 'ï¿½ï¿½×¢ï¿½Ø¸ï¿½');


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_TAGCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `TB_TAGCATEGORY`;
CREATE TABLE `TB_TAGCATEGORY` (
 		`TAGCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`PARENT_ID` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ç©ID',
		`METATYPE` varchar(255) DEFAULT NULL COMMENT 'Ôªï¿½ï¿½ï¿½Í£ï¿½ï¿½ç¡°ï¿½ï¿½ï¿½î·½Ê½ï¿½ï¿½',
		`ISEXCLUSIVE` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ã·ï¿½ï¿½ï¿½ï¿½ÂµÄ±ï¿½Ç©ï¿½Ç·ñ»¥³ï¿½',
  		PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `TB_MEDICALEXAMITEM`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALEXAMITEM`;
CREATE TABLE `TB_MEDICALEXAMITEM` (
 		`MEDICALEXAMITEM_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`PRICE` int(11) NOT NULL COMMENT 'ï¿½Û¸ï¿½',
		`PRICE2` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Û¸ï¿½',
		`TIPS` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ä¿ï¿½ï¿½Ê¾',
		`STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
		`CREATEBY` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼Ô±ï¿½ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ê±ï¿½ï¿½',
		`MEDICALCENTER_ID` varchar(100) NOT NULL,
  		PRIMARY KEY (`MEDICALEXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_MEDICALCENTER`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALCENTER`;
CREATE TABLE `TB_MEDICALCENTER` (
 		`MEDICALCENTER_ID` varchar(100) NOT NULL,
		`STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`LOCATION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Ö·ï¿½ï¿½ï¿½ï¿½',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ä½ï¿½ï¿½ï¿½',
		`LOGOURL` varchar(255) DEFAULT NULL COMMENT 'logoÍ¼Æ¬url',
		`CREATEBY` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼ï¿½Ã»ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ê±ï¿½ï¿½',
  		PRIMARY KEY (`MEDICALCENTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_MEDICALCENERADMIN`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALCENERADMIN`;
CREATE TABLE `TB_MEDICALCENERADMIN` (
 		`MEDICALCENERADMIN_ID` varchar(100) NOT NULL,
		`DEPARTMENT` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
		`TITLE` varchar(255) DEFAULT NULL COMMENT 'Ö°Î» ',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼ï¿½ï¿½Ô±ï¿½ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼ï¿½ï¿½Ê±ï¿½ï¿½',
		`MEDICALCENTER_ID` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½id',
  		PRIMARY KEY (`MEDICALCENERADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMFREQUENCY`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMFREQUENCY`;
CREATE TABLE `EXAM_EXAMFREQUENCY` (
 		`EXAMFREQUENCY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`EXPRESSION` varchar(255) DEFAULT NULL COMMENT 'CRONï¿½ï¿½ï¿½Ê½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ä¼ï¿½ï¿½Æµï¿½ï¿½',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ô±ï¿½ï¿½ï¿½ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼ï¿½ï¿½Ê±ï¿½ï¿½',
  		PRIMARY KEY (`EXAMFREQUENCY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMITEM`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMITEM`;
CREATE TABLE `EXAM_EXAMITEM` (
 		`EXAMITEM_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ô±ï¿½ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ê±ï¿½ï¿½',
		`EXAMCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ê±ï¿½ï¿½',
		`EXAMITEM_PARENT_ID` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ê±ï¿½ï¿½',
		 PRIMARY KEY (`EXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `EXAM_EXAMCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMCATEGORY`;
CREATE TABLE `EXAM_EXAMCATEGORY` (
 		`EXAMCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ô±ï¿½ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ê±ï¿½ï¿½',
  		PRIMARY KEY (`EXAMCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMGUIDELINE`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMGUIDELINE`;
CREATE TABLE `EXAM_EXAMGUIDELINE` (
 		`EXAMGUIDELINE_ID` varchar(100) NOT NULL,
		`ORIGINATE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Ô´',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'Ö¸ï¿½ï¿½ï¿½ï¿½Ï¸ï¿½ï¿½ï¿½ï¿½',
		`CONCERNEDFACTORS` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
		`HIGHRISKDEFINE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Î£ï¿½ï¿½ÈºÊ¶ï¿½ï¿½',
		`HIGHRISKEXPRESSION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Î£ï¿½ï¿½ÈºÊ¶ï¿½ï¿½Å±ï¿½',
		`LOWRISKDEFINE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Í¨ï¿½ï¿½ÈºÊ¶ï¿½ï¿½',
		`LOWRISKEXPRESSION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Í¨ï¿½ï¿½ÈºÊ¶ï¿½ï¿½Å±ï¿½',
		`STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ô±ï¿½ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼Ê±ï¿½ï¿½',
  		PRIMARY KEY (`EXAMGUIDELINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMSOLUTION`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMSOLUTION`;
CREATE TABLE `EXAM_EXAMSOLUTION` (
 		`EXAMSOLUTION_ID` varchar(100) NOT NULL,
		`SUBGROUP` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ö¶Î·ï¿½ï¿½ï¿½ï¿½ï¿½',
		`RISKTYPE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Ô¤ï¿½Ö¶Î¶ï¿½Ó¦ï¿½ï¿½ï¿½ï¿½',
		`STARTAGE` int(11) NOT NULL COMMENT 'ï¿½ï¿½Ê¼ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
		`ENDAGE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
		`FEATURES` varchar(255) DEFAULT NULL COMMENT 'Ò½Ñ§ï¿½ï¿½ï¿½ï¿½Ö¶ï¿½',
		`EXAMGUIDELINE_ID` varchar(100) NOT NULL,
		`EXAMITEM_ID` varchar(100) NOT NULL,
		`EXAMFREQUENCY_ID` varchar(100) NOT NULL,
		
  		PRIMARY KEY (`EXAMSOLUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASECATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASECATEGORY`;
CREATE TABLE `ADMIN_DISEASECATEGORY` (
 		`DISEASECATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼Ô±ï¿½ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼Ê±ï¿½ï¿½',
		`PARENT_ID` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ð±ï¿½id',
  		PRIMARY KEY (`DISEASECATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASE`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASE`;
CREATE TABLE `ADMIN_DISEASE` (
 		`DISEASE_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`ISINHERITABLE` int(11) NOT NULL COMMENT 'ï¿½Ç·ï¿½ï¿½Å´ï¿½ï¿½ï¿½ï¿½ï¿½',
		`ISHIGHINCIDENCE` int(11) NOT NULL COMMENT 'ï¿½Ç·ï¿½ß·ï¿½',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼Ô±ï¿½ï¿½id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼Ê±ï¿½ï¿½',
		`DISEASECATEGORY_ID` varchar(32) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  		PRIMARY KEY (`DISEASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_checkupitem` (
  `CHECKUPITEM_ID` varchar(100) NOT NULL,
  `SUBGROUP` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½ï¿½',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½ï¿½',
  `FEATURES` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `FREQUENCY` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½Æµï¿½ï¿½',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
  `ORIGINATE` varchar(255) DEFAULT NULL COMMENT 'Ö¸ï¿½ï¿½ï¿½ï¿½Ô´',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Ï¸ï¿½ï¿½ï¿½ï¿½',
  `GENERATEDTIME` datetime DEFAULT NULL COMMENT 'ï¿½Ã¼ï¿½Â¼ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `WORKER` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½Ú²ï¿½ï¿½ï¿½ï¿½Ã¼ï¿½Â¼ï¿½Ä±ï¿½ï¿½',
  `REVISION` int(11) NOT NULL COMMENT 'ï¿½æ±¾',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT 'ÏµÍ³ï¿½ï¿½ï¿½',
  `CHECKUPPACKAGE_ID` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½×²ï¿½ï¿½ï¿½ï¿½',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`CHECKUPITEM_ID`),
  KEY `CHECKUPPACKAGE_ID` (`CHECKUPPACKAGE_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `tb_checkupitem_ibfk_1` FOREIGN KEY (`CHECKUPPACKAGE_ID`) REFERENCES `tb_checkuppackage` (`CHECKUPPACKAGE_ID`),
  CONSTRAINT `tb_checkupitem_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_checkupitem` */

insert  into `tb_checkupitem`(`CHECKUPITEM_ID`,`SUBGROUP`,`NAME`,`FEATURES`,`FREQUENCY`,`STATUS`,`ORIGINATE`,`DESCRIPTION`,`GENERATEDTIME`,`WORKER`,`REVISION`,`SYSFLAG`,`CHECKUPPACKAGE_ID`,`USER_ID`) values ('101','CT','ï¿½Ø²ï¿½ï¿½ï¿½ï¿½','ï¿½ï¿½ï¿½ï¿½,È«ï¿½ï¿½','Ã¿ï¿½ï¿½Ò»ï¿½ï¿½','ï¿½ï¿½Ñ¡ï¿½ï¿½','ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½','ï¿½Ø²ï¿½ï¿½ï¿½é°©Ï¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½','2016-04-10 22:29:46','admin',1,'amdin','1001','1'),('102','Xï¿½ï¿½','ï¿½Î²ï¿½ï¿½ï¿½ï¿½','ï¿½ï¿½ï¿½ï¿½','Ã¿ï¿½ï¿½Ò»ï¿½ï¿½','ï¿½ï¿½Ñ¡ï¿½ï¿½','ï¿½ï¿½ï¿½Ã´ï¿½','ï¿½ï¿½ï¿½ï¿½20ï¿½ï¿½,ï¿½Â°ï¿½Ï¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½','2016-04-04 22:31:12','admin',1,'admin','1002','1');

/*Table structure for table `tb_checkuppackage` */

CREATE TABLE `tb_checkuppackage` (
  `CHECKUPPACKAGE_ID` varchar(100) NOT NULL,
  `WORKER` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½É¸Ã¼ï¿½Â¼ï¿½Ä±ï¿½ï¿½',
  `GENERATEDTIME` datetime DEFAULT NULL COMMENT 'ï¿½Ã¼ï¿½Â¼ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `EFFECTIVEFROM` datetime DEFAULT NULL COMMENT 'ï¿½ï¿½Ê¼ï¿½ï¿½Ð§Ê±ï¿½ï¿½',
  `EXPIREON` datetime DEFAULT NULL COMMENT 'Ê§Ð§Ê±ï¿½ï¿½',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
  `REVISION` varchar(255) DEFAULT NULL COMMENT 'ï¿½æ±¾',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT 'ÏµÍ³ï¿½ï¿½ï¿½',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`CHECKUPPACKAGE_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `tb_checkuppackage_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_checkuppackage` */

insert  into `tb_checkuppackage`(`CHECKUPPACKAGE_ID`,`WORKER`,`GENERATEDTIME`,`EFFECTIVEFROM`,`EXPIREON`,`STATUS`,`REVISION`,`SYSFLAG`,`USER_ID`) values ('1001','ï¿½×²ï¿½1','2016-04-10 22:26:42','2016-04-10 22:26:44','2016-04-10 22:26:46','ï¿½ï¿½Ñ¡ï¿½ï¿½','1','admin','1'),('1002','ï¿½×²ï¿½2','2016-04-11 22:27:25','2016-04-12 22:27:28','2016-04-12 22:27:33','Î´Ñ¡ï¿½ï¿½','1','amin','69177258a06e4927b4639ab1684c3320'),('1003','ï¿½×²ï¿½3','2016-04-11 14:51:51','2016-04-11 14:51:57','2016-04-11 14:52:05','ï¿½ï¿½Ñ¡ï¿½ï¿½','1','admin','69177258a06e4927b4639ab1684c3320');



=======
/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50618
Source Host           : 127.0.0.1:3306
Source Database       : fhadmin

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2016-01-28 00:16:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', 'ï¿½ï¿½Ô±ï¿½ï¿½', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('ead1f56708e4409c8d071e0a699e5633', 'a2', 'bcbe3365e6ac95ea2c0343a2395834dd', 'ï¿½ï¿½Ô±ï¿½ï¿½', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '', '', '', '2015-12-01', '2015-12-24', '1', '121', '978336446@qq.com');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½Ô¼ï¿½',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `TITLE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790', '2016-01-16 23:20:36', 'ï¿½ï¿½Å¥È¨ï¿½ï¿½');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,30Q313596790NAME_EN,fh,String,fh,Ó¢ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,50Q313596790BIANMA,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,50Q313596790PARENT_ID,fh,String,fh,ï¿½Ï¼ï¿½ID,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,100Q313596790BZ,fh,String,fh,ï¿½ï¿½×¢,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790HEADMAN,fh,String,fh,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,30Q313596790TEL,fh,String,fh,ï¿½ç»°,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,50Q313596790FUNCTIONS,fh,String,fh,ï¿½ï¿½ï¿½ï¿½Ö°ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790ADDRESS,fh,String,fh,ï¿½ï¿½Ö·,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790', '2015-12-20 01:49:25', 'ï¿½ï¿½Ö¯ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `sys_createcode` VALUES ('d514dbd2474d4b6c8b6ab9904cc9cc7c', 'new', 'News', 'TB_,fh,NEWS', 'TITLE,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790', '2016-01-25 16:38:14', 'ï¿½ï¿½ï¿½Å¹ï¿½ï¿½ï¿½');
INSERT INTO `sys_createcode` VALUES ('dbd7b8330d774dcabd184eca8668a295', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,1000Q313596790TYPE,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,5Q313596790TO_USERNAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790FROM_USERNAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790SEND_TIME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,100Q313596790STATUS,fh,String,fh,×´Ì¬,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,5Q313596790SANME_ID,fh,String,fh,ï¿½ï¿½Í¬ID,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,100Q313596790', '2016-01-23 01:44:15', 'Õ¾ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,ï¿½ï¿½ï¿½ï¿½,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,30Q313596790QX_NAME,fh,String,fh,È¨ï¿½Þ±ï¿½Ê¶,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,50Q313596790BZ,fh,String,fh,ï¿½ï¿½×¢,fh,ï¿½ï¿½,fh,ï¿½ï¿½,fh,255Q313596790', '2016-01-15 18:38:40', 'ï¿½ï¿½Å¥ï¿½ï¿½ï¿½ï¿½');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ó¢ï¿½ï¿½',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT 'ï¿½Ï¼ï¿½ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `TEL` varchar(50) DEFAULT NULL COMMENT 'ï¿½ç»°',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ö°ï¿½ï¿½',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½Ö·',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', 'ï¿½ï¿½ï¿½Û»ï¿½ï¿½', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', 'ï¿½É±ï¿½ï¿½ï¿½ï¿½', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'Bï¿½ï¿½Ë¾', 'b', '002', '0', 'Ò±ï¿½ï¿½', 'ï¿½ï¿½ï¿½ï¿½', '112', 'Ò±ï¿½ï¿½', 'ï¿½Ó±ï¿½');
INSERT INTO `sys_department` VALUES ('83a25761c618457cae2fa1211bd8696d', 'ï¿½ï¿½ï¿½ï¿½Bï¿½ï¿½', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', 'ï¿½ï¿½ï¿½ï¿½', '', '', '');
INSERT INTO `sys_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', 'ï¿½ï¿½ï¿½ï¿½Aï¿½ï¿½', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', 'ï¿½ï¿½ï¿½ï¿½', '0201212', '', '');
INSERT INTO `sys_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1ï¿½ï¿½', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', 'Ð¡ï¿½ï¿½', '12356989', '', '');
INSERT INTO `sys_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'Aï¿½ï¿½Ë¾', 'a', '001', '0', 'ï¿½ï¿½Ãº', 'ï¿½ï¿½ï¿½ï¿½', '110', 'ï¿½ï¿½Ãºï¿½ï¿½', 'É½ï¿½ï¿½');
INSERT INTO `sys_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', 'ï¿½ï¿½ï¿½Û²ï¿½', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ·', 'Ð¡ï¿½ï¿½', '11236', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ·', '909ï¿½ì¹«ï¿½ï¿½');
INSERT INTO `sys_department` VALUES ('d41af567914a409893d011aa53eda797', 'ï¿½ï¿½ï¿½ï¿½', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'ï¿½ï¿½ï¿½ð·¢¹ï¿½ï¿½ï¿½', 'ï¿½ï¿½ï¿½ï¿½', '11236', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '308ï¿½ì¹«ï¿½ï¿½');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ó¢ï¿½ï¿½',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `ORDER_BY` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT 'ï¿½Ï¼ï¿½ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT 'ï¿½Å²ï¿½ï¿½',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', 'ï¿½ï¿½ï¿½ï¿½', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', 'ï¿½ï¿½ï¿½ï¿½', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', 'ï¿½ï¿½ï¿½ï¿½', 'fenlei', '001', '1', '0', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', 'ï¿½ï¿½ï¿½ï¿½', 'diqu', '003', '3', '0', 'ï¿½ï¿½ï¿½ï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', 'ï¿½ï¿½É«', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', 'ï¿½ï¿½É«', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', 'ï¿½ï¿½É«', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', 'ï¿½ï¿½É«', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', 'ï¿½Ïºï¿½', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', 'ï¿½Ïºï¿½', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', 'ï¿½Î³ï¿½', 'kecheng', '002', '2', '0', 'ï¿½Î³ï¿½', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT 'È¨ï¿½Þ±ï¿½Ê¶',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', 'ï¿½ï¿½ï¿½ï¿½EXCEL', 'toExcel', 'ï¿½ï¿½ï¿½ï¿½EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', 'ï¿½ï¿½ï¿½Ê¼ï¿½', 'email', 'ï¿½ï¿½ï¿½Íµï¿½ï¿½ï¿½ï¿½Ê¼ï¿½');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', 'ï¿½ï¿½ï¿½ï¿½EXCEL', 'FromExcel', 'ï¿½ï¿½ï¿½ï¿½EXCELï¿½ï¿½ÏµÍ³ï¿½Ã»ï¿½');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'sms', 'ï¿½ï¿½ï¿½Í¶ï¿½ï¿½ï¿½');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', 'Õ¾ï¿½ï¿½ï¿½ï¿½', 'FHSMS', 'ï¿½ï¿½ï¿½ï¿½Õ¾ï¿½ï¿½ï¿½ï¿½');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `TYPE` varchar(5) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '×´Ì¬',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', 'ï¿½ï¿½ï¿½', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', 'ï¿½ï¿½ï¿½', '2', 'san', 'admin', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', 'ï¿½ï¿½ï¿½', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', 'ï¿½ï¿½ï¿½', '1', 'admin', 'san', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', 'ï¿½ï¿½ï¿½', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½ï¿½', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', 'ï¿½ï¿½Ò²ï¿½ï¿½', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', 'ï¿½ï¿½ï¿½', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', 'ÏµÍ³ï¿½ï¿½ï¿½ï¿½', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', 'È¨ï¿½Þ¹ï¿½ï¿½ï¿½', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', 'ï¿½ï¿½Ï¢ï¿½ï¿½ï¿½ï¿½', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', '1');
INSERT INTO `sys_menu` VALUES ('7', 'Í¼Æ¬ï¿½ï¿½ï¿½ï¿½', 'pictures/list.do', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', 'ï¿½ï¿½ï¿½Ü¼ï¿½ï¿½', 'druid/index.html', '9', '1', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', 'ÏµÍ³ï¿½ï¿½ï¿½ï¿½', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO `sys_menu` VALUES ('10', 'ï¿½Ó¿Ú²ï¿½ï¿½ï¿½', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', 'ï¿½ï¿½ï¿½ï¿½ï¿½Ê¼ï¿½', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', 'ï¿½Ã¶ï¿½Î¬ï¿½ï¿½', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', 'ï¿½ï¿½Í¼ï¿½ï¿½ï¿½ï¿½', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO `sys_menu` VALUES ('15', 'Î¢ï¿½Å¹ï¿½ï¿½ï¿½', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', '1');
INSERT INTO `sys_menu` VALUES ('16', 'ï¿½Ä±ï¿½ï¿½Ø¸ï¿½', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO `sys_menu` VALUES ('17', 'Ó¦ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO `sys_menu` VALUES ('18', 'Í¼ï¿½Ä»Ø¸ï¿½', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('19', 'ï¿½ï¿½×¢ï¿½Ø¸ï¿½', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('20', 'ï¿½ï¿½ï¿½ß¹ï¿½ï¿½ï¿½', 'onlinemanager/list.do', '1', '6', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `sys_menu` VALUES ('21', 'ï¿½ï¿½Ó¡ï¿½ï¿½ï¿½ï¿½', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO `sys_menu` VALUES ('22', 'Ò»ï¿½ï¿½ï¿½Ëµï¿½', '#', '0', '6', 'menu-icon fa fa-fire orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('23', 'ï¿½ï¿½ï¿½ï¿½ï¿½Ëµï¿½', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('24', 'ï¿½ï¿½ï¿½ï¿½ï¿½Ëµï¿½', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('30', 'ï¿½Ä¼ï¿½ï¿½Ëµï¿½', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('31', 'ï¿½å¼¶ï¿½Ëµï¿½1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('32', 'ï¿½å¼¶ï¿½Ëµï¿½2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('33', 'ï¿½ï¿½ï¿½ï¿½ï¿½Ëµï¿½', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('34', 'ï¿½ï¿½ï¿½ï¿½ï¿½Ëµï¿½2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('35', 'ï¿½Ä¼ï¿½ï¿½Ëµï¿½2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('36', 'ï¿½ï¿½É«(ï¿½ï¿½ï¿½ï¿½È¨ï¿½ï¿½)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('37', 'ï¿½ï¿½Å¥È¨ï¿½ï¿½', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', 'ï¿½Ëµï¿½ï¿½ï¿½ï¿½ï¿½', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', 'ï¿½ï¿½Å¥ï¿½ï¿½ï¿½ï¿½', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('40', 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½ï¿½', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('41', 'ÏµÍ³ï¿½Ã»ï¿½', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('42', 'ï¿½ï¿½Ô±ï¿½ï¿½ï¿½ï¿½', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('43', 'ï¿½ï¿½ï¿½ï¿½ï¿½Öµï¿½', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('44', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'createCode/list.do', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('45', 'ï¿½ß¼ï¿½ï¿½Ëµï¿½1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('46', 'ï¿½ß¼ï¿½ï¿½Ëµï¿½2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('47', 'ï¿½Ë¼ï¿½ï¿½Ëµï¿½', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('48', 'Í¼ï¿½ï¿½ï¿½ï¿½', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO `sys_menu` VALUES ('49', 'ï¿½ï¿½Ö¯ï¿½ï¿½ï¿½ï¿½', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '1', '5', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('50', 'Õ¾ï¿½ï¿½ï¿½ï¿½', 'fhsms/list.do', '6', '2', 'menu-icon fa fa-envelope green', '1', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ÏµÍ³ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '2251798773489606', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', 'ï¿½Ð¼ï¿½ï¿½ï¿½Ô±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', 'ï¿½ï¿½Ô±ï¿½ï¿½', '498', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', 'Ò»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô±', '2251798773489606', '1', '2251798773489606', '2251798773489606', '1125898866646982', '2251798773489606');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', 'Ö°Î»ï¿½ï¿½', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', 'ï¿½ï¿½ï¿½ï¿½', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô±', '2251798773489606', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', 'ï¿½ï¿½ï¿½ï¿½', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', 'ï¿½ß¼ï¿½ï¿½ï¿½Ô±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', 'ï¿½é³¤', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', 'ï¿½Ü¼ï¿½', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô±', '2251798773489606', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `ï¿½ï¿½É«ï¿½ï¿½ï¿½ï¿½ï¿½` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('14b5c28ea6ae4508b57d2d272ab3d5f1', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('3768e60edd1c4b5c9f1dd861188ae2f9', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('9412d1d05162464c83658c7f89ab03f0', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('96567633dd3548c9b75d28f430adf5a3', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('a1478f27c852459fa9cad04b642f4fb7', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('ba6696b8761044618e44c7e02c9ba89e', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'ÏµÍ³ï¿½ï¿½ï¿½ï¿½Ô±', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2016-01-27 23:45:53', '127.0.0.1', '0', 'ï¿½ï¿½ï¿½Í³ï¿½ï¿½ï¿½ï¿½', 'default', 'QQ313596790@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('69177258a06e4927b4639ab1684c3320', 'san', '47c4a8dc64ac2f0bb46bbd8813b037c9718f9349', 'ï¿½ï¿½', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-01-25 16:25:36', '192.168.1.102', '0', '111', 'default', '978336446@qq.com', '333', '13562202556');
INSERT INTO `sys_user` VALUES ('9991f4d7782a4ccfb8a65bd96ea7aafa', 'lisi', '2612ade71c1e48cd7150b5f4df152faa699cedfe', 'ï¿½ï¿½ï¿½ï¿½', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-01-06 01:24:26', '127.0.0.1', '0', 'Ð¡ï¿½ï¿½', 'default', '313596790@qq.com', '1102', '13566233663');
INSERT INTO `sys_user` VALUES ('e29149962e944589bb7da23ad18ddeed', 'zhangsan', 'c2da1419caf053885c492e10ebde421581cdc03f', 'ï¿½ï¿½ï¿½ï¿½', '', '3264c8e83d0248bb9e3ea6195b4c0216', '', '', '0', 'Ð¡ï¿½ï¿½', 'default', 'zhangsan@www.com', '1101', '2147483647');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ä¼ï¿½ï¿½ï¿½',
  `PATH` varchar(255) DEFAULT NULL COMMENT 'Â·ï¿½ï¿½',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('b06010340ee54cfab49b8bfbe2387557', 'Í¼Æ¬', '5e6ba5ad3067482e9a8063b0627ee983.png', '20160125/5e6ba5ad3067482e9a8063b0627ee983.png', '2016-01-25 16:49:44', '1', 'Í¼Æ¬ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½');
INSERT INTO `tb_pictures` VALUES ('c9f1eca620c94c27bfa7028c66911f41', 'Í¼Æ¬', '928da750ec8542ceb7b2495f45ea6a9e.jpg', '20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg', '2016-01-25 16:49:44', '1', 'Í¼Æ¬ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ø¼ï¿½ï¿½ï¿½',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT 'Ó¦ï¿½ï¿½Â·ï¿½ï¿½',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `STATUS` int(1) NOT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', 'ï¿½Ø±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', 'ï¿½Ø±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', 'ï¿½Ø±ï¿½QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', 'ï¿½Ø±ï¿½QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', 'ï¿½ï¿½QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', 'ï¿½ï¿½QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ø¼ï¿½ï¿½ï¿½',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `STATUS` int(11) NOT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ö·8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', 'ï¿½ï¿½Ò³', '2015-05-10 20:51:09', '1', 'Í¼ï¿½Ä»Ø¸ï¿½', 'Í¼ï¿½Ä»Ø¸ï¿½ï¿½ï¿½ï¿½ï¿½', 'Í¼ï¿½Ä»Ø¸ï¿½ï¿½ï¿½ï¿½ï¿½', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ø¼ï¿½ï¿½ï¿½',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `STATUS` int(2) DEFAULT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('63681adbe7144f10b66d6863e07f23c2', 'ï¿½ï¿½ï¿½', 'ï¿½ï¿½Ò²ï¿½ï¿½', '2015-05-09 02:39:23', '1', 'ï¿½Ä±ï¿½ï¿½Ø¸ï¿½');
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', 'ï¿½Ô·ï¿½', 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '2015-05-10 22:52:27', '1', 'ï¿½Ä±ï¿½ï¿½Ø¸ï¿½');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', 'ï¿½ï¿½×¢', 'ï¿½ï¿½ï¿½ï¿½ï¿½Ç¹ï¿½×¢ï¿½ï¿½Ø¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', '2015-05-11 02:12:36', '1', 'ï¿½ï¿½×¢ï¿½Ø¸ï¿½');


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_TAGCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `TB_TAGCATEGORY`;
CREATE TABLE `TB_TAGCATEGORY` (
 		`TAGCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
		`PARENT_ID` varchar(255) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ç©ID',
		`METATYPE` varchar(255) DEFAULT NULL COMMENT 'Ôªï¿½ï¿½ï¿½Í£ï¿½ï¿½ç¡°ï¿½ï¿½ï¿½î·½Ê½ï¿½ï¿½',
		`ISEXCLUSIVE` varchar(255) DEFAULT NULL COMMENT 'ï¿½Ã·ï¿½ï¿½ï¿½ï¿½ÂµÄ±ï¿½Ç©ï¿½Ç·ñ»¥³ï¿½',
=======
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '»áÔ±¼×', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('ead1f56708e4409c8d071e0a699e5633', 'a2', 'bcbe3365e6ac95ea2c0343a2395834dd', '»áÔ±ÒÒ', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '', '', '', '2015-12-01', '2015-12-24', '1', '121', '978336446@qq.com');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '°üÃû',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT 'ÀàÃû',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '±íÃû',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT 'ÊôÐÔ¼¯',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `TITLE` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,Ãû³Æ,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790', '2016-01-16 23:20:36', '°´Å¥È¨ÏÞ');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,Ãû³Æ,fh,ÊÇ,fh,ÎÞ,fh,30Q313596790NAME_EN,fh,String,fh,Ó¢ÎÄ,fh,ÊÇ,fh,ÎÞ,fh,50Q313596790BIANMA,fh,String,fh,±àÂë,fh,ÊÇ,fh,ÎÞ,fh,50Q313596790PARENT_ID,fh,String,fh,ÉÏ¼¶ID,fh,·ñ,fh,ÎÞ,fh,100Q313596790BZ,fh,String,fh,±¸×¢,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790HEADMAN,fh,String,fh,¸ºÔðÈË,fh,ÊÇ,fh,ÎÞ,fh,30Q313596790TEL,fh,String,fh,µç»°,fh,ÊÇ,fh,ÎÞ,fh,50Q313596790FUNCTIONS,fh,String,fh,²¿ÃÅÖ°ÄÜ,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790ADDRESS,fh,String,fh,µØÖ·,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790', '2015-12-20 01:49:25', '×éÖ¯»ú¹¹');
INSERT INTO `sys_createcode` VALUES ('d514dbd2474d4b6c8b6ab9904cc9cc7c', 'new', 'News', 'TB_,fh,NEWS', 'TITLE,fh,String,fh,±êÌâ,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790', '2016-01-25 16:38:14', 'ÐÂÎÅ¹ÜÀí');
INSERT INTO `sys_createcode` VALUES ('dbd7b8330d774dcabd184eca8668a295', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,ÄÚÈÝ,fh,ÊÇ,fh,ÎÞ,fh,1000Q313596790TYPE,fh,String,fh,ÀàÐÍ,fh,·ñ,fh,ÎÞ,fh,5Q313596790TO_USERNAME,fh,String,fh,ÊÕÐÅÈË,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790FROM_USERNAME,fh,String,fh,·¢ÐÅÈË,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790SEND_TIME,fh,String,fh,·¢ÐÅÊ±¼ä,fh,ÊÇ,fh,ÎÞ,fh,100Q313596790STATUS,fh,String,fh,×´Ì¬,fh,·ñ,fh,ÎÞ,fh,5Q313596790SANME_ID,fh,String,fh,¹²Í¬ID,fh,ÊÇ,fh,ÎÞ,fh,100Q313596790', '2016-01-23 01:44:15', 'Õ¾ÄÚÐÅ');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,Ãû³Æ,fh,ÊÇ,fh,ÎÞ,fh,30Q313596790QX_NAME,fh,String,fh,È¨ÏÞ±êÊ¶,fh,ÊÇ,fh,ÎÞ,fh,50Q313596790BZ,fh,String,fh,±¸×¢,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790', '2016-01-15 18:38:40', '°´Å¥¹ÜÀí');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'Ãû³Æ',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ó¢ÎÄ',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '±àÂë',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT 'ÉÏ¼¶ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '¸ºÔðÈË',
  `TEL` varchar(50) DEFAULT NULL COMMENT 'µç»°',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '²¿ÃÅÖ°ÄÜ',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT 'µØÖ·',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', 'ÏúÊÛ»á¼Æ', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '³É±¾»á¼Æ', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B¹«Ë¾', 'b', '002', '0', 'Ò±Ìú', 'ÀîËÄ', '112', 'Ò±Ìú', 'ºÓ±±');
INSERT INTO `sys_department` VALUES ('83a25761c618457cae2fa1211bd8696d', 'ÏúÊÛB×é', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', 'ÀîËÄ', '', '', '');
INSERT INTO `sys_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', 'ÏúÊÛA×é', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', 'ÕÅÈý', '0201212', '', '');
INSERT INTO `sys_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1¶Ó', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', 'Ð¡Íõ', '12356989', '', '');
INSERT INTO `sys_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A¹«Ë¾', 'a', '001', '0', 'ÍÚÃº', 'ÕÅÈý', '110', 'ÍÝÃº¿ó', 'É½Î÷');
INSERT INTO `sys_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', 'ÏúÊÛ²¿', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', 'ÍÆÏúÉÌÆ·', 'Ð¡Ã÷', '11236', 'ÍÆÏúÉÌÆ·', '909°ì¹«ÊÒ');
INSERT INTO `sys_department` VALUES ('d41af567914a409893d011aa53eda797', '²ÆÎñ²¿', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '¸ºÔð·¢¹¤×Ê', 'ÍõÎä', '11236', '¹ÜÀí²ÆÎñ', '308°ì¹«ÊÒ');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'Ãû³Æ',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ó¢ÎÄ',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '±àÂë',
  `ORDER_BY` int(11) NOT NULL COMMENT 'ÅÅÐò',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT 'ÉÏ¼¶ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT 'ÅÅ²é±í',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '»ÆÆÖÇø', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '»ÆÆÒ', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '±±¾©', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', '±±¾©', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', 'ÐûÎäÇø', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', 'ÐûÎäÇø', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', 'ÓïÎÄ', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', 'ÓïÎÄ', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '·ÖÀà', 'fenlei', '001', '1', '0', '·ÖÀà', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', 'µØÇø', 'diqu', '003', '3', '0', 'µØÇø', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', 'ºìÉ«', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', 'ºìÉ«', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', 'ÂÌÉ«', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', 'ÂÌÉ«', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', 'ÉÏº£', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', 'ÉÏº£', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '¿Î³Ì', 'kecheng', '002', '2', '0', '¿Î³Ì', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'Ãû³Æ',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT 'È¨ÏÞ±êÊ¶',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', 'µ¼³öEXCEL', 'toExcel', 'µ¼³öEXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '·¢ÓÊ¼þ', 'email', '·¢ËÍµç×ÓÓÊ¼þ');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', 'µ¼ÈëEXCEL', 'FromExcel', 'µ¼ÈëEXCELµ½ÏµÍ³ÓÃ»§');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '·¢¶ÌÐÅ', 'sms', '·¢ËÍ¶ÌÐÅ');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', 'Õ¾ÄÚÐÅ', 'FHSMS', '·¢ËÍÕ¾ÄÚÐÅ');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT 'ÄÚÈÝ',
  `TYPE` varchar(5) DEFAULT NULL COMMENT 'ÀàÐÍ',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT 'ÊÕÐÅÈË',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '·¢ÐÅÈË',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '·¢ÐÅÊ±¼ä',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '×´Ì¬',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', 'ÄãºÃ', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', 'ÄãºÃ', '2', 'san', 'admin', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', 'ÄãºÃ', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', 'ÄãºÃ', '1', 'admin', 'san', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', 'ÈáÈáÈõÈõ', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', 'ÄãºÃ', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '¹ÜÀíÔ±ºÃ', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', 'ÄãÒ²ºÃ', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', 'ÄãºÃ', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (1,'ÏµÍ³¹ÜÀí','#','0','1','menu-icon fa fa-desktop blue','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (2,'È¨ÏÞ¹ÜÀí','#','1','1','menu-icon fa fa-lock black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (6,'ÐÅÏ¢¹ÜÀí','#','0','5','menu-icon fa fa-credit-card green','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (7,'Í¼Æ¬¹ÜÀí','pictures/list.do','6','1','menu-icon fa fa-folder-o pink','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (8,'ÐÔÄÜ¼à¿Ø','druid/index.html','9','1','menu-icon fa fa-tachometer red','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (9,'ÏµÍ³¹¤¾ß','#','0','3','menu-icon fa fa-cog black','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (10,'½Ó¿Ú²âÊÔ','tool/interfaceTest.do','9','2','menu-icon fa fa-exchange green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (11,'·¢ËÍÓÊ¼þ','tool/goSendEmail.do','9','3','menu-icon fa fa-envelope-o green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (12,'ÖÃ¶þÎ¬Âë','tool/goTwoDimensionCode.do','9','4','menu-icon fa fa-barcode green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (14,'µØÍ¼¹¤¾ß','tool/map.do','9','6','menu-icon fa fa-globe black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (15,'Î¢ÐÅ¹ÜÀí','#','0','4','menu-icon fa fa-comments purple','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (16,'ÎÄ±¾»Ø¸´','textmsg/list.do','15','2','menu-icon fa fa-comment green','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (17,'Ó¦ÓÃÃüÁî','command/list.do','15','4','menu-icon fa fa-comment grey','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (18,'Í¼ÎÄ»Ø¸´','imgmsg/list.do','15','3','menu-icon fa fa-comment pink','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (19,'¹Ø×¢»Ø¸´','textmsg/goSubscribe.do','15','1','menu-icon fa fa-comment orange','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (20,'ÔÚÏß¹ÜÀí','onlinemanager/list.do','1','6','menu-icon fa fa-laptop green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (21,'´òÓ¡²âÊÔ','tool/printTest.do','9','7','menu-icon fa fa-hdd-o grey','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (22,'Ò»¼¶²Ëµ¥','#','0','6','menu-icon fa fa-fire orange','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (23,'¶þ¼¶²Ëµ¥','#','22','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (34,'Áù¼¶²Ëµ¥2','login_default.do','31','2','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (35,'ËÄ¼¶²Ëµ¥2','login_default.do','24','2','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (36,'½ÇÉ«(»ù´¡È¨ÏÞ)','role.do','2','1','menu-icon fa fa-key orange','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (37,'°´Å¥È¨ÏÞ','buttonrights/list.do','2','2','menu-icon fa fa-key green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (38,'²Ëµ¥¹ÜÀí','menu/listAllMenu.do','1','3','menu-icon fa fa-folder-open-o brown','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (39,'°´Å¥¹ÜÀí','fhbutton/list.do','1','2','menu-icon fa fa-download orange','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (40,'ÓÃ»§¹ÜÀí','#','0','2','menu-icon fa fa-users blue','2',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (41,'ÏµÍ³ÓÃ»§','user/listUsers.do','40','1','menu-icon fa fa-users green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (42,'»áÔ±¹ÜÀí','happuser/listUsers.do','40','2','menu-icon fa fa-users orange','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (43,'Êý¾Ý×Öµä','dictionaries/listAllDict.do?DICTIONARIES_ID=0','1','4','menu-icon fa fa-book purple','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (44,'´úÂëÉú³É','createCode/list.do','9','0','menu-icon fa fa-cogs brown','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (47,'°Ë¼¶²Ëµ¥','login_default.do','45','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (48,'Í¼±í±¨±í',' tool/fusionchartsdemo.do','9','5','menu-icon fa fa-bar-chart-o black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (49,'×éÖ¯»ú¹¹','department/listAllDepartment.do?DEPARTMENT_ID=0','1','5','menu-icon fa fa-users blue','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (50,'Õ¾ÄÚÐÅ','fhsms/list.do','6','2','menu-icon fa fa-envelope green','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (51,'ÎÄÕÂÐÅÏ¢¹ÜÀí','article/list.do','6','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (72,'Ìå¼ìÌ×²Í¹ÜÀí','checkuppackage/listAll.do','6','2','menu-icon fa fa-leaf black','1',1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ÏµÍ³¹ÜÀí×é', '2251798773489606', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', 'ÖÐ¼¶»áÔ±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '³õ¼¶»áÔ±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '»áÔ±×é', '498', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', 'Ò»¼¶¹ÜÀíÔ±', '2251798773489606', '1', '2251798773489606', '2251798773489606', '1125898866646982', '2251798773489606');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', 'Ö°Î»×é', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', 'Ö÷¹Ü', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '¶þ¼¶¹ÜÀíÔ±', '2251798773489606', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '¾­Àí', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '¸ß¼¶»áÔ±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '×é³¤', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '×Ü¼à', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', 'Èý¼¶¹ÜÀíÔ±', '2251798773489606', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `½ÇÉ«±íÍâ¼ü` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('14b5c28ea6ae4508b57d2d272ab3d5f1', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('3768e60edd1c4b5c9f1dd861188ae2f9', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('9412d1d05162464c83658c7f89ab03f0', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('96567633dd3548c9b75d28f430adf5a3', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('a1478f27c852459fa9cad04b642f4fb7', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('ba6696b8761044618e44c7e02c9ba89e', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT 'ÓÃ»§id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT 'ÓÃ»§Ãû',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT 'ÃÜÂë',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'ÐÕÃû',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT 'È¨ÏÞ',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '½ÇÉ«id',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT '×îºóµÇÂ¼Ê±¼ä',
  `IP` varchar(15) DEFAULT NULL COMMENT 'ÓÃ»§µÇÂ¼ipµØÖ·',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL COMMENT 'Æ¤·ô',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT 'µç×ÓÓÊ¼þ',
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL COMMENT 'µç»°',
  `OPENID` varchar(255) DEFAULT NULL COMMENT '¶ÔÓ¦Î¢ÐÅOPENID',
  `ALIAS` varchar(255) DEFAULT NULL COMMENT 'êÇ³Æ',
  `BIRTHDAY` varchar(255) DEFAULT NULL COMMENT 'ÉúÈÕ',
  `SEX` varchar(255) DEFAULT NULL COMMENT 'ÐÔ±ð',
  `BIRTHPLACE` varchar(255) DEFAULT NULL COMMENT '³öÉúµØ',
  `LIVEPLACE` varchar(255) DEFAULT NULL COMMENT '¾Ó×¡µØ',
  `MARRIAGESTATUS` varchar(255) DEFAULT NULL COMMENT '»éÒö×´Ì¬',
  `CAREER` varchar(255) DEFAULT NULL COMMENT 'Ö°Òµ',
  `DEGREE` varchar(255) DEFAULT NULL COMMENT 'Ñ§Àú',
  `AVATAR` varchar(255) DEFAULT NULL COMMENT 'ÓÃ»§Í¼Ïñ',
  `HEIGHT` int(11) DEFAULT NULL COMMENT 'Éí¸ß',
  `WEIGHT` int(11) DEFAULT NULL COMMENT 'ÌåÖØ',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`,`OPENID`,`ALIAS`,`BIRTHDAY`,`SEX`,`BIRTHPLACE`,`LIVEPLACE`,`MARRIAGESTATUS`,`CAREER`,`DEGREE`,`AVATAR`,`HEIGHT`,`WEIGHT`) values ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','ÏµÍ³¹ÜÀíÔ±','1133671055321055258374707980945218933803269864762743594642571294','1','2016-04-10 22:38:14','0:0:0:0:0:0:0:1','0','×î¸ßÍ³ÖÎÕß',NULL,'QQ313596790@main.com','001','18788888888',NULL,'ÏµÍ³¹ÜÀíÔ±',NULL,'ÄÐ','³É¶¼','³É¶¼','Î´»é','¸ß¼¶¼Ü¹¹Ê¦','±¾¿Æ','img/logo.jpg',188,50),('69177258a06e4927b4639ab1684c3320','san','47c4a8dc64ac2f0bb46bbd8813b037c9718f9349','Èý','3264c8e83d0248bb9e3ea6195b4c0216','1','2016-04-10 21:12:04','0:0:0:0:0:0:0:1','0','111',NULL,'978336446@qq.com','333','13562202556',NULL,'²âÊÔÓÃ»§',NULL,'ÄÐ','³É¶¼','³É¶¼','ÒÑ»é','³ÌÐòÔ±','×¨¿Æ','img/logo.jpg',188,60),('9991f4d7782a4ccfb8a65bd96ea7aafa','lisi','2612ade71c1e48cd7150b5f4df152faa699cedfe','ÀîËÄ','3264c8e83d0248bb9e3ea6195b4c0216','1','2016-01-06 01:24:26','127.0.0.1','0','Ð¡Àî',NULL,'313596790@qq.com','1102','13566233663',NULL,'Àî',NULL,'ÄÐ','ÉÏº£','ÉÏº£','Î´»é','ÏúÊÛ','²©Ê¿','img/logo.jpg',198,67),('d28812dffc7b4c91924dd73c8487a86c','admin123','c9f55b944bbd496ff462196310dcb383586b4a5e','Ä¬Ä¬','','3264c8e83d0248bb9e3ea6195b4c0216','','','0','ÒªºÙºÙºÙÃ´','default','828777292@qq.com','1001','13567899876',NULL,'Ë«ºÚ¹·','1992-08-20','ÄÐ','³É¶¼','³É¶¼','Î´»é','³ÌÐòÔ±','´ó×³','image/logo.jpg',189,89),('e29149962e944589bb7da23ad18ddeed','zhangsan','c2da1419caf053885c492e10ebde421581cdc03f','ÕÅÈý','3264c8e83d0248bb9e3ea6195b4c0216','0',NULL,NULL,NULL,'Ð£³¤',NULL,'zhangsan@www.com','1101','2147483647',NULL,'ÕÅ',NULL,'ÄÐ','±±¾©','±±¾©','Î´»é','¸öÌå','Ð¡Ñ§','img/logo.jpg',178,56);
-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '±êÌâ',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'ÎÄ¼þÃû',
  `PATH` varchar(255) DEFAULT NULL COMMENT 'Â·¾¶',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT 'ÊôÓÚ',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('b06010340ee54cfab49b8bfbe2387557', 'Í¼Æ¬', '5e6ba5ad3067482e9a8063b0627ee983.png', '20160125/5e6ba5ad3067482e9a8063b0627ee983.png', '2016-01-25 16:49:44', '1', 'Í¼Æ¬¹ÜÀí´¦ÉÏ´«');
INSERT INTO `tb_pictures` VALUES ('c9f1eca620c94c27bfa7028c66911f41', 'Í¼Æ¬', '928da750ec8542ceb7b2495f45ea6a9e.jpg', '20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg', '2016-01-25 16:49:44', '1', 'Í¼Æ¬¹ÜÀí´¦ÉÏ´«');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '¹Ø¼ü´Ê',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT 'Ó¦ÓÃÂ·¾¶',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `STATUS` int(1) NOT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', 'Ëø¶¨·þÎñÆ÷', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', 'Ëø¶¨¼ÆËã»ú');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '´ò¿ªä¯ÀÀÆ÷', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '´ò¿ªä¯ÀÀÆ÷²Ù×÷');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '¹Ø±Õä¯ÀÀÆ÷', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', '¹Ø±Õä¯ÀÀÆ÷²Ù×÷');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '¹Ø±ÕQQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '¹Ø±ÕQQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '´ò¿ªQQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '´ò¿ªQQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '¹Ø¼ü´Ê',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `STATUS` int(11) NOT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '±êÌâ1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '±êÌâ2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '±êÌâ3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '±êÌâ4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '±êÌâ5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '±êÌâ6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '±êÌâ7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '±êÌâ8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', 'Ê×Ò³', '2015-05-10 20:51:09', '1', 'Í¼ÎÄ»Ø¸´', 'Í¼ÎÄ»Ø¸´±êÌâ', 'Í¼ÎÄ»Ø¸´ÃèÊö', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '¹Ø¼ü´Ê',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT 'ÄÚÈÝ',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `STATUS` int(2) DEFAULT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('63681adbe7144f10b66d6863e07f23c2', 'ÄãºÃ', 'ÄãÒ²ºÃ', '2015-05-09 02:39:23', '1', 'ÎÄ±¾»Ø¸´');
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '³Ô·¹', '³ÔÁËàÞàÞàÞàÞ', '2015-05-10 22:52:27', '1', 'ÎÄ±¾»Ø¸´');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '¹Ø×¢', 'ÕâÀïÊÇ¹Ø×¢ºó»Ø¸´µÄÄÚÈÝ', '2015-05-11 02:12:36', '1', '¹Ø×¢»Ø¸´');


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_TAGCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `TB_TAGCATEGORY`;
CREATE TABLE `TB_TAGCATEGORY` (
 		`TAGCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'Ãû³Æ',
		`PARENT_ID` varchar(255) DEFAULT NULL COMMENT '¸¸±êÇ©ID',
		`METATYPE` varchar(255) DEFAULT NULL COMMENT 'ÔªÀàÐÍ£¬Èç¡°Éú»î·½Ê½¡±',
		`ISEXCLUSIVE` varchar(255) DEFAULT NULL COMMENT '¸Ã·ÖÀàÏÂµÄ±êÇ©ÊÇ·ñ»¥³â',
  		PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `TB_MEDICALEXAMITEM`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALEXAMITEM`;
CREATE TABLE `TB_MEDICALEXAMITEM` (
 		`MEDICALEXAMITEM_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'Ãû³Æ',
		`PRICE` int(11) NOT NULL COMMENT '¼Û¸ñ',
		`PRICE2` int(11) NOT NULL COMMENT '½¨Òé¼Û¸ñ',
		`TIPS` varchar(255) DEFAULT NULL COMMENT '¼ì²éÏîÄ¿ÌáÊ¾',
		`STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
		`CREATEBY` int(11) NOT NULL COMMENT '´´½¨¼ÇÂ¼Ô±¹¤id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ê±¼ä',
		`MEDICALCENTER_ID` varchar(100) NOT NULL,
  		PRIMARY KEY (`MEDICALEXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_MEDICALCENTER`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALCENTER`;
CREATE TABLE `TB_MEDICALCENTER` (
 		`MEDICALCENTER_ID` varchar(100) NOT NULL,
		`STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
		`NAME` varchar(255) DEFAULT NULL COMMENT 'Ãû³Æ',
		`LOCATION` varchar(255) DEFAULT NULL COMMENT 'µØÖ·ÃèÊö',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'Ìå¼ìÖÐÐÄ½éÉÜ',
		`LOGOURL` varchar(255) DEFAULT NULL COMMENT 'logoÍ¼Æ¬url',
		`CREATEBY` int(11) NOT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼ÓÃ»§id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ê±¼ä',
  		PRIMARY KEY (`MEDICALCENTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_MEDICALCENERADMIN`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALCENERADMIN`;
CREATE TABLE `TB_MEDICALCENERADMIN` (
 		`MEDICALCENERADMIN_ID` varchar(100) NOT NULL,
		`DEPARTMENT` varchar(255) DEFAULT NULL COMMENT 'ËùÊô²¿ÃÅ',
		`TITLE` varchar(255) DEFAULT NULL COMMENT 'Ö°Î» ',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼µÄÔ±¹¤id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¼ÇÂ¼µÄÊ±¼ä',
		`MEDICALCENTER_ID` varchar(255) DEFAULT NULL COMMENT 'ËùÊôÌå¼ìÖÐÐÄid',
  		PRIMARY KEY (`MEDICALCENERADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMFREQUENCY`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMFREQUENCY`;
CREATE TABLE `EXAM_EXAMFREQUENCY` (
 		`EXAMFREQUENCY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'Ãû³Æ',
		`EXPRESSION` varchar(255) DEFAULT NULL COMMENT 'CRON±í´ïÊ½£¬¶¨Òå¼ì²éµÄ¼ä¸ôÆµÂÊ',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ô±¹¤µÄid',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼µÄÊ±¼ä',
  		PRIMARY KEY (`EXAMFREQUENCY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMITEM`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMITEM`;
CREATE TABLE `EXAM_EXAMITEM` (
 		`EXAMITEM_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'Ãû³Æ',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ô±¹¤id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ê±¼ä',
		`EXAMCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ê±¼ä',
		`EXAMITEM_PARENT_ID` varchar(32) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ê±¼ä',
		 PRIMARY KEY (`EXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `EXAM_EXAMCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMCATEGORY`;
CREATE TABLE `EXAM_EXAMCATEGORY` (
 		`EXAMCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '¼ì²éÏîÄ¿·ÖÀàÃû³Æ',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ô±¹¤id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ê±¼ä',
  		PRIMARY KEY (`EXAMCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMGUIDELINE`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMGUIDELINE`;
CREATE TABLE `EXAM_EXAMGUIDELINE` (
 		`EXAMGUIDELINE_ID` varchar(100) NOT NULL,
		`ORIGINATE` varchar(255) DEFAULT NULL COMMENT 'À´Ô´',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'Ö¸ÄÏÏêÏ¸ÃèÊö',
		`CONCERNEDFACTORS` varchar(255) DEFAULT NULL COMMENT '¹Ø×¢ÒòËØÃèÊö',
		`HIGHRISKDEFINE` varchar(255) DEFAULT NULL COMMENT '¸ßÎ£ÈËÈºÊ¶±ð',
		`HIGHRISKEXPRESSION` varchar(255) DEFAULT NULL COMMENT '¸ßÎ£ÈËÈºÊ¶±ð½Å±¾',
		`LOWRISKDEFINE` varchar(255) DEFAULT NULL COMMENT 'ÆÕÍ¨ÈËÈºÊ¶±ð',
		`LOWRISKEXPRESSION` varchar(255) DEFAULT NULL COMMENT 'ÆÕÍ¨ÈËÈºÊ¶±ð½Å±¾',
		`STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ô±¹¤id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¸Ã¼ÇÂ¼Ê±¼ä',
  		PRIMARY KEY (`EXAMGUIDELINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMSOLUTION`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMSOLUTION`;
CREATE TABLE `EXAM_EXAMSOLUTION` (
 		`EXAMSOLUTION_ID` varchar(100) NOT NULL,
		`SUBGROUP` varchar(255) DEFAULT NULL COMMENT '¼ì²éÊÖ¶Î·Ö×é±ê¼Ç',
		`RISKTYPE` varchar(255) DEFAULT NULL COMMENT '¸ÉÔ¤ÊÖ¶Î¶ÔÓ¦·çÏÕ',
		`STARTAGE` int(11) NOT NULL COMMENT '¿ªÊ¼¼ì²éÄêÁä',
		`ENDAGE` varchar(255) DEFAULT NULL COMMENT '½áÊø¼ì²éÄêÁä',
		`FEATURES` varchar(255) DEFAULT NULL COMMENT 'Ò½Ñ§¼ì²éÊÖ¶Î',
		`EXAMGUIDELINE_ID` varchar(100) NOT NULL,
		`EXAMITEM_ID` varchar(100) NOT NULL,
		`EXAMFREQUENCY_ID` varchar(100) NOT NULL,
		
  		PRIMARY KEY (`EXAMSOLUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASECATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASECATEGORY`;
CREATE TABLE `ADMIN_DISEASECATEGORY` (
 		`DISEASECATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'Ãû³Æ',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '´´½¨¼ÇÂ¼Ô±¹¤id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¼ÇÂ¼Ê±¼ä',
		`PARENT_ID` varchar(32) DEFAULT NULL COMMENT '¸¸¼¶ÁÐ±íid',
  		PRIMARY KEY (`DISEASECATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASE`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASE`;
CREATE TABLE `ADMIN_DISEASE` (
 		`DISEASE_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'Ãû³Æ',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö',
		`ISINHERITABLE` int(11) NOT NULL COMMENT 'ÊÇ·ñÒÅ´«ÇãÏò',
		`ISHIGHINCIDENCE` int(11) NOT NULL COMMENT 'ÊÇ·ñ¸ß·¢',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '´´½¨¼ÇÂ¼Ô±¹¤id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '´´½¨¼ÇÂ¼Ê±¼ä',
		`DISEASECATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '¼²²¡·ÖÀàÍâ¼ü',
  		PRIMARY KEY (`DISEASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_checkupitem` (
  `CHECKUPITEM_ID` varchar(100) NOT NULL,
  `SUBGROUP` varchar(255) DEFAULT NULL COMMENT '¼ì²éÏîÄ¿·Ö×é',
  `NAME` varchar(255) DEFAULT NULL COMMENT '¼ì²éÏîÄ¿Ãû³Æ',
  `FEATURES` varchar(255) DEFAULT NULL COMMENT 'ÌØÐÔ',
  `FREQUENCY` varchar(255) DEFAULT NULL COMMENT '¼ì²éÆµÂÊ',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
  `ORIGINATE` varchar(255) DEFAULT NULL COMMENT 'Ö¸ÄÏÀ´Ô´',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ÏêÏ¸ÃèÊö',
  `GENERATEDTIME` datetime DEFAULT NULL COMMENT '¸Ã¼ÇÂ¼Éú³ÉÊ±¼ä',
  `WORKER` varchar(255) DEFAULT NULL COMMENT 'ÓÃÓÚ²úÉú¸Ã¼ÇÂ¼µÄ±ê¼Ç',
  `REVISION` int(11) NOT NULL COMMENT '°æ±¾',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT 'ÏµÍ³±ê¼Ç',
  `CHECKUPPACKAGE_ID` varchar(100) DEFAULT NULL COMMENT 'Ìå¼ìÌ×²ÍÍâ¼ü',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT 'ÓÃ»§±íÍâ¼ü',
  PRIMARY KEY (`CHECKUPITEM_ID`),
  KEY `CHECKUPPACKAGE_ID` (`CHECKUPPACKAGE_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `tb_checkupitem_ibfk_1` FOREIGN KEY (`CHECKUPPACKAGE_ID`) REFERENCES `tb_checkuppackage` (`CHECKUPPACKAGE_ID`),
  CONSTRAINT `tb_checkupitem_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_checkupitem` */

insert  into `tb_checkupitem`(`CHECKUPITEM_ID`,`SUBGROUP`,`NAME`,`FEATURES`,`FREQUENCY`,`STATUS`,`ORIGINATE`,`DESCRIPTION`,`GENERATEDTIME`,`WORKER`,`REVISION`,`SYSFLAG`,`CHECKUPPACKAGE_ID`,`USER_ID`) values ('101','CT','ÐØ²¿¼ì²é','¾­¼Ã,È«Ãæ','Ã¿ÄêÒ»´Î','ÒÑÑ¡ÖÐ','ÃÀ¹ú¼ÓÖÝ','ÐØ²¿¼ì²é°©Ï¸°û±äÒì','2016-04-10 22:29:46','admin',1,'amdin','1001','1'),('102','X¹â','·Î²¿¼ì²é','¾­¼Ã','Ã¿ÄêÒ»´Î','ÒÑÑ¡ÖÐ','¼ÓÄÃ´ó','ÎüÑÌ20Äê,ÖÂ°©Ï¸°û±äÒì','2016-04-04 22:31:12','admin',1,'admin','1002','1');

/*Table structure for table `tb_checkuppackage` */

CREATE TABLE `tb_checkuppackage` (
  `CHECKUPPACKAGE_ID` varchar(100) NOT NULL,
  `WORKER` varchar(255) DEFAULT NULL COMMENT 'Éú³É¸Ã¼ÇÂ¼µÄ±ê¼Ç',
  `GENERATEDTIME` datetime DEFAULT NULL COMMENT '¸Ã¼ÇÂ¼Éú³ÉÊ±¼ä',
  `EFFECTIVEFROM` datetime DEFAULT NULL COMMENT '¿ªÊ¼ÉúÐ§Ê±¼ä',
  `EXPIREON` datetime DEFAULT NULL COMMENT 'Ê§Ð§Ê±¼ä',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '×´Ì¬',
  `REVISION` varchar(255) DEFAULT NULL COMMENT '°æ±¾',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT 'ÏµÍ³±ê¼Ç',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT 'ÓÃ»§±íÍâ¼ü',
  PRIMARY KEY (`CHECKUPPACKAGE_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `tb_checkuppackage_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_checkuppackage` */

insert  into `tb_checkuppackage`(`CHECKUPPACKAGE_ID`,`WORKER`,`GENERATEDTIME`,`EFFECTIVEFROM`,`EXPIREON`,`STATUS`,`REVISION`,`SYSFLAG`,`USER_ID`) values ('1001','Ì×²Í1','2016-04-10 22:26:42','2016-04-10 22:26:44','2016-04-10 22:26:46','ÒÑÑ¡ÖÐ','1','admin','1'),('1002','Ì×²Í2','2016-04-11 22:27:25','2016-04-12 22:27:28','2016-04-12 22:27:33','Î´Ñ¡ÖÐ','1','amin','69177258a06e4927b4639ab1684c3320'),('1003','Ì×²Í3','2016-04-11 14:51:51','2016-04-11 14:51:57','2016-04-11 14:52:05','ÒÑÑ¡ÖÐ','1','admin','69177258a06e4927b4639ab1684c3320');



=======
/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50618
Source Host           : 127.0.0.1:3306
Source Database       : fhadmin

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2016-01-28 00:16:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '»áÔ±¼×', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('ead1f56708e4409c8d071e0a699e5633', 'a2', 'bcbe3365e6ac95ea2c0343a2395834dd', '»áÔ±ÒÒ', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '', '', '', '2015-12-01', '2015-12-24', '1', '121', '978336446@qq.com');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '°üÃû',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT 'ÀàÃû',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '±íÃû',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT 'ÊôÐÔ¼¯',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `TITLE` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,Ãû³Æ,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790', '2016-01-16 23:20:36', '°´Å¥È¨ÏÞ');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,Ãû³Æ,fh,ÊÇ,fh,ÎÞ,fh,30Q313596790NAME_EN,fh,String,fh,Ó¢ÎÄ,fh,ÊÇ,fh,ÎÞ,fh,50Q313596790BIANMA,fh,String,fh,±àÂë,fh,ÊÇ,fh,ÎÞ,fh,50Q313596790PARENT_ID,fh,String,fh,ÉÏ¼¶ID,fh,·ñ,fh,ÎÞ,fh,100Q313596790BZ,fh,String,fh,±¸×¢,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790HEADMAN,fh,String,fh,¸ºÔðÈË,fh,ÊÇ,fh,ÎÞ,fh,30Q313596790TEL,fh,String,fh,µç»°,fh,ÊÇ,fh,ÎÞ,fh,50Q313596790FUNCTIONS,fh,String,fh,²¿ÃÅÖ°ÄÜ,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790ADDRESS,fh,String,fh,µØÖ·,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790', '2015-12-20 01:49:25', '×éÖ¯»ú¹¹');
INSERT INTO `sys_createcode` VALUES ('d514dbd2474d4b6c8b6ab9904cc9cc7c', 'new', 'News', 'TB_,fh,NEWS', 'TITLE,fh,String,fh,±êÌâ,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790', '2016-01-25 16:38:14', 'ÐÂÎÅ¹ÜÀí');
INSERT INTO `sys_createcode` VALUES ('dbd7b8330d774dcabd184eca8668a295', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,ÄÚÈÝ,fh,ÊÇ,fh,ÎÞ,fh,1000Q313596790TYPE,fh,String,fh,ÀàÐÍ,fh,·ñ,fh,ÎÞ,fh,5Q313596790TO_USERNAME,fh,String,fh,ÊÕÐÅÈË,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790FROM_USERNAME,fh,String,fh,·¢ÐÅÈË,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790SEND_TIME,fh,String,fh,·¢ÐÅÊ±¼ä,fh,ÊÇ,fh,ÎÞ,fh,100Q313596790STATUS,fh,String,fh,×´Ì¬,fh,·ñ,fh,ÎÞ,fh,5Q313596790SANME_ID,fh,String,fh,¹²Í¬ID,fh,ÊÇ,fh,ÎÞ,fh,100Q313596790', '2016-01-23 01:44:15', 'Õ¾ÄÚÐÅ');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,Ãû³Æ,fh,ÊÇ,fh,ÎÞ,fh,30Q313596790QX_NAME,fh,String,fh,È¨ÏÞ±êÊ¶,fh,ÊÇ,fh,ÎÞ,fh,50Q313596790BZ,fh,String,fh,±¸×¢,fh,ÊÇ,fh,ÎÞ,fh,255Q313596790', '2016-01-15 18:38:40', '°´Å¥¹ÜÀí');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'Ãû³Æ',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ó¢ÎÄ',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '±àÂë',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT 'ÉÏ¼¶ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '¸ºÔðÈË',
  `TEL` varchar(50) DEFAULT NULL COMMENT 'µç»°',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '²¿ÃÅÖ°ÄÜ',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT 'µØÖ·',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', 'ÏúÊÛ»á¼Æ', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '³É±¾»á¼Æ', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B¹«Ë¾', 'b', '002', '0', 'Ò±Ìú', 'ÀîËÄ', '112', 'Ò±Ìú', 'ºÓ±±');
INSERT INTO `sys_department` VALUES ('83a25761c618457cae2fa1211bd8696d', 'ÏúÊÛB×é', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', 'ÀîËÄ', '', '', '');
INSERT INTO `sys_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', 'ÏúÊÛA×é', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', 'ÕÅÈý', '0201212', '', '');
INSERT INTO `sys_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1¶Ó', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', 'Ð¡Íõ', '12356989', '', '');
INSERT INTO `sys_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A¹«Ë¾', 'a', '001', '0', 'ÍÚÃº', 'ÕÅÈý', '110', 'ÍÝÃº¿ó', 'É½Î÷');
INSERT INTO `sys_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', 'ÏúÊÛ²¿', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', 'ÍÆÏúÉÌÆ·', 'Ð¡Ã÷', '11236', 'ÍÆÏúÉÌÆ·', '909°ì¹«ÊÒ');
INSERT INTO `sys_department` VALUES ('d41af567914a409893d011aa53eda797', '²ÆÎñ²¿', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '¸ºÔð·¢¹¤×Ê', 'ÍõÎä', '11236', '¹ÜÀí²ÆÎñ', '308°ì¹«ÊÒ');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'Ãû³Æ',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ó¢ÎÄ',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '±àÂë',
  `ORDER_BY` int(11) NOT NULL COMMENT 'ÅÅÐò',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT 'ÉÏ¼¶ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT 'ÅÅ²é±í',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '»ÆÆÖÇø', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '»ÆÆÒ', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '±±¾©', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', '±±¾©', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', 'ÐûÎäÇø', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', 'ÐûÎäÇø', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', 'ÓïÎÄ', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', 'ÓïÎÄ', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '·ÖÀà', 'fenlei', '001', '1', '0', '·ÖÀà', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', 'µØÇø', 'diqu', '003', '3', '0', 'µØÇø', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', 'ºìÉ«', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', 'ºìÉ«', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', 'ÂÌÉ«', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', 'ÂÌÉ«', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', 'ÉÏº£', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', 'ÉÏº£', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '¿Î³Ì', 'kecheng', '002', '2', '0', '¿Î³Ì', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT 'Ãû³Æ',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT 'È¨ÏÞ±êÊ¶',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', 'µ¼³öEXCEL', 'toExcel', 'µ¼³öEXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '·¢ÓÊ¼þ', 'email', '·¢ËÍµç×ÓÓÊ¼þ');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', 'µ¼ÈëEXCEL', 'FromExcel', 'µ¼ÈëEXCELµ½ÏµÍ³ÓÃ»§');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '·¢¶ÌÐÅ', 'sms', '·¢ËÍ¶ÌÐÅ');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', 'Õ¾ÄÚÐÅ', 'FHSMS', '·¢ËÍÕ¾ÄÚÐÅ');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT 'ÄÚÈÝ',
  `TYPE` varchar(5) DEFAULT NULL COMMENT 'ÀàÐÍ',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT 'ÊÕÐÅÈË',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '·¢ÐÅÈË',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '·¢ÐÅÊ±¼ä',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '×´Ì¬',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', 'ÄãºÃ', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', 'ÄãºÃ', '2', 'san', 'admin', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', 'ÄãºÃ', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', 'ÄãºÃ', '1', 'admin', 'san', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', 'ÈáÈáÈõÈõ', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', 'ÄãºÃ', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '¹ÜÀíÔ±ºÃ', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', 'ÄãÒ²ºÃ', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', 'ÄãºÃ', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', 'ÏµÍ³¹ÜÀí', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', 'È¨ÏÞ¹ÜÀí', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', 'ÐÅÏ¢¹ÜÀí', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', '1');
INSERT INTO `sys_menu` VALUES ('7', 'Í¼Æ¬¹ÜÀí', 'pictures/list.do', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', 'ÐÔÄÜ¼à¿Ø', 'druid/index.html', '9', '1', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', 'ÏµÍ³¹¤¾ß', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO `sys_menu` VALUES ('10', '½Ó¿Ú²âÊÔ', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', '·¢ËÍÓÊ¼þ', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', 'ÖÃ¶þÎ¬Âë', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', 'µØÍ¼¹¤¾ß', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO `sys_menu` VALUES ('15', 'Î¢ÐÅ¹ÜÀí', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', '1');
INSERT INTO `sys_menu` VALUES ('16', 'ÎÄ±¾»Ø¸´', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO `sys_menu` VALUES ('17', 'Ó¦ÓÃÃüÁî', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO `sys_menu` VALUES ('18', 'Í¼ÎÄ»Ø¸´', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('19', '¹Ø×¢»Ø¸´', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('20', 'ÔÚÏß¹ÜÀí', 'onlinemanager/list.do', '1', '6', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `sys_menu` VALUES ('21', '´òÓ¡²âÊÔ', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO `sys_menu` VALUES ('22', 'Ò»¼¶²Ëµ¥', '#', '0', '6', 'menu-icon fa fa-fire orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('23', '¶þ¼¶²Ëµ¥', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('24', 'Èý¼¶²Ëµ¥', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('30', 'ËÄ¼¶²Ëµ¥', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('31', 'Îå¼¶²Ëµ¥1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('32', 'Îå¼¶²Ëµ¥2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('33', 'Áù¼¶²Ëµ¥', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('34', 'Áù¼¶²Ëµ¥2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('35', 'ËÄ¼¶²Ëµ¥2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('36', '½ÇÉ«(»ù´¡È¨ÏÞ)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('37', '°´Å¥È¨ÏÞ', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', '²Ëµ¥¹ÜÀí', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', '°´Å¥¹ÜÀí', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('40', 'ÓÃ»§¹ÜÀí', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('41', 'ÏµÍ³ÓÃ»§', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('42', '»áÔ±¹ÜÀí', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('43', 'Êý¾Ý×Öµä', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('44', '´úÂëÉú³É', 'createCode/list.do', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('45', 'Æß¼¶²Ëµ¥1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('46', 'Æß¼¶²Ëµ¥2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('47', '°Ë¼¶²Ëµ¥', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('48', 'Í¼±í±¨±í', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO `sys_menu` VALUES ('49', '×éÖ¯»ú¹¹', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '1', '5', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('50', 'Õ¾ÄÚÐÅ', 'fhsms/list.do', '6', '2', 'menu-icon fa fa-envelope green', '1', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ÏµÍ³¹ÜÀí×é', '2251798773489606', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', 'ÖÐ¼¶»áÔ±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '³õ¼¶»áÔ±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '»áÔ±×é', '498', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', 'Ò»¼¶¹ÜÀíÔ±', '2251798773489606', '1', '2251798773489606', '2251798773489606', '1125898866646982', '2251798773489606');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', 'Ö°Î»×é', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', 'Ö÷¹Ü', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '¶þ¼¶¹ÜÀíÔ±', '2251798773489606', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '¾­Àí', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '¸ß¼¶»áÔ±', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '×é³¤', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '×Ü¼à', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', 'Èý¼¶¹ÜÀíÔ±', '2251798773489606', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `½ÇÉ«±íÍâ¼ü` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('14b5c28ea6ae4508b57d2d272ab3d5f1', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('3768e60edd1c4b5c9f1dd861188ae2f9', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('9412d1d05162464c83658c7f89ab03f0', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('96567633dd3548c9b75d28f430adf5a3', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('a1478f27c852459fa9cad04b642f4fb7', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('ba6696b8761044618e44c7e02c9ba89e', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'ÏµÍ³¹ÜÀíÔ±', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2016-01-27 23:45:53', '127.0.0.1', '0', '×î¸ßÍ³ÖÎÕß', 'default', 'QQ313596790@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('69177258a06e4927b4639ab1684c3320', 'san', '47c4a8dc64ac2f0bb46bbd8813b037c9718f9349', 'Èý', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-01-25 16:25:36', '192.168.1.102', '0', '111', 'default', '978336446@qq.com', '333', '13562202556');
INSERT INTO `sys_user` VALUES ('9991f4d7782a4ccfb8a65bd96ea7aafa', 'lisi', '2612ade71c1e48cd7150b5f4df152faa699cedfe', 'ÀîËÄ', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-01-06 01:24:26', '127.0.0.1', '0', 'Ð¡Àî', 'default', '313596790@qq.com', '1102', '13566233663');
INSERT INTO `sys_user` VALUES ('e29149962e944589bb7da23ad18ddeed', 'zhangsan', 'c2da1419caf053885c492e10ebde421581cdc03f', 'ÕÅÈý', '', '3264c8e83d0248bb9e3ea6195b4c0216', '', '', '0', 'Ð¡ÕÅ', 'default', 'zhangsan@www.com', '1101', '2147483647');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '±êÌâ',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'ÎÄ¼þÃû',
  `PATH` varchar(255) DEFAULT NULL COMMENT 'Â·¾¶',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT 'ÊôÓÚ',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('b06010340ee54cfab49b8bfbe2387557', 'Í¼Æ¬', '5e6ba5ad3067482e9a8063b0627ee983.png', '20160125/5e6ba5ad3067482e9a8063b0627ee983.png', '2016-01-25 16:49:44', '1', 'Í¼Æ¬¹ÜÀí´¦ÉÏ´«');
INSERT INTO `tb_pictures` VALUES ('c9f1eca620c94c27bfa7028c66911f41', 'Í¼Æ¬', '928da750ec8542ceb7b2495f45ea6a9e.jpg', '20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg', '2016-01-25 16:49:44', '1', 'Í¼Æ¬¹ÜÀí´¦ÉÏ´«');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '¹Ø¼ü´Ê',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT 'Ó¦ÓÃÂ·¾¶',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `STATUS` int(1) NOT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', 'Ëø¶¨·þÎñÆ÷', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', 'Ëø¶¨¼ÆËã»ú');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '´ò¿ªä¯ÀÀÆ÷', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '´ò¿ªä¯ÀÀÆ÷²Ù×÷');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '¹Ø±Õä¯ÀÀÆ÷', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', '¹Ø±Õä¯ÀÀÆ÷²Ù×÷');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '¹Ø±ÕQQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '¹Ø±ÕQQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '´ò¿ªQQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '´ò¿ªQQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '¹Ø¼ü´Ê',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `STATUS` int(11) NOT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '±êÌâ1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '±êÌâ2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '±êÌâ3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '±êÌâ4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '±êÌâ5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '±êÌâ6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '±êÌâ7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '±êÌâ8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT 'ÃèÊö8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT 'Í¼Æ¬µØÖ·8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '³¬Á´½Ó8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', 'Ê×Ò³', '2015-05-10 20:51:09', '1', 'Í¼ÎÄ»Ø¸´', 'Í¼ÎÄ»Ø¸´±êÌâ', 'Í¼ÎÄ»Ø¸´ÃèÊö', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '¹Ø¼ü´Ê',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT 'ÄÚÈÝ',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '´´½¨Ê±¼ä',
  `STATUS` int(2) DEFAULT NULL COMMENT '×´Ì¬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '±¸×¢',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('63681adbe7144f10b66d6863e07f23c2', 'ÄãºÃ', 'ÄãÒ²ºÃ', '2015-05-09 02:39:23', '1', 'ÎÄ±¾»Ø¸´');
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '³Ô·¹', '³ÔÁËàÞàÞàÞàÞ', '2015-05-10 22:52:27', '1', 'ÎÄ±¾»Ø¸´');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '¹Ø×¢', 'ÕâÀïÊÇ¹Ø×¢ºó»Ø¸´µÄÄÚÈÝ', '2015-05-11 02:12:36', '1', '¹Ø×¢»Ø¸´');


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_TAGCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `TB_TAGCATEGORY`;
CREATE TABLE `TB_TAGCATEGORY` (
 		`TAGCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT 'Ãû³Æ',
		`PARENT_ID` varchar(255) DEFAULT NULL COMMENT '¸¸±êÇ©ID',
		`METATYPE` varchar(255) DEFAULT NULL COMMENT 'ÔªÀàÐÍ£¬Èç¡°Éú»î·½Ê½¡±',
		`ISEXCLUSIVE` varchar(255) DEFAULT NULL COMMENT '¸Ã·ÖÀàÏÂµÄ±êÇ©ÊÇ·ñ»¥³â',
>>>>>>> branch 'master' of github.com:shouxinjk/ihealth.git
  		PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
>>>>>>> bfdab7b85bbbc776f91a5b332cc00544542f0965
