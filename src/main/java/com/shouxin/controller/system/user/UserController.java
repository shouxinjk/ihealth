package com.shouxin.controller.system.user;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.DiseaseCategory;
import com.shouxin.entity.admin.TagCategory;
import com.shouxin.entity.system.Role;
import com.shouxin.service.admin.diseasecategory.DiseaseCategoryManager;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;
import com.shouxin.service.system.menu.MenuManager;
import com.shouxin.service.system.role.RoleManager;
import com.shouxin.service.system.user.UserManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.Const;
import com.shouxin.util.FileDownload;
import com.shouxin.util.FileUpload;
import com.shouxin.util.GetPinyin;
import com.shouxin.util.Jurisdiction;
import com.shouxin.util.ObjectExcelRead;
import com.shouxin.util.PageData;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PathUtil;
import com.shouxin.util.StringUtil;
import com.shouxin.util.Tools;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/** 
 * 类名称：UserController
 * 创建人：shouxin
 * 更新时间：2015年11月3日
 * @version
 */
@Controller
@RequestMapping(value="/user")
public class UserController extends BaseController {
	
	String menuUrl = "user/listUsers.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="tagcategoryService")
	private TagCategoryManager tagcategoryService;
	
	

	@Resource(name="diseasecategoryService")
	private DiseaseCategoryManager diseasecategoryService;
	
