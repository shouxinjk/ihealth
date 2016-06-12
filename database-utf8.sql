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
  `SEX` varchar(255) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `MARRIAGESTATUS` varchar(255) DEFAULT NULL COMMENT '婚姻状况',
  `HEIGHT` int(11) DEFAULT '170' COMMENT '身高',
  `WEIGHT` int(11) DEFAULT '50' COMMENT '体重',
  `BIRTHPLACE` varchar(255) DEFAULT NULL COMMENT '出生地',
  `LIVEPLACE` varchar(255) DEFAULT NULL COMMENT '居住地',
  `CAREER` varchar(255) DEFAULT NULL COMMENT '职业',
  `DEGREE` varchar(255) DEFAULT NULL COMMENT '学历',
  `OPENID` varchar(255) DEFAULT NULL COMMENT 'openid',
  `AVATAR` varchar(255) DEFAULT '../images/defaultimg.png' COMMENT '用户头像',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建用户ID',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录的时间',
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
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', '信息管理', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', '1');
INSERT INTO `sys_menu` VALUES ('7', '图片管理', 'pictures/list.do', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', '性能监控', 'druid/index.html', '9', '1', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO `sys_menu` VALUES ('10', '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO `sys_menu` VALUES ('15', '微信管理', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', '1');
INSERT INTO `sys_menu` VALUES ('16', '文本回复', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO `sys_menu` VALUES ('17', '应用命令', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO `sys_menu` VALUES ('18', '图文回复', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('19', '关注回复', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '6', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `sys_menu` VALUES ('21', '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO `sys_menu` VALUES ('22', '一级菜单', '#', '0', '6', 'menu-icon fa fa-fire orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('23', '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('24', '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('30', '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('31', '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('32', '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('33', '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('34', '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('35', '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('36', '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('37', '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('40', '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('41', '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('42', '会员管理', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('43', '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('44', '代码生成', 'createCode/list.do', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('45', '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('46', '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('47', '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('48', '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO `sys_menu` VALUES ('49', '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '1', '5', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('50', '站内信', 'fhsms/list.do', '6', '2', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('51', '文章信息管理', 'article/list.do', '6', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('73', '指南管理', 'examguideline/list.do', '6', '4', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('75', '体检套餐管理', 'checkuppackage/listAll.do', '6', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('94', '疾病管理', 'disease/listAllDiseasecategory.do', '6', '5', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('95', '标签管理', 'tag/listAllTagCategory.do', '6', '6', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('116', '标签分类管理', 'tagcategory/listAllTagCategoryTree.do?TAGCATEGORY_ID=0', '6', '7', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('137', '疾病分类管理', 'diseasecategory/listAllDiseaseCategoryTree.do?DISEASECATEGORY_ID=0', '6', '8', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('158', '医学检查分类管理', 'examcategory/listAllExamCategory.do?EXAMCATEGORY_ID=0', '6', '9', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('177', '查看微信注册用户', 'user/getUsers.do', '40', '3', 'menu-icon fa fa-users brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('179', '医学检查项目管理', 'examitem/listAllExamCategory.do', '6', '10', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('221', '指南规则管理', 'examguideline/listRule.do', '6', '12', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('222', '检查频率', 'examfrequency/list.do', '6', '14', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('243', '指南发布管理', 'examguideline/listRelease.do', '6', '13', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('244', '文章审核', 'article/auditList.do', '6', '15', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('245', '指南审核', 'examguideline/listVerify.do', '6', '14', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('266', '文章发布', 'article/articleRelease.do', '6', '16', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('267', '指南运维审核', 'examguideline/listRelVerify.do', '6', '18', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('288', '体检中心管理', 'medicalcenter/list.do', '372', '19', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('309', '体检项目管理', 'medicalexamitem/list.do', '372', '21', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('330', '用户订单管理', 'order/list.do', '372', '20', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('351', '体检中心订单管理', 'medicalorder/list.do', '372', '22', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('372', '体检中心(医院)', '#', '0', '7', 'menu-icon fa fa-leaf black', '2', '1');
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

insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('1','系统管理组','2251798773489606','0','1','1','1','1');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('115b386ff04f4352b060dffcd2b5d1da','中级会员','498','2','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('1b67fc82ce89457a8347ae53e43a347e','初级会员','498','2','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('2','会员组','498','0','0','0','0','1');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('3264c8e83d0248bb9e3ea6195b4c0216','一级管理员','118571198322457521683259327569727595184370969558060170687607043651933702855843782','1','118571198322457521683259327569727595184370969558060170687607043651933702855843782','118571198322457521683259327569727595184370969558060170687607043651933702855843782','118571198322457521683259327569727595184370969558060170687607043651933702855843782','118571198322457521683259327569727595184370969558060170687607043651933702855843782');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('46294b31a71c4600801724a6eb06bb26','职位组','','0','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('5466347ac07044cb8d82990ec7f3a90e','主管','','46294b31a71c4600801724a6eb06bb26','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('68f8e4a39efe47c7bb869e9d15ab925d','二级管理员','2251798773489606','1','0','0','2251798773489606','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('856849f422774ad390a4e564054d8cc8','经理','','46294b31a71c4600801724a6eb06bb26','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('8b70a7e67f2841e7aaba8a4d92e5ff6f','高级会员','498','2','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('c21cecf84048434b93383182b1d98cba','组长','','46294b31a71c4600801724a6eb06bb26','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('d449195cd8e7491080688c58e11452eb','总监','','46294b31a71c4600801724a6eb06bb26','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('de9de2f006e145a29d52dfadda295353','三级管理员','2251798773489606','1','0','0','0','0');
insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('e32c2f37d1744d10a76813eee4a882ae','医生','118571198322457521683259327569727595184370969558060170687607043650807803989196992','1','118571198322457521683259327569727595184370969558060170687607043650807803989196992','118571198322457521683259327569727595184370969558060170687607043650807803989196992','118571198322457521683259327569727595184370969558060170687607043650807803989196992','118571198322457521683259327569727595184370969558060170687607043650807803989196992');

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

insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','系统管理员','1133671055321055258374707980945218933803269864762743594642571294','1','2016-05-19 18:02:56','222.211.175.23','0','最高统治者','default','QQ313596790@main.com','001','18788888888');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('69177258a06e4927b4639ab1684c3320','san','47c4a8dc64ac2f0bb46bbd8813b037c9718f9349','三','','3264c8e83d0248bb9e3ea6195b4c0216','2016-05-23 14:35:59','221.237.114.67','0','111','default','978336446@qq.com','333','13562202556');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('7e444063e18b4c059c7346bb11f26f6d','qchzhu','9b74b644687479cb3b258a5701e530e279986ed2','Zhuqingchun','','3264c8e83d0248bb9e3ea6195b4c0216','2016-05-23 11:06:07','222.211.175.23','0','管理员','default','zhuqingchun@shouxinjk.com','admin001','13678189382');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('9991f4d7782a4ccfb8a65bd96ea7aafa','lisi','2612ade71c1e48cd7150b5f4df152faa699cedfe','李四','','3264c8e83d0248bb9e3ea6195b4c0216','2016-05-19 18:11:45','221.237.114.67','0','小李','default','313596790@qq.com','1102','13566233663');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('e29149962e944589bb7da23ad18ddeed','zhangsan','c2da1419caf053885c492e10ebde421581cdc03f','张三','','3264c8e83d0248bb9e3ea6195b4c0216','2016-05-17 14:20:39','','0','小张','default','zhangsan@www.com','1101','2147483647');
insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('f5c882b90236479d803369bd580c2ae2','maqin','0e4d1168ea3a929297c350338f7be98c892efdb9','马钦','','e32c2f37d1744d10a76813eee4a882ae','2016-05-23 14:37:26','221.237.114.67','0','','default','maqin@shouxinjk.com','S00001','13880615408');


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
  `GENERATEDTIME` timestamp NULL DEFAULT NULL COMMENT '该记录生成时间',
  `WORKER` varchar(255) DEFAULT NULL COMMENT '用于产生该记录的标记',
  `REVISION` int(11) DEFAULT NULL COMMENT '版本',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT '系统标记',
  `CHECKUPPACKAGE_ID` varchar(100) DEFAULT NULL COMMENT '体检套餐外键',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '用户表外键',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建用户ID',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录的时间',
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
  `WORKER` varchar(255) DEFAULT NULL COMMENT '生成该记录的标记',
  `GENERATEDTIME` timestamp NULL DEFAULT NULL COMMENT '该记录生成时间',
  `EFFECTIVEFROM` timestamp NULL DEFAULT NULL COMMENT '开始生效时间',
  `EXPIREON` timestamp NULL DEFAULT NULL COMMENT '失效时间',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
  `REVISION` varchar(255) DEFAULT NULL COMMENT '版本',
  `SYSFLAG` varchar(255) DEFAULT NULL COMMENT '系统标记',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '用户表外键',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建用户ID',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录的时间',
  PRIMARY KEY (`CHECKUPPACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `TB_ARTICLE`
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `ARTICLE_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `AUTHOR` varchar(255) DEFAULT NULL COMMENT '作者',
  `LOGOURL` varchar(255) DEFAULT NULL COMMENT '照片url',
  `URL` varchar(255) DEFAULT NULL COMMENT '内容url',
  `SUMMARY` varchar(255) DEFAULT NULL COMMENT '摘要',
  `PUBLISHTIME` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建记录时间',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
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
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `ISINHERITABLE` int(11) NOT NULL COMMENT '是否遗传倾向',
  `ISHIGHINCIDENCE` int(11) NOT NULL COMMENT '是否高发',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
 `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建记录时间',
  `DISEASECATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '疾病分类外键',
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
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建记录时间',
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
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `EXPRESSION` varchar(255) DEFAULT NULL COMMENT '表达式',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '用户id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建记录时间',
  `TAGCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '所属分类id',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `fieldName` varchar(512) DEFAULT NULL COMMENT '字段名称',
  `fieldType` varchar(512) DEFAULT NULL COMMENT '字段属性',
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
  `NAME` varchar(255) DEFAULT NULL COMMENT '标签分类名称',
  `MATETYPE` varchar(255) DEFAULT NULL COMMENT '特性',
  `ISEXCLUSIVE` int(11) NOT NULL COMMENT '是否多选',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '用户id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建记录时间',
  `PARENT_ID` varchar(255) DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`TAGCATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for exam_examcategory
-- ----------------------------
DROP TABLE IF EXISTS `exam_examcategory`;
CREATE TABLE `exam_examcategory` (
  `EXAMCATEGORY_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '检查项目分类名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建记录时间',
  `PARENT_ID` varchar(255) DEFAULT NULL COMMENT '父级id',
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
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `EXPRESSION` varchar(255) DEFAULT NULL COMMENT 'CRON表达式，定义检查的间隔频率',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录员工的id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建记录时间',
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
  `ORIGINATE` varchar(255) DEFAULT '' COMMENT '来源',
  `DESCRIPTION` varchar(512) DEFAULT '' COMMENT '指南详细描述',
  `CONCERNEDFACTORS` varchar(1024) DEFAULT '' COMMENT '关注因素描述',
  `HIGHRISKDEFINE` varchar(512) DEFAULT '' COMMENT '高危人群识别',
  `HIGHRISKEXPRESSION` varchar(1024) DEFAULT '1=0' COMMENT '高危人群识别脚本',
  `LOWRISKDEFINE` varchar(512) DEFAULT '' COMMENT '普通人群识别',
  `LOWRISKEXPRESSION` varchar(1024) DEFAULT '1=1' COMMENT '普通人群识别脚本',
  `STATUS` set('已失效','已发布','运维审核失败','运维审核','已补充','审核失败','已审核','已提交','新建') DEFAULT '新建' COMMENT '状态',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',
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
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',
  `EXAMCATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
  `EXAMITEM_PARENT_ID` varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
  PRIMARY KEY (`EXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for exam_examsolution
-- ----------------------------
DROP TABLE IF EXISTS `exam_examsolution`;
CREATE TABLE `exam_examsolution` (
  `EXAMSOLUTION_ID` varchar(100) NOT NULL,
  `SUBGROUP` varchar(255) DEFAULT NULL COMMENT '检查手段分组标记',
  `RISKTYPE` set('low','middle','high') DEFAULT 'low' COMMENT '干预手段对应风险',
  `STARTAGE` int(11) DEFAULT 0 COMMENT '开始检查年龄',
  `ENDAGE` int(255) DEFAULT 200 COMMENT '结束检查年龄',
  `FEATURES` set('安全','全面','经济') DEFAULT '' COMMENT '医学检查手段',
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
  `NAME` varchar(255) DEFAULT NULL COMMENT '体检中心名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '体检中心描述',
  `LOCATION` varchar(255) DEFAULT NULL COMMENT '体检中心地理位置',
  `ABBREVIATION` varchar(255) DEFAULT NULL COMMENT '体检中心简介',
  `TELEPHONE` varchar(255) DEFAULT NULL COMMENT '体检中心联系电话',
  `STATUS` set('发布','审核','提交','新建') NOT NULL DEFAULT '新建' COMMENT '体检中心状态',
  `LOGO` varchar(255) DEFAULT NULL COMMENT '体检中心logo图片地址',
  `OPENINGTIME` varchar(32) DEFAULT NULL COMMENT '体检中心开业时间',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录用户id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',
  `ACCESSORY` varchar(255) DEFAULT NULL COMMENT '体检中心或医院附件信息',
  `POSITION` varchar(255) DEFAULT NULL COMMENT '体检中心或医院经纬度地理位置',
  `PARENTID` varchar(255) DEFAULT NULL COMMENT '体检中心或医院分支机构',
  PRIMARY KEY (`MEDICALCENTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalcenter
-- ----------------------------
INSERT INTO `tb_medicalcenter` VALUES ('2', 'vbbb', 'bbb', 'bb', 'bbb', 'bbbb', '新建', 'bbbb', null, 'bbbb', null, 'bbbbb', 'bbbbb', '5b901194b7cc42c0b6a95a54a1cd7350');
INSERT INTO `tb_medicalcenter` VALUES ('3', 'vbbb', 'bbb', 'bb', 'bbb', 'bbbb', '新建', 'bbbb', '', 'bbbb', '2016-05-03 14:57:10', 'bbbbb', 'bbbbb', '3');
INSERT INTO `tb_medicalcenter` VALUES ('5b901194b7cc42c0b6a95a54a1cd7350', 'aaaa', 'AA', 'aaa', 'aaaa', 'aaaaaa', '新建', 'aaaaa', '2016-05-16', '', '2016-05-19 14:34:00', 'aaaa', 'aaa', '0');


-- ----------------------------
-- Table structure for tb_medicalexamitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicalexamitem`;
CREATE TABLE `tb_medicalexamitem` (
  `MEDICALEXAMITEM_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '体检项目名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '体检项目说明',
  `FEATURES` varchar(255) DEFAULT NULL COMMENT '体检项目特征',
  `SELLINGPRICE` double(11,0) DEFAULT NULL COMMENT '体检项目销售价格',
  `SETTLEMENTPRICE` double(11,0) DEFAULT NULL COMMENT '体检项目结算价格',
  `LOGO` varchar(255) DEFAULT NULL COMMENT '体检项目logo图片url地址',
  `STATUS` set('审核','提交','新建') DEFAULT '新建' COMMENT '体检项目状态',
  `EFFECTIVETIME` varchar(32) DEFAULT NULL COMMENT '体检项目生效时间',
  `EXPIRETIME` varchar(32) DEFAULT NULL COMMENT '体检项目失效时间',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录用户id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',
  `EXAMITEM_ID` varchar(100) DEFAULT NULL,
  `MEDICALCENTER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEDICALEXAMITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalexamitem
-- ----------------------------
INSERT INTO `tb_medicalexamitem` VALUES ('0673d0a7814345e892d28c3ce9d1a586', 'Aaaaaa', 'aa', 'aaa', '22', '3', 'bb', '新建', '2016-05-18', '2016-05-28', null, '2016-05-19 18:22:00', null, '5b901194b7cc42c0b6a95a54a1cd7350');
INSERT INTO `tb_medicalexamitem` VALUES ('9aada469eefd44b4bfc27b4f3fc81f6b', '男男女女', '男男女女', '男男女女', '11', '22', 'nn', '新建', '2016-05-25', '2016-05-18', null, '2016-05-20 10:43:55', '1', '3');
INSERT INTO `tb_medicalexamitem` VALUES ('ddb62967f06c4f558dadff0c06dcafe9', 'bbv1', 'bbv', 'bbv', '22', '22', 'bbv', '新建', '2016-05-03', '2016-05-06', 'bbnv', '2016-05-19 14:44:13', '1', '5b901194b7cc42c0b6a95a54a1cd7350');


-- ----------------------------
-- Table structure for tb_medicalceneradmin
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicalceneradmin`;
CREATE TABLE `tb_medicalceneradmin` (
  `MEDICALCENERADMIN_ID` varchar(100) NOT NULL,
  `DEPARTMENT` varchar(255) DEFAULT NULL COMMENT '所属科室部门',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '职位',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录用户id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',
  `SYS_USER_ID` varchar(100) DEFAULT NULL,
  `MEDICALCENTER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEDICALCENERADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalceneradmin
-- ----------------------------
INSERT INTO `tb_medicalceneradmin` VALUES ('1', '院长', '院长', '', '2016-05-03 09:47:19', '69177258a06e4927b4639ab1684c3320', '5b901194b7cc42c0b6a95a54a1cd7350');

-- ----------------------------
-- Table structure for tb_medicalorder
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicalorder`;
CREATE TABLE `tb_medicalorder` (
  `MEDICALORDER_ID` varchar(100) NOT NULL,
  `MEDICALORDERNO` varchar(255) DEFAULT NULL COMMENT '订单号',
  `MEDICALORDERGENERATIONTIME` timestamp NULL DEFAULT NULL COMMENT '订单生成时间',
  `MEDICALORDERBOOKINGTIME` timestamp NULL DEFAULT NULL COMMENT '订单预约时间',
  `MEDICALORDEREXECUTIONTIME` timestamp NULL DEFAULT NULL COMMENT '订单实际执行时间',
  `MEDICALTOTALAMOUNT` double NOT NULL COMMENT '订单总金额',
  `STATUS` set('审核','提交','新建') DEFAULT '新建' COMMENT '订单状态',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录用户id',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',
  `MEDICALCENTER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEDICALORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicalorder
-- ----------------------------
INSERT INTO `tb_medicalorder` VALUES ('1', '222222', '2016-04-27 10:27:26', '2016-05-10 10:27:28', '2016-05-02 10:27:31', '222', '新建', '11', '2016-04-29 10:27:37', '5b901194b7cc42c0b6a95a54a1cd7350');
INSERT INTO `tb_medicalorder` VALUES ('2', '111', '2016-05-28 10:27:56', '2016-05-07 10:27:53', '2016-05-04 10:27:49', '22222', '新建', '11', '2016-04-29 10:27:42', '1');
INSERT INTO `tb_medicalorder` VALUES ('3', '222', '2016-05-25 10:28:10', '2016-05-09 10:28:16', '2016-04-25 10:28:19', '333', '新建', '22', '2016-05-19 10:28:29', '2');

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
  `ORDERNO` varchar(255) DEFAULT NULL COMMENT '订单号',
  `ORDERGENERATIONTIME` timestamp NULL DEFAULT NULL COMMENT '订单生成时间',
  `ORDERBOOKINGTIME` timestamp NULL DEFAULT NULL COMMENT '订单预约时间',
  `ORDEREXECUTIONTIME` timestamp NULL DEFAULT NULL COMMENT '订单实际执行时间',
  `ORDERTOTALAMOUNT` double(11,0) DEFAULT NULL COMMENT '订单总金额',
  `STATUS` set('审核','提交','新建') DEFAULT '新建' COMMENT '订单状态',
  `CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建该记录用户',
  `CREATEON` timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', null, null, null, null, '333', '新建', null, null);
INSERT INTO `tb_order` VALUES ('2', 'bbb', '2016-04-27 10:01:50', '2016-05-06 10:01:53', '2016-05-03 10:01:56', '2222', '新建', '11', '2016-05-05 10:02:04');


DROP TABLE IF EXISTS `ta_user`;
CREATE TABLE `ta_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT '用户id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `IP` varchar(15) DEFAULT NULL COMMENT '用户登录ip地址',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '电子邮件',
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
  `HEIGHT` int(11) DEFAULT '170' COMMENT '身高',
  `WEIGHT` int(11) DEFAULT '65' COMMENT '体重',
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