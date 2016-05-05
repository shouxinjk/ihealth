package com.shouxin.controller.rest;

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
import com.shouxin.util.DegreeEnum;
import com.shouxin.util.MarriageStatusEnum;
import com.shouxin.util.PageData;
import com.shouxin.util.SexEnum;
import com.shouxin.util.StatusEnum;

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
	 * @param {phone:"xx",openid:"xxx"}
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
		logBefore(logger, "通过手机号码注册user");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json 
		JSONObject jasonObject = JSONObject.fromObject(userVO);
		
		// 获取json中的key并赋值给字符串 
		String phone = jasonObject.get("phone").toString();
		String openId = jasonObject.get("openId").toString();
		
		// 生成ID主键 
		String userId = this.get32UUID();

		// 将数据添加到PageDate 
		pd.put("USER_ID", userId); 								// ID 主键
		pd.put("PHONE", phone); 								// 电话号码
		pd.put("ROLE_ID", "1b67fc82ce89457a8347ae53e43a347e");	// 赋予新注册用户最低级的权限，初级会员
		pd.put("OPENID", openId); 								// OpenID
		
		// 判断手机号码是否存在
		if (null == userService.findByPhone(pd)) { 
			logger.debug("经过判断，手机号码在数据库中不存在，执行新增操作");
			userService.saveU(pd); // 执行保存
			logger.debug("将用户ID保存，在后续页面上取值");
			msg = "success";
			PageData pageDate = userService.findById(pd);			// 根据ID查询用户数据
			map.put("data", pageDate);
		} else {
			// 手机号码存在，通过手机号码查询用户信息
			PageData pageDate = this.userService.findByPhone(pd);	// 根据手机号码查询用户数据
			map.put("data", pageDate);
			msg = "existence";	
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//根据手机号码 判断用户关系
	/**
	 * 根据手机号码 判断用户关系
	 * @param message {"phone":"手机号码","userId":"当前用户ID"}
	 * @return 	当传入的手机号码为null时 返回：{"result":"phoneisnull"}
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
		
		// 将String类型的数据转换为json 
		JSONObject jasonObject = JSONObject.fromObject(message);
		String phone = jasonObject.get("phone").toString();
		String user_id_one = jasonObject.get("userId").toString();
		if (user_id_one != null && !"".equals(user_id_one)) {
			pd.put("user_id_one", user_id_one);
		}
		if (phone != null && !"".equals(phone)) {
			pd.put("PHONE", phone);
			//根据手机号码 查询用户信息
			PageData pds = this.userService.findByPhone(pd);
			//判断查询的数据是否为空
			if (pds != null && pds.size()>0) {
				String user_id_two = pds.getString("USER_ID");
				pd.put("user_id_two", user_id_two);
				//查询关系是否存在
				PageData upd = this.userService.findConnectionWhether(pd);
				if (upd.size()>0 && upd != null) {
					msg = "guanxicunzai";
				}else{
					msg = "guanxibucunzai";
				}	
			}else{
				//通过手机号码查询的数据不存在
				msg = "no";
			}
		}else{
			msg = "phoneisnull";
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
	 * 			"degree":"学历",
	 * 		  }
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	@ResponseBody
	public Object saveUser(@RequestBody(required = true) String users) throws Exception {
		logBefore(logger, "通过用户ID更新用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(users);
		
		// 将获取到的json数据，转换为String类型
		String userId = (String) jasonObject.get("userId");
		String name = (String) jasonObject.get("name");
		String sex = (String) jasonObject.get("sex");
		String marriageStatus = (String) jasonObject.get("marriageStatus");
		String birthday = (String) jasonObject.get("birthday");
		String height = (String) jasonObject.get("height");
		String weight = (String) jasonObject.get("weight");
		String birthPlace = (String) jasonObject.get("birthPlace");
		String livePlace = (String) jasonObject.get("livePlace");
		String career = (String) jasonObject.get("career");
		String degree = (String) jasonObject.get("degree");
		
		// 将用户ID添加到PageDate中
		pd.put("USER_ID", userId);
		//根据用户ID查询用户信息
		PageData pds = this.userService.findById(pd);

		// 判断性别，并赋值
		if (sex.equals(SexEnum.BOY.getValue())) {
			sex = SexEnum.BOY.getValue();
		} else if (sex.equals(SexEnum.GIRL.getValue())) {
			sex = SexEnum.GIRL.getValue();
		} else {
			sex = SexEnum.BOY.getValue();
		}

		// 判断婚姻状态 传入下拉列表中的value 1 未婚 2 已婚 3 同居 4 离异 5寡居
		marriageStatus = MarriageStatusEnum.getNameByIndex(Integer.parseInt(marriageStatus));
		
		// 判断学历
		degree = DegreeEnum.getNameByIndex(Integer.parseInt(degree));

		// 将值添加到PageDate中
		pds.put("NAME", name);
		pds.put("SEX", sex);
		pds.put("MARRIAGESTATUS", marriageStatus);
		pds.put("BIRTHDAY", birthday);
		pds.put("HEIGHT", height);
		pds.put("WEIGHT", weight);
		pds.put("BIRTHPLACE", birthPlace);
		pds.put("LIVEPLACE", livePlace);
		pds.put("CAREER", career);
		pds.put("DEGREE", degree);

		// 判断用户ID是否存在
		if (null == userId || "".equals(userId)) {
			msg = "error";
		} else {
			logger.debug("根据用户ID更新用户信息");
			this.userService.editU(pds);
			logger.debug("根据用户ID查询用户信息，并保存在map中");
			PageData pageData = this.userService.findById(pds);
			map.put("data", pageData);
			msg = "suceess";
		}
		map.put("result", msg);
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
		logBefore(logger, "根据用户ID获取体检套餐信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		
		String userId = (String) jasonObject.get("userId");
		pd.put("USER_ID", userId);
		
		//判断用户ID是否为空
		if (null == userId || "".equals(userId)) {
			msg = "error";
		} else {
			logger.debug("根据用户ID查询体检套餐信息");
			PageData data = this.checkuppackageService.findById(pd);
			if (data != null && data.size() > 0) {
				msg = "success";
				map.put("data", data);
			} else {
				msg = "no";
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据体检项目ID修改体检项目的状态信息
	 * url:http://localhost:8080/ihealth/rest/editCheckItem 
	 * type:post
	 * @param {"checkupItemId":"体检项目ID","stauts":"状态信息"}
	 * 
	 * @return 	修改成功、返回 { "result": "success"} 
	 * 			修改失败、返回{"result": "error"}
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "editCheckItem", method = RequestMethod.POST)
	@ResponseBody
	public Object editCheckItem(@RequestBody String check) throws Exception {
		logBefore(logger, "根据体检项目ID获取体检项目信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(check);
		String checkItemId = jasonObject.get("checkupItemId").toString();
		String status = jasonObject.get("stauts").toString();

		// 判断体检项目ID和状态是否为空
		if (checkItemId == null || "".equals(checkItemId) || status == null || "".equals(status)) {
			msg = "error";
		} else {
			pd.put("CHECKUPITEM_ID", checkItemId);
			// 判断传入的状态是
			// 如果状态值为 已选中 则改为已删除 
			if (status.equals(StatusEnum.ALREADYENABLED.getName())) {
				status = StatusEnum.HASBEENDELETED.getName();
			} else if (status.equals(StatusEnum.HASBEENDELETED.getName())) {
				// 如果状态值为已删除 则改为已选中 
				status = StatusEnum.ALREADYENABLED.getName();
			}
			// 根据ID查询体检项目
			pd = this.checkupitemService.findById(pd);
			logger.debug("查看体检项目信息" + pd);
			pd.put("STATUS", status);
			logger.debug("修改体检项目信息");
			this.checkupitemService.edit(pd);
			msg = "success";
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
		logBefore(logger, "根据用户ID获取体检项目信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String userId = (String) jasonObject.get("userId");
		
		pd.put("USER_ID", userId);
		
		if (userId == null || "".equals(userId)) {
			msg = "error";
		} else {
			logger.debug("根据用户ID 查询体检项目信息");
			List<PageData> pageDate = this.checkupitemService.listAll(pd);
			if (pageDate != null && pageDate.size() > 0) {
				msg = "success";
				map.put("data", pageDate);
			} else {
				msg = "no";
			}
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
		logBefore(logger, "根据用户ID获取用户信息-----" + u);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String userId = (String) jasonObject.get("userId");
		
		pd.put("USER_ID", userId);
		
		if (null == userId || "".equals(userId)) {
			msg = "error";
		} else {
			PageData data = this.userService.findById(pd);
			if (data != null && data.size() > 0) {
				msg = "success";
				map.put("data", data);
			} else {
				msg = "no";
			}
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
		logBefore(logger, "根据openID获取用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String openId = (String) jasonObject.get("openId");
		
		pd.put("OPENID", openId);
		
		logger.debug("openId为空,获取用户信息失败！");
		if (null == openId || "".equals(openId)) {
			msg = "error";
		} else {
			PageData data = this.userService.findById(pd);
			if (data != null && data.size() > 0) {
				msg = "success";
				map.put("data", data);
			} else {
				msg = "no";
			}
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
		logBefore(logger, "获取前20篇文章信息！");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData> data = this.articleService.listByTopTwenty(pd);
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
		logBefore(logger, "获取所有文章信息！");
		
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
	 * 根据用户ID 获取文章信息 
	 * url:http://localhost:8080/ihealth/rest/findArticleByUserId
	 * type:post
	 * 
	 * @param {"userId":"用户ID"}
	 * @return 用户ID不为空 返回： 
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
	 * 当userID为空： 返回{ "result": "error"} 
	 * 当根据userID查询出的数据为null时 返回{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "findArticleByUserId", method = RequestMethod.POST)
	@ResponseBody
	public Object findArticleByUserId(@RequestBody String u) throws Exception {
		logBefore(logger, "根据userId获取文章信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String userId = (String) jasonObject.get("userId");
		
		pd.put("CREATEBY", userId);
		
		logger.debug("userId为空,获取文章信息！");
		if (null == userId || "".equals(userId)) {
			msg = "error";
		} else {
			List<PageData> data = this.userService.findArticlesById(pd);
			if (data != null && data.size() > 0) {
				msg = "success";
				map.put("data", data);
			} else {
				msg = "no";
			}
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
		logBefore(logger, "根据文章ID获取文章信息！");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(a);
		String articleId = (String) jasonObject.get("articleId");
		
		pd.put("ARTICLE_ID", articleId);
		
		logger.debug("根据文章ID获取文章信息！");
		if (null == articleId || "".equals(articleId)) {
			msg = "error";
		} else {
			PageData data = this.articleService.findById(pd);
			if(data!=null){
				msg = "success";
				map.put("data", data);
			}
			
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据用户ID 获取标签信息 
	 * url:http://localhost:8080/ihealth/rest/findTagByUserId
	 * type:post
	 * 
	 * @param {"userId":"用户ID"}
	 * @return 
	 * 用户ID不为空 返回： 
	 * 		{ 
	 * 		"result": "success", 
	 * 		"data": [ { 
	 * 					"CREATEBY":"创建用户ID", 	"TAG_ID": "ID", 
	 * 					"CREATEON": "创建时间", 	"EXPRESSION":"表达式", 
	 * 					"NAME": "标签名" 
	 * 				} ] 
	 * 		} 
	 * 当userID为空： 返回{ "result": "error"}
	 * 当根据userID查询出的数据为null时 返回{ "result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "findTagByUserId", method = RequestMethod.POST)
	@ResponseBody
	public Object findTagByUserId(@RequestBody String u) throws Exception {
		logBefore(logger, "根据userId获取标签信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String userId = (String) jasonObject.get("userId");
		
		pd.put("USER_ID", userId);
		
		logger.debug("userId为空,获取标签信息！");
		if (null == userId || "".equals(userId)) {
			msg = "error";
		} else {
			List<PageData> data = this.userService.findTagById(pd);
			if (data != null && data.size() > 0) {
				msg = "success";
				map.put("data", data);
			} else {
				msg = "no";
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据用户ID 获取疾病信息 
	 * url:http://localhost:8080/ihealth/rest/findDiseaseById
	 * type:post
	 * 
	 * @param {"userId":"用户ID"}
	 * @return 
	 * 用户ID不为空 返回： 
	 * 		{ 
	 * 		"result": "success", 
	 * 		"data": [ { 
	 * 					"CREATEBY":"创建记录员工id", 	"DESCRIPTION": "描述", 
	 * 					"ISINHERITABLE": 是否遗传倾向,	"DISEASECATEGORY_ID": "疾病分类ID", 
	 * 					"ISHIGHINCIDENCE": 是否高发,	"DISEASE_ID": "ID", 
	 * 					"CREATEON": "创建记录时间", 	"NAME": "名称" 
	 * 				} ] 
	 * 		}
	 * 当userID为空： 返回{ "result": "error"} 
	 * 当根据userID查询出的数据为null时 返回{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "findDiseaseById", method = RequestMethod.POST)
	@ResponseBody
	public Object findDiseaseById(@RequestBody String u) throws Exception {
		logBefore(logger, "根据用户ID获取疾病信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String userId = (String) jasonObject.get("userId");
		
		pd.put("USER_ID", userId);
		
		logger.debug("userId为空,获取疾病信息！");
		if (null == userId || "".equals(userId)) {
			msg = "error";
		} else {
			List<PageData> data = this.userService.findDiseaseById(pd);
			if (data != null && data.size() > 0) {
				msg = "success";
				map.put("data", data);
			} else {
				msg = "no";
			}
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
		logBefore(logger, "根据userId获取关联的用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String userId = jasonObject.get("userId").toString();
		
		if (null == userId || "".equals(userId)) {
			msg = "error";
		} else {
			pd.put("user_id_one", userId);
			List<PageData> data = this.userService.findUsersById(pd);
			if (data != null && data.size() > 0) {
				msg = "success";
				map.put("data", data);
			} else {
				msg = "no";
			}
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
		logBefore(logger, "根据用户关系表中的主键 ID(useranduser_id)删除关联的用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String useranduser_id = jasonObject.get("useranduser_id").toString();
		
		if (useranduser_id == null || useranduser_id == "") {
			msg = "null";
		} else {
			pd.put("useranduser_id", useranduser_id);
			try {
				this.userService.deleteRelationUser(pd);
				msg = "success";
			} catch (Exception e) {
				msg = "error";
				logger.debug("删除用户关联关系失败！");
				e.printStackTrace();
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据userId 添加关联用户 
	 * url:http://localhost:8080/ihealth/rest/saveRelationUser
	 * type:post
	 * @param {
	 * 			"userId":"当前登录的用户ID(主ID)",		"name":"姓名",
	 * 			"sex":"性别",							"marriageStatus":"婚姻",
	 * 			"birthday":"生日",					"height":"身高",
	 * 			"weight":"体重",						"birthPlace":"出生地",
	 *          "livePlace":"常住地",					"career":"职业",
	 *          "degree":"学历",
	 *        }
	 * @return 
	 * 		当新增用户信息失败时！跟新增关联用户关系失败时！返回{"result":"error"}
	 *      当新增关联关系成功时！返回{"result":"success"}
	 * @throws Exception
	 */
	@SuppressWarnings({ "static-access", "static-access" })
	@RequestMapping(value = "saveRelationUser", method = RequestMethod.POST)
	@ResponseBody
	public Object saveRelationUser(@RequestBody String u) {
		logBefore(logger, "根据用户关系表中的主键 ID(useranduser_id)删除关联的用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		
		String userId = jasonObject.get("userId").toString();
		String name = jasonObject.get("name").toString();
		String sex = jasonObject.get("sex").toString();
		String marriageStatus = jasonObject.get("marriageStatus").toString();
		String birthday = jasonObject.get("birthday").toString();
		String height = jasonObject.get("height").toString();
		String weight = jasonObject.get("weight").toString();
		String birthPlace = jasonObject.get("birthPlace").toString();
		String livePlace = jasonObject.get("livePlace").toString();
		String career = jasonObject.get("career").toString();
		String degree = jasonObject.get("degree").toString();

		String uuid = this.get32UUID();				// 新增关联用户的ID

		String useranduser_id = this.get32UUID();	//生成用户关联表中的主键

		if (sex.equals(SexEnum.BOY.getValue())) {	//判断性别
			sex = SexEnum.BOY.getValue();
		} else if (sex.equals(SexEnum.GIRL.getValue())) {
			sex = SexEnum.GIRL.getValue();
		} else {
			sex = SexEnum.BOY.getValue();
		}

		// 判断婚姻状态 传入下拉列表中的value 1 未婚 2 已婚 3 同居 4 离异 5寡居
		marriageStatus = MarriageStatusEnum.getNameByIndex(Integer.parseInt(marriageStatus));

		// 判断学历
		degree = DegreeEnum.getNameByIndex(Integer.parseInt(degree));

		pd.put("USER_ID", uuid);
		pd.put("NAME", name);
		pd.put("SEX", sex);
		pd.put("MARRIAGESTATUS", marriageStatus);
		pd.put("BIRTHDAY", birthday);
		pd.put("HEIGHT", height);
		pd.put("WEIGHT", weight);
		pd.put("BIRTHPLACE", birthPlace);
		pd.put("LIVEPLACE", livePlace);
		pd.put("CAREER", career);
		pd.put("DEGREE", degree);

		if (pd != null || pd.size() > 0) {
			try {
				// 新增用户
				this.userService.saveU(pd);
				if (userId != null || userId != "") {
					// 执行关联信息的添加
					try {
						pd.put("useranduser_id", useranduser_id);
						pd.put("user_id_one", userId);
						pd.put("user_id_two", uuid);
						this.userService.saveRelationUser(pd);
						msg = "success";
					} catch (Exception e) {
						msg = "error";
					}
				}
			} catch (Exception e) {
				msg = "error";
			}
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
		logBefore(logger, "保存用户关系");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		
		String userId = jasonObject.get("userId").toString();
		String user_Id = jasonObject.get("user_Id").toString();
		String connection = jasonObject.get("connection").toString();
		if (userId == null && "".equals(userId) && user_Id == null && "".equals(user_Id) ) {
			logger.debug("获取用户ID失败！");
			msg = "error";
		}else{
			pd.put("user_id_one", userId);
			pd.put("user_id_two", user_Id);
			//根据当前传入的用户ID 查询数据库是否存在
			PageData pds = this.userService.findConnectionWhether(pd);
			if (pds != null && pds.size()>0) {
				logger.debug("用户关系已存在！");
				msg = "existence";
			}else{
				pd.put("useranduser_id", this.get32UUID());
				pd.put("connection", connection);
				try {
					this.userService.saveRelationUser(pd);
					logger.debug("保存用户关系成功！");
					msg = "success";
				} catch (Exception e) {
					logger.debug("程序失败！");
					msg = "no";
				}
			}
			
			
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
	 * 传入的用户ID为空 返回{"result":"error"}
	 * 
	 */
	@RequestMapping(value = "findMessageIntegrity", method = RequestMethod.POST)
	@ResponseBody
	public Object findMessageIntegrity(@RequestBody String u) throws Exception {
		logBefore(logger, "查询信息完整度");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer userNumber = 0;
		Integer tagNumber = 0;
		Integer diseaseNumber = 0;
		Integer	connectionNumber = 0;
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		String userId = jasonObject.get("userId").toString();
		
		if (userId != null && !"".equals(userId)) {
			pd.put("USER_ID", userId);
			//根据用户ID 查询用户信息
			PageData pds = this.userService.findById(pd);
			if (pds.getString("PHONE") != null && !"".equals(pds.getString("PHONE"))) {
				userNumber += 10;
			}
			if (pds.getString("BIRTHDAY") != null && !"".equals(pds.getString("BIRTHDAY"))) {
				userNumber += 10;
			}
			if (pds.getString("SEX") != null && !"".equals(pds.getString("SEX"))) {
				userNumber += 10;
			}
			if (pds.getString("MARRIAGESTATUS") != null && !"".equals(pds.getString("MARRIAGESTATUS"))) {
				userNumber += 10;
			}
			if (pds.getString("BIRTHPLACE") != null && !"".equals(pds.getString("BIRTHPLACE"))) {
				userNumber += 10;
			}
			if (pds.getString("LIVEPLACE") != null && !"".equals(pds.getString("LIVEPLACE"))) {
				userNumber += 10;
			}
			if (pds.getString("HEIGHT") != null && !"".equals(pds.getString("HEIGHT"))) {
				userNumber += 10;
			}
			if (pds.getString("WEIGHT") != null && !"".equals(pds.getString("WEIGHT"))) {
				userNumber += 10;
			}
			if (pds.getString("CAREER") != null && !"".equals(pds.getString("CAREER"))) {
				userNumber += 10;
			}
			if (pds.getString("DEGREE") != null && !"".equals(pds.getString("DEGREE"))) {
				userNumber += 10;
			}
			if (userNumber>=100) {
				userNumber =100;
			}
			
			//获取关联的用户
			
			if (userId != null && !"".equals(userId)) {
				pd.put("user_id_one", userId);
				List<PageData> list = this.userService.findUsersById(pd);
				for (int i = 0; i < list.size(); i++) {
					connectionNumber += 40;
				}
				
				if (connectionNumber >= 100) {
					connectionNumber = 100;
				}
			}
			
			
			//获取标签信息
			List<PageData> tagList = this.tagService.findAllGroupByUId(pd);
			
			if (tagList.size()>0 && tagList != null) {
				for (int i = 0; i < tagList.size(); i++) {
					tagNumber += 10;
				}
				if (tagNumber>=100) {
					tagNumber =100;
				}
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
			//Integer userNumber = 0;
			//Integer tagNumber = 0;
			//Integer diseaseNumber = 0;
			//Integer	connectionNumber = 0;
			pd.put("userNumber", userNumber);
			pd.put("tagNumber", tagNumber);
			pd.put("diseaseNumber", diseaseNumber);
			pd.put("connectionNumber", connectionNumber);
			map.put("data", pd);
			msg = "success";
		}else{
			msg = "error";
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	

}
