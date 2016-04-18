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
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '��Ա��', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('ead1f56708e4409c8d071e0a699e5633', 'a2', 'bcbe3365e6ac95ea2c0343a2395834dd', '��Ա��', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '', '', '', '2015-12-01', '2015-12-24', '1', '121', '978336446@qq.com');

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

/*Data for the table `sys_menu` */

insert  into `sys_menu` values (1,'ϵͳ����','#','0','1','menu-icon fa fa-desktop blue','2',1);
insert  into `sys_menu` values (2,'Ȩ�޹���','#','1','1','menu-icon fa fa-lock black','1',1);
insert  into `sys_menu` values (6,'��Ϣ����','#','0','5','menu-icon fa fa-credit-card green','2',1);
insert  into `sys_menu` values (7,'ͼƬ����','pictures/list.do','6','1','menu-icon fa fa-folder-o pink','2',1);
insert  into `sys_menu` values (8,'���ܼ��','druid/index.html','9','1','menu-icon fa fa-tachometer red','1',1);
insert  into `sys_menu` values (9,'ϵͳ����','#','0','3','menu-icon fa fa-cog black','2',1);
insert  into `sys_menu` values (10,'�ӿڲ���','tool/interfaceTest.do','9','2','menu-icon fa fa-exchange green','1',1);
insert  into `sys_menu` values (11,'�����ʼ�','tool/goSendEmail.do','9','3','menu-icon fa fa-envelope-o green','1',1);
insert  into `sys_menu` values (12,'�ö�ά��','tool/goTwoDimensionCode.do','9','4','menu-icon fa fa-barcode green','1',1);
insert  into `sys_menu` values (14,'��ͼ����','tool/map.do','9','6','menu-icon fa fa-globe black','1',1);
insert  into `sys_menu` values (15,'΢�Ź���','#','0','4','menu-icon fa fa-comments purple','2',1);
insert  into `sys_menu` values (16,'�ı��ظ�','textmsg/list.do','15','2','menu-icon fa fa-comment green','2',1);
insert  into `sys_menu` values (17,'Ӧ������','command/list.do','15','4','menu-icon fa fa-comment grey','2',1);
insert  into `sys_menu` values (18,'ͼ�Ļظ�','imgmsg/list.do','15','3','menu-icon fa fa-comment pink','2',1);
insert  into `sys_menu` values (19,'��ע�ظ�','textmsg/goSubscribe.do','15','1','menu-icon fa fa-comment orange','2',1);
insert  into `sys_menu` values (20,'���߹���','onlinemanager/list.do','1','6','menu-icon fa fa-laptop green','1',1);
insert  into `sys_menu` values (21,'��ӡ����','tool/printTest.do','9','7','menu-icon fa fa-hdd-o grey','1',1);
insert  into `sys_menu` values (22,'һ���˵�','#','0','6','menu-icon fa fa-fire orange','2',1);
insert  into `sys_menu` values (23,'�����˵�','#','22','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (34,'�����˵�2','login_default.do','31','2','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (35,'�ļ��˵�2','login_default.do','24','2','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (36,'��ɫ(����Ȩ��)','role.do','2','1','menu-icon fa fa-key orange','1',1);
insert  into `sys_menu` values (37,'��ťȨ��','buttonrights/list.do','2','2','menu-icon fa fa-key green','1',1);
insert  into `sys_menu` values (38,'�˵�����','menu/listAllMenu.do','1','3','menu-icon fa fa-folder-open-o brown','1',1);
insert  into `sys_menu` values (39,'��ť����','fhbutton/list.do','1','2','menu-icon fa fa-download orange','1',1);
insert  into `sys_menu` values (40,'�û�����','#','0','2','menu-icon fa fa-users blue','2',1);
insert  into `sys_menu` values (41,'ϵͳ�û�','user/listUsers.do','40','1','menu-icon fa fa-users green','1',1);
insert  into `sys_menu` values (42,'��Ա����','happuser/listUsers.do','40','2','menu-icon fa fa-users orange','1',1);
insert  into `sys_menu` values (43,'�����ֵ�','dictionaries/listAllDict.do?DICTIONARIES_ID=0','1','4','menu-icon fa fa-book purple','1',1);
insert  into `sys_menu` values (44,'��������','createCode/list.do','9','0','menu-icon fa fa-cogs brown','1',1);
insert  into `sys_menu` values (47,'�˼��˵�','login_default.do','45','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (48,'ͼ����',' tool/fusionchartsdemo.do','9','5','menu-icon fa fa-bar-chart-o black','1',1);
insert  into `sys_menu` values (49,'��֯����','department/listAllDepartment.do?DEPARTMENT_ID=0','1','5','menu-icon fa fa-users blue','1',1);
insert  into `sys_menu` values (50,'վ����','fhsms/list.do','6','2','menu-icon fa fa-envelope green','1',1);
insert  into `sys_menu` values (51,'������Ϣ����','article/list.do','6','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (72,'����ײ͹���','checkuppackage/listAll.do','6','2','menu-icon fa fa-leaf black','1',1);
INSERT INTO `sys_menu` VALUES (73, '��ǩ����', 'tag/listAllTagCategory.do', '6', '3', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES (74, '��ǩ�������', 'tagcategory/listAllTagCategoryTree.do?TAGCATEGORY_ID=0', '6', '4', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES (75, '��������', 'disease/listAllDiseasecategory.do', '6', '5', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES (76, '�����������', 'diseasecategory/listAllDiseaseCategoryTree.do?DISEASECATEGORY=0', '6', '6', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('158', 'ҽѧ���������', 'examcategory/listAllExamCategory.do?EXAMCATEGORY_ID=0', '6', '9', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('179', 'ҽѧ�����Ŀ����', 'examitem/listAllExamCategory.do', '6', '10', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('200', 'ָ�Ϲ���', '#', '6', '11', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('221', 'ָ�Ϲ������', '#', '6', '12', 'menu-icon fa fa-leaf black', '1', '1');
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
INSERT INTO `sys_role` VALUES ('1', 'ϵͳ������', '2251798773489606', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '�м���Ա', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '������Ա', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '��Ա��', '498', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', 'һ������Ա', '2251798773489606', '1', '2251798773489606', '2251798773489606', '1125898866646982', '2251798773489606');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', 'ְλ��', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '����', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '��������Ա', '2251798773489606', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '����', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '�߼���Ա', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '�鳤', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '�ܼ�', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '��������Ա', '2251798773489606', '1', '0', '0', '0', '0');

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
  `USER_ID` varchar(100) NOT NULL COMMENT '�û�id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '�û���',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '����',
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT 'Ȩ��',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '��ɫid',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT '����¼ʱ��',
  `IP` varchar(15) DEFAULT NULL COMMENT '�û���¼ip��ַ',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '״̬',
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL COMMENT 'Ƥ��',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '�����ʼ�',
  `NUMBER` varchar(100) DEFAULT NULL,
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
  `HEIGHT` int(11) DEFAULT NULL COMMENT '���',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */
INSERT INTO `sys_user` (`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS` ,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'ϵͳ����Ա', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2016-01-27 23:45:53', '127.0.0.1', '0', '���ͳ����', 'default', 'QQ313596790@main.com', '001', '18788888888');
INSERT INTO `sys_user` (`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS` ,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) VALUES ('69177258a06e4927b4639ab1684c3320', 'san', '47c4a8dc64ac2f0bb46bbd8813b037c9718f9349', '��', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-01-25 16:25:36', '192.168.1.102', '0', '111', 'default', '978336446@qq.com', '333', '13562202556');
INSERT INTO `sys_user` (`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS` ,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) VALUES ('9991f4d7782a4ccfb8a65bd96ea7aafa', 'lisi', '2612ade71c1e48cd7150b5f4df152faa699cedfe', '����', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-01-06 01:24:26', '127.0.0.1', '0', 'С��', 'default', '313596790@qq.com', '1102', '13566233663');
INSERT INTO `sys_user` (`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS` ,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) VALUES ('e29149962e944589bb7da23ad18ddeed', 'zhangsan', 'c2da1419caf053885c492e10ebde421581cdc03f', '����', '', '3264c8e83d0248bb9e3ea6195b4c0216', '', '', '0', 'С��', 'default', 'zhangsan@www.com', '1101', '2147483647');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
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


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_TAGCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `TB_TAGCATEGORY`;
CREATE TABLE `TB_TAGCATEGORY` (
 		`TAGCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '����',
		`PARENT_ID` varchar(255) DEFAULT NULL COMMENT '����ǩID',
		`METATYPE` varchar(255) DEFAULT NULL COMMENT 'Ԫ���ͣ��硰���ʽ��',
		`ISEXCLUSIVE` varchar(255) DEFAULT NULL COMMENT '�÷����µı�ǩ�Ƿ񻥳�',
  		PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `TB_MEDICALEXAMITEM`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALEXAMITEM`;
CREATE TABLE `TB_MEDICALEXAMITEM` (
 		`MEDICALEXAMITEM_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '����',
		`PRICE` int(11) NOT NULL COMMENT '�۸�',
		`PRICE2` int(11) NOT NULL COMMENT '����۸�',
		`TIPS` varchar(255) DEFAULT NULL COMMENT '�����Ŀ��ʾ',
		`STATUS` varchar(255) DEFAULT NULL COMMENT '״̬',
		`CREATEBY` int(11) NOT NULL COMMENT '������¼Ա��id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '�����ü�¼ʱ��',
		`MEDICALCENTER_ID` varchar(100) NOT NULL,
  		PRIMARY KEY (`MEDICALEXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_MEDICALCENTER`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALCENTER`;
CREATE TABLE `TB_MEDICALCENTER` (
 		`MEDICALCENTER_ID` varchar(100) NOT NULL,
		`STATUS` varchar(255) DEFAULT NULL COMMENT '״̬',
		`NAME` varchar(255) DEFAULT NULL COMMENT '����',
		`LOCATION` varchar(255) DEFAULT NULL COMMENT '��ַ����',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '������Ľ���',
		`LOGOURL` varchar(255) DEFAULT NULL COMMENT 'logoͼƬurl',
		`CREATEBY` int(11) NOT NULL COMMENT '�����ü�¼�û�id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  		PRIMARY KEY (`MEDICALCENTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_MEDICALCENERADMIN`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALCENERADMIN`;
CREATE TABLE `TB_MEDICALCENERADMIN` (
 		`MEDICALCENERADMIN_ID` varchar(100) NOT NULL,
		`DEPARTMENT` varchar(255) DEFAULT NULL COMMENT '��������',
		`TITLE` varchar(255) DEFAULT NULL COMMENT 'ְλ ',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼��Ա��id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '������¼��ʱ��',
		`MEDICALCENTER_ID` varchar(255) DEFAULT NULL COMMENT '�����������id',
  		PRIMARY KEY (`MEDICALCENERADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exam_examfrequency
-- ----------------------------
DROP TABLE IF EXISTS `exam_examfrequency`;
CREATE TABLE `exam_examfrequency` (
  `EXAMFREQUENCY_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `EXPRESSION` varchar(255) DEFAULT NULL COMMENT 'CRON���ʽ��������ļ��Ƶ��',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼Ա����id',
  `CREATEON` date DEFAULT NULL COMMENT '�����ü�¼��ʱ��',
  PRIMARY KEY (`EXAMFREQUENCY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exam_examitem
-- ----------------------------
DROP TABLE IF EXISTS `exam_examitem`;
CREATE TABLE `exam_examitem` (
  `EXAMITEM_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '����',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼Ա��id',
  `CREATEON` date DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `EXAMCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `EXAMITEM_PARENT_ID` varchar(32) DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  PRIMARY KEY (`EXAMITEM_ID`)
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
  `CREATEON` date DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `PARENT_ID` varchar(255) DEFAULT NULL COMMENT '����id',
  PRIMARY KEY (`EXAMCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exam_examguideline
-- ----------------------------
DROP TABLE IF EXISTS `exam_examguideline`;
CREATE TABLE `exam_examguideline` (
  `EXAMGUIDELINE_ID` varchar(100) NOT NULL,
  `ORIGINATE` varchar(255) DEFAULT NULL COMMENT '��Դ',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'ָ����ϸ����',
  `CONCERNEDFACTORS` varchar(255) DEFAULT NULL COMMENT '��ע��������',
  `HIGHRISKDEFINE` varchar(255) DEFAULT NULL COMMENT '��Σ��Ⱥʶ��',
  `HIGHRISKEXPRESSION` varchar(255) DEFAULT NULL COMMENT '��Σ��Ⱥʶ��ű�',
  `LOWRISKDEFINE` varchar(255) DEFAULT NULL COMMENT '��ͨ��Ⱥʶ��',
  `LOWRISKEXPRESSION` varchar(255) DEFAULT NULL COMMENT '��ͨ��Ⱥʶ��ű�',
  `STATUS` int(255) DEFAULT NULL COMMENT '״̬',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '�����ü�¼Ա��id',
  `CREATEON` date DEFAULT NULL COMMENT '�����ü�¼ʱ��',
  `DISEASE_ID` varchar(32) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EXAMGUIDELINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exam_examsolution
-- ----------------------------
DROP TABLE IF EXISTS `exam_examsolution`;
CREATE TABLE `exam_examsolution` (
  `EXAMSOLUTION_ID` varchar(100) NOT NULL,
  `SUBGROUP` varchar(255) DEFAULT NULL COMMENT '����ֶη�����',
  `RISKTYPE` int(255) DEFAULT NULL COMMENT '��Ԥ�ֶζ�Ӧ����',
  `STARTAGE` int(11) NOT NULL COMMENT '��ʼ�������',
  `ENDAGE` varchar(255) DEFAULT NULL COMMENT '�����������',
  `FEATURES` varchar(255) DEFAULT NULL COMMENT 'ҽѧ����ֶ�',
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
		`NAME` varchar(255) DEFAULT NULL COMMENT '����',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '������¼Ա��id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '������¼ʱ��',
		`PARENT_ID` varchar(32) DEFAULT NULL COMMENT '�����б�id',
  		PRIMARY KEY (`DISEASECATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASE`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASE`;
CREATE TABLE `ADMIN_DISEASE` (
 		`DISEASE_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '����',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
		`ISINHERITABLE` int(11) NOT NULL COMMENT '�Ƿ��Ŵ�����',
		`ISHIGHINCIDENCE` int(11) NOT NULL COMMENT '�Ƿ�߷�',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '������¼Ա��id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '������¼ʱ��',
		`DISEASECATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '�����������',
  		PRIMARY KEY (`DISEASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--------------------------------------
------------    �����Ŀ��          ------------
--------------------------------------
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
  `GENERATEDTIME` datetime DEFAULT NULL COMMENT '�ü�¼����ʱ��',
  `WORKER` varchar(255) DEFAULT NULL COMMENT '���ڲ����ü�¼�ı��',
  `REVISION` int(11) NOT NULL COMMENT '�汾',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT 'ϵͳ���',
  `CHECKUPPACKAGE_ID` varchar(100) DEFAULT NULL COMMENT '����ײ����',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '�û������',
  PRIMARY KEY (`CHECKUPITEM_ID`),
  KEY `CHECKUPPACKAGE_ID` (`CHECKUPPACKAGE_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `tb_checkupitem_ibfk_1` FOREIGN KEY (`CHECKUPPACKAGE_ID`) REFERENCES `tb_checkuppackage` (`CHECKUPPACKAGE_ID`),
  CONSTRAINT `tb_checkupitem_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_checkuppackage` */
DROP TABLE IF EXISTS `tb_checkuppackage`;
CREATE TABLE `tb_checkuppackage` (
  `CHECKUPPACKAGE_ID` varchar(100) NOT NULL,
  `WORKER` varchar(255) DEFAULT NULL COMMENT '���ɸü�¼�ı��',
  `GENERATEDTIME` datetime DEFAULT NULL COMMENT '�ü�¼����ʱ��',
  `EFFECTIVEFROM` datetime DEFAULT NULL COMMENT '��ʼ��Чʱ��',
  `EXPIREON` datetime DEFAULT NULL COMMENT 'ʧЧʱ��',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '״̬',
  `REVISION` varchar(255) DEFAULT NULL COMMENT '�汾',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT 'ϵͳ���',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '�û������',
  PRIMARY KEY (`CHECKUPPACKAGE_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `tb_checkuppackage_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASECATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASECATEGORY`;
CREATE TABLE `ADMIN_DISEASECATEGORY` (
 		`DISEASECATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '����',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '������¼Ա��id',
		`CREATEON` DATE DEFAULT NULL COMMENT '������¼ʱ��',
		`PARENT_ID` varchar(32) DEFAULT NULL COMMENT '�����б�id',
  		PRIMARY KEY (`DISEASECATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASE`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASE`;
CREATE TABLE `ADMIN_DISEASE` (
 		`DISEASE_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '����',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '����',
		`ISINHERITABLE` int(11) NOT NULL COMMENT '�Ƿ��Ŵ�����',
		`ISHIGHINCIDENCE` int(11) NOT NULL COMMENT '�Ƿ�߷�',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '������¼Ա��id',
		`CREATEON` DATE DEFAULT NULL COMMENT '������¼ʱ��',
		`DISEASECATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '�����������',
  		PRIMARY KEY (`DISEASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `TAG_TAG`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_TAG`;
CREATE TABLE `TAG_TAG` (
 		`TAG_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '����',
		`EXPRESSION` varchar(255) DEFAULT NULL COMMENT '���ʽ',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '�û�id',
		`CREATEON` DATE DEFAULT NULL COMMENT 'ʱ��',
		`TAGCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '��������id',
  		PRIMARY KEY (`TAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_TAGCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_TAGCATEGORY`;
CREATE TABLE `ADMIN_TAGCATEGORY` (
 		`TAGCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '��ǩ��������',
		`MATETYPE` varchar(255) DEFAULT NULL COMMENT '����',
		`ISEXCLUSIVE` int(11) NOT NULL COMMENT '�Ƿ��ѡ',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '�û�id',
		`CREATEON` DATE DEFAULT NULL COMMENT 'ʱ��',
		`PARENT_ID` varchar(255) DEFAULT NULL COMMENT '����id',
  		PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_ARTICLE`
-- ----------------------------
DROP TABLE IF EXISTS `TB_ARTICLE`;
CREATE TABLE `TB_ARTICLE` (
 		`ARTICLE_ID` varchar(100) NOT NULL,
		`TITLE` varchar(255) DEFAULT NULL COMMENT '����',
		`AUTHOR` varchar(255) DEFAULT NULL COMMENT '����',
		`LOGOURL` varchar(255) DEFAULT NULL COMMENT '��Ƭurl',
		`URL` varchar(255) DEFAULT NULL COMMENT '����url',
		`SUMMARY` varchar(255) DEFAULT NULL COMMENT 'ժҪ',
		`PUBLISHTIME` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '������¼Ա��id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '������¼ʱ��',
  		PRIMARY KEY (`ARTICLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;