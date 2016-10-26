package com.shouxin.controller.subhealth.subhealth;

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
import com.shouxin.entity.subhealth.SubhealthCategory;
import com.shouxin.util.AppUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;

import net.sf.json.JSONArray;

import com.shouxin.util.Jurisdiction;
import com.shouxin.service.subhealth.subhealth.SubhealthManager;
import com.shouxin.service.subhealth.subhealthcategory.SubhealthcategoryManager;

/** 
 * 说明：亚健康症状
 * 创建人：shouxin
 * 创建时间：2016-08-09
 */
@Controller
@RequestMapping(value="/subhealth")
public class SubhealthController extends BaseController {
	
	String menuUrl = "subhealth/list.do"; //菜单地址(权限用)
	@Resource(name="subhealthService")
	private SubhealthManager subhealthService;
	@Resource(name="subhealthcategoryService")
	private SubhealthcategoryManager subhealthcategoryService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Subhealth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SUBHEALTH_ID", this.get32UUID());	//主键
		pd.put("CREATEBY", "");	//创建该记录用户
		pd.put("CREATEON", "");	//创建该记录时间
		subhealthService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Subhealth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		subhealthService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Subhealth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		subhealthService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Subhealth");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String SUBHEALTHCATEGORY_ID = null == pd.get("SUBHEALTHCATEGORY_ID")?"":pd.get("SUBHEALTHCATEGORY_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			SUBHEALTHCATEGORY_ID = pd.get("id").toString();
		}
		pd.put("SUBHEALTHCATEGORY_ID", SUBHEALTHCATEGORY_ID);
		page.setPd(pd);
		List<PageData>	varList = subhealthService.list(page);	//列出Subhealth列表
		List<PageData>	varListCategory = subhealthService.subhealthcategory(page);//获取亚健康分类名称和ID
		mv.addObject("varListCategory",varListCategory);
		List<PageData>	varListSubhealth = subhealthService.listsubhealth(page);//获取所有名称和ID
		mv.addObject("varListSubhealth",varListSubhealth);
		mv.setViewName("subhealth/subhealth/subhealth_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("SUBHEALTHCATEGORY_ID", SUBHEALTHCATEGORY_ID);
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
	@RequestMapping(value="/listAllSubhealthCategory")
	public ModelAndView listDiseaseCategory(Model model,String SUBHEALTHCATEGORY_ID) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(subhealthcategoryService.listSubhealthCategoryby("0"));
			String json = arr.toString();
			logBefore(logger, json+"列表DiseaseCategory=======");
			json = json.replaceAll("SUBHEALTHCATEGORY_ID", "id").replaceAll("PARENTID", "pId").replaceAll("NAME", "name").replaceAll("subhealthCategorys", "nodes").replaceAll("hasSubhealthCategory", "checked").replaceAll("treeUrl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("SUBHEALTHCATEGORY_ID",SUBHEALTHCATEGORY_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("subhealth/subhealth/subhealth_ztree");
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
	public ModelAndView goAdd(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		logBefore(logger, "SUBHEALTHCATEGORY_ID+++++++++++=="+pd.getString("SUBHEALTHCATEGORY_ID"));
		PageData pds = this.subhealthcategoryService.findById(pd);
		List<PageData>	varList = subhealthService.subhealthcategory(page);//获取亚健康分类名称和ID
		mv.addObject("varList",varList);
		List<PageData>	varListSubhealth = subhealthService.listsubhealth(page);//获取所有名称和ID
		mv.addObject("varListSubhealth",varListSubhealth);
		mv.setViewName("subhealth/subhealth/subhealth_edit");
		mv.addObject("msg", "save");
		mv.addObject("pds",pds);
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = subhealthService.findById(pd);	//根据ID读取
		PageData pds = this.subhealthcategoryService.findById(pd);
		List<PageData>	varList = subhealthService.subhealthcategory(page);//获取亚健康分类名称和ID
		mv.addObject("varList",varList);
		List<PageData>	varListSubhealth = subhealthService.listsubhealth(page);//获取所有名称和ID
		mv.addObject("varListSubhealth",varListSubhealth);
		mv.setViewName("subhealth/subhealth/subhealth_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("pds",pds);
		return mv;
	}	
	
	/**
	 * 亚健康分类两级联动查询
	 * @param req
	 * @param resp
	 * @param SUBHEALTHCATEGORY_ID
	 * @throws Exception
	 */
	
	@RequestMapping(value="/refreshSubhealth")
	public void refreshSubhealth(HttpServletRequest req,HttpServletResponse resp,String SUBHEALTHCATEGORY_ID) throws Exception{
		List<SubhealthCategory> subhealth = subhealthService.findAllCategoryIdSubhealth(SUBHEALTHCATEGORY_ID);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		req.setAttribute("subhealth", subhealth);
		JSONArray json = JSONArray.fromObject(subhealth);
		logBefore(logger, json+"列表subhealth == json");
		PrintWriter pw = null;
		pw=resp.getWriter();
		pw.print(json);
		pw.close();
	}
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Subhealth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			subhealthService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Subhealth到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("编号");	//1
		titles.add("名称");	//2
		titles.add("描述");	//3
		titles.add("是否为按钮");	//4
		titles.add("亚健康分类id");	//5
		titles.add("附加表达式");	//6
		titles.add("创建该记录用户");	//7
		titles.add("创建该记录时间");	//8
		dataMap.put("titles", titles);
		List<PageData> varOList = subhealthService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("SUBHEALTH_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("NAME"));	//2
			vpd.put("var3", varOList.get(i).getString("DESCRIPTION"));	//3
			vpd.put("var4", varOList.get(i).get("ISALABLE").toString());	//4
			vpd.put("var5", varOList.get(i).getString("SUBHEALTHCATEGORY_ID"));	//5
			vpd.put("var6", varOList.get(i).getString("EXPRESSION"));	//6
			vpd.put("var7", varOList.get(i).getString("CREATEBY"));	//7
			vpd.put("var8", varOList.get(i).getString("CREATEON"));	//8
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
