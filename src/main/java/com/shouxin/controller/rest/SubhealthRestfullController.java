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
import com.shouxin.service.subhealth.subhealth.SubhealthManager;
import com.shouxin.service.subhealth.subhealthcategory.SubhealthcategoryManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.PageData;
import com.shouxinjk.ihealth.data.Transfer;
import com.shouxinjk.ihealth.data.pojo.UserTag;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="/restSubhealth")
public class SubhealthRestfullController extends BaseController {
	
	@Resource(name="subhealthService")
	private SubhealthManager subhealthService;
	@Resource(name="subhealthcategoryService")
	private SubhealthcategoryManager subhealthcategoryService;
	
	
	/**
	 * 查询所有的标签分类 url
	 * http://localhost:8080/ihealth/restSubhealth/listAllTSubhealthAndCategory 
	 * @param {"userID":"用户id"}
	 * @return[
	 * "creategoryResult":"success";(success 为获亚健康分类数据成功，no为获取亚健康分类数据失败) 
	 * "subhealthResult":"success";(success 为获亚健康症状数据成功，no为获取亚健康症状数据失败) 
	 * "suserResult":"success";(success 为获属于用户亚健康症状数据成功，no为属于用户获取亚健康症状数据失败) 
	 * "categorydata":{ "NAME":亚健康分类名称,"SUBHEALTHCATEGORY_ID":亚健康分类id
	 * } ]
	 * "subdata":{ "NAME":亚健康症状名称,"SUBHEALTHCATEGORY_ID":亚健康分类id,",
	 * 					   "SUBHEALTH_ID":"亚健康症状id",
	 * } ]
	 * "userdata":{ "NAME":亚健康症状名称,"SUBHEALTHCATEGORY_ID":亚健康分类id,",
	 * 					   "SUBHEALTH_ID":"亚健康症状id",
	 * } ]
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/listAllTSubhealthAndCategory", method = RequestMethod.POST)
	@ResponseBody
	public Object listAllTagCategory(@RequestBody String userID) throws Exception {
		// logBefore(logger, Jurisdiction.getUsername()+"列表TagCategory");
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		String msg2 = null,usermsg = null;
		
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(userID);
		String user = json.get("userID").toString();
		List<PageData> subhealthcategory = this.subhealthcategoryService.listAll(pd);
		List<PageData> subhealth = this.subhealthService.restListAll(pd);
		if (user != null && !user.equals("")) {
			List<PageData> tags = this.subhealthService.restListSubhealthByUserID(user);
			usermsg="success";
			map.put("userdata", tags);
		}else{
			usermsg="no";
		}
		if (subhealthcategory != null && subhealthcategory.size() > 0) {
			msg = "success";
			map.put("categorydata", subhealthcategory);
		} else {
			msg = "no";
		}
		
		if (subhealth != null && subhealth.size() > 0) {
			msg2 = "success";
			map.put("subdata", subhealth);
		} else {
			msg2 = "no";
		}
		map.put("creategoryResult", msg);
		map.put("subhealthResult", msg2);
		map.put("userResult", usermsg);
		logBefore(logger, AppUtil.returnObject(new PageData(), map) + "列表tagCategoorySIZE+++++++++++");
		return AppUtil.returnObject(new PageData(), map);
	}
	
//	/**
//	 * 通过用户id获取该用户所属的标签信息
//	 * url:http://localhost:8080/ihealth/resttag/listAllTagByUserID
//	 * 
//	 * @param userID 参数 userID 当前用户的id
//	 * @return 返回 data：[
//	 * 				"msg":success (success为查询成功，no为查询失败)
//	 * 				"data":{
//	 * 					"NAME":标签名称，
//	 * 					"TAGCATEGORY_ID":标签所属分类的id
//	 * 					"EXPRESSION":选择标签后的脚本
//	 * 					"TAG_ID":标签主键id
//	 * 				}，
//	 * 				{
//	 * 					"NAME":标签名称，
//	 * 					"TAGCATEGORY_ID":标签所属分类的id
//	 * 					"EXPRESSION":选择标签后的脚本
//	 * 					"TAG_ID":标签主键id
//	 * 				}
//	 * 				]
//	 * 			返回值需要进行循环遍历，会有多条标签信息
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/listAllTagByUserID")
//	@ResponseBody
//	public Object listAllTagByUserID(@RequestBody String userID) throws Exception {
//		Map<Object, Object> map = new HashMap<Object, Object>();
//		String msg = null;
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		JSONObject json = JSONObject.fromObject(userID);
//		String user = json.get("userID").toString();
//		if (user != null && !user.equals("")) {
//			pd.put("USER_ID", user);
//			List<PageData> tags = tagService.listTagByUserID(pd);
//			msg="success";
//			map.put("data", tags);
//		}else{
//			msg="no";
//		}
//		map.put("msg", msg);
//		return AppUtil.returnObject(new PageData(), map);
//	};
	
	/**
	 * 修改属于用户的标签信息 URL：http://localhost:8080/ihealth/restSubhealth/updateSubhealth
	 * 
	 * @param tag
	 *            参数一：userID 当前用户的id ，参数二 subhealthID 所有选中亚健康的id 将选中的亚健康的id拼接为以逗号 隔开的字符串
	 *            如:"1,2,3,4";
	 * @return 返回一个data:[ "msg":success (当值为success的时候就添加成功！ 为no添加不成功) ]
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateSubhealth")
	@ResponseBody
	public Object upadteTag(@RequestBody String subhealth) throws Exception {
		logBefore(logger, "修改标签信息");
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(subhealth);
		String userID = json.get("userID").toString();
		String allSubhealthStr = json.get("subhealthID").toString();
		String[] allSubhealthID = allSubhealthStr.split(",");
		if (allSubhealthStr != null && allSubhealthID.length > 0 && userID != null) {
			this.subhealthService.restDeleteUserSubhealth(userID);
			for (int i = 0; i < allSubhealthID.length; i++) {
				pd.put("ID", this.get32UUID());
				pd.put("USER_ID", userID);
				pd.put("SUBHEALTH_ID", allSubhealthID[i]);
				this.subhealthService.restSaveUserSubhealth(pd);
				msg = "success";
			}
		} else {
			msg = "no";
		}
		//qchzhu: hook analysis interface
//		Transfer transfer = Transfer.getInstance();
//		UserTag userTag = new UserTag();
//		userTag.setUser_id(userID);
//		PageData pdTemp = new PageData();
//		pdTemp.put("USER_ID", userID);
//		List<PageData> tags = tagService.listTagByUserID(pdTemp);
//		for(PageData pdTag:tags){
//			userTag.addTag(pdTag.getString("NAME"), pdTag.getString("fieldName"),pdTag.getString("EXPRESSION"));
//		}
//		transfer.transferUserTags(userTag);
		//end
		map.put("msg", msg);

		return AppUtil.returnObject(new PageData(), map);
	}
	
}
