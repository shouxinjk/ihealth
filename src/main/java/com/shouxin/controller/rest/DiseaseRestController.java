package com.shouxin.controller.rest;

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
import com.shouxin.service.admin.disease.DiseaseManager;
import com.shouxin.service.admin.diseasecategory.DiseaseCategoryManager;
import com.shouxin.service.admin.tag.TagManager;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.PageData;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/restdisease")
public class DiseaseRestController extends BaseController {

	@Resource(name = "diseaseService")
	private DiseaseManager diseaseService;
	@Resource(name = "diseasecategoryService")
	private DiseaseCategoryManager diseasecategoryService;

	/**
	 * 查询所有的疾病
	 * url : http://localhost:8080/ihealth/restdisease/listAllDisease
	 * @return[
	 * 		"msg":"success";(success 为获取数据成功，no为获取数据失败)
	 * 		"allData" : { 这个是个人疾病信息
	 * 				"NAME":疾病名称，                                                              
	 * 				"DEXCRIPTION"：描述
	 * 				"ISINHERITABLE":是否遗传
	 * 				"ISHIGHINCIDENCE":是否高发
	 * 			}，
	 * 		"IsInheritableDiseaseData" : {这个事家族疾病信息
	 * 				"NAME":疾病名称，
	 * 				"DEXCRIPTION"：描述
	 * 				"ISINHERITABLE":是否遗传
	 * 				"ISHIGHINCIDENCE":是否高发
	 * 			}，
	 * 		"IsHighIncidence" : {这个是关注疾病信息
	 * 				"NAME":疾病名称，
	 * 				"DEXCRIPTION"：描述
	 * 				"ISINHERITABLE":是否遗传
	 * 				"ISHIGHINCIDENCE":是否高发
	 * 			}
	 *  ]
	 * 都需要对返回值进行循环遍历
	 * @throws Exception
	 */
	@RequestMapping(value = "/listAllDisease", method = RequestMethod.POST)
	public Object listAllTagCategory() throws Exception {
		// logBefore(logger, Jurisdiction.getUsername()+"列表TagCategory");
		Map<Object, Object> allMap = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> allDisease = diseaseService.listAll(pd);
		List<PageData> allIsInheritableDisease = diseaseService.listAllIsInheritable(pd);
		List<PageData> allIsHighIncidenceDiseae = diseaseService.listAllIsHighIncidence(pd);
		if (allDisease != null && allDisease.size() > 0 && allIsInheritableDisease != null
				&& allIsInheritableDisease.size() > 0 && allIsHighIncidenceDiseae != null
				&& allIsHighIncidenceDiseae.size() > 0) {
			allMap.put("allData", allDisease);
			allMap.put("IsInheritableDiseaseData", allIsInheritableDisease);
			allMap.put("IsHighIncidence", allIsHighIncidenceDiseae);
			msg = "success";
		} else {
			msg = "no";
		}
		allMap.put("msg", msg);
		logBefore(logger, AppUtil.returnObject(new PageData(), allMap)+"aaaa");
		return AppUtil.returnObject(new PageData(), allMap);
	}


