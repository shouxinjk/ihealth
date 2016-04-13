package com.shouxin.controller.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.checkup.CheckupItem;
import com.shouxin.entity.checkup.CheckupPackage;
import com.shouxin.service.checkup.checkupitem.CheckupItemManager;
import com.shouxin.service.checkup.checkuppackage.CheckupPackageManager;
import com.shouxin.service.system.user.UserManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.PageData;

import net.sf.json.JSONObject;

/** 
 * 类名称：UserController
 * 创建人：shouxin
 * 更新时间：2015年11月3日
 * @version
 */
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
	@RequestMapping(value="/findCheckPackage/{userId}",method = RequestMethod.POST)
	@ResponseBody
	public Object findCheckPackage(@PathVariable("userId") String userId) throws Exception{
		logger.debug("判断用户ID是否为空:" + userId);
		Map<Object,Object> map = new HashMap<Object,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String msg = null;
		if(null == userId || "".equals(userId)){
			msg="error";
		}else{
			logger.debug("执行根据用户ID查询体检套餐的方法");
			List<CheckupPackage> checkList =  this.checkuppackageService.listAllById(userId);
			logger.debug(checkList);
			msg = "success";
			map.put("data", checkList);
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**
	 * 本机url：http://localhost:8080/ihealth/rest/findCheckItems
	 * @param {"userId":"1"}
	 * @return 当userID不为空，并且数据库中存在这个ID、返回以下数据，需要注意的是，一个用户有多个体检项目，需要循环取值
	 * {
		    "result": "success",
		    "data": [
		        {
		            "users": {
		                "page": {"totalPage": 0,"totalResult": 0, "currentPage": 0,"pageStr": "","showCount": 10, "currentResult": 0,"entityOrField": false,"pd": {}},
		                "username": "zhangsan",
		                "sex": "男",
		            },
		            "name": "肺部检查",
		            "status": "已选中",
		            "description": "吸烟20年,致癌细胞变异",
		            "originate": "加拿大",
		            "subgroup": "X光",
		            "features": null,
		            "revision": 1,
		            "sysflag": "admin",
		            "worker": "admin",
		            "generatedtime": "2016-04-04 22:31:12.0",
		            "frequency": "每年一次",
		            "checkupitem_ID": "102",
		            "checkupPackage": null
		        }
		    ]
		}
	 * 当用户ID为空时返回一下数据{"result": "error"}
	 * @throws Exception
	 */
	@RequestMapping(value="findCheckItems",method=RequestMethod.POST)
	@ResponseBody
	public Object findCheckItems(@RequestBody String u) throws Exception{
		logBefore(logger,"根据用户ID获取用户信息");
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
			 List<CheckupItem> checkupItems = this.checkupitemService.findAllByUserId(userId);
			if (checkupItems!=null) {
				msg = "success";
				map.put("data", checkupItems);
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 通过用户ID获取用户信息
	 * 本机地址url:http://localhost:8080/ihealth/rest/findUserById
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
	 * 当ID为空时：返回的参数为：
	 * 	{"result": "error"}
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
			if (data!=null) {
				msg = "success";
				map.put("data", data);
			}
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
}
