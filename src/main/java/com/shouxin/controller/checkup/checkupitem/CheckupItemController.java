package com.shouxin.controller.checkup.checkupitem;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.checkup.CheckupItem;
import com.shouxin.util.AppUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;
import com.shouxin.util.Jurisdiction;
import com.shouxin.service.checkup.checkupitem.CheckupItemManager;

/** 
 * 说明：体检项目管理
 * 创建人：shouxin
 * 创建时间：2016-04-10
 */
@Controller
@RequestMapping(value="/checkupitem")
public class CheckupItemController extends BaseController {
	
	String menuUrl = "checkupitem/list.do"; //菜单地址(权限用)
	@Resource(name="checkupitemService")
	private CheckupItemManager checkupitemService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增CheckupItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CHECKUPITEM_ID", this.get32UUID());	//主键
		pd.put("CREATEON", new Date());
		pd.put("CREATEBY", Jurisdiction.getUserId());
		checkupitemService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除CheckupItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		checkupitemService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改CheckupItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		checkupitemService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表CheckupItem");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CHECKUPPACKAGE_ID", pd.get("id"));
		List<PageData>	varList = checkupitemService.listAll(pd);	//列出CheckupItem列表
		mv.setViewName("checkup/checkupitem/checkupitem_list");
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
		pd = this.checkupitemService.findById(pd);
		mv.setViewName("checkup/checkupitem/checkupitem_edit");
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
		pd = checkupitemService.findById(pd);	//根据ID读取
		mv.setViewName("checkup/checkupitem/checkupitem_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除CheckupItem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			checkupitemService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出CheckupItem到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("检查项目分组");	//1
		titles.add("检查项目名称");	//2
		titles.add("特性");	//3
		titles.add("检查频率");	//4
		titles.add("状态");	//5
		titles.add("指南来源");	//6
		titles.add("详细描述");	//7
		titles.add("该记录生成时间");	//8
		titles.add("用于产生该记录的标记");	//9
		titles.add("版本");	//10
		titles.add("系统标记");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = checkupitemService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("SUBGROUP"));	//1
			vpd.put("var2", varOList.get(i).getString("NAME"));	//2
			vpd.put("var3", varOList.get(i).getString("FEATURES"));	//3
			vpd.put("var4", varOList.get(i).getString("FREQUENCY"));	//4
			vpd.put("var5", varOList.get(i).getString("STATUS"));	//5
			vpd.put("var6", varOList.get(i).getString("ORIGINATE"));	//6
			vpd.put("var7", varOList.get(i).getString("DESCRIPTION"));	//7
			vpd.put("var8", varOList.get(i).getString("GENERATEDTIME"));	//8
			vpd.put("var9", varOList.get(i).getString("WORKER"));	//9
			vpd.put("var10", varOList.get(i).get("REVISION").toString());	//10
			vpd.put("var11", varOList.get(i).getString("SYSFLAG"));	//11
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	/**
	 * 根据关联关系查询所有体检项目和用户信息
	 * @param id checkupPackageId
	 * @return modelAndView
	 * @throws Exception
	 */
	@RequestMapping(value="/lists/{id}")
	public ModelAndView lists(Page page,@PathVariable String id) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表CheckupItem");
		ModelAndView mv = this.getModelAndView();
		
		List<CheckupItem>	varList = checkupitemService.findAllById(id);	//列出CheckupItem列表
		mv.setViewName("checkup/checkupitem/checkupitem_list");
		mv.addObject("varList", varList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
