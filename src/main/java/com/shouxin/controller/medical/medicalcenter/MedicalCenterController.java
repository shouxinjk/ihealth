package com.shouxin.controller.medical.medicalcenter;

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
import com.shouxin.entity.medical.MedicalCenter;
import com.shouxin.service.medical.medicalcenter.MedicalCenterManager;
import com.shouxin.service.medical.medicalexamitem.MedicalExamItemManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.DateUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;
import com.shouxin.util.Jurisdiction;

/** 
 * 说明：体检中心
 * 创建人：shouxin
 * 创建时间：2016-05-19
 */
@Controller
@RequestMapping(value="/medicalcenter")
public class MedicalCenterController extends BaseController {
	
	String menuUrl = "medicalcenter/list.do"; //菜单地址(权限用)
	@Resource(name="medicalcenterService")
	private MedicalCenterManager medicalcenterService;
	@Resource(name="medicalexamitemService")
	private MedicalExamItemManager medicalexamitemService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增MedicalCenter");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String centerid = this.get32UUID();
		pd.put("MEDICALCENTER_ID", centerid);	//主键
		pd.put("CREATEBY", "");	//创建该记录用户id
		pd.put("CREATEON", DateUtil.getTime());	//创建该记录时间
		String parentid = pd.getString("PARENTID");
		String userId = Jurisdiction.getUserId();
		medicalcenterService.save(pd);
		PageData adminPd = medicalexamitemService.findAdminByUserId(userId);
		String medicalcenterid = "";
		if(adminPd!=null){
			medicalcenterid = adminPd.getString("MEDICALCENTER_ID");
		}
		Page page = new Page();
		PageData pd2 = new PageData();
		pd2.put("MEDICALCENTER_ID", medicalcenterid);
		page.setPd(pd2);
		List<PageData> varList = this.medicalcenterService.list(page);
		if(medicalcenterid .equals("")){
		if(parentid.equals("0")){
				pd.clear();
				pd.put("MEDICALCENERADMIN_ID", this.get32UUID());
				pd.put("MEDICALCENTER_ID",centerid);
				pd.put("SYS_USER_ID", userId);
				this.medicalcenterService.saveCenterAdmin(pd);
			}
		}else{
			if(parentid.equals("0")){
				if(varList.size()<=0){
					pd.clear();
					pd.put("MEDICALCENERADMIN_ID",adminPd.get("MEDICALCENERADMIN_ID"));
					pd.put("MEDICALCENTER_ID",centerid);
					this.medicalcenterService.editCenterAdmin(pd);
				}
			}
		}
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
		logBefore(logger, Jurisdiction.getUsername()+"删除MedicalCenter");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalcenterService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改MedicalCenter");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalcenterService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**修改体检中心状态
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/auditing")
	public ModelAndView auditing() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"审核MedicalCenter状态");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		medicalcenterService.auditing(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表MedicalCenter");
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
		logBefore(logger, medicalcenterid+"=====medicalcenterid");
		if(medicalcenterid.equals("")){
			pd.put("MEDICALCENTER_ID", "");
		}else{
			pd.put("MEDICALCENTER_ID", medicalcenterid);
		}
		
		page.setPd(pd);
		List<PageData>	varList = new ArrayList<PageData>();
		List<PageData> l = new ArrayList<PageData>();
		varList = medicalcenterService.list(page);	//列出MedicalCenter列表
		mv.setViewName("medical/medicalcenter/medicalcenter_list");
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
		logBefore(logger, Jurisdiction.getUsername()+"列表MedicalCenter");
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
		String medicalcenterid= "";
		if(adminPd!=null){
			medicalcenterid = adminPd.getString("MEDICALCENTER_ID");
		}
		logBefore(logger, medicalcenterid+"=====medicalcenterid");
		if(medicalcenterid.equals("")){
			pd.put("MEDICALCENTER_ID", "");
		}else{
			pd.put("MEDICALCENTER_ID", medicalcenterid);
		}
		
		page.setPd(pd);
		List<PageData> l = new ArrayList<PageData>();
		List<PageData>	varList = medicalcenterService.listRelAll(page);	//列出MedicalCenter列表
		mv.setViewName("medical/medicalcenter/medicalcenterrel_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listPlatformRel")
	public ModelAndView listPingTairel(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表MedicalCenter");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = medicalcenterService.dataPingTairellistPage(page);	//列出MedicalCenter列表
		mv.setViewName("medical/medicalcenter/medicalcenterplatformrel_list");
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
		String userId = Jurisdiction.getUserId();
		PageData adminPd = medicalexamitemService.findAdminByUserId(userId);
		String medicalcenterid = "";
		if(adminPd!=null){
			medicalcenterid = adminPd.getString("MEDICALCENTER_ID");
		}
		List<MedicalCenter> centers = new ArrayList<MedicalCenter>();
		List<PageData> pds = new ArrayList<PageData>();
		if(!medicalcenterid.equals("")){
			centers = medicalcenterService.listParentIDPage(medicalcenterid);
		}else{
			medicalcenterid ="0";
			pds = medicalcenterService.listAll();
		}
		mv.setViewName("medical/medicalcenter/medicalcenter_edit");
		mv.addObject("msg", "save");
		mv.addObject("medicalcenterid",medicalcenterid);
		mv.addObject("centers",centers);
		mv.addObject("pds",pds);
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
		pd = medicalcenterService.findById(pd);	//根据ID读取
		mv.setViewName("medical/medicalcenter/medicalcenter_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除MedicalCenter");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			medicalcenterService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出MedicalCenter到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("体检中心名称");	//1
		titles.add("体检中心描述");	//2
		titles.add("体检中心地理位置");	//3
		titles.add("体检中心简介");	//4
		titles.add("体检中心联系电话");	//5
		titles.add("体检中心状态");	//6
		titles.add("体检中心logo图片地址");	//7
		titles.add("体检中心开业时间");	//8
		titles.add("创建该记录用户id");	//9
		titles.add("创建该记录时间");	//10
		titles.add("体检中心或医院附件信息");	//11
		titles.add("体检中心或医院经纬度地理位置");	//12
		titles.add("体检中心或医院分支机构");	//13
		dataMap.put("titles", titles);
		List<PageData> varOList = medicalcenterService.listAll();
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("DESCRIPTION"));	//2
			vpd.put("var3", varOList.get(i).getString("LOCATION"));	//3
			vpd.put("var4", varOList.get(i).getString("ABBREVIATION"));	//4
			vpd.put("var5", varOList.get(i).getString("TELEPHONE"));	//5
			vpd.put("var6", varOList.get(i).get("STATUS").toString());	//6
			vpd.put("var7", varOList.get(i).getString("LOGO"));	//7
			vpd.put("var8", varOList.get(i).getString("OPENINGTIME"));	//8
			vpd.put("var9", varOList.get(i).getString("CREATEBY"));	//9
			vpd.put("var10", varOList.get(i).getString("CREATEON"));	//10
			vpd.put("var11", varOList.get(i).getString("ACCESSORY"));	//11
			vpd.put("var12", varOList.get(i).getString("POSITION"));	//12
			vpd.put("var13", varOList.get(i).getString("PARENTID"));	//13
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
