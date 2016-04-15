package com.shouxin.controller.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;
import com.shouxin.controller.base.BaseController;
import com.shouxin.service.admin.tag.TagManager;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.Jurisdiction;
import com.shouxin.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Controller
@RequestMapping(value="/resttag")
public class TagRestController extends BaseController {

	@Resource(name="tagService")
	private TagManager tagService;
	@Resource(name="tagcategoryService")
	private TagCategoryManager tagcategoryService;
	
	/**
	 * 查询所有的标签分类
	 * url http://localhost:8080/ihealth/resttag/listAllTagCategory
	 * @return[
	 * 		"msg":"success";(success 为获取数据成功，no为获取数据失败)
	 * 		"data":{
	 * 		"NAME":标签分类名称
	 * 		"METATYPE":标签分类所属特性
	 * 		"isExclusive":这个分类下的标签是否可以多选，暂时使用的是1，0 （1为可以多选，0为不行）
	 * 		}
	 * ]
	 * @throws Exception
	 */
	@RequestMapping(value="/listAllTagCategory",method=RequestMethod.POST)
	public Object listAllTagCategory() throws Exception{
//		logBefore(logger, Jurisdiction.getUsername()+"列表TagCategory");
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> tagCategory = tagcategoryService.listAll(pd);
		if(tagCategory!=null && tagCategory.size()>0){
			msg = "success";
			map.put("data", tagCategory);
		}else{
			msg = "no";
		}
		map.put("success", msg);
		logBefore(logger, AppUtil.returnObject(new PageData(), map)+"列表tagCategoorySIZE+++++++++++");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/listAllDiseaseByDiseaseCategoryID",method=RequestMethod.POST)
	public Object listAllDiseaseByDiseaseCategoryID(HttpServletRequest req) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null;
		PageData pd = new PageData();
		pd=this.getPageData();
		String tagCategory_ID = req.getParameter("tagCategory_ID");
		logBefore(logger,  tagCategory_ID+"tagid++++++++++");
		logBefore(logger,  pd.get("tagCategory_ID")+"tagid2222++++++++++");
		if(tagCategory_ID!=null && tagCategory_ID.equals("")){
			pd.put("TAGCATEGORY_ID", tagCategory_ID);
			List<PageData> tags = tagService.findAllByTagCategoryId(pd);
			msg = "success";
			map.put("data", tags);
		}else{
			msg="no";
		}
		logBefore(logger,  AppUtil.returnObject(new PageData(), map)+"tag++++++++++");
		return AppUtil.returnObject(new PageData(), map);
	}
	
}
