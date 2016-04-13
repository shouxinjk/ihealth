package com.shouxin.controller.admin.disease;

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
import com.shouxin.service.admin.disease.DiseaseManager;
import com.shouxin.service.admin.diseasecategory.DiseaseCategoryManager;

/** 
 * 说明：疾病
 * 创建人：shouxin
 * 创建时间：2016-04-07
 * 
 */
@Controller
@RequestMapping(value="/disease")
public class DiseaseController extends BaseController {
	
	String menuUrl = "disease/list.do"; //菜单地址(权限用)
	@Resource(name="diseaseService")
	private DiseaseManager diseaseService;
	@Resource(name="diseasecategoryService")
	private DiseaseCategoryManager diseasecategoryService;
	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Disease");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("DISEASE_ID", this.get32UUID());	//主键
		logBefore(logger, pd.get("DISEASECATEGORY_ID")+"疾病分类id++++++++++++");
		diseaseService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Disease");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		diseaseService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Disease");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		diseaseService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Disease");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");	
		//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String DISEASECATEGORY_ID = null == pd.get("DISEASECATEGORY_ID")?"":pd.get("DISEASECATEGORY_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			DISEASECATEGORY_ID = pd.get("id").toString();
		}
		pd.put("DISEASECATEGORY_ID", DISEASECATEGORY_ID);	
		logBefore(logger, DISEASECATEGORY_ID+"列表DiseaseCategory=======");
		page.setPd(pd);
		List<PageData>	varList = diseaseService.list(page);	//列出Disease列表
		mv.setViewName("admin/disease/disease_list");
		mv.addObject("varList", varList);
		mv.addObject("DISEASECATEGORY_ID", DISEASECATEGORY_ID);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 展示DiseaseCategory所有tree列表
	 * @param model
	 * @param DISEASECATEGORY_ID
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listAllDiseasecategory")
	public ModelAndView listDiseaseCategory(Model model,String DISEASECATEGORY_ID) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(diseasecategoryService.listSubDiseaseCategoryByParentId("0"));
			String json = arr.toString();
			logBefore(logger, json+"列表DiseaseCategory=======");
			json = json.replaceAll("DISEASECATEGORY_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDiseaseCategory", "nodes").replaceAll("hasDiseaseCategory", "checked").replaceAll("treeUrl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("DISEASECATEGORY_ID",DISEASECATEGORY_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("admin/disease/disease_ztree");
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
		String DISEASECATEGORY_ID = null == pd.get("DISEASECATEGORY_ID")?"":pd.get("DISEASECATEGORY_ID").toString();
		pd.put("DISEASECATEGORY_ID", DISEASECATEGORY_ID);	
		logBefore(logger, pd.get("DISEASECATEGORY_ID")+"标签分类TAGCATEGORY_ID===============");
		mv.addObject("pds",diseasecategoryService.findById(pd));
		mv.setViewName("admin/disease/disease_edit");
		mv.addObject("msg", "save");
		mv.addObject("DISEASECATEGORY_ID",DISEASECATEGORY_ID);
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
		pd = diseaseService.findById(pd);//根据ID读取
		mv.addObject("pd", pd);
		String DISEASECATEGORY_ID = null == pd.get("DISEASECATEGORY_ID")?"":pd.get("DISEASECATEGORY_ID").toString();
		pd.put("DISEASECATEGORY_ID", DISEASECATEGORY_ID);	
		logBefore(logger, pd.get("DISEASECATEGORY_ID")+"标签分类TAGCATEGORY111===============");
		mv.addObject("pds",diseasecategoryService.findById(pd));
		mv.addObject("DISEASECATEGORY_ID",DISEASECATEGORY_ID);
		mv.setViewName("admin/disease/disease_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Disease");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			diseaseService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Disease到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("名称");	//1
		titles.add("描述");	//2
		titles.add("是否遗传倾向");	//3
		titles.add("是否高发");	//4
		titles.add("创建记录员工id");	//5
		titles.add("创建记录时间");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = diseaseService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("DESCRIPTION"));	//2
			vpd.put("var3", varOList.get(i).get("ISINHERITABLE").toString());	//3
			vpd.put("var4", varOList.get(i).get("ISHIGHINCIDENCE").toString());	//4
			vpd.put("var5", varOList.get(i).getString("CREATEBY"));	//5
			vpd.put("var6", varOList.get(i).getString("CREATEON"));	//6
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
