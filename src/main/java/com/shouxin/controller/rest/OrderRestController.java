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
import com.shouxin.service.medical.medicalorder.MedicalOrderManager;
import com.shouxin.service.medical.order.OrderManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.PageData;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/restOrder")
public class OrderRestController extends BaseController {
	
	@Resource(name="orderService")
	private OrderManager orderService;
	
	@RequestMapping(value="/addOrder",method=RequestMethod.POST)
	@ResponseBody
	public Object addOrder(@RequestBody String souid) throws Exception{
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ORDER_ID =  this.get32UUID();
		String ORDERNO = this.get32UUID();
		pd.put("ORDER_ID", ORDER_ID);
		pd.put("ORDERNO", ORDERNO);
		pd.put("ORDERGENERATIONTIME", new Date());
		orderService.save(pd);
		JSONObject json = JSONObject.fromObject(souid);
		String solutionID = json.getString("solutionID").toString();
		String[] solutionIDS = solutionID.split(",");
		List<String> itemIDs = new ArrayList<String>();
		for(int i=0;i<solutionIDS.length;i++){
			String examitemID
			= orderService.findExamItemByExamSolutionId(solutionIDS[i]);
			itemIDs.add(examitemID);
		}
		System.out.println(itemIDs.size()+"=============");
		if(itemIDs.size()>0){
			orderService.saveOrderItem(itemIDs);
			allMap.put("msg", "yes");
		}else{
			allMap.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), allMap);
	}
	
}
