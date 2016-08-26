package com.shouxin.controller.medical.medicalorder;

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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.medical.MedicalExamItem;
import com.shouxin.entity.medical.MedicalOrder;
import com.shouxin.entity.medical.MedicalOrderItem;
import com.shouxin.entity.medical.Order;
import com.shouxin.service.medical.medicalexamitem.MedicalExamItemManager;
import com.shouxin.service.medical.medicalorder.MedicalOrderManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.DateUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;
import com.shouxin.util.Jurisdiction;

/** 
 * 说明：体检中心订单（小订单）
 * 创建人：shouxin
 * 创建时间：2016-05-19
 */
@Controller
@RequestMapping(value="/medicalorder")
public class MedicalOrderController extends BaseController {
	
	String menuUrl = "medicalorder/list.do"; //菜单地址(权限用)
	@Resource(name="medicalorderService")
	private MedicalOrderManager medicalorderService;
	@Resource(name="medicalexamitemService")
	private MedicalExamItemManager medicalexamitemService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增MedicalOrder");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MEDICALORDER_ID", this.get32UUID());	//主键
		pd.put("CREATEBY", Jurisdiction.getUserId());	//创建该记录用户id
		pd.put("CREATEON", DateUtil.getTime());	//创建该记录时间
		medicalorderService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除MedicalOrder");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalorderService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改状态
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/auditing")
	public void auditing(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改体检中心订单状态");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalorderService.auditing(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改MedicalOrder");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalorderService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表MedicalOrder");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String userId = Jurisdiction.getUserId();
		PageData adminPd = medicalexamitemService.findAdminByUserId(userId);
		String medicalcenterid = "";
		if(adminPd!=null){
			medicalcenterid = adminPd.getString("MEDICALCENTER_ID");
		}
		if(medicalcenterid.equals("")){
			pd.put("MEDICALCENTER_ID", "");
		}else{
			pd.put("MEDICALCENTER_ID", medicalcenterid);
		}
		page.setPd(pd);
		List<PageData>	varList = medicalorderService.list(page);	//列出MedicalOrder列表
		mv.setViewName("medical/medicalorder/medicalorder_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listPart")
	public ModelAndView listPart(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"单个状态下的列表MedicalOrder");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String STATUS = pd.get("STATUS").toString();
		String userId = Jurisdiction.getUserId();
		PageData adminPd = medicalexamitemService.findAdminByUserId(userId);
		String medicalcenterid = adminPd.getString("MEDICALCENTER_ID");
		if(medicalcenterid == null){
			pd.put("MEDICALCENTER_ID", "");
		}else{
			pd.put("MEDICALCENTER_ID", medicalcenterid);
		}
		page.setPd(pd);
		List<PageData>	varList = medicalorderService.listPart(page);	//列出MedicalOrder列表
		mv.setViewName("medical/medicalorder/medicalorder_list");
		mv.addObject("varList", varList);
		mv.addObject("STATUS",STATUS);
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
		mv.setViewName("medical/medicalorder/medicalorder_edit");
		mv.addObject("msg", "save");
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
		pd = medicalorderService.findById(pd);	//根据ID读取
		mv.setViewName("medical/medicalorder/medicalorder_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**
	 * 去查看订单详情页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/lookdetails")
	public ModelAndView lookdDtails()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		logBefore(logger, pd.getString("MEDICALORDER_ID") + "----------根据订单ID，获取体检项目详细信息start--------");
		List<PageData> varList = this.medicalorderService.findItemsById(pd);
		pd = medicalorderService.findById(pd);	//根据ID读取
		mv.setViewName("medical/medicalorder/lookdetails");
		mv.addObject("varList", varList);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除MedicalOrder");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			medicalorderService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出MedicalOrder到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单编号");	//1
		titles.add("订单号");	//2
		titles.add("订单生成时间");	//3
		titles.add("订单预约时间");	//4
		titles.add("订单实际执行时间");	//5
		titles.add("订单总金额");	//6
		titles.add("订单状态");	//7
		titles.add("创建该记录用户id");	//8
		titles.add("创建该记录时间");	//9
		dataMap.put("titles", titles);
		List<PageData> varOList = medicalorderService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MEDICALORDER_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("ORDERNO"));	//2
			vpd.put("var3", varOList.get(i).getString("ORDERGENERATIONTIME"));	//3
			vpd.put("var4", varOList.get(i).getString("ORDERBOOKINGTIME"));	//4
			vpd.put("var5", varOList.get(i).getString("ORDEREXECUTIONTIME"));	//5
			vpd.put("var6", varOList.get(i).get("TOTALAMOUNT").toString());	//6
			vpd.put("var7", varOList.get(i).getString("STATUS"));	//7
			vpd.put("var8", varOList.get(i).getString("CREATEBY"));	//8
			vpd.put("var9", varOList.get(i).getString("CREATEON"));	//9
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
