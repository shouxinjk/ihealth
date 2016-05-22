package com.shouxin.controller.system.appuser;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.DiseaseCategory;
import com.shouxin.entity.admin.TagCategory;
import com.shouxin.entity.system.Role;
import com.shouxin.service.admin.diseasecategory.DiseaseCategoryManager;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;
import com.shouxin.service.system.appuser.AppuserManager;
import com.shouxin.service.system.role.RoleManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.DateUtil;
import com.shouxin.util.Jurisdiction;
import com.shouxin.util.MD5;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;
import com.shouxin.util.StringUtil;
import com.shouxin.util.Tools;
import com.shouxinjk.ihealth.data.Transfer;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/** 
 * 类名称：AppuserController
 * 创建人：shouxin
 * 修改时间：2014年11月17日
 * @version
 */
@Controller
@RequestMapping(value="/happuser")
public class AppuserController extends BaseController {
	
	String menuUrl = "happuser/listUsers.do"; //菜单地址(权限用)
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="tagcategoryService")
	private TagCategoryManager tagcategoryService;
	@Resource(name="diseasecategoryService")
	private DiseaseCategoryManager diseasecategoryService;
	
	
	/**去我关心的人
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goICareAbout")
	public ModelAndView goICareAbout()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> userList = this.appuserService.findUserCastUser(pd);
		String uid = pd.getString("user_id_one");
		mv.addObject("uid", uid);
		if (userList.size()>0 && userList != null) {
			pd.put("userList", userList);
			pd.put("msg", "你可以查看关心的人");
		}else{
			pd.put("msg", "你还没有添加关心的人哦！");
		}
		
		mv.setViewName("system/appuser/iCareAbout");
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
				this.appuserService.deleteRelationUser(pd);
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
		
		List<PageData> userList = this.appuserService.findLike(pd);
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
			PageData pds = this.appuserService.findConnectionWhether(pd);
			if (pds != null && pds.size()>0) {
				msg = "existence";
			}else{
				pd.put("useranduser_id", this.get32UUID());
				pd.put("connection", connection);
				try {
					logger.debug("保存用户关系");
					this.appuserService.saveRelationUser(pd);
					msg = "success";
				} catch (Exception e) {
					msg = "no";
				}
			}
			
			
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
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
		List<PageData> tagList = this.appuserService.findTagsById(pd);
		if(tagList.size()>0 && tagList !=null){
			map.put("tagList", tagList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 根据用户ID 获取既个人疾病信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findPersonalDiseasesById/{id}")
	@ResponseBody
	public Object findPersonalDiseasesById(@PathVariable String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		logger.debug("用户的ID为:" + id);
		pd.put("user_id", id);
		List<PageData> pdiseaseList = this.appuserService.findPersonalDiseasesById(pd);
		if(pdiseaseList.size()>0 && pdiseaseList !=null){
			map.put("pdiseaseList", pdiseaseList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 根据用户ID 获取关注疾病信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findFocusDiseasesById/{id}")
	@ResponseBody
	public Object findFocusDiseasesById(@PathVariable String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		logger.debug("用户的ID为:" + id);
		pd.put("user_id", id);
		List<PageData> fdiseaseList = this.appuserService.findFocusDiseasesById(pd);
		if(fdiseaseList.size()>0 && fdiseaseList !=null){
			map.put("fdiseaseList", fdiseaseList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 根据用户ID 获取遗传疾病信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findFamilyDiseasesById/{id}")
	@ResponseBody
	public Object findFamilyDiseasesById(@PathVariable String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		logger.debug("用户的ID为:" + id);
		pd.put("user_id", id);
		List<PageData> fhdiseaseList = this.appuserService.findFamilyDiseasesById(pd);
		if(fhdiseaseList.size()>0 && fhdiseaseList !=null){
			map.put("fhdiseaseList", fhdiseaseList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**显示用户列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listUsers")
	public ModelAndView listUsers(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String keywords = pd.getString("keywords");							//检索条件 关键词
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
			page.setPd(pd);
			List<PageData>	userList = appuserService.listPdPageUser(page);		//列出会员列表
			pd.put("ROLE_ID", "2");
			List<Role> roleList = roleService.listAllRolesByPId(pd);			//列出会员组角色
			mv.setViewName("system/appuser/appuser_list");
			mv.addObject("userList", userList);
			mv.addObject("roleList", roleList);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAddU")
	public ModelAndView goAddU(Model model) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ROLE_ID", "2");
		List<Role> roleList = roleService.listAllRolesByPId(pd);			//列出会员组角色
		
		/**
		 * 需求： 当用户点击新增按钮时，跳转到新增页面并获取所有的标签分类下的标签信息
		 */
		try{
			//加载疾病信息
			JSONArray diseasearr = JSONArray.fromObject(this.diseasecategoryService.findAllDiseases());
			String diseaseJson = diseasearr.toString();
			logBefore(logger, diseaseJson+"列表DiseaseCategory=======");
			diseaseJson = diseaseJson.replaceAll("DISEASE_ID", "id").replaceAll("DISEASECATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("diseases", "nodes");
			model.addAttribute("zTreeNodess", diseaseJson);
			
			//加载遗传疾病信息
			JSONArray ind = JSONArray.fromObject(this.diseasecategoryService.findAllIsInheritabl());
			String indiseaseJson = ind.toString();
			logBefore(logger, indiseaseJson+"列表DiseaseCategory=======");
			indiseaseJson = indiseaseJson.replaceAll("DISEASE_ID", "id").replaceAll("DISEASECATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("diseasess", "nodes");
			model.addAttribute("ins", indiseaseJson);
			
			//加载标签信息
			List<TagCategory> list = this.tagcategoryService.findTagsList();
			String json = JSONArray.fromObject(list).toString();
			json = json.replaceAll("TAG_ID", "id").replaceAll("TAGCATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("tags", "nodes");
			model.addAttribute("zTreeNodes", json);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		mv.setViewName("system/appuser/appuser_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"新增会员");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//生成 用户信息的ID
		//String user_id = this.get32UUID();
		
		//获取前段页面传入的多个标签的ID 并按,拆分
		//String tagIds = pd.getString("tagIds");
		
		/*if(tagIds != null && !"".equals(tagIds)){
			logger.debug("多个标签的ID为："+tagIds);
			//按,进行拆分  保存数据到数据库中
			String[] tags = StringUtil.StrList(tagIds);
			for (int i = 0; i < tags.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("tag_id", tags[i]);
				pd.put("user_id", user_id);
				this.appuserService.saveAppUserAndTag(pd);
			}
		}
		
		//获取当前选中的个人疾病的ID
		String personalDiseaseId = pd.getString("personalDiseaseId");
		
		if(!"".equals(personalDiseaseId) && personalDiseaseId != null){
			logger.debug("多个既往疾病的ID为:" + personalDiseaseId);
			String[] Pdiseases = StringUtil.StrList(personalDiseaseId);
			for (int i = 0; i < Pdiseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("user_id", user_id);
				pd.put("disease_id", Pdiseases[i]);
				this.appuserService.saveAppUserAndPersonal(pd);
			}
		}
		
		//获取当前选中的关注疾病的ID
		String focusDiseaseId = pd.getString("focusDiseaseId");
		
		if(!"".equals(focusDiseaseId) && focusDiseaseId != null){
			logger.debug("多个家族遗传疾病的ID为:" + focusDiseaseId);
			String[] focusDiseases = StringUtil.StrList(focusDiseaseId);
			for (int i = 0; i < focusDiseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("user_id", user_id);
				pd.put("disease_id", focusDiseases[i]);
				this.appuserService.saveAppUserAndFocus(pd);
			}
		}
		
		//获取当前选中的家族遗传疾病的ID
		String familyDiseaseId = pd.getString("familyDiseaseId");
		
		if(!"".equals(familyDiseaseId) && familyDiseaseId != null){
			logger.debug("多个家族遗传疾病的ID为:" + familyDiseaseId);
			String[] fDiseases = StringUtil.StrList(familyDiseaseId);
			for (int i = 0; i < fDiseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("user_id", user_id);
				pd.put("disease_id", fDiseases[i]);
				this.appuserService.saveAppUserAndFamily(pd);
			}
		}*/
		
		pd.put("USER_ID", this.get32UUID());	//ID
		pd.put("RIGHTS", "");	
		pd.put("LAST_LOGIN", DateUtil.getTime());				//最后登录时间
		pd.put("IP", "");						//IP
		pd.put("CREATEON", DateUtil.getTime());
		if (Tools.isEmpty(pd.getString("BIRTHDAY"))) {
			pd.put("BIRTHDAY", DateUtil.getTime());
		}
		
		if(Tools.isEmpty(pd.getString("HEIGHT"))){
			pd.put("HEIGHT", 170);
		}
		
		if(Tools.isEmpty(pd.getString("WEIGHT"))){
			pd.put("WEIGHT", 50);
		}
		
		pd.put("CREATEBY", Jurisdiction.getUserId());
		pd.put("PASSWORD", MD5.md5(pd.getString("PASSWORD")));
		if(null == appuserService.findByUsername(pd)){
			appuserService.saveU(pd);			//判断新增权限
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
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
			if(appuserService.findByUsername(pd) != null){
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
			if(appuserService.findByEmail(pd) != null){
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
			if(appuserService.findByNumber(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**删除用户
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteU")
	public void deleteU(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除会员");
		PageData pd = new PageData();
		pd = this.getPageData();
		appuserService.deleteU(pd);
		
		pd.put("user_id", pd.getString("USER_ID"));
		this.appuserService.deleteTag(pd);
		this.appuserService.deletePersonal(pd);
		this.appuserService.deleteFocus(pd);
		this.appuserService.deleteFamily(pd);
		out.write("success");
		out.close();
	}
	
	/**修改用户
	 * @param out
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editU")
	public ModelAndView editU(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改会员");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("PASSWORD") != null && !"".equals(pd.getString("PASSWORD"))){
			pd.put("PASSWORD", MD5.md5(pd.getString("PASSWORD")));
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
			this.appuserService.deleteTag(pd);
			
			for (int i = 0; i < tags.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("tag_id", tags[i]);
				//新增关系
				this.appuserService.saveAppUserAndTag(pd);
			}
		}
		
		//获取当前选中的个人疾病的ID
		String personalDiseaseId = pd.getString("personalDiseaseId");
		logger.debug(personalDiseaseId);
		//拆分
		if (personalDiseaseId != null && !"".equals(personalDiseaseId)) {
			//拆分
			String[] PDiseases = StringUtil.StrList(personalDiseaseId);
			//删除所有跟此用户有关系的的个人疾病信息
			this.appuserService.deletePersonal(pd);
			for (int i = 0; i < PDiseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("disease_id", PDiseases[i]);
				this.appuserService.saveAppUserAndPersonal(pd);
			}
		}
		
		//获取当前选中的关注疾病的ID
		String focusDiseaseId = pd.getString("focusDiseaseId");
		logger.debug(focusDiseaseId);
		//拆分
		if (focusDiseaseId != null && !"".equals(focusDiseaseId)) {
			//拆分
			String[] FDiseases = StringUtil.StrList(focusDiseaseId);
			//删除所有跟此用户有关系的的关注疾病信息
			this.appuserService.deleteFocus(pd);
			for (int i = 0; i < FDiseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("disease_id", FDiseases[i]);
				this.appuserService.saveAppUserAndFocus(pd);
			}
		}
		
		//获取当前选中的遗传疾病ID
		String familyDiseaseId = pd.getString("familyDiseaseId");
		logger.debug(familyDiseaseId);
		//拆分
		if (familyDiseaseId != null && !"".equals(familyDiseaseId)) {
			//拆分
			String[] FHDiseases = StringUtil.StrList(familyDiseaseId);
			//删除所有跟此用户有关系的的遗传疾病信息
			this.appuserService.deleteFamily(pd);
			for (int i = 0; i < FHDiseases.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("disease_id", FHDiseases[i]);
				this.appuserService.saveAppUserAndFamily(pd);
			}
		}
		
		appuserService.editU(pd);
		//qchzhu: hook analysis interface
		Transfer transfer = new Transfer();
		transfer.transferUserTags(user_id);
		transfer.transferUserDiseases(user_id);
		//end hook analysis interface
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改用户页面
	 * @return
	 */
	@RequestMapping(value="/goEditU")
	public ModelAndView goEditU(Model model){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("ROLE_ID", "2");
			List<Role> roleList = roleService.listAllRolesByPId(pd);//列出会员组角色
			
			/**
			 * 需求： 当用户点击新增按钮时，跳转到新增页面并获取所有的标签分类下的标签信息
			 */
			
			//加载疾病信息
			JSONArray diseasearr = JSONArray.fromObject(this.diseasecategoryService.findAllDiseases());
			String diseaseJson = diseasearr.toString();
			logBefore(logger, diseaseJson+"列表DiseaseCategory=======");
			diseaseJson = diseaseJson.replaceAll("DISEASE_ID", "id").replaceAll("DISEASECATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("diseases", "nodes");
			model.addAttribute("zTreeNodess", diseaseJson);
			
			//加载遗传疾病信息
			JSONArray ind = JSONArray.fromObject(this.diseasecategoryService.findAllIsInheritabl());
			String indiseaseJson = ind.toString();
			logBefore(logger, indiseaseJson+"列表DiseaseCategory=======");
			indiseaseJson = indiseaseJson.replaceAll("DISEASE_ID", "id").replaceAll("DISEASECATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("diseases", "nodes");
			model.addAttribute("ins", indiseaseJson);
			
			//加载标签信息
			List<TagCategory> list = this.tagcategoryService.findTagsList();
			String json = JSONArray.fromObject(list).toString();
			json = json.replaceAll("TAG_ID", "id").replaceAll("TAGCATEGORY_ID", "pid").replaceAll("NAME", "name").replaceAll("tags", "nodes");
			model.addAttribute("zTreeNodes", json);
			
			
			pd = appuserService.findByUiId(pd);						//根据ID读取
			mv.setViewName("system/appuser/appuser_edit");
			mv.addObject("msg", "editU");
			mv.addObject("pd", pd);
			mv.addObject("roleList", roleList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**批量删除
	 * @return
	 */
	@RequestMapping(value="/deleteAllU")
	@ResponseBody
	public Object deleteAllU() {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除会员");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String USER_IDS = pd.getString("USER_IDS");
			if(null != USER_IDS && !"".equals(USER_IDS)){
				String ArrayUSER_IDS[] = USER_IDS.split(",");
				appuserService.deleteAllU(ArrayUSER_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**导出会员信息到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, Jurisdiction.getUsername()+"导出会员资料");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){	
				String keywords = pd.getString("keywords");
				if(null != keywords && !"".equals(keywords)){
					pd.put("keywords", keywords.trim());
				}
				String lastLoginStart = pd.getString("lastLoginStart");
				String lastLoginEnd = pd.getString("lastLoginEnd");
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
				titles.add("手机号");		//4
				titles.add("身份证号");		//5
				titles.add("等级");			//6
				titles.add("邮箱");			//7
				titles.add("最近登录");		//8
				titles.add("到期时间");		//9
				titles.add("上次登录IP");	//10
				dataMap.put("titles", titles);
				List<PageData> userList = appuserService.listAllUser(pd);
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<userList.size();i++){
					PageData vpd = new PageData();
					vpd.put("var1", userList.get(i).getString("USERNAME"));		//1
					vpd.put("var2", userList.get(i).getString("NUMBER"));		//2
					vpd.put("var3", userList.get(i).getString("NAME"));			//3
					vpd.put("var4", userList.get(i).getString("PHONE"));		//4
					vpd.put("var5", userList.get(i).getString("SFID"));			//5
					vpd.put("var6", userList.get(i).getString("ROLE_NAME"));	//6
					vpd.put("var7", userList.get(i).getString("EMAIL"));		//7
					vpd.put("var8", userList.get(i).getString("LAST_LOGIN"));	//8
					vpd.put("var9", userList.get(i).getString("END_TIME"));		//9
					vpd.put("var10", userList.get(i).getString("IP"));			//10
					varList.add(vpd);
				}
				dataMap.put("varList", varList);
				ObjectExcelView erv = new ObjectExcelView();
				mv = new ModelAndView(erv,dataMap);
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
