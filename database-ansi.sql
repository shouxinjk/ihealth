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
  `LAST_LOGIN` timestamp NULL DEFAULT NULL,
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
  `SEX` varchar(255) DEFAULT NULL COMMENT '�Ա�',
  `BIRTHDAY` date DEFAULT NULL COMMENT '����',
  `MARRIAGESTATUS` varchar(255) DEFAULT NULL COMMENT '����״��',
  `HEIGHT` int(11) DEFAULT '170' COMMENT '���',
  `WEIGHT` int(11) DEFAULT '50' COMMENT '����',
  `BIRTHPLACE` varchar(255) DEFAULT NULL COMMENT '������',
  `LIVEPLACE` varchar(255) DEFAULT NULL COMMENT '��ס��',
  `CAREER` varchar(255) DEFAULT NULL COMMENT 'ְҵ',
  `DEGREE` varchar(255) DEFAULT NULL COMMENT 'ѧ��',
  `OPENID` varchar(255) DEFAULT NULL COMMENT 'openid',
  `AVATAR` varchar(255) DEFAULT '../images/defaultimg.png' COMMENT '�û�ͷ��',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����û�ID',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼��ʱ��',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_app_user_and_user`;
CREATE TABLE `sys_app_user_and_user` (
  `useranduser_id` varchar(32) NOT NULL,
  `user_id_one` varchar(32) DEFAULT NULL,
  `user_id_two` varchar(32) DEFAULT NULL,
  `connection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`useranduser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '����',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '����',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '����',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '���Լ�',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '����ʱ��',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,����,fh,��,fh,��,fh,255Q313596790', '2016-01-16 23:20:36', '��ťȨ��');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,����,fh,��,fh,��,fh,30Q313596790NAME_EN,fh,String,fh,Ӣ��,fh,��,fh,��,fh,50Q313596790BIANMA,fh,String,fh,����,fh,��,fh,��,fh,50Q313596790PARENT_ID,fh,String,fh,�ϼ�ID,fh,��,fh,��,fh,100Q313596790BZ,fh,String,fh,��ע,fh,��,fh,��,fh,255Q313596790HEADMAN,fh,String,fh,������,fh,��,fh,��,fh,30Q313596790TEL,fh,String,fh,�绰,fh,��,fh,��,fh,50Q313596790FUNCTIONS,fh,String,fh,����ְ��,fh,��,fh,��,fh,255Q313596790ADDRESS,fh,String,fh,��ַ,fh,��,fh,��,fh,255Q313596790', '2015-12-20 01:49:25', '��֯����');
INSERT INTO `sys_createcode` VALUES ('d514dbd2474d4b6c8b6ab9904cc9cc7c', 'new', 'News', 'TB_,fh,NEWS', 'TITLE,fh,String,fh,����,fh,��,fh,��,fh,255Q313596790', '2016-01-25 16:38:14', '���Ź���');
INSERT INTO `sys_createcode` VALUES ('dbd7b8330d774dcabd184eca8668a295', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,����,fh,��,fh,��,fh,1000Q313596790TYPE,fh,String,fh,����,fh,��,fh,��,fh,5Q313596790TO_USERNAME,fh,String,fh,������,fh,��,fh,��,fh,255Q313596790FROM_USERNAME,fh,String,fh,������,fh,��,fh,��,fh,255Q313596790SEND_TIME,fh,String,fh,����ʱ��,fh,��,fh,��,fh,100Q313596790STATUS,fh,String,fh,״̬,fh,��,fh,��,fh,5Q313596790SANME_ID,fh,String,fh,��ͬID,fh,��,fh,��,fh,100Q313596790', '2016-01-23 01:44:15', 'վ����');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,����,fh,��,fh,��,fh,30Q313596790QX_NAME,fh,String,fh,Ȩ�ޱ�ʶ,fh,��,fh,��,fh,50Q313596790BZ,fh,String,fh,��ע,fh,��,fh,��,fh,255Q313596790', '2016-01-15 18:38:40', '��ť����');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '����',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ӣ��',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '����',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '�ϼ�ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '��ע',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '������',
  `TEL` varchar(50) DEFAULT NULL COMMENT '�绰',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '����ְ��',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '��ַ',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', '���ۻ��', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '�ɱ����', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B��˾', 'b', '002', '0', 'ұ��', '����', '112', 'ұ��', '�ӱ�');
INSERT INTO `sys_department` VALUES ('83a25761c618457cae2fa1211bd8696d', '����B��', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '����', '', '', '');
INSERT INTO `sys_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', '����A��', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '����', '0201212', '', '');
INSERT INTO `sys_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1��', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', 'С��', '12356989', '', '');
INSERT INTO `sys_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A��˾', 'a', '001', '0', '��ú', '����', '110', '��ú��', 'ɽ��');
INSERT INTO `sys_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', '���۲�', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '������Ʒ', 'С��', '11236', '������Ʒ', '909�칫��');
INSERT INTO `sys_department` VALUES ('d41af567914a409893d011aa53eda797', '����', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '���𷢹���', '����', '11236', '�������', '308�칫��');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '����',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT 'Ӣ��',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '����',
  `ORDER_BY` int(11) NOT NULL COMMENT '����',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '�ϼ�ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '��ע',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '�Ų��',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '������', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '����', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '����', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', '����', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', '������', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', '������', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', '����', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', '����', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '����', 'fenlei', '001', '1', '0', '����', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', '����', 'diqu', '003', '3', '0', '����', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', '��ɫ', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', '��ɫ', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', '��ɫ', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', '��ɫ', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '�Ϻ�', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', '�Ϻ�', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '�γ�', 'kecheng', '002', '2', '0', '�γ�', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '����',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT 'Ȩ�ޱ�ʶ',
  `BZ` varchar(255) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '����EXCEL', 'toExcel', '����EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '���ʼ�', 'email', '���͵����ʼ�');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '����EXCEL', 'FromExcel', '����EXCEL��ϵͳ�û�');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '������', 'sms', '���Ͷ���');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', 'վ����', 'FHSMS', '����վ����');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '����',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '����',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '������',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '������',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '����ʱ��',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '״̬',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '���', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '���', '2', 'san', 'admin', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '���', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '���', '1', 'admin', 'san', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '��������', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '���', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '����Ա��', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '��Ҳ��', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '���', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

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
INSERT INTO `sys_menu` VALUES ('1', 'ϵͳ����', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', 'Ȩ�޹���', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', '��Ϣ����', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', '1');
INSERT INTO `sys_menu` VALUES ('7', 'ͼƬ����', 'pictures/list.do', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', '���ܼ��', 'druid/index.html', '9', '1', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', 'ϵͳ����', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO `sys_menu` VALUES ('10', '�ӿڲ���', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', '�����ʼ�', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', '�ö�ά��', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', '��ͼ����', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO `sys_menu` VALUES ('15', '΢�Ź���', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', '1');
INSERT INTO `sys_menu` VALUES ('16', '�ı��ظ�', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO `sys_menu` VALUES ('17', 'Ӧ������', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO `sys_menu` VALUES ('18', 'ͼ�Ļظ�', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('19', '��ע�ظ�', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('20', '���߹���', 'onlinemanager/list.do', '1', '6', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `sys_menu` VALUES ('21', '��ӡ����', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO `sys_menu` VALUES ('22', 'һ���˵�', '#', '0', '6', 'menu-icon fa fa-fire orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('23', '�����˵�', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('24', '�����˵�', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('30', '�ļ��˵�', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('31', '�弶�˵�1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('32', '�弶�˵�2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('33', '�����˵�', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('34', '�����˵�2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('35', '�ļ��˵�2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('36', '��ɫ(����Ȩ��)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('37', '��ťȨ��', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', '�˵�����', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', '��ť����', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('40', '�û�����', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('41', 'ϵͳ�û�', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('42', '��Ա����', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('43', '�����ֵ�', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('44', '��������', 'createCode/list.do', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('45', '�߼��˵�1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('46', '�߼��˵�2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('47', '�˼��˵�', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('48', 'ͼ����', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO `sys_menu` VALUES ('49', '��֯����', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '1', '5', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('50', 'վ����', 'fhsms/list.do', '6', '2', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('51', '������Ϣ����', 'article/list.do', '6', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('73', 'ָ�Ϲ���', 'examguideline/list.do', '6', '4', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('75', '����ײ͹���', 'checkuppackage/listAll.do', '6', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('94', '��������', 'disease/listAllDiseasecategory.do', '6', '5', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('95', '��ǩ����', 'tag/listAllTagCategory.do', '6', '6', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('116', '��ǩ�������', 'tagcategory/listAllTagCategoryTree.do?TAGCATEGORY_ID=0', '6', '7', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('137', '�����������', 'diseasecategory/listAllDiseaseCategoryTree.do?DISEASECATEGORY_ID=0', '6', '8', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('158', 'ҽѧ���������', 'examcategory/listAllExamCategory.do?EXAMCATEGORY_ID=0', '6', '9', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('177', '�鿴΢��ע���û�', 'user/getUsers.do', '40', '3', 'menu-icon fa fa-users brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('179', 'ҽѧ�����Ŀ����', 'examitem/listAllExamCategory.do', '6', '10', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('221', 'ָ�Ϲ������', 'examguideline/listRule.do', '6', '12', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('222', '���Ƶ��', 'examfrequency/list.do', '6', '14', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('243', 'ָ�Ϸ�������', 'examguideline/listRelease.do', '6', '13', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('244', '�������', 'article/auditList.do', '6', '15', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('245', 'ָ�����', 'examguideline/listVerify.do', '6', '14', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('266', '���·���', 'article/articleRelease.do', '6', '16', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('267', 'ָ����ά���', 'examguideline/listRelVerify.do', '6', '18', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('288', '������Ĺ���', 'medicalcenter/list.do', '372', '19', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('309', '�����Ŀ����', 'medicalexamitem/list.do', '372', '21', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('330', '�û���������', 'order/list.do', '372', '20', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('351', '������Ķ�������', 'medicalorder/list.do', '372', '22', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('372', '�������(ҽԺ)', '#', '0', '7', 'menu-icon fa fa-leaf black', '2', '1');
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

insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('1','ϵͳ������','2251798773489606','0','1','1','1','1');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('115b386ff04f4352b060dffcd2b5d1da','�м���Ա','498','2','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('1b67fc82ce89457a8347ae53e43a347e','������Ա','498','2','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('2','��Ա��','498','0','0','0','0','1');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('3264c8e83d0248bb9e3ea6195b4c0216','һ������Ա','118571198322457521683259327569727595184370969558060170687607043651933702855843782','1','118571198322457521683259327569727595184370969558060170687607043651933702855843782','118571198322457521683259327569727595184370969558060170687607043651933702855843782','118571198322457521683259327569727595184370969558060170687607043651933702855843782','118571198322457521683259327569727595184370969558060170687607043651933702855843782');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('46294b31a71c4600801724a6eb06bb26','ְλ��','','0','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('5466347ac07044cb8d82990ec7f3a90e','����','','46294b31a71c4600801724a6eb06bb26','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('68f8e4a39efe47c7bb869e9d15ab925d','��������Ա','2251798773489606','1','0','0','2251798773489606','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('856849f422774ad390a4e564054d8cc8','����','','46294b31a71c4600801724a6eb06bb26','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('8b70a7e67f2841e7aaba8a4d92e5ff6f','�߼���Ա','498','2','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('c21cecf84048434b93383182b1d98cba','�鳤','','46294b31a71c4600801724a6eb06bb26','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('d449195cd8e7491080688c58e11452eb','�ܼ�','','46294b31a71c4600801724a6eb06bb26','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('de9de2f006e145a29d52dfadda295353','��������Ա','2251798773489606','1','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('e32c2f37d1744d10a76813eee4a882ae','ҽ��','118571198322457521683259327569727595184370969558060170687607043650807803989196992','1','118571198322457521683259327569727595184370969558060170687607043650807803989196992','118571198322457521683259327569727595184370969558060170687607043650807803989196992','118571198322457521683259327569727595184370969558060170687607043650807803989196992','118571198322457521683259327569727595184370969558060170687607043650807803989196992');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `��ɫ�����` (`ROLE_ID`) USING BTREE,
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
  `LAST_LOGIN` timestamp NULL DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','ϵͳ����Ա','1133671055321055258374707980945218933803269864762743594642571294','1','2016-05-19 18:02:56','222.211.175.23','0','���ͳ����','default','QQ313596790@main.com','001','18788888888');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('69177258a06e4927b4639ab1684c3320','san','47c4a8dc64ac2f0bb46bbd8813b037c9718f9349','��','','3264c8e83d0248bb9e3ea6195b4c0216','2016-05-23 14:35:59','221.237.114.67','0','111','default','978336446@qq.com','333','13562202556');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('7e444063e18b4c059c7346bb11f26f6d','qchzhu','9b74b644687479cb3b258a5701e530e279986ed2','Zhuqingchun','','3264c8e83d0248bb9e3ea6195b4c0216','2016-05-23 11:06:07','222.211.175.23','0','����Ա','default','zhuqingchun@shouxinjk.com','admin001','13678189382');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('9991f4d7782a4ccfb8a65bd96ea7aafa','lisi','2612ade71c1e48cd7150b5f4df152faa699cedfe','����','','3264c8e83d0248bb9e3ea6195b4c0216','2016-05-19 18:11:45','221.237.114.67','0','С��','default','313596790@qq.com','1102','13566233663');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('e29149962e944589bb7da23ad18ddeed','zhangsan','c2da1419caf053885c492e10ebde421581cdc03f','����','','3264c8e83d0248bb9e3ea6195b4c0216','2016-05-17 14:20:39','','0','С��','default','zhangsan@www.com','1101','2147483647');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('f5c882b90236479d803369bd580c2ae2','maqin','0e4d1168ea3a929297c350338f7be98c892efdb9','����','','e32c2f37d1744d10a76813eee4a882ae','2016-05-23 14:37:26','221.237.114.67','0','','default','maqin@shouxinjk.com','S00001','13880615408');


DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '����',
  `NAME` varchar(255) DEFAULT NULL COMMENT '�ļ���',
  `PATH` varchar(255) DEFAULT NULL COMMENT '·��',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '����ʱ��',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '����',
  `BZ` varchar(255) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('b06010340ee54cfab49b8bfbe2387557', 'ͼƬ', '5e6ba5ad3067482e9a8063b0627ee983.png', '20160125/5e6ba5ad3067482e9a8063b0627ee983.png', '2016-01-25 16:49:44', '1', 'ͼƬ�����ϴ�');
INSERT INTO `tb_pictures` VALUES ('c9f1eca620c94c27bfa7028c66911f41', 'ͼƬ', '928da750ec8542ceb7b2495f45ea6a9e.jpg', '20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg', '2016-01-25 16:49:44', '1', 'ͼƬ�����ϴ�');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '�ؼ���',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT 'Ӧ��·��',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '����ʱ��',
  `STATUS` int(1) NOT NULL COMMENT '״̬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '����������', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', '���������');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '�������', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '�����������');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '�ر������', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', '�ر����������');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '�ر�QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '�ر�QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '��QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '��QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '�ؼ���',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '����ʱ��',
  `STATUS` int(11) NOT NULL COMMENT '״̬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '��ע',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '����1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '����1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT 'ͼƬ��ַ1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '������1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '����2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '����2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT 'ͼƬ��ַ2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '������2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '����3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '����3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT 'ͼƬ��ַ3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '������3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '����4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '����4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT 'ͼƬ��ַ4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '������4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '����5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '����5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT 'ͼƬ��ַ5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '������5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '����6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '����6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT 'ͼƬ��ַ6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '������6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '����7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '����7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT 'ͼƬ��ַ7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '������7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '����8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '����8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT 'ͼƬ��ַ8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '������8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '��ҳ', '2015-05-10 20:51:09', '1', 'ͼ�Ļظ�', 'ͼ�Ļظ�����', 'ͼ�Ļظ�����', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '�ؼ���',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '����',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '����ʱ��',
  `STATUS` int(2) DEFAULT NULL COMMENT '״̬',
  `BZ` varchar(255) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('63681adbe7144f10b66d6863e07f23c2', '���', '��Ҳ��', '2015-05-09 02:39:23', '1', '�ı��ظ�');
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '�Է�', '������������', '2015-05-10 22:52:27', '1', '�ı��ظ�');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '��ע', '�����ǹ�ע��ظ�������', '2015-05-11 02:12:36', '1', '��ע�ظ�');


DROP TABLE IF EXISTS `tb_checkupitem`;
CREATE TABLE `tb_checkupitem` (
  `CHECKUPITEM_ID` varchar(100) NOT NULL,
  `SUBGROUP` varchar(255) DEFAULT NULL COMMENT '�����Ŀ����',
  `NAME` varchar(255) DEFAULT NULL COMMENT '�����Ŀ����',
  `FEATURES` varchar(255) DEFAULT NULL COMMENT '����',
  `FREQUENCY` varchar(255) DEFAULT NULL COMMENT '���Ƶ��',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '״̬',
  `ORIGINATE` varchar(255) DEFAULT NULL COMMENT 'ָ����Դ',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '��ϸ����',
  `GENERATEDTIME` timestamp NULL DEFAULT NULL COMMENT '�ü�¼����ʱ��',
  `WORKER` varchar(255) DEFAULT NULL COMMENT '���ڲ����ü�¼�ı��',
  `REVISION` int(11) DEFAULT NULL COMMENT '�汾',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT 'ϵͳ���',
  `CHECKUPPACKAGE_ID` varchar(100) DEFAULT NULL COMMENT '����ײ����',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '�û������',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����û�ID',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼��ʱ��',
  `concernedfactors` varchar(1024) DEFAULT NULL,
  `disease_name` varchar(50) DEFAULT NULL,
  `riskType` varchar(50) DEFAULT NULL,
  `solution_id` varchar(50) DEFAULT NULL,
  `riskDefine` varchar(1024) DEFAULT NULL,
  `startage` int(11) DEFAULT NULL,
  `endage` int(11) DEFAULT NULL,
  PRIMARY KEY (`CHECKUPITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_checkuppackage` */
DROP TABLE IF EXISTS `tb_checkuppackage`;
CREATE TABLE `tb_checkuppackage` (
  `CHECKUPPACKAGE_ID` varchar(100) NOT NULL,
  `WORKER` varchar(255) DEFAULT NULL COMMENT '���ɸü�¼�ı��',
  `GENERATEDTIME` timestamp NULL DEFAULT NULL COMMENT '�ü�¼����ʱ��',
  `EFFECTIVEFROM` timestamp NULL DEFAULT NULL COMMENT '��ʼ��Чʱ��',
  `EXPIREON` timestamp NULL DEFAULT NULL COMMENT 'ʧЧʱ��',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '״̬',
  `REVISION` varchar(255) DEFAULT NULL COMMENT '�汾',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT 'ϵͳ���',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '�û������',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����û�ID',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼��ʱ��',
  PRIMARY KEY (`CHECKUPPACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_ARTICLE`
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `ARTICLE_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '����',
  `AUTHOR` varchar(255) DEFAULT NULL COMMENT '����',
  `LOGOURL` varchar(255) DEFAULT NULL COMMENT '��Ƭurl',
  `URL` varchar(255) DEFAULT NULL COMMENT '����url',
  `SUMMARY` varchar(255) DEFAULT NULL COMMENT 'ժҪ',
  `PUBLISHTIME` timestamp NULL DEFAULT NULL COMMENT '����ʱ��',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '������¼Ա��id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '������¼ʱ��',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '״̬',
  PRIMARY KEY (`ARTICLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `admin_tagandarticle`;
CREATE TABLE `admin_tagandarticle` (
  `id` varchar(32) NOT NULL,
  `tag_id` varchar(32) DEFAULT NULL,
  `article_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `admin_diseaseandarticle`;
CREATE TABLE `admin_diseaseandarticle` (
  `diseaseandarticle_id` varchar(32) NOT NULL,
  `article_id` varchar(32) DEFAULT NULL,
  `disease_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`diseaseandarticle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for admin_disease
-- ----------------------------
DROP TABLE IF EXISTS `admin_disease`;
CREATE TABLE `admin_disease` (
  `DISEASE_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
  `ISINHERITABLE` int(11) NOT NULL COMMENT '�Ƿ��Ŵ�����',
  `ISHIGHINCIDENCE` int(11) NOT NULL COMMENT '�Ƿ�߷�',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '������¼Ա��id',
 `CREATEON` timestamp NULL DEFAULT NULL COMMENT '������¼ʱ��',
  `DISEASECATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '�����������',
  PRIMARY KEY (`DISEASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_disease
-- ----------------------------


-- ----------------------------
-- Table structure for admin_diseasecategory
-- ----------------------------
DROP TABLE IF EXISTS `admin_diseasecategory`;
CREATE TABLE `admin_diseasecategory` (
  `DISEASECATEGORY_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '������¼Ա��id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '������¼ʱ��',
  `PARENT_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DISEASECATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_diseasecategory
-- ----------------------------


-- ----------------------------
-- Table structure for admin_tag
-- ----------------------------
DROP TABLE IF EXISTS `admin_tag`;
CREATE TABLE `admin_tag` (
  `TAG_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `EXPRESSION` varchar(255) DEFAULT NULL COMMENT '���ʽ',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�û�id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '������¼ʱ��',
  `TAGCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '��������id',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `fieldName` varchar(512) DEFAULT NULL COMMENT '�ֶ�����',
  `fieldType` varchar(512) DEFAULT NULL COMMENT '�ֶ�����',
  PRIMARY KEY (`TAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_tag
-- ----------------------------

-- ----------------------------
-- Table structure for admin_tagcategory
-- ----------------------------
DROP TABLE IF EXISTS `admin_tagcategory`;
CREATE TABLE `admin_tagcategory` (
  `TAGCATEGORY_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '��ǩ��������',
  `MATETYPE` varchar(255) DEFAULT NULL COMMENT '����',
  `ISEXCLUSIVE` int(11) NOT NULL COMMENT '�Ƿ��ѡ',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�û�id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '������¼ʱ��',
  `PARENT_ID` varchar(255) DEFAULT NULL COMMENT '����id',
  PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for exam_examcategory
-- ----------------------------
DROP TABLE IF EXISTS `exam_examcategory`;
CREATE TABLE `exam_examcategory` (
  `EXAMCATEGORY_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '�����Ŀ��������',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼Ա��id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '������¼ʱ��',
  `PARENT_ID` varchar(255) DEFAULT NULL COMMENT '����id',
  PRIMARY KEY (`EXAMCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_examcategory
-- ----------------------------


-- ----------------------------
-- Table structure for exam_examfrequency
-- ----------------------------
DROP TABLE IF EXISTS `exam_examfrequency`;
CREATE TABLE `exam_examfrequency` (
  `EXAMFREQUENCY_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `EXPRESSION` varchar(255) DEFAULT NULL COMMENT 'CRON���ʽ��������ļ��Ƶ��',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼Ա����id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '������¼ʱ��',
  PRIMARY KEY (`EXAMFREQUENCY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_examfrequency
-- ----------------------------


-- ----------------------------
-- Table structure for exam_examguideline
-- ----------------------------
DROP TABLE IF EXISTS `exam_examguideline`;
CREATE TABLE `exam_examguideline` (
  `EXAMGUIDELINE_ID` varchar(100) NOT NULL,
  `ORIGINATE` varchar(255) DEFAULT NULL COMMENT '��Դ',
  `DESCRIPTION` varchar(512) DEFAULT '' COMMENT 'ָ����ϸ����',
  `CONCERNEDFACTORS` varchar(1024) DEFAULT '' COMMENT '��ע��������',
  `HIGHRISKDEFINE` varchar(512) DEFAULT '' COMMENT '��Σ��Ⱥʶ��',
  `HIGHRISKEXPRESSION` varchar(255) DEFAULT '1=1' COMMENT '��Σ��Ⱥʶ��ű�',
  `LOWRISKDEFINE` varchar(512) DEFAULT '' COMMENT '��ͨ��Ⱥʶ��',
  `LOWRISKEXPRESSION` varchar(255) DEFAULT '1=1' COMMENT '��ͨ��Ⱥʶ��ű�',
  `STATUS` set('��ʧЧ','�ѷ���','��ά���ʧ��','��ά���','�Ѳ���','���ʧ��','�����','���ύ','�½�') DEFAULT '�½�' COMMENT '״̬',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼Ա��id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `DISEASE_ID` varchar(32) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EXAMGUIDELINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_examguideline
-- ----------------------------

-- ----------------------------
-- Table structure for exam_examitem
-- ----------------------------
DROP TABLE IF EXISTS `exam_examitem`;
CREATE TABLE `exam_examitem` (
  `EXAMITEM_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼Ա��id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `EXAMCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `EXAMITEM_PARENT_ID` varchar(32) DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  PRIMARY KEY (`EXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for exam_examsolution
-- ----------------------------
DROP TABLE IF EXISTS `exam_examsolution`;
CREATE TABLE `exam_examsolution` (
  `EXAMSOLUTION_ID` varchar(100) NOT NULL,
  `SUBGROUP` varchar(255) DEFAULT NULL COMMENT '����ֶη�����',
  `RISKTYPE` set('low','middle','high') DEFAULT 'low' COMMENT '��Ԥ�ֶζ�Ӧ����',
  `STARTAGE` int(11) DEFAULT 0 COMMENT '��ʼ�������',
  `ENDAGE` int(255) DEFAULT 200 COMMENT '�����������',
  `FEATURES` set('��ȫ','ȫ��','����') DEFAULT '' COMMENT 'ҽѧ����ֶ�',
  `EXAMGUIDELINE_ID` varchar(100) DEFAULT NULL,
  `EXAMITEM_ID` varchar(100) DEFAULT NULL,
  `EXAMFREQUENCY_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EXAMSOLUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_examsolution
-- ----------------------------

DROP TABLE IF EXISTS `sys_app_user_and_family_disease`;
CREATE TABLE `sys_app_user_and_family_disease` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `disease_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_app_user_and_focus_disease`;
CREATE TABLE `sys_app_user_and_focus_disease` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `disease_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_app_user_and_personal_disease`;
CREATE TABLE `sys_app_user_and_personal_disease` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `disease_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_app_user_and_tag`;
CREATE TABLE `sys_app_user_and_tag` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `tag_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for tb_medicalcenter
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicalcenter`;
CREATE TABLE `tb_medicalcenter` (
  `MEDICALCENTER_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '�����������',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '�����������',
  `LOCATION` varchar(255) DEFAULT NULL COMMENT '������ĵ���λ��',
  `ABBREVIATION` varchar(255) DEFAULT NULL COMMENT '������ļ��',
  `TELEPHONE` varchar(255) DEFAULT NULL COMMENT '���������ϵ�绰',
  `STATUS` set('����','���','�ύ','�½�') NOT NULL DEFAULT '�½�' COMMENT '�������״̬',
  `LOGO` varchar(255) DEFAULT NULL COMMENT '�������logoͼƬ��ַ',
  `OPENINGTIME` varchar(32) DEFAULT NULL COMMENT '������Ŀ�ҵʱ��',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼�û�id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `ACCESSORY` varchar(255) DEFAULT NULL COMMENT '������Ļ�ҽԺ������Ϣ',
  `POSITION` varchar(255) DEFAULT NULL COMMENT '������Ļ�ҽԺ��γ�ȵ���λ��',
  `PARENTID` varchar(255) DEFAULT NULL COMMENT '������Ļ�ҽԺ��֧����',
  PRIMARY KEY (`MEDICALCENTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalcenter
-- ----------------------------
INSERT INTO `tb_medicalcenter` VALUES ('2', 'vbbb', 'bbb', 'bb', 'bbb', 'bbbb', '�½�', 'bbbb', null, 'bbbb', null, 'bbbbb', 'bbbbb', '5b901194b7cc42c0b6a95a54a1cd7350');
INSERT INTO `tb_medicalcenter` VALUES ('3', 'vbbb', 'bbb', 'bb', 'bbb', 'bbbb', '�½�', 'bbbb', '', 'bbbb', '2016-05-03 14:57:10', 'bbbbb', 'bbbbb', '3');
INSERT INTO `tb_medicalcenter` VALUES ('5b901194b7cc42c0b6a95a54a1cd7350', 'aaaa', 'AA', 'aaa', 'aaaa', 'aaaaaa', '�½�', 'aaaaa', '2016-05-16', '', '2016-05-19 14:34:00', 'aaaa', 'aaa', '0');


-- ----------------------------
-- Table structure for tb_medicalexamitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicalexamitem`;
CREATE TABLE `tb_medicalexamitem` (
  `MEDICALEXAMITEM_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '�����Ŀ����',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '�����Ŀ˵��',
  `FEATURES` varchar(255) DEFAULT NULL COMMENT '�����Ŀ����',
  `SELLINGPRICE` double(11,0) DEFAULT NULL COMMENT '�����Ŀ���ۼ۸�',
  `SETTLEMENTPRICE` double(11,0) DEFAULT NULL COMMENT '�����Ŀ����۸�',
  `LOGO` varchar(255) DEFAULT NULL COMMENT '�����ĿlogoͼƬurl��ַ',
  `STATUS` set('���','�ύ','�½�') DEFAULT '�½�' COMMENT '�����Ŀ״̬',
  `EFFECTIVETIME` varchar(32) DEFAULT NULL COMMENT '�����Ŀ��Чʱ��',
  `EXPIRETIME` varchar(32) DEFAULT NULL COMMENT '�����ĿʧЧʱ��',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼�û�id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `EXAMITEM_ID` varchar(100) DEFAULT NULL,
  `MEDICALCENTER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEDICALEXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalexamitem
-- ----------------------------
INSERT INTO `tb_medicalexamitem` VALUES ('0673d0a7814345e892d28c3ce9d1a586', 'Aaaaaa', 'aa', 'aaa', '22', '3', 'bb', '�½�', '2016-05-18', '2016-05-28', null, '2016-05-19 18:22:00', null, '5b901194b7cc42c0b6a95a54a1cd7350');
INSERT INTO `tb_medicalexamitem` VALUES ('9aada469eefd44b4bfc27b4f3fc81f6b', '����ŮŮ', '����ŮŮ', '����ŮŮ', '11', '22', 'nn', '�½�', '2016-05-25', '2016-05-18', null, '2016-05-20 10:43:55', '1', '3');
INSERT INTO `tb_medicalexamitem` VALUES ('ddb62967f06c4f558dadff0c06dcafe9', 'bbv1', 'bbv', 'bbv', '22', '22', 'bbv', '�½�', '2016-05-03', '2016-05-06', 'bbnv', '2016-05-19 14:44:13', '1', '5b901194b7cc42c0b6a95a54a1cd7350');


-- ----------------------------
-- Table structure for tb_medicalceneradmin
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicalceneradmin`;
CREATE TABLE `tb_medicalceneradmin` (
  `MEDICALCENERADMIN_ID` varchar(100) NOT NULL,
  `DEPARTMENT` varchar(255) DEFAULT NULL COMMENT '�������Ҳ���',
  `TITLE` varchar(255) DEFAULT NULL COMMENT 'ְλ',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼�û�id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `SYS_USER_ID` varchar(100) DEFAULT NULL,
  `MEDICALCENTER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEDICALCENERADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalceneradmin
-- ----------------------------
INSERT INTO `tb_medicalceneradmin` VALUES ('1', 'Ժ��', 'Ժ��', '', '2016-05-03 09:47:19', '69177258a06e4927b4639ab1684c3320', '5b901194b7cc42c0b6a95a54a1cd7350');

-- ----------------------------
-- Table structure for tb_medicalorder
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicalorder`;
CREATE TABLE `tb_medicalorder` (
  `MEDICALORDER_ID` varchar(100) NOT NULL,
  `MEDICALORDERNO` varchar(255) DEFAULT NULL COMMENT '������',
  `MEDICALORDERGENERATIONTIME` timestamp NULL DEFAULT NULL COMMENT '��������ʱ��',
  `MEDICALORDERBOOKINGTIME` timestamp NULL DEFAULT NULL COMMENT '����ԤԼʱ��',
  `MEDICALORDEREXECUTIONTIME` timestamp NULL DEFAULT NULL COMMENT '����ʵ��ִ��ʱ��',
  `MEDICALTOTALAMOUNT` double NOT NULL COMMENT '�����ܽ��',
  `STATUS` set('���','�ύ','�½�') DEFAULT '�½�' COMMENT '����״̬',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼�û�id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `MEDICALCENTER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEDICALORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalorder
-- ----------------------------
INSERT INTO `tb_medicalorder` VALUES ('1', '222222', '2016-04-27 10:27:26', '2016-05-10 10:27:28', '2016-05-02 10:27:31', '222', '�½�', '11', '2016-04-29 10:27:37', '5b901194b7cc42c0b6a95a54a1cd7350');
INSERT INTO `tb_medicalorder` VALUES ('2', '111', '2016-05-28 10:27:56', '2016-05-07 10:27:53', '2016-05-04 10:27:49', '22222', '�½�', '11', '2016-04-29 10:27:42', '1');
INSERT INTO `tb_medicalorder` VALUES ('3', '222', '2016-05-25 10:28:10', '2016-05-09 10:28:16', '2016-04-25 10:28:19', '333', '�½�', '22', '2016-05-19 10:28:29', '2');

-- ----------------------------
-- Table structure for tb_medicalorderitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicalorderitem`;
CREATE TABLE `tb_medicalorderitem` (
  `MEDICALORDERITEM_ID` varchar(100) NOT NULL,
  `MEDICALEXAMITEM_ID` varchar(100) DEFAULT NULL,
  `MEDICALORDER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEDICALORDERITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalorderitem
-- ----------------------------
INSERT INTO `tb_medicalorderitem` VALUES ('1', '0673d0a7814345e892d28c3ce9d1a586', '1');
INSERT INTO `tb_medicalorderitem` VALUES ('2', '0673d0a7814345e892d28c3ce9d1a586', '2');
INSERT INTO `tb_medicalorderitem` VALUES ('3', '9aada469eefd44b4bfc27b4f3fc81f6b', '1');
INSERT INTO `tb_medicalorderitem` VALUES ('4', 'ddb62967f06c4f558dadff0c06dcafe9', '2');


-- ----------------------------
-- Table structure for tb_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `ORDERITEM_ID` varchar(100) NOT NULL,
  `MEDICALEXAMITEM_ID` varchar(100) DEFAULT NULL,
  `ORDER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ORDERITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_orderitem
-- ----------------------------
INSERT INTO `tb_orderitem` VALUES ('1', '0673d0a7814345e892d28c3ce9d1a586', '1');
INSERT INTO `tb_orderitem` VALUES ('2', '9aada469eefd44b4bfc27b4f3fc81f6b', '1');
INSERT INTO `tb_orderitem` VALUES ('3', '0673d0a7814345e892d28c3ce9d1a586', '2');
INSERT INTO `tb_orderitem` VALUES ('4', 'ddb62967f06c4f558dadff0c06dcafe9', '2');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `ORDER_ID` varchar(100) NOT NULL,
  `ORDERNO` varchar(255) DEFAULT NULL COMMENT '������',
  `ORDERGENERATIONTIME` timestamp NULL DEFAULT NULL COMMENT '��������ʱ��',
  `ORDERBOOKINGTIME` timestamp NULL DEFAULT NULL COMMENT '����ԤԼʱ��',
  `ORDEREXECUTIONTIME` timestamp NULL DEFAULT NULL COMMENT '����ʵ��ִ��ʱ��',
  `ORDERTOTALAMOUNT` double(11,0) DEFAULT NULL COMMENT '�����ܽ��',
  `STATUS` set('���','�ύ','�½�') DEFAULT '�½�' COMMENT '����״̬',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼�û�',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', null, null, null, null, '333', '�½�', null, null);
INSERT INTO `tb_order` VALUES ('2', 'bbb', '2016-04-27 10:01:50', '2016-05-06 10:01:53', '2016-05-03 10:01:56', '2222', '�½�', '11', '2016-05-05 10:02:04');


DROP TABLE IF EXISTS `ta_user`;
CREATE TABLE `ta_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT '�û�id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '�û���',
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `IP` varchar(15) DEFAULT NULL COMMENT '�û���¼ip��ַ',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '״̬',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '�����ʼ�',
  `PHONE` varchar(32) DEFAULT NULL COMMENT '�绰',
  `OPENID` varchar(255) DEFAULT NULL COMMENT '��Ӧ΢��OPENID',
  `ALIAS` varchar(255) DEFAULT NULL COMMENT '�ǳ�',
  `BIRTHDAY` varchar(255) DEFAULT NULL COMMENT '����',
  `SEX` varchar(255) DEFAULT NULL COMMENT '�Ա�',
  `BIRTHPLACE` varchar(255) DEFAULT NULL COMMENT '������',
  `LIVEPLACE` varchar(255) DEFAULT NULL COMMENT '��ס��',
  `MARRIAGESTATUS` varchar(255) DEFAULT NULL COMMENT '����״̬',
  `CAREER` varchar(255) DEFAULT NULL COMMENT 'ְҵ',
  `DEGREE` varchar(255) DEFAULT NULL COMMENT 'ѧ��',
  `AVATAR` varchar(255) DEFAULT NULL COMMENT '�û�ͼ��',
  `HEIGHT` int(11) DEFAULT '170' COMMENT '���',
  `WEIGHT` int(11) DEFAULT '65' COMMENT '����',
  `age` int(11) DEFAULT '0',
  `sufferedDiseases` varchar(1024) DEFAULT '',
  `inheritDiseases` varchar(1024) DEFAULT '',
  `concernDiseases` varchar(1024) DEFAULT '',  
  `tags` varchar(1024) DEFAULT '',
  `lastModifiedOn` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `lastPreparedOn` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  `lastMatchedOn` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  `lastGeneratedOn` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  `lastReleasedOn` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',  
  `lastEvaluatedOn` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',  
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ta_userrule`;
CREATE TABLE `ta_userrule` (
  `rule_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `guideline_id` varchar(100) NOT NULL,
  `originate` varchar(255) DEFAULT '',
  `description` varchar(512) DEFAULT '',
  `concernedfactors` varchar(512) DEFAULT '',
  `riskDefine` varchar(512) DEFAULT '',
  `disease_name` varchar(100) DEFAULT '',
  `riskType` varchar(20) DEFAULT 'low',
  `ruleExpression` varchar(1024) DEFAULT '1=1',
  `status` varchar(20) DEFAULT 'pending',
  `sysflag` varchar(20) DEFAULT 'toPrepare',  
  `createdOn` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  `modifiedOn` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  `worker` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ta_statistics`;
CREATE TABLE `ta_statistics` (
  `checkuppackage_id` varchar(100) NOT NULL,
  `matchedRules` int(11) NOT NULL default 0,
  `generatedRules` int(11) NOT NULL default 0,
  `status` varchar(20) NOT NULL default 'inprocess',  
  PRIMARY KEY (`checkuppackage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;