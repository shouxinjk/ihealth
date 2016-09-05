package com.shouxin.controller.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shouxin.controller.base.BaseController;
import com.shouxin.service.admin.tag.TagManager;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;
import com.shouxin.service.system.appuser.AppuserManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.Jurisdiction;
import com.shouxin.util.PageData;
import com.shouxinjk.ihealth.data.Transfer;
import com.shouxinjk.ihealth.data.pojo.UserTag;

import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/resttag")
public class TagRestController extends BaseController {

	@Resource(name = "tagService")
	private TagManager tagService;
	@Resource(name = "tagcategoryService")
	private TagCategoryManager tagcategoryService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;

	/**
	 * 查询所有的标签分类 url
	 * http://localhost:8080/ihealth/resttag/listAllTagCategory @return[
	 * "msg":"success";(success 为获取数据成功，no为获取数据失败) "data":{ "NAME":标签分类名称
	 * "METATYPE":标签分类所属特性 "isExclusive":这个分类下的标签是否可以多选，暂时使用的是1，0 （1为可以多选，0为不行）
	 * } ]
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/listAllTagCategory", method = RequestMethod.POST)
	@ResponseBody
	public Object listAllTagCategory() throws Exception {
		// logBefore(logger, Jurisdiction.getUsername()+"列表TagCategory");
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> tagCategory = tagcategoryService.listAllFu(pd);
		if (tagCategory != null && tagCategory.size() > 0) {
			msg = "success";
			map.put("data", tagCategory);
		} else {
			msg = "no";
		}
		map.put("success", msg);
		logBefore(logger, AppUtil.returnObject(new PageData(), map) + "列表tagCategoorySIZE+++++++++++");
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 根据标签分类id查询这个标签分类下的所有标签信息 url
	 * http://localhost:8080/resttag/listAllDiseaseByDiseaseCategoryID
	 * 
	 * @param tagCategory参数：String
	 *            tagCategory 标签分类id
	 * @return 返回值 需要对data进行遍历[ "msg":success (success为查询成功 no为查询不成功) "data":{
	 *         "NAME":标签名称 "EXPRESSION":选择标签后的脚本表达式 }， "data":{ "NAME":标签名称
	 *         "EXPRESSION":选择标签后的脚本表达式 } ]
	 * @throws Exception
	 */
	@RequestMapping(value = "/listAllTagByTagCategoryID", method = RequestMethod.POST)
	@ResponseBody
	public Object listAllDiseaseByDiseaseCategoryID(@RequestBody String tagCategory) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		logBefore(logger, tagCategory+"json+++++++++++");
		JSONObject json = JSONObject.fromObject(tagCategory);
		String tagCategory_ID = json.get("tagCategory_ID").toString();
		if (tagCategory_ID != null && !tagCategory_ID.equals("")) {
			pd.put("TAGCATEGORY_ID", tagCategory_ID);
			List<PageData> tags = tagService.findAllByTagCategoryId(pd);
			logBefore(logger, tags.size() + "tag++++++++++");
			msg = "success";
			map.put("data", tags);
		} else {
			msg = "no";
		}
		map.put("msg", msg);
		logBefore(logger, AppUtil.returnObject(new PageData(), map) + "tag++++++++++");
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 为这个用户id添加标签信息 url：http://localhost:8080/iheath/resttag/addTag
	 * 
	 * @param tag
	 *            参数一：userID 当前用户的id ，参数二 tagID 所有选中标签的id 将选中的标签的id拼接为以逗号 隔开的字符串
	 *            如:"1,2,3,4";
	 * @return 返回一个data:[ "msg":success (当值为success的时候就添加成功！ 为no添加不成功) ]
	 * @throws Exception
	 */
	@RequestMapping(value = "/addTag")
	@ResponseBody
	public Object addTag(@RequestBody String tag) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(tag);
		String userId = json.get("userID").toString();
		String tagId = json.get("tagID").toString();
		String[] tagIDS = tagId.split(",");
		if (tagIDS != null && tagIDS.length > 0) {
			for (int i = 0; i < tagIDS.length; i++) {
				pd.put("ID", this.get32UUID());
				pd.put("USER_ID", userId);
				pd.put("TAG_ID", tagIDS[i]);
				tagService.addAll(pd);
			}
			msg = "success";
		} else {
			msg = "no";
		}
		//qchzhu: hook analysis interface
		Transfer transfer = Transfer.getInstance();
		transfer.transferUserTags(userId);
//		UserTag userTag = new UserTag();
//		userTag.setUser_id(userId);
//		PageData pdTemp = new PageData();
//		pdTemp.put("USER_ID", userId);
//		List<PageData> tags = tagService.listTagByUserID(pdTemp);
//		for(PageData pdTag:tags){
//			userTag.addTag(pdTag.getString("NAME"), pdTag.getString("fieldName"),pdTag.getString("EXPRESSION"));
//		}
//		transfer.transferUserTags(userTag);
		//end
		map.put("msg", msg);

		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 修改属于用户的标签信息 URL：http://localhost:8080/ihealth/resttag/updateTag
	 * 
	 * @param tag
	 *            参数一：userID 当前用户的id ，参数二 tagID 所有选中标签的id 将选中的标签的id拼接为以逗号 隔开的字符串
	 *            如:"1,2,3,4";
	 * @return 返回一个data:[ "msg":success (当值为success的时候就添加成功！ 为no添加不成功) ]
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateTag")
	@ResponseBody
	public Object upadteTag(@RequestBody String tag) throws Exception {
		logBefore(logger, "修改标签信息");
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = JSONObject.fromObject(tag);
		String userID = json.get("userID").toString();
		String allTagIdStr = json.get("tagID").toString();
		String[] allTagID = allTagIdStr.split(",");
		if (allTagIdStr != null && allTagID.length > 0 && userID != null) {
			pd.put("USER_ID", userID);
			tagService.deleteTagByUserID(pd);
			for (int i = 0; i < allTagID.length; i++) {
				pd.put("ID", this.get32UUID());
				pd.put("USER_ID", userID);
				pd.put("TAG_ID", allTagID[i]);
				tagService.addAll(pd);
				msg = "success";
			}
			this.appuserService.editUserIsModify(userID);
		} else {
			msg = "no";
		}
		//qchzhu: hook analysis interface
		Transfer transfer = Transfer.getInstance();
		transfer.transferUserTags(userID);
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
	
	/**
	 * 通过用户id获取该用户所属的标签信息
	 * url:http://localhost:8080/ihealth/resttag/listAllTagByUserID
	 * 
	 * @param userID 参数 userID 当前用户的id
	 * @return 返回 data：[
	 * 				"msg":success (success为查询成功，no为查询失败)
	 * 				"data":{
	 * 					"NAME":标签名称，
	 * 					"TAGCATEGORY_ID":标签所属分类的id
	 * 					"EXPRESSION":选择标签后的脚本
	 * 					"TAG_ID":标签主键id
	 * 				}，
	 * 				{
	 * 					"NAME":标签名称，
	 * 					"TAGCATEGORY_ID":标签所属分类的id
	 * 					"EXPRESSION":选择标签后的脚本
	 * 					"TAG_ID":标签主键id
	 * 				}
	 * 				]
	 * 			返回值需要进行循环遍历，会有多条标签信息
	 * @throws Exception
	 */
	@RequestMapping(value = "/listAllTagByUserID")
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
			List<PageData> tags = tagService.listTagByUserID(pd);
			msg="success";
			map.put("data", tags);
		}else{
			msg="no";
		}
		map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	};

}
 