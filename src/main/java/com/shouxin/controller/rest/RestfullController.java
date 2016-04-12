package com.shouxin.controller.rest;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shouxin.controller.base.BaseController;
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
	
	/**
	 * 用户注册，通过手机号码 url : rest/register
	 * 当用户填写了手机号码并点击注册时需要的数据{phone:"xx",openid:"xxx"}
	 * @param UserVO 
	 * @return json
	 * 当手号码不存在时，执行新增用户并返回用户ID{"msg":"success"}{"userId",userId}
	 * 当手机号码存在，返回{"msg","existence"}{"pd",pageDate}
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
		pd.put("PHONE", phone);
		pd.put("OPENID", openId);
		if(null == userService.findByPhone(pd)){	//判断手机号码是否存在
			logger.debug("经过判断，手机号码在数据库中不存在，执行新增操作");
			userService.saveU(pd); 					//执行保存
			logger.debug("将用户ID保存，在后续页面上取值");
			msg="success";
			PageData pageDate = userService.findById(pd);
			map.put("pd", pageDate);
		}else{
			//手机号码存在，通过手机号码查询用户信息
			PageData pageDate = this.userService.findByPhone(pd);
			map.put("pd", pageDate);
			msg = "existence";
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
}
