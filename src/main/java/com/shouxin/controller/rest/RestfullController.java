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
import com.shouxin.service.checkup.checkupitem.CheckupItemManager;
import com.shouxin.service.checkup.checkuppackage.CheckupPackageManager;
import com.shouxin.service.system.user.UserManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.PageData;
import com.shouxin.util.StatusEnum;

import net.sf.json.JSONObject;

/** 
 * 类名称：RestfullController
 * 提供微信端网页访问的接口
 * 创建人：shouxin
 * 更新时间：2015年11月3日
 * @version
 */
@SuppressWarnings("restriction")
@Controller
@RequestMapping(value="/rest")
public class RestfullController extends BaseController {
	
	
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="checkuppackageService")
	private CheckupPackageManager checkuppackageService;
	@Resource(name="checkupitemService")
	private CheckupItemManager checkupitemService;
	
	
	/**
	 * 用户注册，通过手机号码
	 * url : rest/register
	 * type:post
	 * @param {phone:"xx",openid:"xxx"} 
	 * @return 
	 * 当手号码不存在时，执行新增用户并返回用户信息{"result": "success","data": {"OPENID": "OPENID","PHONE": "电话","USER_ID": "USER_ID","ROLE_ID": "用户权限"}}
	 * 当手机号码存在，返回
	 * {
		    "result": "existence",
		    "data": {
		        "NUMBER": "编号",
		        "RIGHTS": "3264c8e83d0248bb9e3ea6195b4c0216",
		        "IP": "127.0.0.1",
		        "PHONE": "17787287288",
		        "ALIAS": "小黑",
		        "SEX": "男",
		        "USER_ID": "9991f4d7782a4ccfb8a65bd96ea7aafa",
		        "MARRIAGESTATUS": "婚姻",
		        "LAST_LOGIN": "2016-01-06 01:24:26",
		        "EMAIL": "909999000@qq.com",
		        "HEIGHT": 177,
		        "BIRTHPLACE": "上海",
		        "NAME": "姓名",
		        "CAREER": "职业",
		        "STATUS": "0",
		        "OPENID": "啊说三道四说撒",
		        "PASSWORD": "2612ade71c1e48cd7150b5f4df152faa699cedfe",
		        "BZ": "333",
		        "USERNAME": "xiaohei",
		        "DEGREE": "学历",
		        "LIVEPLACE": "常住地",
		        "AVATAR": "img/llls.jpg",
		        "WEIGHT": 156,
		        "BIRTHDAY": "1995-09-09"
		    }
		}
	 */
	@RequestMapping(value="/register",method = RequestMethod.POST)
	@ResponseBody
	private Object register(@RequestBody(required=true) String userVO) throws Exception{
		logBefore(logger,"通过手机号码注册user");
		Map<Object,Object> map = new HashMap<Object,Object>();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(userVO);
		//获取json中的key并赋值给字符串
		String phone = (String) jasonObject.get("phone");
		String openId = (String) jasonObject.get("openId");
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//生成ID
		String userId = this.get32UUID();
		logger.debug("phone:"+phone +"openId:" + openId);
		//将数据添加到PageDate
		pd.put("USER_ID", userId);	//ID 主键
		pd.put("PHONE", phone);		//电话号码
		pd.put("ROLE_ID", "1b67fc82ce89457a8347ae53e43a347e");//赋予新注册用户最低级的权限，初级会员
		pd.put("OPENID", openId);	//OpenID
		if(null == userService.findByPhone(pd)){	//判断手机号码是否存在
			logger.debug("经过判断，手机号码在数据库中不存在，执行新增操作");
			userService.saveU(pd); 					//执行保存
			logger.debug("将用户ID保存，在后续页面上取值");
			msg="success";
			PageData pageDate = userService.findById(pd);//根据ID查询用户数据
			map.put("data", pageDate);
		}else{
			//手机号码存在，通过手机号码查询用户信息
			PageData pageDate = this.userService.findByPhone(pd);//根据手机号码查询用户数据
			map.put("data", pageDate);
			msg = "existence";
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据ID更新用户信息
	 * URL：rest/updateUser
	 * type:post
	 * ID不为空 返回结果，和用户信息：
	 * {
		    "result": "suceess",
		    "data": {
		        "NUMBER": "9009",
		        "RIGHTS": "3264c8e83d0248bb9e3ea6195b4c0216",
		        "IP": "127.0.0.1",
		        "PHONE": "17787287288",
		        "ALIAS": "小黑",
		        "SEX": "男",
		        "USER_ID": "9991f4d7782a4ccfb8a65bd96ea7aafa",
		        "MARRIAGESTATUS": "婚姻",
		        "LAST_LOGIN": "2016-01-06 01:24:26",
		        "EMAIL": "909999000@qq.com",
		        "HEIGHT": 177,
		        "BIRTHPLACE": "上海",
		        "NAME": "姓名",
		        "CAREER": "职业",
		        "STATUS": "0",
		        "OPENID": "啊说三道四说撒",
		        "PASSWORD": "2612ade71c1e48cd7150b5f4df152faa699cedfe",
		        "BZ": "333",
		        "USERNAME": "xiaohei",
		        "DEGREE": "学历",
		        "LIVEPLACE": "常住地",
		        "AVATAR": "img/llls.jpg",
		        "WEIGHT": 156,
		        "BIRTHDAY": "1995-09-09"
		    }
		}	
	 * ID为空： {"result":"error"}
	 * @param {"userId":"ID","name":"姓名","sex":"性别","marriageStatus":"婚姻","birthday":"生日","height":"身高","weight":"体重","birthPlace":"出生地", "livePlace":"常住地","career":"职业","degree":"学历",}
	 * @return Object json
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateUser",method = RequestMethod.POST)
	@ResponseBody
	public Object saveUser(@RequestBody(required=true) String users) throws Exception{
		logBefore(logger,"通过手机号码注册user");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(users);
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
		
		//根据ID查询信息
		
		pd.put("USER_ID", userId);
		PageData pds = this.userService.findById(pd);
		
		pds.put("NAME", name);
		pds.put("SEX", sex);
		pds.put("MARRIAGESTATUS", marriageStatus);
		pds.put("BIRTHDAY", birthday);
		pds.put("HEIGHT", Integer.parseInt(height));
		pds.put("WEIGHT", Integer.parseInt(weight));
		pds.put("BIRTHPLACE", birthPlace);
		pds.put("LIVEPLACE", livePlace);
		pds.put("CAREER", career);
		pds.put("DEGREE", degree);
		
		//判断用户ID是否存在
		if(null == userId || "".equals(userId)){
			msg = "error";
		}else{
			logger.debug("执行根据ID更新用户数据");
			this.userService.editU(pds);
			logger.debug("返回一个用户数据");
			PageData pageData = this.userService.findById(pds);
			map.put("data", pageData);
			msg = "suceess";
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	//通过用户ID获取体检套餐信息的接口
	/**
	 * url:http://localhost:8080/ihealth/rest/findCheckPackage
	 * type:post
	 * 通过用户ID获取体检套餐信息
	 * @param {"userId":"用户ID"}
	 * @return 当用户ID不为空时，返回：
	 * {
		    "result": "success",
		    "data": {
		        "REVISION": "版本",
		        "STATUS": "状态",
		        "GENERATEDTIME": 该记录生成时间,
		        "EFFECTIVEFROM": 开始生效时间,
		        "EXPIREON": 失效时间,
		        "WORKER": "生成该记录的标记",
		        "CHECKUPPACKAGE_ID": "1001",
		        "SYSFLAG": "系统标记"
		    }
		}
		
		当用户ID为空时，返回：{ "result": "error"}
		当根据userID查询出的数据为null时  返回{ "result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value="/findCheckPackage",method = RequestMethod.POST)
	@ResponseBody
	public Object findCheckPackage(@RequestBody String u) throws Exception{
		logBefore(logger,"根据用户ID获取体检套餐信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String userId =(String) jasonObject.get("userId");
		pd.put("USER_ID", userId);
		if(null == userId || "".equals(userId)){
			msg = "error";
		}else{
			PageData data = this.checkuppackageService.findById(pd);
			if (data!=null && data.size()>0) {
				msg = "success";
				map.put("data", data);
			}else{
				msg = "no";
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * url:http://localhost:8080/ihealth/rest/editCheckItem
	 * type:post
	 * 根据体检项目ID修改体检项目的状态信息
	 * @param {"checkupItemId":"体检项目ID","stauts":"状态信息"}
	 * @return 修改成功、返回 { "result": "success"}
	 * 		         修改失败、返回{"result": "error"}
	 * @throws Exception
	 */
	@RequestMapping(value="editCheckItem",method=RequestMethod.POST)
	@ResponseBody
	public Object editCheckItem(@RequestBody String check) throws Exception{
		logBefore(logger,"根据体检项目ID获取体检项目信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(check);
		String checkItemId = jasonObject.get("checkupItemId").toString();
		String status = jasonObject.get("stauts").toString();
		
		//判断体检项目ID是否为空
		if(checkItemId == null || "".equals(checkItemId) || status ==null || "".equals(status)){
			msg = "error";
		}else{
			pd.put("CHECKUPITEM_ID", checkItemId);
			//判断传入的状态是
			/*如果状态值为 已选中 则改为已删除*/
			if(status.equals(StatusEnum.ALREADYENABLED.getValue())){
				status = StatusEnum.HASBEENDELETED.getValue();
			}else if(status.equals(StatusEnum.HASBEENDELETED.getValue())){
				/*如果状态值为已删除  则改为已选中*/
				status = StatusEnum.ALREADYENABLED.getValue();
			}
			//先查后改 --根据ID查询体检项目
			pd = this.checkupitemService.findById(pd);
			logger.debug("查看体检项目信息"+pd);
			pd.put("STATUS", status);
			logger.debug("修改体检项目----------start");
			this.checkupitemService.edit(pd);
			msg = "success";
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**
	 * 根据userID 获取体检项目
	 * 本机url：http://localhost:8080/ihealth/rest/findCheckItems
	 * type:post
	 * @param {"userId":"1"}
	 * @return 当userID不为空，并且数据库中存在这个ID、返回以下数据，需要注意的是，一个用户有多个体检项目，需要循环取值
	 * {
		    "result": "success",
		    "data": [
		        {
		            "REVISION": 版本,
		            "STATUS": "状态，包括：已选中，已删除",
		            "DESCRIPTION": "详细描述",
		            "GENERATEDTIME": 该记录生成时间,
		            "FREQUENCY": "每年一次",
		            "ORIGINATE": "指南来源",
		            "WORKER": "用于产生该记录的标记",
		            "SUBGROUP": "检查项目分组",
		            "SYSFLAG": "系统标记",
		            "NAME": "检查项目名称",
		            "FEATURES": "检查频率，是文字描述",
		            "CHECKUPITEM_ID": "ID"
		        },
		        {
		            "REVISION": 1,
		            "STATUS": "已选中",
		            "DESCRIPTION": "吸烟20年,致癌细胞变异",
		            "GENERATEDTIME": 1459780272000,
		            "FREQUENCY": "每年一次",
		            "ORIGINATE": "加拿大",
		            "WORKER": "admin",
		            "SUBGROUP": "X光",
		            "SYSFLAG": "admin",
		            "NAME": "肺部检查",
		            "FEATURES": "经济",
		            "CHECKUPITEM_ID": "102"
		        }
		    ]
		}
	 * 当用户ID为空时返回一下数据{"result": "error"}
	 * 当根据userID查询出的数据为null时  返回{ "result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value="findCheckItems",method=RequestMethod.POST)
	@ResponseBody
	public Object findCheckItems(@RequestBody String u) throws Exception{
		logBefore(logger,"根据用户ID获取体检项目信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String userId =(String) jasonObject.get("userId");
		pd.put("USER_ID", userId);
		if(userId == null || "".equals(userId)){
			msg = "error";
		}else{
			 List<PageData> pageDate = this.checkupitemService.listAll(pd);
			if (pageDate!=null && pageDate.size()>0) {
				msg = "success";
				map.put("data", pageDate);
			}else{
				msg = "no";
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 通过用户ID获取用户信息
	 * 本机地址url:http://localhost:8080/ihealth/rest/findUserById
	 * type:post
	 * @param {"userId":"1"}
	 * @return 当ID不为空，返回的参数列表为：
	 * {
		    "result": "success",
		    "data": {
		        "NUMBER": "001",
		        "RIGHTS": "1133671055321055258374707980945218933803269864762743594642571294",
		        "IP": "0:0:0:0:0:0:0:1",
		        "PHONE": "18788888888",
		        "ALIAS": "系统管理员",
		        "SEX": "男",
		        "USER_ID": "1",
		        "MARRIAGESTATUS": "未婚",
		        "LAST_LOGIN": "2016-04-12 14:55:19",
		        "EMAIL": "QQ313596790@main.com",
		        "HEIGHT": 188,
		        "BIRTHPLACE": "成都",
		        "NAME": "系统管理员",
		        "CAREER": "高级架构师",
		        "STATUS": "0",
		        "PASSWORD": "de41b7fb99201d8334c23c014db35ecd92df81bc",
		        "BZ": "最高统治者",
		        "USERNAME": "admin",
		        "ROLE_ID": "1",
		        "DEGREE": "本科",
		        "LIVEPLACE": "成都",
		        "AVATAR": "img/logo.jpg",
		        "WEIGHT": 50
		    }
		}
	 * 当userID为空时：返回的参数为：{"result": "error"}
	 * 当根据userID查询出的数据为null时  返回{ "result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value="findUserById",method=RequestMethod.POST)
	@ResponseBody
	public Object findUserById(@RequestBody String u) throws Exception{
		logBefore(logger,"根据用户ID获取用户信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String userId =(String) jasonObject.get("userId");
		pd.put("USER_ID", userId);
		if(null == userId || "".equals(userId)){
			msg = "error";
		}else{
			PageData data = this.userService.findById(pd);
			if (data!=null && data.size()>0) {
				msg = "success";
				map.put("data", data);
			}else{
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
	 * @param {openid:"openId"}
	 * 当根据openId查询出的数据为null时  返回{ "result": "no"}
	 * @return 当获取openId失败！返回{"result":"error"}
	 * @return 当获取openId成功！返回值为：
	 * {
		    "result": "success",
		    "data": {
		        "NUMBER": "001",
		        "RIGHTS": "1133671055321055258374707980945218933803269864762743594642571294",
		        "IP": "0:0:0:0:0:0:0:1",
		        "PHONE": "18788888888",
		        "ALIAS": "系统管理员",
		        "SEX": "男",
		        "USER_ID": "1",
		        "MARRIAGESTATUS": "未婚",
		        "LAST_LOGIN": "2016-04-13 16:12:33",
		        "EMAIL": "QQ313596790@main.com",
		        "HEIGHT": 188,
		        "BIRTHPLACE": "成都",
		        "NAME": "系统管理员",
		        "CAREER": "高级架构师",
		        "STATUS": "0",
		        "OPENID": "wwwsssddd",
		        "PASSWORD": "de41b7fb99201d8334c23c014db35ecd92df81bc",
		        "BZ": "最高统治者",
		        "USERNAME": "admin",
		        "ROLE_ID": "1",
		        "DEGREE": "本科",
		        "LIVEPLACE": "成都",
		        "AVATAR": "img/logo.jpg",
		        "WEIGHT": 50
		    }
		}
	 * @throws Exception
	 */
	@RequestMapping(value="findUserByOpenId",method=RequestMethod.POST)
	@ResponseBody
	public Object findUserByOpenId(@RequestBody String u) throws Exception{
		logBefore(logger,"根据openID获取用户信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String openId =(String) jasonObject.get("openId");
		pd.put("OPENID", openId);
		logger.debug("openId为空,获取用户信息失败！");
		if(null == openId || "".equals(openId)){
			msg = "error";
		}else{
			PageData data = this.userService.findById(pd);
			if (data!=null && data.size()>0) {
				msg = "success";
				map.put("data", data);
			}else{
				msg = "no";
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//根据用户ID  获取文章信息
	/**
	 * 根据用户ID  获取文章信息
	 * url:http://localhost:8080/ihealth/rest/findArticleByUserId
	 * type:post
	 * @param {"userId":"1"}
	 * @return 用户ID不为空 返回：
	 * {
		    "result": "success",
		    "data": [
		        {
		            "LOGOURL": 照片url
		            "PUBLISHTIME": 发布时间
		            "SUMMARY": "摘要",
		            "CREATEBY": "创建记录员工id",
		            "TITLE": "标题",
		            "ARTICLE_ID": "ID",
		            "AUTHOR": "作者",
		            "CREATEON": 创建记录时间
		            "URL": 内容url
		        }
		    ]
		}
		
		当userID为空： 返回{ "result": "error"}
		当根据userID查询出的数据为null时  返回{ "result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value="findArticleByUserId",method=RequestMethod.POST)
	@ResponseBody
	public Object findArticleByUserId(@RequestBody String u) throws Exception{
		logBefore(logger,"根据userId获取用户信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String userId =(String) jasonObject.get("userId");
		pd.put("USER_ID", userId);
		logger.debug("userId为空,获取文章信息！");
		if(null == userId || "".equals(userId)){
			msg = "error";
		}else{
			List<PageData> data = this.userService.findArticlesById(pd);
			if (data!=null && data.size()>0) {
				msg = "success";
				map.put("data", data);
			}else{
				msg = "no";
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据用户ID  获取标签信息
	 * url:http://localhost:8080/ihealth/rest/findTagByUserId
	 * type:post
	 * @param {"userId":"1"}
	 * @return 用户ID不为空 返回：
	 *{
		    "result": "success",
		    "data": [
		        {
		            "CREATEBY": "创建用户ID",
		            "TAG_ID": "ID",
		            "CREATEON": "创建时间",
		            "EXPRESSION": "表达式",
		            "NAME": "标签名"
		        }
		    ]
		}
		当userID为空： 返回{ "result": "error"}
		当根据userID查询出的数据为null时  返回{ "result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value="findTagByUserId",method=RequestMethod.POST)
	@ResponseBody
	public Object findTagByUserId(@RequestBody String u) throws Exception{
		logBefore(logger,"根据userId获取标签信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String userId =(String) jasonObject.get("userId");
		pd.put("USER_ID", userId);
		logger.debug("userId为空,获取标签信息！");
		if(null == userId || "".equals(userId)){
			msg = "error";
		}else{
			List<PageData> data = this.userService.findTagById(pd);
			if (data!=null && data.size()>0) {
				msg = "success";
				map.put("data", data);
			}else{
				msg = "no";
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据用户ID  获取疾病信息
	 * url:http://localhost:8080/ihealth/rest/findDiseaseById
	 * type:post
	 * @param {"userId":"1"}
	 * @return 用户ID不为空 返回：
	 *{
		    "result": "success",
		    "data": [
		        {
		            "CREATEBY": "创建记录员工id",
		            "DESCRIPTION": "描述",
		            "ISINHERITABLE": 是否遗传倾向,
		            "DISEASECATEGORY_ID": "疾病分类ID",
		            "ISHIGHINCIDENCE": 是否高发,
		            "DISEASE_ID": "ID",
		            "CREATEON": "创建记录时间",
		            "NAME": "名称"
		        }
		    ]
		}
		当userID为空： 返回{ "result": "error"}
		当根据userID查询出的数据为null时  返回{ "result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value="findDiseaseById",method=RequestMethod.POST)
	@ResponseBody
	public Object findDiseaseById(@RequestBody String u) throws Exception{
		logBefore(logger,"根据userId获取疾病信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String userId =(String) jasonObject.get("userId");
		pd.put("USER_ID", userId);
		logger.debug("userId为空,获取疾病信息！");
		if(null == userId || "".equals(userId)){
			msg = "error";
		}else{
			List<PageData> data = this.userService.findDiseaseById(pd);
			if (data!=null && data.size()>0) {
				msg = "success";
				map.put("data", data);
			}else{
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
	 * @param {"userId":"用户ID"}
	 * @return 当传入的userId为null或为''时 返回数据为{ "result": "error"}
	 * 当根据userID查询出的数据为null时  返回{ "result": "no"}
	 * 当查询出数据时、返回一条或多条数据，取值需要循环：
	 * {
		    "result": "success",
		    "data": [
		        {
		            "NUMBER": "用户编号",
		            "RIGHTS": "权限",
		            "IP": "0:0:0:0:0:0:0:1",
		            "PHONE": "电话",
		            "ALIAS": "昵称",
		            "SEX": "男",
		            "USER_ID": "ID",
		            "MARRIAGESTATUS": "婚姻状况",
		            "LAST_LOGIN": "最后登录时间",
		            "EMAIL": "邮箱",
		            "HEIGHT": 身高,
		            "BIRTHPLACE": "出生地",
		            "NAME": "姓名",
		            "CAREER": "职业",
		            "STATUS": "状态",
		            "PASSWORD": "密码",
		            "BZ": "111",
		            "USERNAME": "用户名",
		            "ROLE_ID": "角色id",
		            "DEGREE": "专业",
		            "LIVEPLACE": "生活地",
		            "AVATAR": "头像地址",
		            "WEIGHT": 体重
		        },
		        {
		            "RIGHTS": "",
		            "PHONE": "13567899876",
		            "ALIAS": "双黑狗",
		            "SEX": "男",
		            "USER_ID": "d28812dffc7b4c91924dd73c8487a86c",
		            "LAST_LOGIN": "",
		            "EMAIL": "828777292@qq.com",
		            "STATUS": "0",
		            "BZ": "要嘿嘿嘿么",
		            "USERNAME": "admin123",
		            "ROLE_ID": "3264c8e83d0248bb9e3ea6195b4c0216",
		            "SKIN": "default",
		            "LIVEPLACE": "成都",
		            "AVATAR": "image/logo.jpg",
		            "WEIGHT": 89,
		            "BIRTHDAY": "1992-08-20",
		            "NUMBER": "1001",
		            "IP": "",
		            "MARRIAGESTATUS": "未婚",
		            "HEIGHT": 189,
		            "BIRTHPLACE": "成都",
		            "NAME": "默默",
		            "CAREER": "程序员",
		            "PASSWORD": "c9f55b944bbd496ff462196310dcb383586b4a5e",
		            "DEGREE": "大壮"
		        }
		    ]
		}
	 * @throws Exception
	 */
	@RequestMapping(value="findUsersById",method=RequestMethod.POST)
	@ResponseBody
	public Object findUsersById(@RequestBody String u) throws Exception{
		logBefore(logger,"根据userId获取关联的用户信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String userId = jasonObject.get("userId").toString();
		if(null == userId || "".equals(userId)){
			msg = "error";
		}else{
			pd.put("user_id_one", userId);
			List<PageData> data = this.userService.findUsersById(pd);
			if (data!=null && data.size()>0) {
				msg = "success";
				map.put("data", data);
			}else{
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
	 * @param {"useranduser_id":"值为：根据前面根据userId查询出来的useranduser_id"}
	 * @return 删除成功返回:{"result": "success"}
	 * 当传入的参数useranduser_id 为null或""时,返回值为{"result" = "null"}
	 * 当程序报错时 返回值为{"result" = "error"}
	 */
	@RequestMapping(value="deleteRelationUser",method=RequestMethod.POST)
	@ResponseBody
	public Object deleteRelationUser(@RequestBody String u){
		logBefore(logger,"根据用户关系表中的主键 ID(useranduser_id)删除关联的用户信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String useranduser_id = jasonObject.get("useranduser_id").toString();
		if(useranduser_id == null || useranduser_id == ""){
			msg = "null";
		}else{
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
	 * @param {"userId":"当前登录的用户ID(主ID)","name":"姓名","sex":"性别","marriageStatus":"婚姻","birthday":"生日","height":"身高","weight":"体重","birthPlace":"出生地", "livePlace":"常住地","career":"职业","degree":"学历",}
	 * @return
	 * 	当新增用户信息失败时！跟新增关联用户关系失败时！返回{"result":"error"}
	 * 	当新增关联关系成功时！返回{"result":"success"}
	 */
	@RequestMapping(value="saveRelationUser",method=RequestMethod.POST)
	@ResponseBody
	public Object saveRelationUser(@RequestBody String u){
		/*
		 * 分析：当用户点击新增关联用户按钮时：获取当前登录的用户ID userId 跳转页面到新增
		 * (执行新增用户的操作) 同时保存 生成的 ID
		 * 将获取到的userID   和  新增用户的 userID  存入sys_useranduser表中 并生成 ID属性
		 * 当新增用户成功时！
		 * 
		 */
		logBefore(logger,"根据用户关系表中的主键 ID(useranduser_id)删除关联的用户信息");
		Map<Object,Object> map = new HashMap<Object,Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		//将String类型的数据转换为json
		JSONObject jasonObject =JSONObject.fromObject(u);
		String userId = jasonObject.get("userId").toString();
		
		String name = jasonObject.get("name").toString();
		String sex = jasonObject.get("sex").toString();
		String marriageStatus = jasonObject.get("marriageStatus").toString();
		String birthday = jasonObject.get("birthday").toString();
		String height = jasonObject.get("height").toString();
		String weight = jasonObject.get("weight").toString();
		String birthPlace =  jasonObject.get("birthPlace").toString();
		String livePlace =  jasonObject.get("livePlace").toString();
		String career =  jasonObject.get("career").toString();
		String degree =  jasonObject.get("degree").toString();
		
		String uuid = this.get32UUID();//新增关联用户的ID
		
		String useranduser_id = this.get32UUID();
		
		pd.put("USER_ID", uuid);
		pd.put("NAME", name);
		pd.put("SEX", sex);
		pd.put("MARRIAGESTATUS", marriageStatus);
		pd.put("BIRTHDAY", birthday);
		pd.put("HEIGHT", Integer.parseInt(height));
		pd.put("WEIGHT", Integer.parseInt(weight));
		pd.put("BIRTHPLACE", birthPlace);
		pd.put("LIVEPLACE", livePlace);
		pd.put("CAREER", career);
		pd.put("DEGREE", degree);
		
		if (pd!=null  || pd.size()>0) {
			try {
				//新增用户
				this.userService.saveU(pd);
				if (userId != null || userId != "") {
					//执行关联信息的添加
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
}
