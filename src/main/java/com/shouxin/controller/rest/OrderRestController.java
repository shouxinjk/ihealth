package com.shouxin.controller.rest;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shouxin.service.medical.medicalorder.MedicalOrderManager;
import com.shouxin.service.medical.order.OrderManager;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/restOrder")
public class OrderRestController {
	
	@Resource(name="orderService")
	private OrderManager orderService;
	
	@RequestMapping(value="/addOrder",method=RequestMethod.POST)
	@ResponseBody
	public Object addOrder(@RequestBody String souid) throws Exception{
		JSONObject json = JSONObject.fromObject(souid);
		String solutionID = json.getString("solutionID").toString();
		String[] solutionIDS = solutionID.split(",");
		for(int i=0;i<solutionIDS.length;i++){
//			String examitemID
//			= orderService.findExamItemByExamSolutionId(solutionIDS[i]);
			System.out.println(solutionIDS[i]);
		}
		return null;
	}
	
}
