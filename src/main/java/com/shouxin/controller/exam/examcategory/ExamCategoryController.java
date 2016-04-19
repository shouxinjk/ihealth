package com.shouxin.controller.exam.examcategory;

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
import com.shouxin.service.exam.examcategory.ExamCategoryManager;

/** 
 * 说明：医学检查分类
 * 创建人：shouxin
 * 创建时间：2016-04-12
 */
@Controller
@RequestMapping(value="/examcategory")
public class ExamCategoryController extends BaseController {
	
	String menuUrl = "examcategory/list.do"; //菜单地址(权限用)
	@Resource(name="examcategoryService")
	private ExamCategoryManager examcategoryService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ExamCategory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EXAMCATEGORY_ID", this.get32UUID());	//主键
		examcategoryService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除ExamCategory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		examcategoryService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ExamCategory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		examcategoryService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表ExamCategory");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String EXAMCATEGORY_ID = null == pd.get("EXAMCATEGORY_ID")?"":pd.get("EXAMCATEGORY_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			EXAMCATEGORY_ID = pd.get("id").toString();
		}
		pd.put("EXAMCATEGORY_ID", EXAMCATEGORY_ID);					//上级ID
		logBefore(logger, pd.get("EXAMCATEGORY_ID")+"列表EXAMCATEGORY_ID");
		page.setPd(pd);
		List<PageData>	varList = examcategoryService.list(page);	//列出ExamCategory列表
		mv.setViewName("exam/examcategory/examcategory_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("EXAMCATEGORY_ID",EXAMCATEGORY_ID);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 显示列表ztree
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listAllExamCategory")
	public ModelAndView listAllDepartment(Model model,String EXAMCATEGORY_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(examcategoryService.listAllExamCategory("0"));
			String json = arr.toString();
			logBefore(logger, json+"列表depa=======");
			json = json.replaceAll("EXAMCATEGORY_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subExamCategory", "nodes").replaceAll("hasExamCategory", "checked").replaceAll("treeUrl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("EXAMCATEGORY_ID",EXAMCATEGORY_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("exam/examcategory/examcategory_ztree");
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
		String EXAMCATEGORY_ID = null == pd.get("EXAMCATEGORY_ID")?"":pd.get("EXAMCATEGORY_ID").toString();
		pd.put("EXAMCATEGORY_ID", EXAMCATEGORY_ID);					//上级ID
		logBefore(logger, pd.get("EXAMCATEGORY_ID")+"列表id");
		logBefore(logger, examcategoryService.findById(pd)+"列表id examcategory");
		mv.addObject("pds",examcategoryService.findById(pd));		//传入上级所有信息
		mv.addObject("EXAMCATEGORY_ID", EXAMCATEGORY_ID);
		mv.setViewName("exam/examcategory/examcategory_edit");
		mv.addObject("msg", "save");
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
		String EXAMCATEGORY_ID = pd.getString("EXAMCATEGORY_ID");
		pd = examcategoryService.findById(pd);	//根据ID读取
		mv.addObject("pd", pd);
		pd.put("EXAMCATEGORY_ID",pd.get("PARENT_ID").toString());			//用作上级信息
		mv.addObject("pds",examcategoryService.findById(pd));	
		pd.put("EXAMCATEGORY_ID", EXAMCATEGORY_ID);
		mv.setViewName("exam/examcategory/examcategory_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ExamCategory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			examcategoryService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出ExamCategory到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("检查项目分类名称");	//1
		titles.add("描述");	//2
		titles.add("创建该记录员工id");	//3
		titles.add("创建该记录时间");	//4
		titles.add("父级id");	//5
		dataMap.put("titles", titles);
		List<PageData> varOList = examcategoryService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("DESCRIPTION"));	//2
			vpd.put("var3", varOList.get(i).getString("CREATEBY"));	//3
			vpd.put("var4", varOList.get(i).getString("CREATEON"));	//4
			vpd.put("var5", varOList.get(i).getString("PARENT_ID"));	//5
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
