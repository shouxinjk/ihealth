package com.shouxin.controller.rest;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.medical.MedicalExamItem;
import com.shouxin.entity.medical.MedicalOrder;
import com.shouxin.entity.medical.MedicalOrderItem;
import com.shouxin.entity.medical.Order;
import com.shouxin.entity.medical.OrderItem;
import com.shouxin.service.checkup.checkupitem.CheckupItemManager;
import com.shouxin.service.medical.medicalexamitem.MedicalExamItemManager;
import com.shouxin.service.medical.medicalorder.MedicalOrderManager;
import com.shouxin.service.medical.order.OrderManager;
import com.shouxin.service.system.appuser.AppuserManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.Jurisdiction;
import com.shouxin.util.OrderNo;
import com.shouxin.util.PageData;

import net.sf.json.JSONObject;

/**
 * 订单接口
 * @author yxd1
 *
 */
@Controller
@RequestMapping(value = "/restOrder")
public class OrderRestController extends BaseController {
	
	@Resource(name="orderService")
	private OrderManager orderService;
	@Resource(name = "checkupitemService")
	private CheckupItemManager checkupitemService;
	@Resource(name="medicalexamitemService")
	private MedicalExamItemManager medicalexamitemService;
	@Resource(name="medicalorderService")
	private MedicalOrderManager medicalorderService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	/**
	 * 添加订单
	 * @param souid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addOrder",method=RequestMethod.POST)
	@ResponseBody
	public Object addOrder(@RequestBody String params) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ORDER_ID =  this.get32UUID();
		JSONObject json = JSONObject.fromObject(params);
		String user_id = json.getString("userId").toString();
		String orderDateStr = OrderNo.getDateStr();
		String orderNo = this.orderService.getMaxOrderNo(orderDateStr);
		String orderNoStr = OrderNo.getOrderNo(orderNo);
		pd.put("ORDER_ID", ORDER_ID);
		if(!orderNoStr.equals("max")){
			pd.put("ORDERNO", orderNoStr);
		}
		pd.put("APP_USERID", user_id);
		pd.put("ORDERGENERATIONTIME", new Date());
		orderService.save(pd);
//		String solutionID = json.getString("solutionID").toString();
//		String[] solutionIDS = solutionID.split(",");
//		List<OrderItem> itemIDs = new ArrayList<OrderItem>();
//		for(int i=0;i<solutionIDS.length;i++){
//			OrderItem oi = new OrderItem();
//			String orderItemID = this.get32UUID();
//				oi.setORDER_ID(ORDER_ID);
//				oi.setORDERITEM_ID(orderItemID);
//				//String MEDICALEXAMITEM_ID = orderService.findExamItemByExamSolutionId(solutionIDS[i]);
//				oi.setMEDICALEXAMITEM_ID(solutionIDS[i]);
//				itemIDs.add(oi);
//		}
//		System.out.println(itemIDs.size()+"=============");
//		if(itemIDs.size()>0){
//			orderService.saveOrderItem(itemIDs);
//			allMap.put("msg", "success");
//			allMap.put("orderid", ORDER_ID);
//		}else{
//			allMap.put("msg", "no");
//		}
		allMap.put("msg", "success");
		allMap.put("orderid", ORDER_ID);
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 修改所属订单的体检项目
	 * @param {"order_id":订单编号,"itemID":属于订单的体检项目}
	 * @return{"msg":修改的状态（success=完成修改，no=修改失败）,"orderid":订单编号}
	 * @throws Exception
	 */
	@RequestMapping(value="/editOrderAndItem",method=RequestMethod.POST)
	@ResponseBody
	public Object editOrderAndExamItem(@RequestBody String itemID) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(itemID);
		String ORDER_ID = json.getString("order_id").toString();
		String itemIDStr = json.getString("itemID").toString();
		double ORDERTOTALAMOUNT = json.getDouble("ORDERTOTALAMOUNT");
		pd.put("ORDER_ID", ORDER_ID);
		pd.put("ORDERTOTALAMOUNT", ORDERTOTALAMOUNT*100);
		//修改订单金额
		orderService.editOrderPrice(pd);
		String[] itemIDArray = itemIDStr.split(",");
		List<OrderItem> itemIDs = new ArrayList<OrderItem>();
		for(int i=0;i<itemIDArray.length;i++){
			OrderItem oi = new OrderItem();
			String orderItemID = this.get32UUID();
				oi.setORDER_ID(ORDER_ID);
				oi.setORDERITEM_ID(orderItemID);
				//String MEDICALEXAMITEM_ID = orderService.findExamItemByExamSolutionId(solutionIDS[i]);
				oi.setMEDICALEXAMITEM_ID(itemIDArray[i]);
				itemIDs.add(oi);
		}
		if(itemIDs.size()>0){
			//添加订单体检项目
			orderService.saveOrderItem(itemIDs);
			//根据订单体检项目拆分出子级体检中心订单
			splitOrder(ORDER_ID);
			PageData pds = new PageData();
			pds.put("ORDER_ID", ORDER_ID);
			pds = orderService.findById(pds);
			allMap.put("msg", "success");
			allMap.put("orderid", ORDER_ID);
			allMap.put("orderData", pds);
		}else{
			allMap.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 根据用户订单体检项目信息分解体检中心订单
	 * @param OrderId
	 * @throws Exception
	 */
	public void splitOrder(String OrderId)throws Exception{
		logBefore(logger, "提交订单时根据订单所属的体检项目进行拆分");
		PageData pd = new PageData();
		Order order = orderService.findByIdString(OrderId);	//根据ID读取
		List<MedicalExamItem> item = orderService.findCenterIDByOrderId(OrderId);
		List<MedicalExamItem> items = orderService.findExamItemByOrderId(OrderId);
		List<MedicalOrder> medicalOrder = new ArrayList<MedicalOrder>();
		List<MedicalOrderItem> medicalOrderItem = new ArrayList<MedicalOrderItem>();
		for (int i=0;i<item.size();i++) {
			MedicalOrder o = new MedicalOrder();
			String medicalOrder_id = this.get32UUID();
			o.setMEDICALORDER_ID(medicalOrder_id);
			o.setMEDICALCENTER_ID(item.get(i).getMEDICALCENTER_ID());
			o.setMEDICALORDERBOOKINGTIME(order.getORDERBOOKINGTIME());
			o.setMEDICALORDEREXECUTIONTIME(order.getORDEREXECUTIONTIME());
			o.setORDER_ID(OrderId);
			if(i<10){
				o.setMEDICALORDERNO(order.getORDERNO()+"-0"+(i+1));
			}else{
				o.setMEDICALORDERNO(order.getORDERNO()+"-"+(i+1));
			}
			
			o.setMEDICALORDERGENERATIONTIME(order.getORDERGENERATIONTIME());
			
			double SELLINCPRICE = 0.0;
			for (MedicalExamItem it : items) {
				if(it.getMEDICALCENTER_ID().equals(item.get(i).getMEDICALCENTER_ID())){
					MedicalOrderItem moi = new MedicalOrderItem();
					moi.setMEDICALORDERITEM_ID(this.get32UUID());
					moi.setMEDICALORDER_ID(medicalOrder_id);
					moi.setMEDICALEXAMITEM_ID(it.getMEDICALEXAMITEM_ID());
					SELLINCPRICE+=it.getSETTLEMENTPRICE();
					medicalOrderItem.add(moi);
				}
			}
			o.setMEDICALTOTALAMOUNT(SELLINCPRICE*100);
			medicalOrder.add(o);
		}
		
		medicalorderService.saveAll(medicalOrder);
		medicalorderService.saveItemAll(medicalOrderItem);
		logBefore(logger, item.get(0).getMEDICALCENTER_ID()+"medicalcenter_id==");
		pd.clear();
		pd.put("ORDER_ID", OrderId);
		pd.put("STATUS", "已提交");
		orderService.updateOrderStatus(pd);
	}
	
	/**
	 * 根据orderid和userid分别查询出订单和用户信息
	 * @param souid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findOrderAndUser",method=RequestMethod.POST)
	@ResponseBody
	public Object findOrderAndUser(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String orderid = json.getString("order_id").toString();
		String userid = json.getString("user_id").toString();
		pd.put("ORDER_ID", orderid);
		pd = orderService.findById(pd);
		PageData pds = new PageData();
		pds.put("USER_ID", userid);
		pds = appuserService.findByUiId(pds);
		allMap.put("msg", "success");
		allMap.put("orderData", pd);
		allMap.put("userData", pds);
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 根据订单号查询订单信息并且修改订单状态
	 * @param orderNo:订单号
	 * @return 该订单的所有信息
	 * 			[orderData:{"ORDERNO":"订单号","ORDERTOTALAMOUNT":"订单总金额","ORDER_ID":"订单编号"}]
	 * @throws Exception
	 */
	@RequestMapping(value="/findOrderByOrderNo",method=RequestMethod.POST)
	@ResponseBody
	public Object findOrderByOrderNo(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String orderno = json.getString("orderNo").toString();
		PageData orderpds = this.orderService.findByOrderNoString(orderno);
		if(orderpds!=null ){
			pd.put("STATUS", "已付款");
			pd.put("ORDER_ID", orderpds.getString("ORDER_ID"));
			this.orderService.updateOrderStatus(pd);
			List<PageData> pds = new ArrayList<PageData>();
			pd.clear();
			pd.put("ORDER_ID", orderpds.getString("ORDER_ID"));
			pds=this.medicalorderService.listOrderByOrderId(pd);
			for (PageData p : pds) {
				PageData p1 = new PageData();
				p1.put("STATUS", "已付款");
				p1.put("MEDICALORDER_ID", p.getString("MEDICALORDER_ID"));
				this.medicalorderService.auditing(p1);
			}
			allMap.put("result", "SUCCESS");
		}else{
			allMap.put("result", "NO");
		}
		allMap.put("orderData", orderpds);
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 修改订单预约时间时查询出订单信息
	 * @param order_id:订单编号
	 * @return 该订单的所有信息
	 * 			[orderData:{"UNAME":"体检人的名称","CNAME":"体检中心名称","ORDER_ID":"订单编号"
	 * 			,"MNAME":"体检项目名称","MEDICALORDERBOOKINGTIME":"预约时间","MEDICALORDER_ID":"体检订单编号"
	 * 			"ORDERNO":"订单编号","MEDICALORDERNO":"体检订单编号","MSTATUS":"体检订单状态"}]
	 * @throws Exception
	 */
	@RequestMapping(value="/aboutOrderPageData",method=RequestMethod.POST)
	@ResponseBody
	public Object aboutOrderTime(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String ORDER_ID = json.getString("order_id").toString();
		pd.put("ORDER_ID", ORDER_ID);
//		List<PageData> pds = this.medicalorderService.listOrderByOrderId(pd);
//		PageData order = this.orderService.findById(pd);
		List<PageData> pds = this.medicalorderService.listAllOrderAndAbout(pd);
		allMap.put("msg", "success");
		allMap.put("orderData", pds);
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 修改订单预约时间 并且修改订单状态
	 * @param order_id:体检订单编号,time:预约的时间
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value="/editAboutTime",method=RequestMethod.POST)
	@ResponseBody
	public Object editAboutTime(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String ORDER_ID = json.getString("order_id").toString();
		String time = json.getString("time").toString();
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(time);
		pd.put("MEDICALORDER_ID", ORDER_ID);
		pd.put("MEDICALORDERBOOKINGTIME", date);
		this.medicalorderService.editTime(pd);
		pd.put("STATUS", "已预约");
		this.medicalorderService.auditing(pd);
		PageData orderpd = this.medicalorderService.findById(pd);
		String orderID = orderpd.getString("ORDER_ID");
		PageData orderIDpd = new PageData();
		pd.put("ORDER_ID", orderID);
		List<PageData> medicalOrders = this.medicalorderService.listOrderByOrderId(orderIDpd);
		boolean fash = true;
		for (PageData p : medicalOrders) {
			if(p.getString("STATUS").equals("已付款")){
				fash = false;
			}
		}
		if(fash){
			orderIDpd.clear();
			orderIDpd.put("ORDER_ID", orderID);
			orderIDpd.put("STATUS", "已预约");
			this.orderService.updateOrderStatus(orderIDpd);
			orderIDpd.put("ORDERBOOKINGTIME", date);
			this.orderService.editTime(orderIDpd);
		}else{
			orderIDpd.clear();
			orderIDpd.put("ORDER_ID", orderID);
			orderIDpd.put("STATUS", "正在预约");
			this.orderService.updateOrderStatus(orderIDpd);
		}
		allMap.put("msg", "success");
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 修改订单预约时间 并且修改订单状态
	 * @param order_id:体检订单编号,time:预约的时间
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value="/editAboutTimeQuxiao",method=RequestMethod.POST)
	@ResponseBody
	public Object editAboutTimeQuxiao(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String ORDER_ID = json.getString("order_id").toString();
		pd.put("MEDICALORDER_ID", ORDER_ID);
		pd.put("STATUS", "取消预约");
		this.medicalorderService.auditing(pd);
		PageData orderpd = this.medicalorderService.findById(pd);
		String orderID = orderpd.getString("ORDER_ID");
		PageData orderIDpd = new PageData();
		orderIDpd.clear();
		orderIDpd.put("ORDER_ID", orderID);
		orderIDpd.put("STATUS", "正在预约");
		this.orderService.updateOrderStatus(orderIDpd);
		allMap.put("msg", "success");
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 查询我的订单
	 * @param user_id:用户编号
	 * @return 该订单的所有信息
	 * 			[pds:{"ORDERNO":"订单号","ORDERGENERATIONTIME":"下单时间","ORDER_ID":"订单编号"
	 * 			,"ORDERBOOKINGTIME":"预约时间","ORDEREXECUTIONTIME":"实际执行时间","ORDERTOTALAMOUNT":"订单总金额"
	 * 			"STATUS":"订单状态","USER_ID":"体检人id","NAME":"体检人名称"}]
	 * @throws Exception
	 */
	@RequestMapping(value="/myOrder",method=RequestMethod.POST)
	@ResponseBody
	public Object myOrder(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String user_id = json.getString("user_id").toString();
		pd.put("APP_USERID", user_id);
		List<PageData > pds = this.orderService.listAllByUserID(pd);
		if(pds!=null){
			if(pds.size()>0){
				allMap.put("result", "SUCCESS");
				allMap.put("pds", pds);
			}else{
				allMap.put("result", "NO");
			}
		}else{
			allMap.put("result", "NO");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 查询我和关联用户的所有的订单
	 * @param user_id:用户编号
	 * @return 该订单的所有信息
	 * 			[pds:{"ORDERNO":"订单号","ORDERGENERATIONTIME":"下单时间","ORDER_ID":"订单编号"
	 * 			,"ORDERBOOKINGTIME":"预约时间","ORDEREXECUTIONTIME":"实际执行时间","ORDERTOTALAMOUNT":"订单总金额"
	 * 			"STATUS":"订单状态","USER_ID":"体检人id","NAME":"体检人名称"}]
	 * @throws Exception
	 */
	@RequestMapping(value="/myAllOrders",method=RequestMethod.POST)
	@ResponseBody
	public Object myAllOrders(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String user_id = json.getString("user_id").toString();
		pd.put("APP_USERID", user_id);
		List<PageData > pds = this.orderService.listAllOrderByUserIDAndUserID(pd);
		if(pds!=null){
			if(pds.size()>0){
				allMap.put("result", "SUCCESS");
				allMap.put("pds", pds);
			}else{
				allMap.put("result", "NO");
			}
		}else{
			allMap.put("result", "NO");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 查询该订单详情和所有体检项目
	 * @param user_id:用户编号
	 * @return 该订单的所有信息
	 * 			[itemData:{"ORDERNO":"订单号","ORDERGENERATIONTIME":"下单时间","ORDER_ID":"订单编号"
	 * 			,"ORDERBOOKINGTIME":"预约时间","ORDEREXECUTIONTIME":"实际执行时间","ORDERTOTALAMOUNT":"订单总金额"
	 * 			"STATUS":"订单状态","USER_ID":"体检人id","NAME":"体检人名称"}
	 * 			orderData:{"MNAME":"项目名称","SELLINGPRICE":"项目价格","CNAME":"体检中心名称"}
	 * 			]
	 * @throws Exception
	 */
	@RequestMapping(value="/orderSummary",method=RequestMethod.POST)
	@ResponseBody
	public Object orderSummary(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String order_id = json.getString("order_id").toString();
		List<PageData > pds = this.orderService.findOrderExamitem(order_id);
		PageData orderPD = this.orderService.findOrder(order_id);
		if(pds!=null){
				allMap.put("result", "SUCCESS");
				allMap.put("itemData", pds);
				allMap.put("orderData", orderPD);
		}else{
			allMap.put("result", "NO");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 查询该订单详情和所有体检项目
	 * @param user_id:用户编号
	 * @return 该订单的所有信息
	 * 			[itemData:{"MEDICALORDERNO":"订单号","MEDICALORDERGENERATIONTIME":"下单时间","ORDER_ID":"订单编号","MEDICALORDER_ID":"子订单编号"
	 * 			,"MEDICALORDERBOOKINGTIME":"预约时间","MEDICALORDEREXECUTIONTIME":"实际执行时间","MEDICALTOTALAMOUNT":"订单总金额"
	 * 			"STATUS":"订单状态","USER_ID":"体检人id","NAME":"体检人名称"}
	 * 			orderData:{"MNAME":"项目名称","SELLINGPRICE":"项目价格","CNAME":"体检中心名称"}
	 * 			]
	 * @throws Exception
	 */
	@RequestMapping(value="/medicalOrderSummary",method=RequestMethod.POST)
	@ResponseBody
	public Object medicalOrderSummary(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String order_id = json.getString("order_id").toString();
		List<PageData > pds = this.medicalorderService.findMedicalOrderExamitem(order_id);
		PageData orderPD = this.medicalorderService.findMedicalOrder(order_id);
		if(pds!=null){
				allMap.put("result", "SUCCESS");
				allMap.put("itemData", pds);
				allMap.put("orderData", orderPD);
		}else{
			allMap.put("result", "NO");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 查询我的体检日程
	 * @param user_id:用户编号
	 * @return 该订单的所有信息
	 * 			[pds:{"UNAME":"体检人的名称","CNAME":"体检中心名称","ORDER_ID":"订单编号","ORDERTOTALAMOUNT":"订单金额"
	 * 			,"MNAME":"体检项目名称","MEDICALORDERBOOKINGTIME":"预约时间","MEDICALORDER_ID":"体检订单编号"
	 * 			"ORDERNO":"订单号","MEDICALORDERNO":"体检订单号","MSTATUS":"体检订单状态","LOCATION":"体检中心地址"}]
	 * @throws Exception
	 */
	@RequestMapping(value="/allSchedule",method=RequestMethod.POST)
	@ResponseBody
	public Object allSchedule(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String user_id = json.getString("user_id").toString();
		pd.put("USER_ID", user_id);
		List<PageData > pds = this.medicalorderService.listAllScheduleAndUserID(pd);
		if(pds!=null){
			if(pds.size()>0){
				allMap.put("result", "SUCCESS");
				allMap.put("pds", pds);
			}else{
				allMap.put("result", "NO");
			}
		}else{
			allMap.put("result", "NO");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/**
	 * 查询我的体检日程
	 * @param user_id:用户编号
	 * @return 该订单的所有信息
	 * 			[pds:{"UNAME":"体检人的名称","CNAME":"体检中心名称","ORDER_ID":"订单编号","ORDERTOTALAMOUNT":"订单金额"
	 * 			,"MNAME":"体检项目名称","MEDICALORDERBOOKINGTIME":"预约时间","MEDICALORDER_ID":"体检订单编号"
	 * 			"ORDERNO":"订单号","MEDICALORDERNO":"体检订单号","MSTATUS":"体检订单状态","LOCATION":"体检中心地址"}]
	 * @throws Exception
	 */
	@RequestMapping(value="/mySchedule",method=RequestMethod.POST)
	@ResponseBody
	public Object mySchedule(@RequestBody String param) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(param);
		String user_id = json.getString("user_id").toString();
		pd.put("USER_ID", user_id);
		List<PageData > pds = this.medicalorderService.listAllSchedule(pd);
		if(pds!=null){
			if(pds.size()>0){
				allMap.put("result", "SUCCESS");
				allMap.put("pds", pds);
			}else{
				allMap.put("result", "NO");
			}
		}else{
			allMap.put("result", "NO");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
	/*@RequestMapping(value="/listExamItem",method=RequestMethod.POST)
	@ResponseBody
	public Object listExamItem(@RequestBody String id) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(id);
		String orderID = json.getString("orderId").toString();
		List<MedicalExamItem> items = orderService.findExamItemByOrderId(orderID);
		if(items.size()>0){
			allMap.put("items", items);
			allMap.put("msg", "success");
		}else{
			allMap.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}*/
	
	/**
	 * 根据userID 和当前分组名 获取体检项目
	 * url：http://localhost:8080/ihealth/rest/getCheckItemsByGroup type:post
	 * 
	 * @param {"userId":"用户ID"}
	 * @return 当userID不为空，并且数据库中存在这个ID、返回以下数据，需要注意的是，一个用户有多个体检项目，需要循环取值 {
	 *         "result": "success", "data": [ { "REVISION": 版本,
	 *         "STATUS":"状态，包括：已选中，已删除", "DESCRIPTION": "详细描述", "GENERATEDTIME":
	 *         该记录生成时间, "FREQUENCY": "每年一次", "ORIGINATE": "指南来源", "WORKER":
	 *         "用于产生该记录的标记", "SUBGROUP": "检查项目分组", "SYSFLAG": "系统标记", "NAME":
	 *         "检查项目名称", "FEATURES": "检查频率，是文字描述", "CHECKUPITEM_ID": "ID" } ] }
	 *         当用户ID为空时返回：{"result": "error"} 当根据userID查询出的数据为null时
	 *         返回：{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCheckItemsByGroup", method = RequestMethod.POST)
	@ResponseBody
	public Object getCheckItemsByGroup(@RequestBody String u) throws Exception {
		logBefore(logger, "查询--------根据用户ID，获取体检项目信息");

		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null, userId = null;
		PageData pd = new PageData();
		pd = this.getPageData();

		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		try {
			if (jasonObject.get("userId") != null && !"".equals(jasonObject.get("userId"))
					&& !"null".equals(jasonObject.get("userId"))) {
				userId = jasonObject.getString("userId").trim();
				pd.put("USER_ID", userId);
				pd.put("STATUS", "已选中");
				logger.debug("根据用户ID 查询体检项目信息");
				List<PageData> pageDate = this.checkupitemService.findCIByIdOrSubGroup(pd);
				String prompt = "";
				if (pageDate != null && pageDate.size() > 0) {
					for (PageData p : pageDate) {
						List<PageData> pds = new ArrayList<PageData>();
						pds = this.medicalexamitemService.listMedicalItemByCheckuoItemId(p.getString("CHECKUPITEM_ID"));
//						logBefore(logger, "查看购买项目的状态++++++++"+pds);
						for (int i = 0; i < pds.size(); i++) {
							if(!(pds.get(i).getString("MSTATUS").equals("平台发布")&&
									pds.get(i).getString("CSTATUS").equals("平台发布"))){
								System.out.println(1);
								pds.remove(i);
								i--;
							}
						}
						if(pds.size()==0){
							prompt+="\n";
							prompt+=p.getString("NAME");
						}
						p.put("pds", pds);
					}
					msg = "success";
					map.put("prompt", prompt);
					map.put("data", pageDate);
				} else {
					msg = "no";
				}
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			msg = "error";
			logBefore(logger, "程序异常--请检查参数列表");
			e.printStackTrace();
		}

		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据checkupItemID查询体检中心体检项目
	 * @param checkupId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listMedicalItemByCid")
	@ResponseBody
	public Object listMedicalItemByCid(@RequestBody String checkupId)throws Exception{
		logBefore(logger, "查询--------根据checkupitemID，获取体检中心体检项目信息");
		Map<Object, Object> map = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> pds = new ArrayList<PageData>();
		JSONObject json = JSONObject.fromObject(checkupId);
		String user_id = null,checkupItemId = null,msg="";
		if(json.get("userID") != null && !json.getString("userID").equals("")){
			user_id = json.getString("userID");
			pd.put("USER_ID", user_id);
		}
		if(json.get("checkupItemID")!=null && !json.getString("checkupItemID").equals("")){
			checkupItemId = json.getString("checkupItemID");
			pd.put("CHECKUPITEM_ID", checkupItemId);
			pds = this.medicalexamitemService.listMedicalItemByCheckuoItemId(checkupItemId);
			if(pds!=null&&pds.size()>0){
				msg = "success";
				map.put("data", pds);
			}else{
				msg = "no";
			}
		}else{
			msg = "paramerror";
		}	
		pd.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	public static void main(String[] args) {
		if((!"平台发布".equals("平台发布"))&&(!"新建1".equals("平台发布"))){
			System.out.println(1111);
		}
	}
	
}
