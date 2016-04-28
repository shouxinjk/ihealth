package com.shouxin.controller.admin.article;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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

import com.alibaba.druid.stat.TableStat.Mode;
import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.DiseaseCategory;
import com.shouxin.entity.admin.Tag;
import com.shouxin.entity.admin.TagCategory;
import com.shouxin.util.AppUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;
import com.shouxin.util.StatusEnum;
import com.shouxin.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.shouxin.util.Jurisdiction;
import com.shouxin.service.admin.article.ArticleManager;
import com.shouxin.service.admin.diseasecategory.DiseaseCategoryManager;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;

/** 
 * 说明：文章信息管理
 * 创建人：shouxin
 * 创建时间：2016-04-13
 */
@Controller
@RequestMapping(value="/article")
public class ArticleController extends BaseController {
	
	String menuUrl = "article/list.do"; //菜单地址(权限用)
	@Resource(name="articleService")
	private ArticleManager articleService;

	@Resource(name="tagcategoryService")
	private TagCategoryManager tagcategoryService;
	
	

	@Resource(name="diseasecategoryService")
	private DiseaseCategoryManager diseasecategoryService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ARTICLE_ID", this.get32UUID());	//主键
		pd.put("PUBLISHTIME", new Date()); //发布时间
		pd.put("CREATEBY", Jurisdiction.getUserId());//当前登录用户
		pd.put("CREATEON", new Date());//改记录创建时间
		pd.put("STATUS", StatusEnum.NEW);
		articleService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 将新建的文章状态改为已发布
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editStatus")
	@ResponseBody
	public Object editStatus(@RequestBody String Status) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Article的状态信息");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		JSONObject jasonObject = JSONObject.fromObject(Status);
		
