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
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('ead1f56708e4409c8d071e0a699e5633', 'a2', 'bcbe3365e6ac95ea2c0343a2395834dd', '会员乙', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '', '', '', '2015-12-01', '2015-12-24', '1', '121', '978336446@qq.com');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790', '2016-01-16 23:20:36', '按钮权限');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790', '2015-12-20 01:49:25', '组织机构');
INSERT INTO `sys_createcode` VALUES ('d514dbd2474d4b6c8b6ab9904cc9cc7c', 'new', 'News', 'TB_,fh,NEWS', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255Q313596790', '2016-01-25 16:38:14', '新闻管理');
INSERT INTO `sys_createcode` VALUES ('dbd7b8330d774dcabd184eca8668a295', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790', '2016-01-23 01:44:15', '站内信');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-01-15 18:38:40', '按钮管理');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B公司', 'b', '002', '0', '冶铁', '李四', '112', '冶铁', '河北');
INSERT INTO `sys_department` VALUES ('83a25761c618457cae2fa1211bd8696d', '销售B组', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '李四', '', '', '');
INSERT INTO `sys_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', '销售A组', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '张三', '0201212', '', '');
INSERT INTO `sys_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1队', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', '小王', '12356989', '', '');
INSERT INTO `sys_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', '挖煤', '张三', '110', '洼煤矿', '山西');
INSERT INTO `sys_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', '销售部', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '推销商品', '小明', '11236', '推销商品', '909办公室');
INSERT INTO `sys_department` VALUES ('d41af567914a409893d011aa53eda797', '财务部', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '负责发工资', '王武', '11236', '管理财务', '308办公室');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '黄浦区', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '黄埔', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', '宣武区', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', '宣武区', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', '语文', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '分类', 'fenlei', '001', '1', '0', '分类', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', '地区', 'diqu', '003', '3', '0', '地区', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', '红色', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', '绿色', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', '绿色', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '课程', 'kecheng', '002', '2', '0', '课程', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

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

