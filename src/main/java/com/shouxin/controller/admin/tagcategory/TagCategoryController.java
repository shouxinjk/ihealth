package com.shouxin.controller.admin.tagcategory;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.util.AppUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;

import net.sf.json.JSONArray;

import com.shouxin.util.Jurisdiction;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;

/** 
 * 说明：标签分类
 * 创建人：shouxin
 * 创建时间：2016-04-10
 */
@Controller
@RequestMapping(value="/tagcategory")
public class TagCategoryController extends BaseController {
	
	String menuUrl = "tagcategory/list.do"; //菜单地址(权限用)
	@Resource(name="tagcategoryService")
	private TagCategoryManager tagcategoryService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增TagCategory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TAGCATEGORY_ID", this.get32UUID());	//主键
		logBefore(logger, pd.get("PARENT_ID")+"新增department");
		pd.put("CREATEBY", Jurisdiction.getUserId());
		pd.put("CREATEON", new Date());
//		pd.put("MATETYPE", "生活方式");
		pd.put("ISEXCLUSIVE", 1);
		tagcategoryService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除TagCategory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		tagcategoryService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改TagCategory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		tagcategoryService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表TagCategory");
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
		pd.put("TAGCATEGORY_ID", TAGCATEGORY_ID);					//上级ID
		logBefore(logger, pd.get("TAGCATEGORY_ID")+"列表department");
		page.setPd(pd);
		List<PageData>	varList = tagcategoryService.list(page);	//列出TagCategory列表
		mv.setViewName("admin/tagcategory/tagcategory_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("TAGCATEGORY_ID", TAGCATEGORY_ID);		
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
	@RequestMapping(value="/listAllTagCategoryTree")
	public ModelAndView listDiseaseCategory(Model model,String TAGCATEGORY_ID) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(tagcategoryService.listAllTagCategoryTree("0"));
			String json = arr.toString();
			logBefore(logger, json+"列表DiseaseCategory=======");
			json = json.replaceAll("TAGCATEGORY_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subTagCategory", "nodes").replaceAll("hasTagCategory", "checked").replaceAll("treeUrl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("TAGCATEGORY_ID",TAGCATEGORY_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("admin/tagcategory/tagcategory_ztree");
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
		mv.setViewName("admin/tagcategory/tagcategory_edit");
		mv.addObject("msg", "save");
		mv.addObject("TAGATEGGORY_ID",TAGCATEGORY_ID);
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
		String TAGCATEGORY_ID = pd.getString("TAGCATEGORY_ID");
		pd = tagcategoryService.findById(pd);	//根据ID读取
		mv.addObject("pd", pd);
		logBefore(logger, pd.get("PARENT_ID").toString()+"列表parent_id");
		pd.put("TAGCATEGORY_ID", pd.get("PARENT_ID").toString());	
		mv.addObject("pds",tagcategoryService.findById(pd));
		mv.setViewName("admin/tagcategory/tagcategory_edit");
		pd.put("TAGCATEGORY_ID", TAGCATEGORY_ID);
		logBefore(logger, pd.get("TAGCATEGORY_ID").toString()+"列表parent_id1111");
		mv.addObject("msg", "edit");
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除TagCategory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			tagcategoryService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出TagCategory到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("标签分类名称");	//1
		titles.add("特性");	//2
		titles.add("是否多选");	//3
		titles.add("用户id");	//4
		titles.add("时间");	//5
		titles.add("父级id");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = tagcategoryService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("MATETYPE"));	//2
			vpd.put("var3", varOList.get(i).get("ISEXCLUSIVE").toString());	//3
			vpd.put("var4", varOList.get(i).getString("CREATEBY"));	//4
			vpd.put("var5", varOList.get(i).getString("CREATEON"));	//5
			vpd.put("var6", varOList.get(i).getString("PARENT_ID"));	//6
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