		String id = (String) jasonObject.get("id");
		if(id!=null&&!"".equals(id)){
			pd.put("ARTICLE_ID", id);
			pd = this.articleService.findById(pd);
			String status = pd.getString("STATUS");
			if (status.equals(StatusEnum.NEW.getName())||status.equals(StatusEnum.AUDITDIDNOTPASS.getName())) {
				status = StatusEnum.SUBMITTED.getName();
				pd.put("STATUS", status);
				System.out.println("---------------"+pd);
				this.articleService.edit(pd);
				msg = "success";
			}else{
				msg = "error";
			}
		}else{
			msg = "null";
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**将已提交的文章状态改为已审核
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/auditSuccess")
	@ResponseBody
	public Object auditSuccess(@RequestBody String Status) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Article的状态信息");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		JSONObject jasonObject = JSONObject.fromObject(Status);
		
		String id = (String) jasonObject.get("id");
		if(id!=null&&!"".equals(id)){
			pd.put("ARTICLE_ID", id);
			pd = this.articleService.findById(pd);
			String status = pd.getString("STATUS");
			if (status.equals(StatusEnum.SUBMITTED.getName())) {
				status = StatusEnum.THEAPPROVED.getName();
				pd.put("STATUS", status);
				System.out.println("---------------"+pd);
				this.articleService.edit(pd);
				msg = "success";
			}else{
				msg = "error";
			}
		}else{
			msg = "null";
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**将已提交的文章状态改为拒绝审核
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/auditError")
	@ResponseBody
	public Object auditError(@RequestBody String Status) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Article的状态信息");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		JSONObject jasonObject = JSONObject.fromObject(Status);
		
		String id = (String) jasonObject.get("id");
		if(id!=null&&!"".equals(id)){
			pd.put("ARTICLE_ID", id);
			pd = this.articleService.findById(pd);
			String status = pd.getString("STATUS");
			if (status.equals(StatusEnum.SUBMITTED.getName())) {
				status = StatusEnum.AUDITDIDNOTPASS.getName();
				pd.put("STATUS", status);
				System.out.println("---------------"+pd);
				this.articleService.edit(pd);
				msg = "success";
			}else{
				msg = "error";
			}
		}else{
			msg = "null";
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 将已审核的文章修改为已发布
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/published")
	@ResponseBody
	public Object published(@RequestBody String Status) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Article的状态信息");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		JSONObject jasonObject = JSONObject.fromObject(Status);
		
		String id = (String) jasonObject.get("id");
		if(id!=null&&!"".equals(id)){
			pd.put("ARTICLE_ID", id);
			pd = this.articleService.findById(pd);
			String status = pd.getString("STATUS");
			if (status.equals(StatusEnum.THEAPPROVED.getName())||status.equals(StatusEnum.CANCELTHERELEASE.getName())) {
				status = StatusEnum.PUBLISH.getName();
				pd.put("STATUS", status);
				System.out.println("---------------"+pd);
				this.articleService.edit(pd);
				msg = "success";
			}else{
				msg = "error";
			}
		}else{
			msg = "null";
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 将已发布改为取消发布
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/cancelPublished")
	@ResponseBody
	public Object cancelPublished(@RequestBody String Status) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Article的状态信息");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		
		JSONObject jasonObject = JSONObject.fromObject(Status);
		
		String id = (String) jasonObject.get("id");
		if(id!=null&&!"".equals(id)){
			pd.put("ARTICLE_ID", id);
			pd = this.articleService.findById(pd);
			String status = pd.getString("STATUS");
			if (status.equals(StatusEnum.PUBLISH.getName())) {
				status = StatusEnum.CANCELTHERELEASE.getName();
				pd.put("STATUS", status);
				System.out.println("---------------"+pd);
				this.articleService.edit(pd);
				msg = "success";
			}else{
				msg = "error";
			}
		}else{
			msg = "null";
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		articleService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String articleId = pd.getString("ARTICLE_ID");
		String status = pd.getString("STATUS");
		if (status=="" || status == null) {
			status = StatusEnum.NEW.getName();
		}
		//获取前段页面传入的多个标签的ID 并按,拆分
		String tagIds = pd.getString("tagIds");
		logger.debug(tagIds);
		if (tagIds != null && !"".equals(tagIds)) {
			//拆分
			String[] tags = StringUtil.StrList(tagIds);
			//根据传入的文章ID 删除所有跟此文章有关系的的数据
			pd.put("article_id", articleId);
			//删除
			this.articleService.deleteTags(pd);
			for (int i = 0; i < tags.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("tag_id", tags[i]);
				//新增关系
				this.articleService.saveTagAndArticle(pd);
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
			//根据传入的文章ID 删除所有跟此文章有关系的的数据
			pd.put("article_id", articleId);			
			this.articleService.deleteDiseases(pd);
			for (int i = 0; i < diseases.length; i++) {
				pd.put("diseaseandarticle_id", this.get32UUID());
				pd.put("disease_id", diseases[i]);
				this.articleService.saveDiseaseAndArticle(pd);
			}
		}
		
		pd.put("PUBLISHTIME", new Date()); //发布时间
		articleService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Article");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = articleService.list(page);	//列出Article列表
		mv.setViewName("admin/article/article_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**文章审核页面
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/auditList")
	public ModelAndView auditList(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Article");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = articleService.list(page);	//列出Article列表
		mv.setViewName("admin/article/article_audit");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	/**文章发布页面
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/articleRelease")
	public ModelAndView articleRelease(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Article");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = articleService.list(page);	//列出Article列表
		mv.setViewName("admin/article/article_published");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(Model model,String TAGATEGORY_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
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
		mv.setViewName("admin/article/article_edit");
		mv.addObject("msg", "saveRelations");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**
	 * 根据文章ID 获取标签信息
	 */
	@RequestMapping(value="findTagsById/{id}")
	@ResponseBody
	public Object findTagsById(@PathVariable String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		logger.debug("文章的ID为:" + id);
		pd.put("article_id", id);
		List<PageData> tagList = this.articleService.findTagsByArticleId(pd);
		if(tagList.size()>0 && tagList !=null){
			map.put("tagList", tagList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 根据文章ID 获取疾病信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findDiseasesById/{id}")
	@ResponseBody
	public Object findDiseasesById(@PathVariable String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		logger.debug("文章的ID为:" + id);
		pd.put("article_id", id);
		List<PageData> diseaseList = this.articleService.findDiseaseByArticleId(pd);
		if(diseaseList.size()>0 && diseaseList !=null){
			map.put("diseaseList", diseaseList);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(Model model)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
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
		
		pd = articleService.findById(pd);	//根据ID读取
		mv.setViewName("admin/article/article_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			articleService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Article到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("标题");	//1
		titles.add("作者");	//2
		titles.add("照片url");	//3
		titles.add("内容url");	//4
		titles.add("摘要");	//5
		titles.add("发布时间");	//6
		titles.add("创建记录员工id");	//7
		titles.add("创建记录时间");	//8
		dataMap.put("titles", titles);
		List<PageData> varOList = articleService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE"));	//1
			vpd.put("var2", varOList.get(i).getString("AUTHOR"));	//2
			vpd.put("var3", varOList.get(i).getString("LOGOURL"));	//3
			vpd.put("var4", varOList.get(i).getString("URL"));	//4
			vpd.put("var5", varOList.get(i).getString("SUMMARY"));	//5
			vpd.put("var6", varOList.get(i).getString("PUBLISHTIME"));	//6
			vpd.put("var7", varOList.get(i).getString("CREATEBY"));	//7
			vpd.put("var8", varOList.get(i).getString("CREATEON"));	//8
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	//新增文章时，添加标签和疾病信息跟 文章的关系
	@RequestMapping(value="/saveRelations",method = RequestMethod.POST)
	public ModelAndView saveRelations() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//生成 新增文章信息的ID
		String articleId = this.get32UUID();
		
		//获取前段页面传入的多个标签的ID 并按,拆分
		String tagIds = pd.getString("tagIds");
		if(tagIds != null && !"".equals(tagIds)){
			logger.debug("多个标签的ID为："+tagIds);
			//按,进行拆分  保存数据到数据库中
			String[] tags = StringUtil.StrList(tagIds);
			for (int i = 0; i < tags.length; i++) {
				pd.put("id", this.get32UUID());
				pd.put("tag_id", tags[i]);
				pd.put("article_id", articleId);
				this.articleService.saveTagAndArticle(pd);
			}
		}
		
		//获取当前选中的疾病的ID
		String diseaseId = pd.getString("diseaseId");
		if(!"".equals(diseaseId) && diseaseId != null){
			logger.debug("多个疾病的ID为:" + diseaseId);
			String[] diseases = StringUtil.StrList(diseaseId);
			for (int i = 0; i < diseases.length; i++) {
				pd.put("diseaseandarticle_id", this.get32UUID());
				pd.put("article_id", articleId);
				pd.put("disease_id", diseases[i]);
				this.articleService.saveDiseaseAndArticle(pd);
			}
		}
		
		pd.put("ARTICLE_ID", articleId);	//主键
		pd.put("PUBLISHTIME", new Date()); //发布时间
		pd.put("CREATEBY", Jurisdiction.getUserId());//当前登录用户
		pd.put("CREATEON", new Date());//改记录创建时间
		pd.put("STATUS", StatusEnum.NEW.getName()); //设置新增的文章状态  为  新增
		articleService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
