package com.shouxin.controller.rest;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shouxin.controller.base.BaseController;
import com.shouxin.service.admin.article.ArticleManager;
import com.shouxin.service.admin.disease.DiseaseManager;
import com.shouxin.service.admin.tag.TagManager;
import com.shouxin.service.checkup.checkupitem.CheckupItemManager;
import com.shouxin.service.checkup.checkuppackage.CheckupPackageManager;
import com.shouxin.service.system.appuser.AppuserManager;
import com.shouxin.service.system.user.UserManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.DateUtil;
import com.shouxin.util.DegreeEnum;
import com.shouxin.util.MarriageStatusEnum;
import com.shouxin.util.PageData;
import com.shouxin.util.SexEnum;
import com.shouxin.util.StatusEnum;
import com.shouxin.util.Tools;

import net.sf.json.JSONObject;

/**
 * 类名称：RestfullController 提供微信端网页访问的接口
 * 创建人：sys 
 * 更新时间：2016年4月21日
 * 
 * @version 1.0
 */
@SuppressWarnings("restriction")
@Controller
@RequestMapping(value = "/rest")
public class RestfullController extends BaseController {

	@Resource(name = "userService")
	private UserManager userService;
	@Resource(name = "checkuppackageService")
	private CheckupPackageManager checkuppackageService;
	@Resource(name = "checkupitemService")
	private CheckupItemManager checkupitemService;
	@Resource(name="tagService")
	private TagManager tagService;
	@Resource(name="articleService")
	private ArticleManager articleService;
	
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	
	@Resource(name="diseaseService")
	private DiseaseManager diseaseService;

	
	/**
	 * 用户注册，通过手机号码
	 * url : http://localhost:8080/ihealth/rest/register 
	 * type:post
	 * @param {phone:"xx",openId:"xxx","name":"姓名","avatar","用户头像"}
	 * @return 当手号码不存在时，执行新增用户并返回用户信息:
	 * 				{"result": "success","data": {"OPENID":"OPENID","PHONE": "电话","USER_ID": "USER_ID","ROLE_ID": "用户权限"}}
	 * 		         当用户执行添加关心的人的操作时，关系存在返回的数据
	 * 			{"result": "connection_existence"}
	 *         当手机号码存在，返回 
	 *         		{ 
	 *         			"result": "existence", 
	 *        			"data": { 
	 *        					"NUMBER": "编号",					"RIGHTS": "权限", 
	 *         					"IP": "IP地址", 					"PHONE": "电话", 
	 *         					"ALIAS": "昵称",					"SEX": "性别", 
	 *         					"USER_ID": "ID",				"MARRIAGESTATUS": "婚姻状况",
	 *         					"LAST_LOGIN": "最后登录时间",		"EMAIL": "邮箱地址", 
	 *         					"HEIGHT": 身高,					"BIRTHPLACE": "出生地", 
	 *         					"NAME": "姓名", 					"CAREER": "职业", 
	 *         					"STATUS": "0",					"OPENID": "openId", 
	 *         					"PASSWORD": "密码", 				"BZ": "333", 
	 *         					"USERNAME":"用户名", 				"DEGREE": "学历", 
	 *         					"LIVEPLACE": "常住地", 			"AVATAR": "头像地址",
	 *         					"WEIGHT": 体重, 					"BIRTHDAY": "生日" 
	 *         					} 
	 *         		}
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	private Object register(@RequestBody(required = true) String userVO) throws Exception {
		logBefore(logger, "通过手机号码注册+++++++++++++start");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String msg = null, phone = null,openId = null,avatar = null,name = null;
		// 将String类型的数据转换为json 
		JSONObject jasonObject = JSONObject.fromObject(userVO);
		try {
			// 获取json中的key并赋值给字符串 
			if (Tools.notEmpty(jasonObject.getString("phone"))) {
				phone = jasonObject.getString("phone").trim();
				pd.put("PHONE", phone); 
				pd.put("USERNAME", phone);	
			}
			if (Tools.notEmpty(jasonObject.getString("openId"))) {
				openId = jasonObject.getString("openId").trim();
				pd.put("OPENID", openId); 
			}
			if (Tools.notEmpty(jasonObject.getString("avatar"))) {
				avatar = jasonObject.getString("avatar").trim();
				pd.put("AVATAR", avatar);
			}
			if (Tools.notEmpty(jasonObject.getString("name"))) {
				name = jasonObject.getString("name").trim();
				pd.put("NAME", name);
			}
			
			pd.put("USER_ID", this.get32UUID()); 
			pd.put("ROLE_ID", "1b67fc82ce89457a8347ae53e43a347e");	// 赋予新注册用户最低级的权限，初级会员
			pd.put("STATUS", "1");									//状态
			pd.put("LAST_LOGIN", new Date());						//最后登录时间
			pd.put("CREATEON", new Date());							//该记录的创建时间
			// 判断手机号码是否存在	如果当前手机号存在  则继续判断openID是否存在，如果都存在 则返回用户数据   如果不存在 则 添加openID和用户头像信息
			if (null == this.appuserService.findByPhone(pd)) { 
				logBefore(logger, "经过判断，手机号码在数据库中不存在，执行新增操作");
				appuserService.saveU(pd); // 执行保存
				//TODO hook analysis interface
				msg = "success";
				map.put("data", appuserService.findByUiId(pd));
			} else {
				logBefore(logger, "经过判断，手机号码存在：-------------------------------");
				PageData pds = this.appuserService.findByPhone(pd);
				String openid = pds.getString("OPENID");
				//经过判断，手机号吗 存在，openID 不存在
				if (Tools.isEmpty(openid)) {
					pds.put("USER_ID", pds.getString("USER_ID"));
					pds.put("NAME", name);
					pds.put("OPENID", openId);
					pds.put("AVATAR", avatar);
					this.appuserService.editU(pds);
				}
				map.put("data", pds);
				msg = "existence";
			}
		} catch (Exception e) {
			msg = "error";
			logger.debug(e);
			logBefore(logger, "程序异常--请检查参数列表" + e.getMessage());
		}
		
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据手机号码 判断用户关系
	 * @param message {"phone":"手机号码","userId":"当前用户ID"}
	 * @return 
	 * 			当通过手机号查询的数据为null时  返回{"result":"no"}
	 * 			查询出有关系已存在时  返回 {"result":"guanxicunzai"}
	 * 			查询关系不存在时       返回{"result":"guanxibucunzai"}
	 * @throws Exception
	 */
	@RequestMapping(value = "/getConnectionByPhone", method = RequestMethod.POST)
	@ResponseBody
	public  Object getConnectionByPhone(@RequestBody(required = true) String message) throws Exception {
		logBefore(logger, "通过手机号码注册user");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		String phone = null;
		String user_id_one = null;
		// 将String类型的数据转换为json 
		JSONObject jasonObject = JSONObject.fromObject(message);
		try {
			if (Tools.notEmpty(jasonObject.getString("phone"))) {
				phone = jasonObject.getString("phone").trim();
				pd.put("PHONE", phone);
			}
			if (Tools.notEmpty(jasonObject.getString("userId"))) {
				user_id_one = jasonObject.getString("userId").trim();
				pd.put("user_id_one", user_id_one);
			}
			
			//根据手机号码 查询用户信息
			PageData pds = this.appuserService.findByPhone(pd);
			//判断查询的数据是否为空
			if (pds != null && pds.size()>0) {
				String user_id_two = pds.getString("USER_ID");
				pd.put("user_id_two", user_id_two);
				//查询关系是否存在
				PageData upd = this.appuserService.findConnectionWhether(pd);
				if (upd.size()>0 && upd != null) {
					msg = "guanxicunzai";
				}else{
					msg = "guanxibucunzai";
				}	
			}else{
				//通过手机号码查询的数据不存在
				msg = "no";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据ID更新用户信息
	 * URL：http://localhost:8080/ihealth/rest/updateUser 
	 * type:post 
	 * @return ID不为空 返回结果，和用户信息： 
	 * { 
	 * 	"result":"suceess", 
	 * 	"data": { 
	 * 			"NUMBER": "编号",			"RIGHTS": "权限", 
	 * 			"IP": "IP地址",			"PHONE": "电话", 
	 * 			"ALIAS": "昵称",			"SEX": "性别", 
	 * 			"USER_ID": "ID",		"MARRIAGESTATUS": "婚姻状况", 
	 * 			"LAST_LOGIN": 			"最后登录时间","EMAIL": "邮箱地址",
	 * 			"HEIGHT": 身高,			"BIRTHPLACE": "出生地", 
	 * 			"NAME": "姓名",			"CAREER": "职业",
	 * 			"STATUS": "0",			"OPENID": "openId", 
	 * 			"PASSWORD": "密码",		"BZ": "333",
	 * 			"USERNAME": "用户名",		"DEGREE": "学历", 
	 * 			"LIVEPLACE": "常住地",	"AVATAR": "头像地址",
	 * 			"WEIGHT": 体重,			"BIRTHDAY": "生日" 
	 * 			} 
	 * } 
	 * ID为空： {"result":"error"}
	 * @param {
	 * 			"userId":"ID",		"name":"姓名",
	 * 			"sex":"性别",			"marriageStatus":"婚姻",
	 * 			"birthday":"生日",	"height":"身高",
	 * 			"weight":"体重",		"birthPlace":"出生地",
	 * 			"livePlace":"常住地",	"career":"职业",
	 * 			"degree":"学历",		"avatar":"用户头像地址"
	 * 		  }
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	@ResponseBody
	public Object saveUser(@RequestBody(required = true) String users){
		logBefore(logger, "通过用户ID更新用户信息+++++++++++++执行修改用户信息的方法");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pds = new PageData();
		String msg = null,userId = null,name = null,sex = null,marriageStatus = null,birthday = null,height = null,weight = null,birthPlace = null,livePlace = null,career = null,degree = null,avatar = null;
		// 将String类型的数据转换为json
		try {
			JSONObject jasonObject = JSONObject.fromObject(users);
			if (Tools.notEmpty(jasonObject.getString("userId"))) {
				userId = jasonObject.getString("userId").trim();
				logBefore(logger, "执行根据用户ID，修改用户信息的方法：用户ID为："+userId);
				
				pd.put("USER_ID", userId);
				//根据用户ID查询用户信息
				pds = this.appuserService.findByUiId(pd);
				
				if (Tools.notEmpty(jasonObject.getString("name"))) {
					name = jasonObject.getString("name").trim();
					pds.put("NAME", name);
				}
				if (Tools.notEmpty(jasonObject.getString("sex"))) {
					sex =  jasonObject.getString("sex").trim();
					// 判断性别，并赋值
					if (sex.equals(SexEnum.BOY.getValue())) {
						sex = SexEnum.BOY.getValue();
					} else if (sex.equals(SexEnum.GIRL.getValue())) {
						sex = SexEnum.GIRL.getValue();
					} else {
						sex = SexEnum.BOY.getValue();
					}
					pds.put("SEX", sex);
				}
				if (Tools.notEmpty(jasonObject.getString("marriageStatus"))) {
					marriageStatus =  jasonObject.getString("marriageStatus").trim();
					// 判断婚姻状态 传入下拉列表中的value 1 未婚 2 已婚 3 同居 4 离异 5寡居
					marriageStatus = MarriageStatusEnum.getNameByIndex(Integer.parseInt(marriageStatus));
					pds.put("MARRIAGESTATUS", marriageStatus);
				}
				if (Tools.notEmpty(jasonObject.getString("birthday"))) {
					birthday = jasonObject.getString("birthday").trim();
					pds.put("BIRTHDAY", DateUtil.fomatDate(birthday));
				}
				if (Tools.notEmpty(jasonObject.getString("height"))) {
					height = jasonObject.getString("height").trim();
					pds.put("HEIGHT", Double.parseDouble(height));
				}
				if (Tools.notEmpty(jasonObject.getString("weight"))) {
					weight = jasonObject.getString("weight").trim();
					pds.put("WEIGHT", Double.parseDouble(weight));
				}
				if (Tools.notEmpty(jasonObject.getString("birthPlace"))) {
					birthPlace = jasonObject.getString("birthPlace").trim();
					pds.put("BIRTHPLACE", birthPlace);
				}
				if (Tools.notEmpty(jasonObject.getString("livePlace"))) {
					livePlace = jasonObject.getString("livePlace").trim();
					pds.put("LIVEPLACE", livePlace);
				}
				if (Tools.notEmpty(jasonObject.getString("career"))) {
					career = jasonObject.getString("career").trim();
					pds.put("CAREER", career);
				}
				if (Tools.notEmpty(jasonObject.getString("degree"))) {
					degree = jasonObject.getString("degree").trim();
					// 判断学历
					degree = DegreeEnum.getNameByIndex(Integer.parseInt(degree));
					pds.put("DEGREE", degree);
				}
				if (Tools.notEmpty(jasonObject.getString("avatar"))) {
					avatar = jasonObject.getString("avatar").trim();
					pds.put("AVATAR", avatar);
					logBefore(logger, "执行根据用户ID，修改用户信息的方法：用户头像地址为：======"+avatar);
				}
				// 将值添加到PageDate中
				pds.put("STATUS", "1");
				logBefore(logger, "执行根据ID，修改用户信息的方法--------------------------------++++++++");
				this.appuserService.editU(pds);
				//TODO hook analysis interface
				PageData pageData = this.appuserService.findByUiId(pds);
				map.put("data", pageData);
				msg = "suceess";
				
			}else{
				msg = "error";
				logBefore(logger, "没有获取到用户ID ++++++++++++++++++ 用户ID为空");
			}
		} catch (Exception e) {
			msg = "errorMessage";
			logBefore(logger, "程序异常--请检查参数列表");
		}finally{
			map.put("result", msg);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 通过用户ID获取体检套餐信息
	 * url:http://localhost:8080/ihealth/rest/findCheckPackage 
	 * type:post
	 * @param {"userId":"用户ID"}
	 * @return 当用户ID不为空时，返回： { 
	 * 								"result": "success", 
	 * 								"data": { 
	 * 									"REVISION": "版本","STATUS": "状态", 
	 * 									"GENERATEDTIME": 该记录生成时间, "EFFECTIVEFROM":开始生效时间, 
	 * 									"EXPIREON": 失效时间, "WORKER": "生成该记录的标记",
	 *         							"CHECKUPPACKAGE_ID": "1001", "SYSFLAG": "系统标记" 
	 *         						} 
	 *         					}
	 * 
	 *         当用户ID为空时，返回：{ "result": "error"} 
	 *         当根据userID查询出的数据为null时 返回{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "/findCheckPackage", method = RequestMethod.POST)
	@ResponseBody
	public Object findCheckPackage(@RequestBody String u) throws Exception {
		logBefore(logger, "查询-----------根据ID查询体检套餐");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,userId = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("userId"))) {
				userId = jasonObject.get("userId").toString().trim();
				pd.put("USER_ID", userId);
				
				PageData data = this.checkuppackageService.findById(pd);
				if (data != null && data.size() > 0) {
					msg = "success";
					map.put("data", data);
				} else {
					msg = "no";
				}
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据体检项目ID修改体检项目的状态信息
	 * url:http://localhost:8080/ihealth/rest/editCheckItem 
	 * type:post
	 * @param {"checkupItemId":"体检项目ID","stauts":"状态信息","subGroup":"分组名"}
	 * 
	 * @return 	修改成功、返回 { "result": "success"} 
	 * 			修改失败、返回{"result": "error"}
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "editCheckItem", method = RequestMethod.POST)
	@ResponseBody
	public Object editCheckItem(@RequestBody String check) throws Exception {
		logBefore(logger, "修改----------------体检项目信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,checkItemId = null,status = null,subGroup = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(check);
		try {
			if (Tools.notEmpty(jasonObject.getString("subGroup"))) {
				subGroup = jasonObject.getString("subGroup");	//获取分组名
				pd.put("SUBGROUP", subGroup);
				this.checkupitemService.removeStatus(pd);
				msg = "success";
			}else{
				msg = "error";
			}
			
			if (Tools.notEmpty(jasonObject.getString("stauts"))) {
				status = jasonObject.getString("stauts").trim();		//获取状态
				//如果当前状态为已选中 则将当前状态修改为 已删除
				if (status.equals(StatusEnum.ALREADYENABLED.getName())) {
					if (Tools.notEmpty(jasonObject.getString("checkupItemId"))) {
						checkItemId = jasonObject.getString("checkupItemId").trim();	//获取当前项目ID
						pd.put("CHECKUPITEM_ID", checkItemId);
						this.checkupitemService.editAllStatus(pd);
						msg = "success";
					}else{
						msg = "error";
					}
				}else{
					checkItemId = jasonObject.getString("checkupItemId").trim();	//获取当前项目ID
					//根据当前ID  修改当前状态信息为已选中
					if (Tools.notEmpty(checkItemId)) {
						pd.put("CHECKUPITEM_ID", checkItemId);
						this.checkupitemService.editStatus(pd);
						msg = "success";
					}else{
						msg = "error";
					}
				
				}
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据userID 获取体检项目 
	 * url：http://localhost:8080/ihealth/rest/findCheckItems
	 * type:post
	 * 
	 * @param {"userId":"用户ID"}
	 * @return 当userID不为空，并且数据库中存在这个ID、返回以下数据，需要注意的是，一个用户有多个体检项目，需要循环取值 
	 * 			{
	 *         "result": "success", 
	 *         "data": [ { 
	 *         			"REVISION": 版本, 				"STATUS":"状态，包括：已选中，已删除", 
	 *         			"DESCRIPTION": "详细描述", 		"GENERATEDTIME": 该记录生成时间,
	 *         			"FREQUENCY": "每年一次", 			"ORIGINATE": "指南来源", 
	 *         			"WORKER": "用于产生该记录的标记",		"SUBGROUP": "检查项目分组", 
	 *         			"SYSFLAG": "系统标记", 			"NAME": "检查项目名称",
	 *         			"FEATURES": "检查频率，是文字描述", 	"CHECKUPITEM_ID": "ID" 
	 *         			} ] 
	 *         }
	 *         当用户ID为空时返回：{"result": "error"} 
	 *         当根据userID查询出的数据为null时 返回：{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "findCheckItems", method = RequestMethod.POST)
	@ResponseBody
	public Object findCheckItems(@RequestBody String u) throws Exception {
		logBefore(logger, "查询-----------根据userID获取用体检项目信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,userId = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("userId"))) {
				userId = jasonObject.getString("userId").trim();
				pd.put("USER_ID", userId);
				List<PageData> pageDate = this.checkupitemService.listAll(pd);
				List<PageData> groupList = this.checkupitemService.findCIByGroup(pd);
				if (pageDate != null && pageDate.size() > 0) {
					msg = "success";
					map.put("group", groupList);
					map.put("data", pageDate);
					System.out.println("youshuju");
				} else {
					System.out.println("meishuju");
					msg = "no";
				}
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据userID 和当前分组名 获取体检项目 
	 * url：http://localhost:8080/ihealth/rest/getCheckItemsByGroup
	 * type:post
	 * 
	 * @param {"userId":"用户ID"}
	 * @return 当userID不为空，并且数据库中存在这个ID、返回以下数据，需要注意的是，一个用户有多个体检项目，需要循环取值 
	 * 			{
	 *         "result": "success", 
	 *         "data": [ { 
	 *         			"REVISION": 版本, 				"STATUS":"状态，包括：已选中，已删除", 
	 *         			"DESCRIPTION": "详细描述", 		"GENERATEDTIME": 该记录生成时间,
	 *         			"FREQUENCY": "每年一次", 			"ORIGINATE": "指南来源", 
	 *         			"WORKER": "用于产生该记录的标记",		"SUBGROUP": "检查项目分组", 
	 *         			"SYSFLAG": "系统标记", 			"NAME": "检查项目名称",
	 *         			"FEATURES": "检查频率，是文字描述", 	"CHECKUPITEM_ID": "ID" 
	 *         			} ] 
	 *         }
	 *         当用户ID为空时返回：{"result": "error"} 
	 *         当根据userID查询出的数据为null时 返回：{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "getCheckItemsByGroup", method = RequestMethod.POST)
	@ResponseBody
	public Object getCheckItemsByGroup(@RequestBody String u) throws Exception {
		logBefore(logger, "查询--------根据用户ID，获取体检项目信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,userId = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("userId"))) {
				userId = jasonObject.getString("userId").trim();
				pd.put("USER_ID", userId);
				logger.debug("根据用户ID 查询体检项目信息");
				List<PageData> pageDate = this.checkupitemService.findCIByIdOrSubGroup(pd);
				if (pageDate != null && pageDate.size() > 0) {
					msg = "success";
					map.put("data", pageDate);
				} else {
					msg = "no";
				}
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据体检项目ID 获取体检项目
	 * url：http://localhost:8080/ihealth/rest/getCheckItem
	 * type:post
	 * 
	 * @param {"id":"体检项目ID"}
	 * @return 根据体检项目ID，查询当前体检项目
	 * 			{
	 *         "result": "success", 
	 *         "data": [ { 
	 *         			"REVISION": 版本, 				"STATUS":"状态，包括：已选中，已删除", 
	 *         			"DESCRIPTION": "详细描述", 		"GENERATEDTIME": 该记录生成时间,
	 *         			"FREQUENCY": "每年一次", 			"ORIGINATE": "指南来源", 
	 *         			"WORKER": "用于产生该记录的标记",		"SUBGROUP": "检查项目分组", 
	 *         			"SYSFLAG": "系统标记", 			"NAME": "检查项目名称",
	 *         			"FEATURES": "检查频率，是文字描述", 	"CHECKUPITEM_ID": "ID" 
	 *         			} ] 
	 *         }
	 *         当用户ID为空时返回：{"result": "error"} 
	 *         当根据userID查询出的数据为null时 返回：{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "getCheckItem", method = RequestMethod.POST)
	@ResponseBody
	public Object getCheckItem(@RequestBody String u) throws Exception {
		logBefore(logger, "查询------------根据体检项目ID查询体检项目信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,id = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("id"))) {
				id = jasonObject.getString("id").trim();
				pd.put("CHECKUPITEM_ID", id);
				logger.debug("根据用户ID 查询体检项目信息");
				PageData pageDate = this.checkupitemService.findById(pd);
				if (pageDate != null) {
					msg = "success";
					map.put("data", pageDate);
				} else {
					msg = "no";
				}
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	

	/**
	 * 通过用户ID获取用户信息 
	 * url:http://localhost:8080/ihealth/rest/findUserById
	 * type:post
	 * 
	 * @param {"userId":"1"}
	 * @return 
	 * 当ID不为空，返回的参数列表为： 
	 * 		{ 
	 * 		"result": "success", 
	 * 		"data": { 
	 * 				"NUMBER": "编号",				"RIGHTS": "权限", 
	 * 				"IP": "IP地址", 				"PHONE": "电话", 
	 * 				"ALIAS": "昵称",				"SEX": "性别", 
	 * 				"USER_ID": "ID", 			"MARRIAGESTATUS": "婚姻状况",
	 *          	"LAST_LOGIN": "最后登录时间", 	"EMAIL": "邮箱地址", 
	 *         		"HEIGHT": 身高,				"BIRTHPLACE": "出生地", 
	 *         		"NAME": "姓名", 				"CAREER": "职业", 
	 *         		"STATUS":"用户状态", 			"OPENID": "openId", 
	 *         		"PASSWORD": "密码", 			"BZ": "333",
	 *         	 	"USERNAME": "用户名", 		"DEGREE": "学历", 
	 *         		"LIVEPLACE": "常住地", 		"AVATAR":"头像地址", 
	 *         		"WEIGHT": 体重, 				"BIRTHDAY": "生日" 
	 *       		} 
	 *      }
	 * 当userID为空时：返回的参数为：{"result": "error"} 
	 * 当根据userID查询出的数据为null时 返回{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "findUserById", method = RequestMethod.POST)
	@ResponseBody
	public Object findUserById(@RequestBody String u) throws Exception {
		logBefore(logger, "查询-----------根据用户ID，查询用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,userId = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("userId"))) {
				userId = jasonObject.getString("userId").trim();
				pd.put("USER_ID", userId);
				PageData data = this.appuserService.findByUiId(pd);
				if (data != null && data.size() > 0) {
					msg = "success";
					map.put("data", data);
				} else {
					msg = "no";
				}
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据openId获取用户信息 
	 * url:http://localhost:8080/ihealth/rest/findUserByOpenId
	 * type:post
	 * 
	 * @param {openid:"openId"}
	 * 
	 * @return 
	 * 当获取openId成功！返回值为：
	 * 		{ 
	 * 		"result": "success", 
	 * 		"data": { 
	 * 				"NUMBER":"编号", 				"RIGHTS": "权限", 
	 * 				"IP": "IP地址", 				"PHONE": "电话", 
	 * 				"ALIAS": "昵称",				"SEX": "性别", 
	 * 				"USER_ID": "ID", 			"MARRIAGESTATUS": "婚姻状况",
	 *         		"LAST_LOGIN": "最后登录时间", 	"EMAIL": "邮箱地址", 
	 *         		"HEIGHT": 身高,				"BIRTHPLACE": "出生地", 
	 *         		"NAME": "姓名", 				"CAREER": "职业", 
	 *         		"STATUS":"用户状态", 			"OPENID": "openId", 
	 *         		"PASSWORD": "密码", 			"BZ": "333",
	 *         		"USERNAME": "用户名", 		"DEGREE": "学历", 
	 *         		"LIVEPLACE": "常住地", 		"AVATAR":"头像地址", 
	 *         		"WEIGHT": 体重, 				"BIRTHDAY": "生日" 
	 *         		} 
	 *       }    
	 * 当根据openId查询出的数据为null时 返回{ "result": "no"}
	 * 当获取openId失败！返回{"result":"error"}
	 * @throws Exception
	 */
	@RequestMapping(value = "findUserByOpenId", method = RequestMethod.POST)
	@ResponseBody
	public Object findUserByOpenId(@RequestBody String u) throws Exception {
		logBefore(logger, "查询--------根据openID获取用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,openId = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("openId"))) {
				openId = jasonObject.getString("openId").trim();
				pd.put("OPENID", openId);
				PageData data = this.appuserService.findByUiId(pd);
				if (data != null && data.size() > 0) {
					msg = "success";
					map.put("data", data);
				} else {
					msg = "no";
				}
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 获取前20篇文章信息 
	 * url:http://localhost:8080/ihealth/rest/findByTopTwenty
	 * type:post
	 * @return 获取文章信息不为空： 
	 * 		{ 
	 * 		"result": "success", 
	 * 		"data": [ { 
	 * 					"LOGOURL": 照片url,	"PUBLISHTIME": 发布时间 ,
	 * 					"SUMMARY": "摘要", 	"CREATEBY": "创建记录员工id",
	 *         			"TITLE": "标题", 		"ARTICLE_ID": "ID", 
	 *         			"AUTHOR": "作者", 	"CREATEON":创建记录时间 ,
	 *         			"URL": 内容url 
	 *         		} ] 
	 *      }
	 * 
	 * 获取文章信息为空： 返回{ "result": "error"} 
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "findByTopTwenty", method = RequestMethod.POST)
	@ResponseBody
	public Object findByTopTwenty() throws Exception{
		logBefore(logger, "查询---------获取前20篇文章信息！");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> data = this.articleService.listByTopTwenty(pd);
			if(data!=null||data.size()>0){
				msg = "success";
				map.put("data", data);
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--获取文章失败");
		}
		
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 获取所有文章信息 
	 * url:http://localhost:8080/ihealth/rest/findAllArticles
	 * type:post
	 * @return 获取文章信息不为空： 
	 * 		{ 
	 * 		"result": "success", 
	 * 		"data": [ { 
	 * 					"LOGOURL": 照片url,	"PUBLISHTIME": 发布时间 ,
	 * 					"SUMMARY": "摘要", 	"CREATEBY": "创建记录员工id",
	 *         			"TITLE": "标题", 		"ARTICLE_ID": "ID", 
	 *         			"AUTHOR": "作者", 	"CREATEON":创建记录时间 ,
	 *         			"URL": 内容url 
	 *         		} ] 
	 *      }
	 * 
	 * 获取文章信息为空： 返回{ "result": "error"} 
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "findAllArticles", method = RequestMethod.POST)
	@ResponseBody
	public Object findAllArticles() throws Exception{
		logBefore(logger, "查询----------获取所有文章信息！");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData> data = this.articleService.listAll(pd);
		if(data!=null||data.size()>0){
			msg = "success";
			map.put("data", data);
		}else{
			msg = "error";
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	
	
	/**
	 * 根据文章信息ID 获取文章信息 
	 * url:http://localhost:8080/ihealth/rest/findArticleById
	 * type:post
	 * @param {"articleId":"文章信息ID"}
	 * @return 根据ID查询出数据返回：
	 * 		{ 
	 * 		"result": "success", 
	 * 		"data": { 
	 * 					"LOGOURL": 照片url,	"PUBLISHTIME": 发布时间 ,
	 * 					"SUMMARY": "摘要", 	"CREATEBY": "创建记录员工id",
	 *         			"TITLE": "标题", 		"ARTICLE_ID": "ID", 
	 *         			"AUTHOR": "作者", 	"CREATEON":创建记录时间 ,
	 *         			"URL": 内容url 
	 *         		}
	 *      }
	 * 当articleId为空： 返回{ "result": "error"}
	 * @throws Exception
	 */
	@RequestMapping(value = "findArticleById", method = RequestMethod.POST)
	@ResponseBody
	public Object findArticleById(@RequestBody String a) throws Exception{
		logBefore(logger, "查询-----------------根据文章ID获取文章信息！");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,articleId = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(a);
		if (Tools.notEmpty(jasonObject.getString("articleId"))) {
			articleId = jasonObject.getString("articleId").trim();
			pd.put("ARTICLE_ID", articleId);
			PageData data = this.articleService.findById(pd);
			if(data!=null){
				msg = "success";
				map.put("data", data);
			}
		}else{
			msg = "error";
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}


	/**
	 * 通过用户ID 获取关联的用户信息 
	 * url:http://localhost:8080/ihealth/rest/findUsersById
	 * type:post
	 * 
	 * @param {"userId":"用户ID"}
	 * @return 
	 * 当查询出数据时、返回一条或多条数据，取值需要循环： 
	 * 		{ 
	 * 		"result": "success", 
	 * 		"data": [ {
	 * 					"useranduser_id": "关联表主键","connection": "我们之间的关系",
	 * 					"useranduser_id": "我是谁",	"user_id_two": "跟谁关联",
	 *         			"NUMBER": "编号", 			"RIGHTS": "权限", 
	 *         			"IP": "IP地址", 				"PHONE": "电话",
	 *         			"ALIAS": "昵称", 				"SEX": "性别", 
	 *         			"USER_ID": "ID", 			"MARRIAGESTATUS":"婚姻状况", 
	 *         			"LAST_LOGIN": "最后登录时间", 	"EMAIL": "邮箱地址", 
	 *         			"HEIGHT": 身高,				"BIRTHPLACE": "出生地", 
	 *         			"NAME": "姓名", 				"CAREER": "职业", 
	 *         			"STATUS": "用户状态", 			"OPENID": "openId", 
	 *         			"PASSWORD": "密码", 			"BZ": "333",
	 *         			"USERNAME": "用户名", 		"DEGREE": "学历", 
	 *         			"LIVEPLACE": "常住地", 		"AVATAR": "头像地址", 
	 *         			"WEIGHT": 体重, 				"BIRTHDAY": "生日" 
	 *         		} ] 
	 *      }
	 * 当传入的userId为null或为''时 返回数据为{ "result": "error"}
	 * 当根据userID查询出的数据为null时 返回{ "result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "findUsersById", method = RequestMethod.POST)
	@ResponseBody
	public Object findUsersById(@RequestBody String u) throws Exception {
		logBefore(logger, "查询--------------根据userId获取关联的用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,userId = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("userId"))) {
				userId = jasonObject.getString("userId").trim();
				pd.put("user_id_one", userId);
				List<PageData> data = this.appuserService.findUserCastUser(pd);
				if (data != null && data.size() > 0) {
					msg = "success";
					map.put("data", data);
				} else {
					msg = "no";
				}
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据关联关系表中的ID主键 删除关联用户
	 * url:http://localhost:8080/ihealth/rest/deleteRelationUser 
	 * type:post
	 * 
	 * @param {"useranduser_id":"值为：根据前面根据userId查询出来的useranduser_id"}
	 * @return 
	 * 		删除成功返回:{"result": "success"} 
	 * 		当传入的参数useranduser_id为null或""时,返回值为{"result" = "null"} 
	 * 		当程序报错时 返回值为{"result" = "error"}
	 * @throws Exception
	 */
	@RequestMapping(value = "deleteRelationUser", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteRelationUser(@RequestBody String u) {
		logBefore(logger, "删除---------------------根据用户关系表中的主键 ID(useranduser_id)删除关联的用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,useranduser_id = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("useranduser_id"))) {
				useranduser_id = jasonObject.getString("useranduser_id").trim();
				pd.put("useranduser_id", useranduser_id);
				try {
					this.appuserService.deleteRelationUser(pd);
					msg = "success";
				} catch (Exception e) {
					msg = "error";
					logger.debug("删除用户关联关系失败！");
					e.printStackTrace();
				}
			}else{
				msg = "null";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据userId 添加关联用户 
	 * url:http://localhost:8080/ihealth/rest/saveUserAndUser
	 * type:post
	 * 传入参数
	 * @param {
	 * 			"userId":"当前登录的用户ID(主ID)",		"user_Id":"关联用户的ID",
	 * 			"connection":"用户关系"
	 *        }
	 * @return 
	 * 		当传入的参数为null 返回{"result":"error"}
	 *      当新增关联关系成功时！返回{"result":"success"}
	 *      如果关系已存在 返回：{"result":"existence"}
	 *      程序出错 返回{"result":"no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "saveUserAndUser", method = RequestMethod.POST)
	@ResponseBody
	public Object saveUserAndUser(@RequestBody String u) throws Exception {
		logBefore(logger, "新增-----------保存用户关系");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,userId = null,user_Id = null,connection = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("connection"))) {
				connection = jasonObject.getString("connection").trim();
			}
			
			if (Tools.notEmpty(jasonObject.getString("userId")) && Tools.notEmpty(jasonObject.getString("user_Id"))) {
				userId = jasonObject.getString("userId").trim();
				user_Id = jasonObject.getString("user_Id").trim();
				pd.put("user_id_one", userId);
				pd.put("user_id_two", user_Id);
				//根据当前传入的用户ID 查询数据库是否存在
				PageData pds = this.appuserService.findConnectionWhether(pd);
				if (pds != null && pds.size()>0) {
					logger.debug("用户关系已存在！");
					msg = "existence";
				}else{
					pd.put("useranduser_id", this.get32UUID());
					pd.put("connection", connection);
					try {
						this.appuserService.saveRelationUser(pd);
						logger.debug("保存用户关系成功！");
						msg = "success";
					} catch (Exception e) {
						logger.debug("程序出错！");
						msg = "no";
					}
				}
			}else{
				logger.debug("获取用户ID失败！");
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据userId 查询用户信息完整度
	 * url:http://localhost:8080/ihealth/rest/findMessageIntegrity
	 * type:post
	 * @param {"userId":"当前登录的用户ID(主ID)"}
	 * @return 用户ID不为空 返回
	 * 	{
	 * "result":"success",
	 * "data":
	 * 		{
	 * 		"tagNumber":标签信息完整度,
	 * 		"connectionNumber":关心的人完整度,
	 * 		"USER_ID":"用户ID",
	 * 		"diseaseNumber":疾病信息完整度,
	 * 		"userNumber":用户信息完整度
	 * 		}
	 * }
	 * 传入的用户ID为空 返回{"result":"null"}
	 * 程序出错 返回{"result":"error"}
	 * 
	 */
	@RequestMapping(value = "findMessageIntegrity", method = RequestMethod.POST)
	@ResponseBody
	public Object findMessageIntegrity(@RequestBody String u) throws Exception {
		logBefore(logger, "查询-------------根据userID查询信息完整度");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,userId = null;
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		Integer userNumber = 0,tagNumber = 0,diseaseNumber = 0,connectionNumber = 0;
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (Tools.notEmpty(jasonObject.getString("userId"))) {
				userId = jasonObject.getString("userId").trim();
				pd.put("USER_ID", userId);
				//根据用户ID 查询用户信息
				pds = this.appuserService.findByUiId(pd);
				if (pds != null) {
					if (Tools.notEmpty(pds.getString("PHONE"))) {
						userNumber += 10;
					}
					Object objB = pds.get("BIRTHDAY");
					if (objB != null && !"".equals(objB) && !"null".equals(objB)) {
						userNumber += 10;
					}
					if (Tools.notEmpty(pds.getString("SEX"))) {
						userNumber += 10;
					}
					if (Tools.notEmpty(pds.getString("MARRIAGESTATUS"))) {
						userNumber += 10;
					}
					if (Tools.notEmpty(pds.getString("BIRTHPLACE"))) {
						userNumber += 10;
					}
					if (Tools.notEmpty(pds.getString("LIVEPLACE"))) {
						userNumber += 10;
					}
					Object objH = pds.get("HEIGHT");
					if (objH != null && !"".equals(objH) && !"null".equals(objH)) {
						userNumber += 10;
					}
					Object objW = pds.get("WEIGHT");
					if (objW != null && !"".equals(objW) && !"null".equals(objW)) {
						userNumber += 10;
					}
					if (Tools.notEmpty(pds.getString("CAREER"))) {
						userNumber += 10;
					}
					if (Tools.notEmpty(pds.getString("DEGREE"))) {
						userNumber += 10;
					}
				}
				
				if (userNumber>=100) {
					userNumber =100;
				}
				
				//获取关联的用户
				if (Tools.notEmpty(userId)) {
					pd.put("user_id_one", userId);
					List<PageData> list = this.appuserService.findUserCastUser(pd);
					if (list.size() > 0) {
						for (int i = 0; i < list.size(); i++) {
							connectionNumber += 40;
						}
					}
					if (connectionNumber >= 100) {
						connectionNumber = 100;
					}
				}
				
				//获取标签信息
				List<PageData> tagList = this.tagService.findALLByGroup(pd);
				
				if (tagList.size() > 0 && tagList != null) {
					tagNumber = 10 * tagList.size();
				}
				if (tagNumber>=100) {
					tagNumber =100;
				}
				
				//所有疾病
				if (this.diseaseService.listAllByUserID(pd).size() > 0) {
					diseaseNumber += 30;
				}
				//家族遗传病
				if (this.diseaseService.listAllByUserIDIsInherItable(pd).size() > 0) {
					diseaseNumber += 30;
				}
				//关注疾病
				if (this.diseaseService.listAllByUserIDIsHighIncaidence(pd).size() > 0) {
					diseaseNumber += 40;
				}
				
				if (diseaseNumber >= 100) {
					diseaseNumber = 100;
				}
				pd.put("userNumber", userNumber);
				pd.put("tagNumber", tagNumber);
				pd.put("diseaseNumber", diseaseNumber);
				pd.put("connectionNumber", connectionNumber);
				map.put("data", pd);
				msg = "success";
			}else{
				msg = "null";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	

}