	/**
	 * 为这个用户id添加疾病信息 url：http://localhost:8080/iheath/restdisease/addDisease
	 * 
	 * @param tag
	 *            参数一：userID 当前用户的id ，参数二 diseaseID 所有选中疾病的id 将选中的疾病的id拼接为以逗号 隔开的字符串
	 *            如:"1,2,3,4";
	 * @return 返回一个data:[ "msg":success (当值为success的时候就添加成功！ 为no添加不成功) ]
	 * @throws Exception
	 */
	@RequestMapping(value = "/addDisease")
	@ResponseBody
	public Object addTag(@RequestBody String disease) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(disease);
		String userId = json.get("userID").toString();
		String diseaseID = json.get("diseaseID").toString();
		String[] diseaseIDS = diseaseID.split(",");
		if (diseaseIDS != null && diseaseIDS.length > 0) {
			for (int i = 0; i < diseaseIDS.length; i++) {
				pd.put("ID", this.get32UUID());
				pd.put("USER_ID", userId);
				pd.put("DISEASE_ID", diseaseIDS[i]);
				diseaseService.saveUserAndDisease(pd);
			}
			msg = "success";
		} else {
			msg = "no";
		}
		map.put("msg", msg);

		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 修改属于用户的标签信息 URL：http://localhost:8080/ihealth/rest/updateTag
	 * 
	 * @param tag
	 *            参数一：userID 当前用户的id ，参数二 tagID 所有选中标签的id 将选中的标签的id拼接为以逗号 隔开的字符串
	 *            如:"1,2,3,4";
	 * @return 返回一个data:[ "msg":success (当值为success的时候就添加成功！ 为no添加不成功) ]
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateDisease")
	@ResponseBody
	public Object upadteTag(@RequestBody String disease) throws Exception {
		logBefore(logger, "修改标签信息");
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(disease);
		String userID = json.get("userID").toString();
		String allDiseaseIDStr = json.get("diseaseID").toString();
		String[] allDiseaseID = allDiseaseIDStr.split(",");
		if (allDiseaseIDStr != null && allDiseaseID.length > 0 && userID != null) {
			pd.put("USER_ID", userID);
			diseaseService.deleteDiseaseByUserID(pd);
			for (int i = 0; i < allDiseaseID.length; i++) {
				pd.put("ID", this.get32UUID());
				pd.put("USER_ID", userID);
				pd.put("DISEASE_ID", allDiseaseID[i]);
				diseaseService.saveUserAndDisease(pd);
				msg = "success";
			}
		} else {
			msg = "no";
		}
		map.put("msg", msg);

		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 查询该用户下所有的疾病信息
	 * url : http://localhost:8080/ihealth/restdisease/listAllDiseaseByUserID
	 * @return[
	 * 		"msg":"success";(success 为获取数据成功，no为获取数据失败)
	 * 		"allData" : { 这个是个人疾病信息
	 * 				"NAME":疾病名称，                                                              
	 * 				"DEXCRIPTION"：描述
	 * 				"ISINHERITABLE":是否遗传
	 * 				"ISHIGHINCIDENCE":是否高发
	 * 			}，
	 * 		"IsInheritableDiseaseData" : {这个事家族疾病信息
	 * 				"NAME":疾病名称，
	 * 				"DEXCRIPTION"：描述
	 * 				"ISINHERITABLE":是否遗传
	 * 				"ISHIGHINCIDENCE":是否高发
	 * 			}，
	 * 		"IsHighIncidence" : {这个是关注疾病信息
	 * 				"NAME":疾病名称，
	 * 				"DEXCRIPTION"：描述
	 * 				"ISINHERITABLE":是否遗传
	 * 				"ISHIGHINCIDENCE":是否高发
	 * 			}
	 *  ]
	 * 都需要对返回值进行循环遍历
	 * @throws Exception
	 */
	@RequestMapping(value = "/listAllDiseaseByUserID")
	@ResponseBody
	public Object listAllTagByUserID(@RequestBody String userID) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(userID);
		String user = json.get("userID").toString();
		if (user != null && !user.equals("")) {
			pd.put("USER_ID", user);
			List<PageData> allDisease = diseaseService.listAllByUserID(pd);
			List<PageData> allDiseaseIsHighIncaidence = diseaseService.listAllByUserIDIsHighIncaidence(pd);
			List<PageData> allDiseaseIsInherItable = diseaseService.listAllByUserIDIsInherItable(pd);
			msg = "success";
			map.put("allData", allDisease);
			map.put("IsInheritableDiseaseData", allDiseaseIsHighIncaidence);
			map.put("IsHighIncidence", allDiseaseIsInherItable);
		} else {
			msg = "no";
		}
		map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	};
}