	/**显示用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listUsers")
	public ModelAndView listUsers(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		
		List<PageData>	userList = userService.findUsers(pd);	//列出用户列表
		
		mv.setViewName("system/user/user_list");
		mv.addObject("userList", userList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	//查看微信端注册用户
	/**显示用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getUsers")
	public ModelAndView listalluser(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		
		List<PageData>	userList = userService.findAllUserByOpenId(pd);	//列出用户列表
		
		mv.setViewName("system/user/registered_users");
		mv.addObject("userList", userList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**删除用户
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteU")
	public void deleteU(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除user");
		PageData pd = new PageData();
		pd = this.getPageData();
		userService.deleteU(pd);
		out.write("success");
		out.close();
	}
	
	/**去我关心的人
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goICareAbout")
	public ModelAndView goICareAbout()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> userList = this.userService.findUsersById(pd);
		String uid = pd.getString("user_id_one");
		mv.addObject("uid", uid);
		if (userList.size()>0 && userList != null) {
			pd.put("userList", userList);
			pd.put("msg", "你可以查看关心的人");
		}else{
			pd.put("msg", "你还没有添加关心的人哦！");
		}
		
		mv.setViewName("system/user/iCareAbout");
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 删除用户关联关系
	 * @param u
	 * @return
	 */
	@RequestMapping(value = "delConnection", method = RequestMethod.POST)
	@ResponseBody
	public Object delConnection(@RequestBody String u) {
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
	 * 模糊查询
	 * @param u
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "findLike", method = RequestMethod.POST)
	@ResponseBody
	public Object findLike(@RequestBody String v) throws Exception {
		logBefore(logger, "根据手机号码模糊查询用户信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(v);
		String phone = jasonObject.get("keyword").toString();
		if (phone !=null && phone != "") {
			pd.put("PHONE", phone);
		}
		
		List<PageData> userList = this.userService.findLike(pd);
		if (userList!=null && userList.size()>0) {
			pd.put("list", userList);
			msg = "success";
		}
		map.put("data", pd);
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
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
			msg = "error";
		}else{
			pd.put("user_id_one", userId);
			pd.put("user_id_two", user_Id);
			//根据当前传入的用户ID 查询数据库是存在
			PageData pds = this.userService.findConnectionWhether(pd);
			if (pds != null && pds.size()>0) {
				msg = "existence";
			}else{
				pd.put("useranduser_id", this.get32UUID());
				pd.put("connection", connection);
				try {
					logger.debug("保存用户关系");
					this.userService.saveRelationUser(pd);
					msg = "success";
				} catch (Exception e) {
					msg = "no";
				}
			}
			
			
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddU")
	public ModelAndView goAddU(Model model)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		/**
		 * 需求： 当用户点击新增按钮时，跳转到新增页面并获取所有的标签分类下的标签信息
		 */
		try{
			List<TagCategory> list = this.tagcategoryService.findTagsList();
			List<DiseaseCategory> disList = this.diseasecategoryService.findAllDiseases();
			String jsons = JSONArray.fromObject(disList).toString();
			String json = JSONArray.fromObject(list).toString();
			logger.debug(json + "-------------------------------------------------");
			json = json.replaceAll("TAG_ID", "id").replaceAll("TAGCATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("tags", "nodes");
			jsons = jsons.replaceAll("DISEASE_ID", "id").replaceAll("DISEASECATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("diseases", "nodes");
			model.addAttribute("zTreeNodes", json);
			model.addAttribute("zTreeNodess", jsons);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "saveU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveU")
	public ModelAndView saveU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//生成 用户信息的ID
		String user_id = this.get32UUID();
		
		//获取前段页面传入的多个标签的ID 并按,拆分
		String tagIds = pd.getString("tagIds");
		if(tagIds != null && !"".equals(tagIds)){
			logger.debug("多个标签的ID为："+tagIds);
			//按,进行拆分  保存数据到数据库中
			String[] tags = StringUtil.StrList(tagIds);
			for (int i = 0; i < tags.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("tag_id", tags[i]);
				pd.put("user_id", user_id);
				this.userService.saveUserAndTag(pd);
			}
		}
		
		//获取当前选中的疾病的ID
		String diseaseId = pd.getString("diseaseId");
		if(!"".equals(diseaseId) && diseaseId != null){
			logger.debug("多个既往疾病的ID为:" + diseaseId);
			String[] diseases = StringUtil.StrList(diseaseId);
			for (int i = 0; i < diseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("user_id", user_id);
				pd.put("disease_id", diseases[i]);
				this.userService.saveUserAndDisease(pd);
			}
		}
		
		//获取当前选中的家族遗传疾病的ID
		String fhdiseaseId = pd.getString("fhdiseaseId");
		if(!"".equals(fhdiseaseId) && fhdiseaseId != null){
			logger.debug("多个家族遗传疾病的ID为:" + fhdiseaseId);
			String[] fhdiseases = StringUtil.StrList(fhdiseaseId);
			for (int i = 0; i < fhdiseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("user_id", user_id);
				pd.put("disease_id", fhdiseases[i]);
				this.userService.saveUserAndFhDisease(pd);
			}
		}
		
		pd.put("USER_ID", user_id);	//ID 主键
		pd.put("LAST_LOGIN", "");				//最后登录时间
		pd.put("IP", "");						//IP
		pd.put("STATUS", "0");					//状态
		pd.put("CREATEON", new Date());
		pd.put("CREATEBY", Jurisdiction.getUserId());
		pd.put("SKIN", "default");
		pd.put("RIGHTS", "");		
		pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());	//密码加密
		if(null == userService.findByUsername(pd)){	//判断用户名是否存在
			userService.saveU(pd); 					//执行保存
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**
	 * 根据用户ID 获取标签信息
	 */
	@RequestMapping(value="findTagsById/{id}")
	@ResponseBody
	public Object findTagsById(@PathVariable String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		logger.debug("用户的ID为:" + id);
		pd.put("user_id", id);
		List<PageData> tagList = this.userService.findTagsByUserId(pd);
		if(tagList.size()>0 && tagList !=null){
			map.put("tagList", tagList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 根据用户ID 获取既往疾病信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findDiseasesById/{id}")
	@ResponseBody
	public Object findDiseasesById(@PathVariable String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		logger.debug("用户的ID为:" + id);
		pd.put("user_id", id);
		List<PageData> diseaseList = this.userService.findDiseaseByUserId(pd);
		if(diseaseList.size()>0 && diseaseList !=null){
			map.put("diseaseList", diseaseList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 根据用户ID 获取家族遗传疾病信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findFhDiseasesById/{id}")
	@ResponseBody
	public Object findFhDiseasesById(@PathVariable String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		logger.debug("用户的ID为:" + id);
		pd.put("user_id", id);
		List<PageData> fhdiseaseList = this.userService.findFhDiseaseByUserId(pd);
		if(fhdiseaseList.size()>0 && fhdiseaseList !=null){
			map.put("fhdiseaseList", fhdiseaseList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 判断手机号是否存在
	 */
	@RequestMapping(value="/hasPhone")
	@ResponseBody
	public Object hasPhone(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByPhone(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断用户名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUsername(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断邮箱是否存在
	 * @return
	 */
	@RequestMapping(value="/hasE")
	@ResponseBody
	public Object hasE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasN")
	@ResponseBody
	public Object hasN(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUN(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**去修改用户页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditU")
	public ModelAndView goEditU(Model model) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String fx = pd.getString("fx");//顶部修改个人资料
		if("head".equals(fx)){
			mv.addObject("fx", "head");
		}else{
			mv.addObject("fx", "user");
		}
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		pd = userService.findById(pd);								//根据ID读取
		/**
		 * 需求： 当用户点击新增按钮时，跳转到新增页面并获取所有的标签分类下的标签信息
		 */
		try{
			List<TagCategory> list = this.tagcategoryService.findTagsList();
			List<DiseaseCategory> disList = this.diseasecategoryService.findAllDiseases();
			String jsons = JSONArray.fromObject(disList).toString();
			String json = JSONArray.fromObject(list).toString();
			logger.debug(json + "-------------------------------------------------");
			json = json.replaceAll("TAG_ID", "id").replaceAll("TAGCATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("tags", "nodes");
			jsons = jsons.replaceAll("DISEASE_ID", "id").replaceAll("DISEASECATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("diseases", "nodes");
			model.addAttribute("zTreeNodes", json);
			model.addAttribute("zTreeNodess", jsons);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**查看用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/view")
	public ModelAndView view() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		pd = userService.findByUsername(pd);						//根据ID读取
		mv.setViewName("system/user/user_view");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**去修改用户页面(在线管理页面打开)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditUfromOnline")
	public ModelAndView goEditUfromOnline(Model model) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		pd = userService.findByUsername(pd);						//根据ID读取
		/**
		 * 需求： 当用户点击新增按钮时，跳转到新增页面并获取所有的标签分类下的标签信息
		 */
		try{
			List<TagCategory> list = this.tagcategoryService.findTagsList();
			List<DiseaseCategory> disList = this.diseasecategoryService.findAllDiseases();
			String jsons = JSONArray.fromObject(disList).toString();
			String json = JSONArray.fromObject(list).toString();
			logger.debug(json + "-------------------------------------------------");
			json = json.replaceAll("TAG_ID", "id").replaceAll("TAGCATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("tags", "nodes");
			jsons = jsons.replaceAll("DISEASE_ID", "id").replaceAll("DISEASECATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("diseases", "nodes");
			model.addAttribute("zTreeNodes", json);
			model.addAttribute("zTreeNodess", jsons);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**
	 * 修改用户
	 */
	@RequestMapping(value="/editU")
	public ModelAndView editU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改ser");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("PASSWORD") != null && !"".equals(pd.getString("PASSWORD"))){
			pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());
		}
		
		String user_id = pd.getString("USER_ID");
		pd.put("user_id", user_id);
		//获取前段页面传入的多个标签的ID 并按,拆分
		String tagIds = pd.getString("tagIds");
		logger.debug(tagIds);
		if (tagIds != null && !"".equals(tagIds)) {
			//拆分
			String[] tags = StringUtil.StrList(tagIds);
			//删除跟这个用户有关系的所有的标签信息
			this.userService.deleteTags(pd);
			for (int i = 0; i < tags.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("tag_id", tags[i]);
				//新增关系
				this.userService.saveUserAndTag(pd);
			}
		}
		//根据传入的文章ID 和 标签ID 新增关系
		
		
		//获取当前选中的疾病的ID
		String diseaseId = pd.getString("diseaseId");
		logger.debug(diseaseId);
		//拆分
		if (diseaseId != null && !"".equals(diseaseId)) {
			//拆分
			String[] diseases = StringUtil.StrList(diseaseId);
			//删除所有跟此用户有关系的的既往疾病信息
			this.userService.deleteDiseases(pd);
			for (int i = 0; i < diseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("disease_id", diseases[i]);
				this.userService.saveUserAndDisease(pd);
			}
		}
		
		//获取当前选中的家族遗传疾病的ID
		String fhdiseaseId = pd.getString("fhdiseaseId");
		if(!"".equals(fhdiseaseId) && fhdiseaseId != null){
			String[] fhdiseases = StringUtil.StrList(fhdiseaseId);
			logger.debug("多个家族遗传疾病的ID为:" + fhdiseaseId);
			//删除所有跟次用户有关系的家族遗传疾病
			this.userService.deleteFhDiseases(pd);
			for (int i = 0; i < fhdiseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("disease_id", fhdiseases[i]);
				this.userService.saveUserAndFhDisease(pd);
			}
		}
		
		
		userService.editU(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 批量删除
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteAllU")
	@ResponseBody
	public Object deleteAllU() throws Exception {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除user");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String USER_IDS = pd.getString("USER_IDS");
		if(null != USER_IDS && !"".equals(USER_IDS)){
			String ArrayUSER_IDS[] = USER_IDS.split(",");
			userService.deleteAllU(ArrayUSER_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**导出用户信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
				String keywords = pd.getString("keywords");				//关键词检索条件
				if(null != keywords && !"".equals(keywords)){
					pd.put("keywords", keywords.trim());
				}
				String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
				String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
				if(lastLoginStart != null && !"".equals(lastLoginStart)){
					pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
				}
				if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
					pd.put("lastLoginEnd", lastLoginEnd+" 00:00:00");
				} 
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				titles.add("用户名"); 		//1
				titles.add("编号");  		//2
				titles.add("姓名");			//3
				titles.add("职位");			//4
				titles.add("手机");			//5
				titles.add("邮箱");			//6
				titles.add("最近登录");		//7
				titles.add("上次登录IP");	//8
				dataMap.put("titles", titles);
				List<PageData> userList = userService.listAllUser(pd);
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<userList.size();i++){
					PageData vpd = new PageData();
					vpd.put("var1", userList.get(i).getString("USERNAME"));		//1
					vpd.put("var2", userList.get(i).getString("NUMBER"));		//2
					vpd.put("var3", userList.get(i).getString("NAME"));			//3
					vpd.put("var4", userList.get(i).getString("ROLE_NAME"));	//4
					vpd.put("var5", userList.get(i).getString("PHONE"));		//5
					vpd.put("var6", userList.get(i).getString("EMAIL"));		//6
					vpd.put("var7", userList.get(i).getString("LAST_LOGIN"));	//7
					vpd.put("var8", userList.get(i).getString("IP"));			//8
					varList.add(vpd);
				}
				dataMap.put("varList", varList);
				ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
				mv = new ModelAndView(erv,dataMap);
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/user/uploadexcel");
		return mv;
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Users.xls", "Users.xls");
	}
	
	/**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "userexcel");							//执行上传
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);		//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			/*存入数据库操作======================================*/
			pd.put("RIGHTS", "");					//权限
			pd.put("LAST_LOGIN", "");				//最后登录时间
			pd.put("IP", "");						//IP
			pd.put("STATUS", "0");					//状态
			pd.put("SKIN", "default");				//默认皮肤
			pd.put("ROLE_ID", "1");
			List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
			pd.put("ROLE_ID", roleList.get(0).getROLE_ID());		//设置角色ID为随便第一个
			/**
			 * var0 :编号
			 * var1 :姓名
			 * var2 :手机
			 * var3 :邮箱
			 * var4 :备注
			 */
			for(int i=0;i<listPd.size();i++){		
				pd.put("USER_ID", this.get32UUID());										//ID
				pd.put("NAME", listPd.get(i).getString("var1"));							//姓名
				
				String USERNAME = GetPinyin.getPingYin(listPd.get(i).getString("var1"));	//根据姓名汉字生成全拼
				pd.put("USERNAME", USERNAME);	
				if(userService.findByUsername(pd) != null){									//判断用户名是否重复
					USERNAME = GetPinyin.getPingYin(listPd.get(i).getString("var1"))+Tools.getRandomNum();
					pd.put("USERNAME", USERNAME);
				}
				pd.put("BZ", listPd.get(i).getString("var4"));								//备注
				if(Tools.checkEmail(listPd.get(i).getString("var3"))){						//邮箱格式不对就跳过
					pd.put("EMAIL", listPd.get(i).getString("var3"));						
					if(userService.findByUE(pd) != null){									//邮箱已存在就跳过
						continue;
					}
				}else{
					continue;
				}
				pd.put("NUMBER", listPd.get(i).getString("var0"));							//编号已存在就跳过
				pd.put("PHONE", listPd.get(i).getString("var2"));							//手机号
				
				pd.put("PASSWORD", new SimpleHash("SHA-1", USERNAME, "123").toString());	//默认密码123
				if(userService.findByUN(pd) != null){
					continue;
				}
				userService.saveU(pd);
			}
			/*存入数据库操作======================================*/
			mv.addObject("msg","success");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

}