insert  into `sys_menu` values (1,'系统管理','#','0','1','menu-icon fa fa-desktop blue','2',1);
insert  into `sys_menu` values (2,'权限管理','#','1','1','menu-icon fa fa-lock black','1',1);
insert  into `sys_menu` values (6,'信息管理','#','0','5','menu-icon fa fa-credit-card green','2',1);
insert  into `sys_menu` values (7,'图片管理','pictures/list.do','6','1','menu-icon fa fa-folder-o pink','2',1);
insert  into `sys_menu` values (8,'性能监控','druid/index.html','9','1','menu-icon fa fa-tachometer red','1',1);
insert  into `sys_menu` values (9,'系统工具','#','0','3','menu-icon fa fa-cog black','2',1);
insert  into `sys_menu` values (10,'接口测试','tool/interfaceTest.do','9','2','menu-icon fa fa-exchange green','1',1);
insert  into `sys_menu` values (11,'发送邮件','tool/goSendEmail.do','9','3','menu-icon fa fa-envelope-o green','1',1);
insert  into `sys_menu` values (12,'置二维码','tool/goTwoDimensionCode.do','9','4','menu-icon fa fa-barcode green','1',1);
insert  into `sys_menu` values (14,'地图工具','tool/map.do','9','6','menu-icon fa fa-globe black','1',1);
insert  into `sys_menu` values (15,'微信管理','#','0','4','menu-icon fa fa-comments purple','2',1);
insert  into `sys_menu` values (16,'文本回复','textmsg/list.do','15','2','menu-icon fa fa-comment green','2',1);
insert  into `sys_menu` values (17,'应用命令','command/list.do','15','4','menu-icon fa fa-comment grey','2',1);
insert  into `sys_menu` values (18,'图文回复','imgmsg/list.do','15','3','menu-icon fa fa-comment pink','2',1);
insert  into `sys_menu` values (19,'关注回复','textmsg/goSubscribe.do','15','1','menu-icon fa fa-comment orange','2',1);
insert  into `sys_menu` values (20,'在线管理','onlinemanager/list.do','1','6','menu-icon fa fa-laptop green','1',1);
insert  into `sys_menu` values (21,'打印测试','tool/printTest.do','9','7','menu-icon fa fa-hdd-o grey','1',1);
insert  into `sys_menu` values (22,'一级菜单','#','0','6','menu-icon fa fa-fire orange','2',1);
insert  into `sys_menu` values (23,'二级菜单','#','22','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (34,'六级菜单2','login_default.do','31','2','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (35,'四级菜单2','login_default.do','24','2','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (36,'角色(基础权限)','role.do','2','1','menu-icon fa fa-key orange','1',1);
insert  into `sys_menu` values (37,'按钮权限','buttonrights/list.do','2','2','menu-icon fa fa-key green','1',1);
insert  into `sys_menu` values (38,'菜单管理','menu/listAllMenu.do','1','3','menu-icon fa fa-folder-open-o brown','1',1);
insert  into `sys_menu` values (39,'按钮管理','fhbutton/list.do','1','2','menu-icon fa fa-download orange','1',1);
insert  into `sys_menu` values (40,'用户管理','#','0','2','menu-icon fa fa-users blue','2',1);
insert  into `sys_menu` values (41,'系统用户','user/listUsers.do','40','1','menu-icon fa fa-users green','1',1);
insert  into `sys_menu` values (42,'会员管理','happuser/listUsers.do','40','2','menu-icon fa fa-users orange','1',1);
insert  into `sys_menu` values (43,'数据字典','dictionaries/listAllDict.do?DICTIONARIES_ID=0','1','4','menu-icon fa fa-book purple','1',1);
insert  into `sys_menu` values (44,'代码生成','createCode/list.do','9','0','menu-icon fa fa-cogs brown','1',1);
insert  into `sys_menu` values (47,'八级菜单','login_default.do','45','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (48,'图表报表',' tool/fusionchartsdemo.do','9','5','menu-icon fa fa-bar-chart-o black','1',1);
insert  into `sys_menu` values (49,'组织机构','department/listAllDepartment.do?DEPARTMENT_ID=0','1','5','menu-icon fa fa-users blue','1',1);
insert  into `sys_menu` values (50,'站内信','fhsms/list.do','6','2','menu-icon fa fa-envelope green','1',1);
insert  into `sys_menu` values (51,'文章信息管理','article/list.do','6','1','menu-icon fa fa-leaf black','1',1);
insert  into `sys_menu` values (72,'体检套餐管理','checkuppackage/listAll.do','6','2','menu-icon fa fa-leaf black','1',1);
INSERT INTO `sys_menu` VALUES ('73', '标签管理', 'tag/listAllTagCategory.do', '6', '3', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('74', '标签分类管理', 'tagcategory/listAllTagCategoryTree.do?TAGCATEGORY_ID=0', '6', '4', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('75', '疾病管理', 'disease/listAllDiseasecategory.do', '6', '5', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('76', '疾病分类管理', 'diseasecategory/listAllDiseaseCategoryTree.do?DISEASECATEGORY=0', '6', '6', 'menu-icon fa fa-envelope green', '1', '1');

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
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '2251798773489606', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '会员组', '498', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '2251798773489606', '1', '2251798773489606', '2251798773489606', '1125898866646982', '2251798773489606');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', '职位组', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '主管', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '2251798773489606', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '经理', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '组长', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '总监', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '2251798773489606', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
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
  `USER_ID` varchar(100) NOT NULL COMMENT '用户id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT '权限',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '角色id',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT '最后登录时间',
  `IP` varchar(15) DEFAULT NULL COMMENT '用户登录ip地址',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL COMMENT '皮肤',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '电子邮件',
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL COMMENT '电话',
  `OPENID` varchar(255) DEFAULT NULL COMMENT '对应微信OPENID',
  `ALIAS` varchar(255) DEFAULT NULL COMMENT '昵称',
  `BIRTHDAY` varchar(255) DEFAULT NULL COMMENT '生日',
  `SEX` varchar(255) DEFAULT NULL COMMENT '性别',
  `BIRTHPLACE` varchar(255) DEFAULT NULL COMMENT '出生地',
  `LIVEPLACE` varchar(255) DEFAULT NULL COMMENT '居住地',
  `MARRIAGESTATUS` varchar(255) DEFAULT NULL COMMENT '婚姻状态',
  `CAREER` varchar(255) DEFAULT NULL COMMENT '职业',
  `DEGREE` varchar(255) DEFAULT NULL COMMENT '学历',
  `AVATAR` varchar(255) DEFAULT NULL COMMENT '用户图像',
  `HEIGHT` int(11) DEFAULT NULL COMMENT '身高',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '体重',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`,`OPENID`,`ALIAS`,`BIRTHDAY`,`SEX`,`BIRTHPLACE`,`LIVEPLACE`,`MARRIAGESTATUS`,`CAREER`,`DEGREE`,`AVATAR`,`HEIGHT`,`WEIGHT`) values ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','系统管理员','1133671055321055258374707980945218933803269864762743594642571294','1','2016-04-10 22:38:14','0:0:0:0:0:0:0:1','0','最高统治者',NULL,'QQ313596790@main.com','001','18788888888',NULL,'系统管理员',NULL,'男','成都','成都','未婚','高级架构师','本科','img/logo.jpg',188,50),('69177258a06e4927b4639ab1684c3320','san','47c4a8dc64ac2f0bb46bbd8813b037c9718f9349','三','3264c8e83d0248bb9e3ea6195b4c0216','1','2016-04-10 21:12:04','0:0:0:0:0:0:0:1','0','111',NULL,'978336446@qq.com','333','13562202556',NULL,'测试用户',NULL,'男','成都','成都','已婚','程序员','专科','img/logo.jpg',188,60),('9991f4d7782a4ccfb8a65bd96ea7aafa','lisi','2612ade71c1e48cd7150b5f4df152faa699cedfe','李四','3264c8e83d0248bb9e3ea6195b4c0216','1','2016-01-06 01:24:26','127.0.0.1','0','小李',NULL,'313596790@qq.com','1102','13566233663',NULL,'李',NULL,'男','上海','上海','未婚','销售','博士','img/logo.jpg',198,67),('d28812dffc7b4c91924dd73c8487a86c','admin123','c9f55b944bbd496ff462196310dcb383586b4a5e','默默','','3264c8e83d0248bb9e3ea6195b4c0216','','','0','要嘿嘿嘿么','default','828777292@qq.com','1001','13567899876',NULL,'双黑狗','1992-08-20','男','成都','成都','未婚','程序员','大壮','image/logo.jpg',189,89),('e29149962e944589bb7da23ad18ddeed','zhangsan','c2da1419caf053885c492e10ebde421581cdc03f','张三','3264c8e83d0248bb9e3ea6195b4c0216','0',NULL,NULL,NULL,'校长',NULL,'zhangsan@www.com','1101','2147483647',NULL,'张',NULL,'男','北京','北京','未婚','个体','小学','img/logo.jpg',178,56);
-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('b06010340ee54cfab49b8bfbe2387557', '图片', '5e6ba5ad3067482e9a8063b0627ee983.png', '20160125/5e6ba5ad3067482e9a8063b0627ee983.png', '2016-01-25 16:49:44', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('c9f1eca620c94c27bfa7028c66911f41', '图片', '928da750ec8542ceb7b2495f45ea6a9e.jpg', '20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg', '2016-01-25 16:49:44', '1', '图片管理处上传');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', '锁定计算机');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '打开浏览器操作');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', '关闭浏览器操作');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '关闭QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '打开QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', '1', '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('63681adbe7144f10b66d6863e07f23c2', '你好', '你也好', '2015-05-09 02:39:23', '1', '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', '1', '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', '1', '关注回复');


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_TAGCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `TB_TAGCATEGORY`;
CREATE TABLE `TB_TAGCATEGORY` (
 		`TAGCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`PARENT_ID` varchar(255) DEFAULT NULL COMMENT '父标签ID',
		`METATYPE` varchar(255) DEFAULT NULL COMMENT '元类型，如“生活方式”',
		`ISEXCLUSIVE` varchar(255) DEFAULT NULL COMMENT '该分类下的标签是否互斥',
  		PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `TB_MEDICALEXAMITEM`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALEXAMITEM`;
CREATE TABLE `TB_MEDICALEXAMITEM` (
 		`MEDICALEXAMITEM_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`PRICE` int(11) NOT NULL COMMENT '价格',
		`PRICE2` int(11) NOT NULL COMMENT '建议价格',
		`TIPS` varchar(255) DEFAULT NULL COMMENT '检查项目提示',
		`STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
		`CREATEBY` int(11) NOT NULL COMMENT '创建记录员工id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
		`MEDICALCENTER_ID` varchar(100) NOT NULL,
  		PRIMARY KEY (`MEDICALEXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_MEDICALCENTER`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALCENTER`;
CREATE TABLE `TB_MEDICALCENTER` (
 		`MEDICALCENTER_ID` varchar(100) NOT NULL,
		`STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`LOCATION` varchar(255) DEFAULT NULL COMMENT '地址描述',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '体检中心介绍',
		`LOGOURL` varchar(255) DEFAULT NULL COMMENT 'logo图片url',
		`CREATEBY` int(11) NOT NULL COMMENT '创建该记录用户id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
  		PRIMARY KEY (`MEDICALCENTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_MEDICALCENERADMIN`
-- ----------------------------
DROP TABLE IF EXISTS `TB_MEDICALCENERADMIN`;
CREATE TABLE `TB_MEDICALCENERADMIN` (
 		`MEDICALCENERADMIN_ID` varchar(100) NOT NULL,
		`DEPARTMENT` varchar(255) DEFAULT NULL COMMENT '所属部门',
		`TITLE` varchar(255) DEFAULT NULL COMMENT '职位 ',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录的员工id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建记录的时间',
		`MEDICALCENTER_ID` varchar(255) DEFAULT NULL COMMENT '所属体检中心id',
  		PRIMARY KEY (`MEDICALCENERADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMFREQUENCY`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMFREQUENCY`;
CREATE TABLE `EXAM_EXAMFREQUENCY` (
 		`EXAMFREQUENCY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`EXPRESSION` varchar(255) DEFAULT NULL COMMENT 'CRON表达式，定义检查的间隔频率',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录员工的id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建该记录的时间',
  		PRIMARY KEY (`EXAMFREQUENCY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMITEM`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMITEM`;
CREATE TABLE `EXAM_EXAMITEM` (
 		`EXAMITEM_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
		`EXAMCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
		`EXAMITEM_PARENT_ID` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
		 PRIMARY KEY (`EXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `EXAM_EXAMCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMCATEGORY`;
CREATE TABLE `EXAM_EXAMCATEGORY` (
 		`EXAMCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '检查项目分类名称',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
  		PRIMARY KEY (`EXAMCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMGUIDELINE`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMGUIDELINE`;
CREATE TABLE `EXAM_EXAMGUIDELINE` (
 		`EXAMGUIDELINE_ID` varchar(100) NOT NULL,
		`ORIGINATE` varchar(255) DEFAULT NULL COMMENT '来源',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '指南详细描述',
		`CONCERNEDFACTORS` varchar(255) DEFAULT NULL COMMENT '关注因素描述',
		`HIGHRISKDEFINE` varchar(255) DEFAULT NULL COMMENT '高危人群识别',
		`HIGHRISKEXPRESSION` varchar(255) DEFAULT NULL COMMENT '高危人群识别脚本',
		`LOWRISKDEFINE` varchar(255) DEFAULT NULL COMMENT '普通人群识别',
		`LOWRISKEXPRESSION` varchar(255) DEFAULT NULL COMMENT '普通人群识别脚本',
		`STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
  		PRIMARY KEY (`EXAMGUIDELINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `EXAM_EXAMSOLUTION`
-- ----------------------------
DROP TABLE IF EXISTS `EXAM_EXAMSOLUTION`;
CREATE TABLE `EXAM_EXAMSOLUTION` (
 		`EXAMSOLUTION_ID` varchar(100) NOT NULL,
		`SUBGROUP` varchar(255) DEFAULT NULL COMMENT '检查手段分组标记',
		`RISKTYPE` varchar(255) DEFAULT NULL COMMENT '干预手段对应风险',
		`STARTAGE` int(11) NOT NULL COMMENT '开始检查年龄',
		`ENDAGE` varchar(255) DEFAULT NULL COMMENT '结束检查年龄',
		`FEATURES` varchar(255) DEFAULT NULL COMMENT '医学检查手段',
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
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建记录时间',
		`PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父级列表id',
  		PRIMARY KEY (`DISEASECATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASE`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASE`;
CREATE TABLE `ADMIN_DISEASE` (
 		`DISEASE_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
		`ISINHERITABLE` int(11) NOT NULL COMMENT '是否遗传倾向',
		`ISHIGHINCIDENCE` int(11) NOT NULL COMMENT '是否高发',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
		`CREATEON` varchar(32) DEFAULT NULL COMMENT '创建记录时间',
		`DISEASECATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '疾病分类外键',
  		PRIMARY KEY (`DISEASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--------------------------------------
------------    体检项目表          ------------
--------------------------------------
DROP TABLE IF EXISTS `tb_checkupitem`;
CREATE TABLE `tb_checkupitem` (
  `CHECKUPITEM_ID` varchar(100) NOT NULL,
  `SUBGROUP` varchar(255) DEFAULT NULL COMMENT '检查项目分组',
  `NAME` varchar(255) DEFAULT NULL COMMENT '检查项目名称',
  `FEATURES` varchar(255) DEFAULT NULL COMMENT '特性',
  `FREQUENCY` varchar(255) DEFAULT NULL COMMENT '检查频率',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
  `ORIGINATE` varchar(255) DEFAULT NULL COMMENT '指南来源',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '详细描述',
  `GENERATEDTIME` datetime DEFAULT NULL COMMENT '该记录生成时间',
  `WORKER` varchar(255) DEFAULT NULL COMMENT '用于产生该记录的标记',
  `REVISION` int(11) NOT NULL COMMENT '版本',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT '系统标记',
  `CHECKUPPACKAGE_ID` varchar(100) DEFAULT NULL COMMENT '体检套餐外键',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '用户表外键',
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
  `WORKER` varchar(255) DEFAULT NULL COMMENT '生成该记录的标记',
  `GENERATEDTIME` datetime DEFAULT NULL COMMENT '该记录生成时间',
  `EFFECTIVEFROM` datetime DEFAULT NULL COMMENT '开始生效时间',
  `EXPIREON` datetime DEFAULT NULL COMMENT '失效时间',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
  `REVISION` varchar(255) DEFAULT NULL COMMENT '版本',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT '系统标记',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '用户表外键',
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
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
		`CREATEON` DATE DEFAULT NULL COMMENT '创建记录时间',
		`PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父级列表id',
  		PRIMARY KEY (`DISEASECATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_DISEASE`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_DISEASE`;
CREATE TABLE `ADMIN_DISEASE` (
 		`DISEASE_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
		`ISINHERITABLE` int(11) NOT NULL COMMENT '是否遗传倾向',
		`ISHIGHINCIDENCE` int(11) NOT NULL COMMENT '是否高发',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
		`CREATEON` DATE DEFAULT NULL COMMENT '创建记录时间',
		`DISEASECATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '疾病分类外键',
  		PRIMARY KEY (`DISEASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `TAG_TAG`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_TAG`;
CREATE TABLE `TAG_TAG` (
 		`TAG_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '名称',
		`EXPRESSION` varchar(255) DEFAULT NULL COMMENT '表达式',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '用户id',
		`CREATEON` DATE DEFAULT NULL COMMENT '时间',
		`TAGCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '所属分类id',
  		PRIMARY KEY (`TAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ADMIN_TAGCATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN_TAGCATEGORY`;
CREATE TABLE `ADMIN_TAGCATEGORY` (
 		`TAGCATEGORY_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '标签分类名称',
		`MATETYPE` varchar(255) DEFAULT NULL COMMENT '特性',
		`ISEXCLUSIVE` int(11) NOT NULL COMMENT '是否多选',
		`CREATEBY` varchar(255) DEFAULT NULL COMMENT '用户id',
		`CREATEON` DATE DEFAULT NULL COMMENT '时间',
		`PARENT_ID` varchar(255) DEFAULT NULL COMMENT '父级id',
  		PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
