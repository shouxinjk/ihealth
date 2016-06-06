package com.shouxin.controller.medical.medicalexamitem;

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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.exam.ExamCategory;
import com.shouxin.entity.exam.ExamItem;
import com.shouxin.util.AppUtil;
import com.shouxin.util.DateUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;

import net.sf.json.JSONArray;

import com.shouxin.util.Jurisdiction;
import com.shouxin.service.exam.examcategory.ExamCategoryManager;
import com.shouxin.service.exam.examitem.ExamItemManager;
import com.shouxin.service.medical.medicalexamitem.MedicalExamItemManager;

/** 
 * 说明：体检中心体检项目
 * 创建人：shouxin
 * 创建时间：2016-05-19
 */
@Controller
@RequestMapping(value="/medicalexamitem")
public class MedicalExamItemController extends BaseController {
	
	String menuUrl = "medicalexamitem/list.do"; //菜单地址(权限用)
	@Resource(name="medicalexamitemService")
	private MedicalExamItemManager medicalexamitemService;
	@Resource(name="examitemService")
	private ExamItemManager examitemService;
	@Resource(name="examcategoryService")
	private ExamCategoryManager examcategoryService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增MedicalExamItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String userId = Jurisdiction.getUserId();
		String medicalcenterId = medicalexamitemService.findAdminByUserId(userId);
		pd.put("MEDICALCENTER_ID", medicalcenterId);
		pd.put("MEDICALEXAMITEM_ID", this.get32UUID());	//主键
		pd.put("CREATEON", DateUtil.getTime());	//创建该记录时间
		medicalexamitemService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除MedicalExamItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalexamitemService.delete(pd);
		out.write("success");
		out.close();
	}
	
	
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改MedicalExamItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalexamitemService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**修改体检项目状态
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/auditing")
	public ModelAndView auditing() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改MedicalExamItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalexamitemService.auditing(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表MedicalExamItem");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		logBefore(logger, Jurisdiction.getUserId()+"userID_+++++++++++++++");
		pd.put("userId", Jurisdiction.getUserId());
		page.setPd(pd);
		List<PageData>	varList = medicalexamitemService.list(page);	//列出MedicalExamItem列表
		mv.setViewName("medical/medicalexamitem/medicalexamitem_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listrel")
	public ModelAndView listrel(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表MedicalExamItem");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		logBefore(logger, Jurisdiction.getUserId()+"userID_+++++++++++++++");
		pd.put("userId", Jurisdiction.getUserId());
		page.setPd(pd);
		List<PageData>	varList = medicalexamitemService.listrel(page);	//列出MedicalExamItem列表
		mv.setViewName("medical/medicalexamitem/medicalexamitemrel_list");
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
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("medical/medicalexamitem/medicalexamitem_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**
	 * 查询检查项目分类
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value="/listCategory")
	public void listExamCategory(HttpServletResponse resp) throws Exception{
		List<ExamCategory> varItemCategoryList = examcategoryService.listAllExamCategory2("0","");//查询所有检查项目分类
		JSONArray array = JSONArray.fromObject(varItemCategoryList);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(array);
		out.close();
	}
	
	/**
	 * 检查分类两级联动查询
	 * @param req
	 * @param resp
	 * @param DISEASECATEGORY_ID
	 * @throws Exception
	 */
	@RequestMapping(value="/refreshItem")
	public void refreshItem(HttpServletRequest req,HttpServletResponse resp,String ITEMCATEGORY_ID) throws Exception{
		List<PageData> item = examitemService.listItemByExamCategoryID(ITEMCATEGORY_ID);
		logBefore(logger, item+"item列表");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		req.setAttribute("item", item);
		JSONArray json = JSONArray.fromObject(item);
		logBefore(logger, json+"列表item == json");
		PrintWriter pw = null;
		pw=resp.getWriter();
		pw.print(json);
		pw.close();
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
		pd = medicalexamitemService.findById(pd);	//根据ID读取
		List<ExamCategory> varItemCategoryList = examcategoryService.listAllExamCategory2("0","");//查询所有检查项目分类
		ExamItem e = examitemService.findById(pd.getString("EXAMITEM_ID"));
		//logBefore(logger, e.toString()+"查询所有检查项目分类");
		mv.setViewName("medical/medicalexamitem/medicalexamitem_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("item",e);
		mv.addObject("varItemcate",varItemCategoryList);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除MedicalExamItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			medicalexamitemService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出MedicalExamItem到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("体检项目名称");	//1
		titles.add("体检项目说明");	//2
		titles.add("体检项目特征");	//3
		titles.add("体检项目销售价格");	//4
		titles.add("体检项目结算价格");	//5
		titles.add("体检项目logo图片url地址");	//6
		titles.add("体检项目状态");	//7
		titles.add("体检项目生效时间");	//8
		titles.add("体检项目失效时间");	//9
		titles.add("创建该记录用户id");	//10
		titles.add("创建该记录时间");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = medicalexamitemService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("DESCRIPTION"));	//2
			vpd.put("var3", varOList.get(i).getString("FEATURES"));	//3
			vpd.put("var4", varOList.get(i).get("SELLINGPRICE").toString());	//4
			vpd.put("var5", varOList.get(i).get("SETTLEMENTPRICE").toString());	//5
			vpd.put("var6", varOList.get(i).getString("LOGO"));	//6
			vpd.put("var7", varOList.get(i).getString("STATUS"));	//7
			vpd.put("var8", varOList.get(i).getString("EFFECTIVETIME"));	//8
			vpd.put("var9", varOList.get(i).getString("EXPIRETIME"));	//9
			vpd.put("var10", varOList.get(i).getString("CREATEBY"));	//10
			vpd.put("var11", varOList.get(i).getString("CREATEON"));	//11
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
