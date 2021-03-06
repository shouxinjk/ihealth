package com.shouxin.controller.medical.order;

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
import com.shouxin.service.medical.medicalorder.MedicalOrderManager;
import com.shouxin.service.medical.order.OrderManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;
import com.shouxin.util.Jurisdiction;

/** 
 * 说明：平台订单（大订单）
 * 创建人：shouxin
 * 创建时间：2016-05-19
 */
@Controller
@RequestMapping(value="/order")
public class OrderController extends BaseController {
	
	String menuUrl = "order/list.do"; //菜单地址(权限用)
	@Resource(name="orderService")
	private OrderManager orderService;
	@Resource(name="medicalorderService")
	private MedicalOrderManager medicalorderService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORDER_ID", this.get32UUID());	//主键
		orderService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		orderService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改状态
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/submitted")
	public void submitted(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"审核ExamGuideLine");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = pd.getString("ORDER_ID");
		Order order = orderService.findByIdString(id);	//根据ID读取
		List<MedicalExamItem> item = orderService.findCenterIDByOrderId(id);
		List<MedicalExamItem> items = orderService.findExamItemByOrderId(id);
		List<MedicalOrder> medicalOrder = new ArrayList<MedicalOrder>();
		List<MedicalOrderItem> medicalOrderItem = new ArrayList<MedicalOrderItem>();
		for (MedicalExamItem m : item) {
			MedicalOrder o = new MedicalOrder();
			String medicalOrder_id = this.get32UUID();
			o.setMEDICALORDER_ID(medicalOrder_id);
			o.setMEDICALCENTER_ID(m.getMEDICALCENTER_ID());
			o.setMEDICALORDERBOOKINGTIME(order.getORDERBOOKINGTIME());
			o.setMEDICALORDEREXECUTIONTIME(order.getORDEREXECUTIONTIME());
			o.setMEDICALORDERNO(order.getORDERNO());
			o.setMEDICALORDERGENERATIONTIME(order.getORDERGENERATIONTIME());
			medicalOrder.add(o);
			for (MedicalExamItem i : items) {
				if(i.getMEDICALCENTER_ID().equals(m.getMEDICALCENTER_ID())){
					MedicalOrderItem moi = new MedicalOrderItem();
					moi.setMEDICALORDERITEM_ID(this.get32UUID());
					moi.setMEDICALORDER_ID(medicalOrder_id);
					moi.setMEDICALEXAMITEM_ID(i.getMEDICALEXAMITEM_ID());
					medicalOrderItem.add(moi);
				}
			}
		}
		medicalorderService.saveAll(medicalOrder);
		medicalorderService.saveItemAll(medicalOrderItem);
		logBefore(logger, item.get(0).getMEDICALCENTER_ID()+"medicalcenter_id==");
		orderService.updateOrderStatus(pd);
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
		logBefore(logger, pd.getString("STATUS")+"status+++++++++++++++");
		orderService.updateOrderStatus(pd);
		medicalorderService.auditingAll(pd);
		out.write("success");
		out.close();
	}
	
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		orderService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Order");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = orderService.list(page);	//列出Order列表
		for(int i=0;i<varList.size();i++){
			List<MedicalOrder> medicalOrders = 
					medicalorderService.listMedicalOrderByOrderNo(varList.get(i).getString("ORDERNO"));
			System.out.println(medicalOrders.size());
			if(medicalOrders.size()>0){
				varList.get(i).put("ISCONFIRM", false);
			}else if(medicalOrders.size()==0){
				varList.get(i).put("ISCONFIRM", true);
//				pd.put("STATUS", "体检中心确认");
//				pd.put("ORDER_ID", varList.get(i).getString("ORDER_ID"));
//				orderService.updateOrderStatus(pd);
//				medicalorderService.auditingAll(pd);
			}
		}
		mv.setViewName("medical/order/order_list");
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Order");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String STATUS = pd.getString("STATUS");
		page.setPd(pd);
		List<PageData>	varList = orderService.listPart(page);	//列出Order列表
		for(int i=0;i<varList.size();i++){
			List<MedicalOrder> medicalOrders = 
					medicalorderService.listMedicalOrderByOrderNo(varList.get(i).getString("ORDERNO"));
			System.out.println(medicalOrders.size());
			if(medicalOrders.size()>0){
				varList.get(i).put("ISCONFIRM", false);
			}else if(medicalOrders.size()==0){
				varList.get(i).put("ISCONFIRM", true);
//				pd.put("STATUS", "体检中心确认");
//				pd.put("ORDER_ID", varList.get(i).getString("ORDER_ID"));
//				orderService.updateOrderStatus(pd);
//				medicalorderService.auditingAll(pd);
			}
		}
		mv.setViewName("medical/order/order_list");
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
		mv.setViewName("medical/order/order_edit");
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
		pd = orderService.findById(pd);	//根据ID读取
		mv.setViewName("medical/order/order_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去查询页面
		* @param
		* @throws Exception
		*/
	@RequestMapping(value="/goFind")
	public ModelAndView goFind()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = pd.getString("ORDER_ID");
		pd = orderService.findById(pd);	//根据ID读取
		List<MedicalExamItem> item = orderService.findExamItemByOrderId(id);
		List<MedicalOrder> medicalOrders = medicalorderService.listAllMedicalOrderByOrderNo(pd.getString("ORDERNO"));
		for (MedicalOrder medicalOrder : medicalOrders) {
			List<MedicalExamItem> items = medicalorderService.listExamItemByMedicalOrderID(medicalOrder.getMEDICALORDER_ID());
			medicalOrder.setItems(items);
		}
		logBefore(logger, item+"查询单个订单信息");
		mv.setViewName("medical/order/order_cha");
		mv.addObject("msg", "edit");
		mv.addObject("medicalOrders",medicalOrders);
		mv.addObject("item", item);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			orderService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Order到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单号");	//1
		titles.add("订单生成时间");	//2
		titles.add("订单预约时间");	//3
		titles.add("订单实际执行时间");	//4
		titles.add("订单总金额");	//5
		titles.add("订单状态");	//6
		titles.add("创建该记录用户");	//7
		titles.add("创建该记录时间");	//8
		dataMap.put("titles", titles);
		List<PageData> varOList = orderService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MEDICALORDERNO"));	//1
			vpd.put("var2", varOList.get(i).getString("MEDICALORDERGENERATIONTIME"));	//2
			vpd.put("var3", varOList.get(i).getString("MEDICALORDERBOOKINGTIME"));	//3
			vpd.put("var4", varOList.get(i).getString("MEDICALORDEREXECUTIONTIME"));	//4
			vpd.put("var5", varOList.get(i).get("MEDICALORDERTOTALAMOUNT").toString());	//5
			vpd.put("var6", varOList.get(i).getString("MEDICALORDERSTATUS"));	//6
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
