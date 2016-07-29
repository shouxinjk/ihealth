package com.shouxin.controller.admin.tag;

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

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Tag;
import com.shouxin.util.AppUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;

import net.sf.json.JSONArray;

import com.shouxin.util.Jurisdiction;
import com.shouxin.service.admin.tag.TagManager;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;
import com.shouxin.service.admin.tagcategory.impl.TagCategoryService;

/** 
 * 说明：标签信息
 * 创建人：shouxin
 * 创建时间：2016-04-10
 */
@Controller
@RequestMapping(value="/tag")
public class TagController extends BaseController {
	
	String menuUrl = "tag/list.do"; //菜单地址(权限用)
	@Resource(name="tagService")
	private TagManager tagService;
	@Resource(name="tagcategoryService")
	private TagCategoryManager tagcategoryService;
	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Tag");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TAG_ID", this.get32UUID());	//主键
		pd.put("CREATEBY", Jurisdiction.getUserId());
		pd.put("CREATEON", new Date());
		logBefore(logger, pd+"新增Tag+++++++");
		String name = pd.getString("NAME");
		Tag tag =  this.tagService.findTagByName(name);
		if(tag==null){
			tagService.save(pd);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 判断输入的标签是否存在
	 * @throws Exception
	 */
	@RequestMapping(value="/tagIsNull")
	public void tagIsNull(HttpServletRequest req ,HttpServletResponse resp) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Tag");
		String name = req.getParameter("name");
		Tag tag =  this.tagService.findTagByName(name);
		String isNull = "";
		if(tag==null){
			isNull = "yes";
		}else{
			isNull = "no";
		}
		PrintWriter pw = resp.getWriter();
		pw.print(isNull);
		pw.close();
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Tag");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		tagService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Tag");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		tagService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page,HttpServletResponse res) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Tag");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String TAGCATEGORY_ID = null == pd.get("TAGCATEGORY_ID")?"":pd.get("TAGCATEGORY_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			TAGCATEGORY_ID = pd.get("id").toString();
		}
		pd.put("TAGCATEGORY_ID", TAGCATEGORY_ID);
		logBefore(logger, pd.get("TAGCATEGORY_ID")+"列表DiseaseCategory=======");
		page.setPd(pd);
		List<PageData>	varList = tagService.list(page);	//列出Tag列表
		mv.setViewName("admin/tag/tag_list");
		mv.addObject("varList", varList);
		mv.addObject("TAGCATEGORY_ID", TAGCATEGORY_ID);		
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/***
	 * 显示所有tagCategory tree
	 * @param model
	 * @param TAGATEGORY_ID
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listAllTagCategory")
	public ModelAndView listDiseaseCategory(Model model,String TAGCATEGORY_ID) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(tagcategoryService.listAllTagCategory("0"));
			String json = arr.toString();
			logBefore(logger, json+"列表DiseaseCategory=======");
			json = json.replaceAll("TAGCATEGORY_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subTagCategory", "nodes").replaceAll("hasTagCategory", "checked").replaceAll("treeUrl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("TAGCATEGORY_ID",TAGCATEGORY_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("admin/tag/tag_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String TAGCATEGORY_ID = null == pd.get("TAGCATEGORY_ID")?"":pd.get("TAGCATEGORY_ID").toString();
		pd.put("TAGCATEGORY_ID", TAGCATEGORY_ID);	
		logBefore(logger, pd.get("TAGCATEGORY_ID")+"标签分类TAGCATEGORY_ID===============");
		mv.addObject("pds",tagcategoryService.findById(pd));
		mv.setViewName("admin/tag/tag_edit");
		mv.addObject("msg", "save");
		mv.addObject("TAGCATEGORY_ID",TAGCATEGORY_ID);

		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String TAGCATEGORY_ID = null == pd.get("TAGCATEGORY_ID")?"":pd.get("TAGCATEGORY_ID").toString();
		pd.put("TAGCATEGORY_ID", TAGCATEGORY_ID);	
		logBefore(logger, pd.get("TAGCATEGORY_ID")+"标签分类TAGCATEGORY111===============");
		logBefore(logger, tagcategoryService.findById(pd)+"标签分类TAGCATEGORY===============");
		mv.addObject("pds",tagcategoryService.findById(pd));
		mv.setViewName("admin/tag/tag_edit");
		mv.addObject("msg", "edit");
		pd = tagService.findById(pd);	//根据ID读取
		mv.addObject("TAGCATEGORY_ID",TAGCATEGORY_ID);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Tag");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			tagService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Tag到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("名称");	//1
		titles.add("表达式");	//2
		titles.add("用户id");	//3
		titles.add("时间");	//4
		dataMap.put("titles", titles);
		List<PageData> varOList = tagService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("EXPRESSION"));	//2
			vpd.put("var3", varOList.get(i).getString("CREATEBY"));	//3
			vpd.put("var4", varOList.get(i).getString("CREATEON"));	//4
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
