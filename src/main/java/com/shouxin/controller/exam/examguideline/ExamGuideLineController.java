package com.shouxin.controller.exam.examguideline;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Disease;
import com.shouxin.entity.admin.DiseaseCategory;
import com.shouxin.entity.exam.ExamCategory;
import com.shouxin.entity.exam.ExamItem;
import com.shouxin.util.AppUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;
import com.shouxin.util.StatusEnum;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.shouxin.util.Jurisdiction;
import com.shouxin.service.admin.disease.DiseaseManager;
import com.shouxin.service.admin.diseasecategory.DiseaseCategoryManager;
import com.shouxin.service.exam.examcategory.ExamCategoryManager;
import com.shouxin.service.exam.examfrequency.ExamFrequencyManager;
import com.shouxin.service.exam.examguideline.ExamGuideLineManager;
import com.shouxin.service.exam.examitem.ExamItemManager;
import com.shouxin.service.exam.examsolution.ExamSolutionManager;

/** 
 * 说明：医学体检指南
 * 创建人：shouxin
 * 创建时间：2016-04-07
 */
@Controller
@RequestMapping(value="/examguideline")
public class ExamGuideLineController extends BaseController {
	
	String menuUrl = "examguideline/list.do"; //菜单地址(权限用)
	@Resource(name="examguidelineService")
	private ExamGuideLineManager examguidelineService;
	@Resource(name="diseaseService")
	private DiseaseManager diseaseService;
	@Resource(name="diseasecategoryService")
	private DiseaseCategoryManager diseasecategoryService;
	@Resource(name="examsolutionService")
	private ExamSolutionManager examsolutionService;
	@Resource(name="examfrequencyService")
	private ExamFrequencyManager examfrequencyService;
	@Resource(name="examcategoryService")
	private ExamCategoryManager examcategoryService;
	@Resource(name="examitemService")
	private ExamItemManager examitemService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(String NAME) throws Exception{
		logBefore(logger,NAME+"新增ExamGuideLine");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EXAMGUIDELINE_ID", this.get32UUID());	//主键
		examguidelineService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除ExamGuideLine");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		examguidelineService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改状态
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/auditing")
	public void auditing(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"审核ExamGuideLine");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		examguidelineService.auditing(pd);
		out.write("success");
		out.close();
	}
	
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ExamGuideLine");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//logBefore(logger, pd.get("DISEASE_ID").toString()+"修改table");
		examguidelineService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**指南规则修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editRule")
	public ModelAndView editRule() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ExamGuideLine");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		examguidelineService.editRule(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表ExamGuideLine");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = examguidelineService.list(page);	//列出ExamGuideLine列表
		logBefore(logger,StatusEnum.getNameByIndex(1)+"enum+++++++++++");
		mv.setViewName("exam/examguideline/examguideline_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**指南规则列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listRule")
	public ModelAndView listRule(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表ExamGuideLine");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		System.out.println(page.isEntityOrField()+"=======");
		List<PageData>	varList = examguidelineService.list(page);	//列出ExamGuideLine列表
		mv.setViewName("exam/examguideline/examguidelinerule_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**指南发布列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listRelease")
	public ModelAndView listRelease(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表ExamGuideLine");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		System.out.println(page.isEntityOrField()+"=======");
		List<PageData>	varList = examguidelineService.listRelease(page);	//列出ExamGuideLine列表
		mv.setViewName("exam/examguidelinerel/examguidelinerel_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**指南审核列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listVerify")
	public ModelAndView listVerify(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表ExamGuideLine");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = examguidelineService.listVerfiy(page);	//列出ExamGuideLine列表
		mv.setViewName("exam/examguidelineverify/examguidelineverify_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**指南运维审核列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listRelVerify")
	public ModelAndView listRelVerify(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表ExamGuideLine");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = examguidelineService.listRelVerfiy(page);	//列出ExamGuideLine列表
		mv.setViewName("exam/examguidelinerelverify/examguidelinerelverify_list");
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
		List<PageData> pds = diseasecategoryService.listAll(pd);//查询出所有的疾分类
		List<PageData> varDisList = diseaseService.listAll(pd);//查询出所有疾病
		List<PageData> varSouAndItem = examsolutionService.listAllExamSolutionAndExamItem(pd);//查询所有的检查手段
		List<PageData> varFreqList = examfrequencyService.listAll(pd);//查询所有 的检查频率
		List<PageData> varSouList = examsolutionService.listExamSolutionByExamGuidelineID(pd.getString("EXAMGUIDELINE_ID"));//查询属于这个指南的检查手段
		mv.setViewName("exam/examguideline/examguideline_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("pds",pds);
		mv.addObject("varDisList",varDisList);
		mv.addObject("varItemList",varSouAndItem);
		mv.addObject("varFreqList",varFreqList);
		mv.addObject("varSouList",varSouList);
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
		logBefore(logger, pd.get("EXAMGUIDELINE_ID")+"列表EXAM  ==== exanmmID");
		pd = this.getPageData();
		pd = examguidelineService.findById(pd);	//根据ID读取
		logBefore(logger, pd+"列表EXAM  ==== exanmm");
		List<PageData> pds = diseasecategoryService.listAll(pd);//查询出所有的疾分类
		List<PageData> varDisList = diseaseService.listAll(pd);//查询出所有疾病
		List<ExamCategory> varItemCategoryList = examcategoryService.listAllExamCategory("0");//查询所有检查项目分类
		logBefore(logger, varItemCategoryList+"查询所有检查项目分类");
		List<PageData> varSouAndItem = examsolutionService.listAllExamSolutionAndExamItem(pd);//查询所有的检查手段
		List<PageData> varFreqList = examfrequencyService.listAll(pd);//查询所有检查频率
		List<PageData> varSouList = examsolutionService.listExamSolutionByExamGuidelineID(pd.get("EXAMGUIDELINE_ID").toString());
		//logBefore(logger, pds.get(1).get("DISEASECATEGORY_ID")+"列表EXAM  ==== DISEASE");
		logBefore(logger, varSouList+"列表EXAM  ==== DISEASE_ID");
		mv.setViewName("exam/examguideline/examguideline_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("pds",pds);
		mv.addObject("varDisList",varDisList);
		mv.addObject("varItemCategoryList",varItemCategoryList);
		mv.addObject("varSouList",varSouList);
		mv.addObject("varItemList",varSouAndItem);
		mv.addObject("varFreqList",varFreqList);
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
	
	@RequestMapping(value="/listDisease")
	public void listDiseaseCategory(HttpServletResponse resp) throws Exception{
		List<DiseaseCategory> varDisease = diseasecategoryService.listAllDiseaseByTree2("0","");//查询所有检查项目分类
		JSONArray array2 = JSONArray.fromObject(varDisease);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(array2);
		out.close();
	}
	
	/**
	 * 新增检查指南手段
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value="/addSou")
	public void addSou(HttpServletResponse resp) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		logBefore(logger, pd.get("FEATURES")+"FEATURES+++++++++++++++++++");
		pd.put("EXAMSOLUTION_ID", this.get32UUID());	//主键
		if(pd.get("STARTAGE").equals("")){
			pd.put("STARTAGE", 0);
		}
		System.out.println(pd.getString("SUBGROUP")+"+++++++++++++++++++++++");
		examsolutionService.save(pd);
		List<PageData> varSouList = examsolutionService.listExamSolutionByExamGuidelineID(pd.get("EXAMGUIDELINE_ID").toString());
		JSONArray array = JSONArray.fromObject(varSouList);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(array);
		out.close();
	}
	
	/**
	 * 删除检查手段
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value="/delSou")
	public void delSou(HttpServletResponse resp) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		examsolutionService.delete(pd);
		List<PageData> varSouList = examsolutionService.listExamSolutionByExamGuidelineID(pd.get("EXAMGUIDELINE_ID").toString());
		JSONArray array = JSONArray.fromObject(varSouList);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(array);
		out.close();
		
	}
	
	 /**去指南规则修改页面
		 * @param
		 * @throws Exception
		 */
		@RequestMapping(value="/goEditRule")
		public ModelAndView goEditRule()throws Exception{
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			logBefore(logger, pd.get("EXAMGUIDELINE_ID")+"列表EXAM  ==== exanmmID");
			pd = this.getPageData();
			pd = examguidelineService.findById(pd);	//根据ID读取
			mv.setViewName("exam/examguideline/examguidelinerule_edit");
			mv.addObject("msg", "editRule");
			mv.addObject("pd", pd);
			return mv;
		}	
	
		/**
		 * 疾病分类两级联动查询
		 * @param req
		 * @param resp
		 * @param DISEASECATEGORY_ID
		 * @throws Exception
		 */
	@RequestMapping(value="/refreshDisease")
	public void refreshDisease(HttpServletRequest req,HttpServletResponse resp,String DISEASECATEGORY_ID) throws Exception{
		List<Disease> diseases = diseaseService.listDiseaseByDiseaseCategoryID(DISEASECATEGORY_ID);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		req.setAttribute("diseases", diseases);
		JSONArray json = JSONArray.fromObject(diseases);
		logBefore(logger, json+"列表disease == json");
		PrintWriter pw = null;
		pw=resp.getWriter();
		pw.print(json);
		pw.close();
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
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ExamGuideLine");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			examguidelineService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出ExamGuideLine到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("来源");	//1
		titles.add("指南详细描述");	//2
		titles.add("关注因素描述");	//3
		titles.add("高危人群识别");	//4
		titles.add("高危人群识别脚本");	//5
		titles.add("普通人群识别");	//6
		titles.add("普通人群识别脚本");	//7
		titles.add("状态");	//8
		titles.add("创建该记录员工id");	//9
		titles.add("创建该记录时间");	//10
		dataMap.put("titles", titles);
		List<PageData> varOList = examguidelineService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ORIGINATE"));	//1
			vpd.put("var2", varOList.get(i).getString("DESCRIPTION"));	//2
			vpd.put("var3", varOList.get(i).getString("CONCERNEDFACTORS"));	//3
			vpd.put("var4", varOList.get(i).getString("HIGHRISKDEFINE"));	//4
			vpd.put("var5", varOList.get(i).getString("HIGHRISKEXPRESSION"));	//5
			vpd.put("var6", varOList.get(i).getString("LOWRISKDEFINE"));	//6
			vpd.put("var7", varOList.get(i).getString("LOWRISKEXPRESSION"));	//7
			vpd.put("var8", varOList.get(i).getString("STATUS"));	//8
			vpd.put("var9", varOList.get(i).getString("CREATEBY"));	//9
			vpd.put("var10", varOList.get(i).getString("CREATEON"));	//10
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
