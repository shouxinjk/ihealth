package com.shouxin.controller.rest;

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
	/**
	 * 添加订单
	 * @param souid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addOrder",method=RequestMethod.POST)
	@ResponseBody
	public Object addOrder(@RequestBody String souid) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ORDER_ID =  this.get32UUID();
		String orderDateStr = OrderNo.getDateStr();
		String orderNo = this.orderService.getMaxOrderNo(orderDateStr);
		String orderNoStr = OrderNo.getOrderNo(orderNo);
		pd.put("ORDER_ID", ORDER_ID);
		if(!orderNoStr.equals("max")){
			pd.put("ORDERNO", orderNoStr);
		}
		pd.put("ORDERGENERATIONTIME", new Date());
		orderService.save(pd);
		JSONObject json = JSONObject.fromObject(souid);
		String solutionID = json.getString("solutionID").toString();
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
		pd.put("ORDERTOTALAMOUNT", ORDERTOTALAMOUNT);
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
			allMap.put("msg", "success");
			allMap.put("orderid", ORDER_ID);
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
			if(i<10){
				o.setMEDICALORDERNO(order.getORDERNO()+"-0"+i);
			}else{
				o.setMEDICALORDERNO(order.getORDERNO()+"-"+i);
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
			o.setMEDICALORDERTOTALAMOUNT(SELLINCPRICE);
			medicalOrder.add(o);
		}
		
		medicalorderService.saveAll(medicalOrder);
		medicalorderService.saveItemAll(medicalOrderItem);
		logBefore(logger, item.get(0).getMEDICALCENTER_ID()+"medicalcenter_id==");
		pd.put("STATUS", "已提交");
		orderService.updateOrderStatus(pd);
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
				if (pageDate != null && pageDate.size() > 0) {
					for (PageData p : pageDate) {
						List<PageData> pds = new ArrayList<PageData>();
						pds = this.medicalexamitemService.listMedicalItemByCheckuoItemId(p.getString("CHECKUPITEM_ID"));
						p.put("pds", pds);
					}
					msg = "success";
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
	
}
