package com.shouxin.controller.rest;

import java.security.MessageDigest;
import java.util.ArrayList;
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
import com.shouxin.entity.admin.Disease;
import com.shouxin.entity.admin.DiseaseAndUser;
import com.shouxin.entity.admin.Tag;
import com.shouxin.entity.admin.TagAndUser;
import com.shouxin.service.admin.disease.DiseaseManager;
import com.shouxin.service.admin.tag.TagManager;
import com.shouxin.service.checkup.checkupitem.CheckupItemManager;
import com.shouxin.service.checkup.checkuppackage.CheckupPackageManager;
import com.shouxin.service.enterprise.enterprise.EnterpriseManager;
import com.shouxin.service.system.appuser.AppuserManager;
import com.shouxin.service.system.user.UserManager;
import com.shouxin.util.AppUtil;
import com.shouxin.util.DateUtil;
import com.shouxin.util.PageData;
import com.shouxin.util.RepeatString;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 对外企业添加企业用户，查询企业用户体检套餐接口
 * @author yxd1
 *
 */
@Controller
@RequestMapping(value="/rest/company")
public class ForeignRestController extends BaseController {
	
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	@Resource(name = "diseaseService")
	private DiseaseManager diseaseService;
	@Resource(name = "tagService")
	private TagManager tagService;
	@Resource(name = "checkuppackageService")
	private CheckupPackageManager checkuppackageService;
	@Resource(name = "checkupitemService")
	private CheckupItemManager checkupitemService;
	@Resource(name="enterpriseService")
	private EnterpriseManager enterpriseService;
	@Resource(name="userService")
	private UserManager userService;
	
	/**
	 * 添加企业，和企业管理员
	 * @param enterprise
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/new",method = RequestMethod.POST)
	@ResponseBody
	public Object addEnterpris(@RequestBody String enterprise) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject jsonObject = JSONObject.fromObject(enterprise);
		String name=null,abbreviation=null,telephone=null,location=null,parent=null,parentID=null;
		String msg = "success";
		String appkey = null;
		String parentId = this.get32UUID();
		if(jsonObject.get("parent")!=null&&!jsonObject.get("parent").equals("")){
			boolean a = true;
			parent = jsonObject.getString("parent");
			JSONObject jo = JSONObject.fromObject(parent);
			if(jo.get("abbreviation")!=null&&!jo.get("abbreviation").equals("")){
				abbreviation = jo.getString("abbreviation");
				pd.put("ABBREVIATION", abbreviation);
			}
			if(jo.get("telephone")!=null&&!jo.get("telephone").equals("")){
				telephone = jo.getString("telephone");
				pd.put("TELEPHONE", telephone);
			}
			if(jo.get("location")!=null&&!jo.get("location").equals("")){
				location = jo.getString("location");
				pd.put("LOCATION", location);
			}
			if(jo.get("name")!=null&&!jo.get("name").equals("")){
				name = jo.getString("name");
				pd.put("NAME", name);
				MessageDigest md = MessageDigest.getInstance("MD5");  
				appkey = MD5(name,md);
				PageData data = new PageData();
				data = this.enterpriseService.findEnterpriseByAppkey(appkey);
				pd.put("APPKEY", appkey);
				if(data!=null&&data.get("ENTERPRISE_ID")!=null&&!data.get("ENTERPRISE_ID").equals("")){
					this.enterpriseService.editEN(pd);
					parentID = data.getString("ENTERPRISE_ID");
				}else{
					pd.put("ENTERPRISE_ID", parentId);
					parentID = parentId;
					this.enterpriseService.save(pd);
				}
			}
		}
		pd.clear();
		pd.put("PARENTID", parentID);
		pd.put("ENTERPRISE_ID", this.get32UUID());
		if(jsonObject.get("abbreviation")!=null&&!jsonObject.get("abbreviation").equals("")){
			abbreviation = jsonObject.getString("abbreviation");
			pd.put("ABBREVIATION", abbreviation);
		}
		if(jsonObject.get("telephone")!=null&&!jsonObject.get("telephone").equals("")){
			telephone = jsonObject.getString("telephone");
			pd.put("TELEPHONE", telephone);
		}
		if(jsonObject.get("location")!=null&&!jsonObject.get("location").equals("")){
			location = jsonObject.getString("location");
			pd.put("LOCATION", location);
		}
		if(jsonObject.get("name")!=null&&!jsonObject.get("name").equals("")){
			name = jsonObject.getString("name");
			 MessageDigest md = MessageDigest.getInstance("MD5");  
			appkey = MD5(name,md);
			PageData data = new PageData();
			data = this.enterpriseService.findEnterpriseByAppkey(appkey);
			pd.put("NAME", name);
			pd.put("APPKEY", appkey);
			if(data!=null&&data.get("ENTERPRISE_ID")!=null&&!data.get("ENTERPRISE_ID").equals("")){
				msg = "update";
			}
		}else{
			msg="null";
		}
		if(msg.equals("success")){
			this.enterpriseService.save(pd);
			pd.clear();
			String id = this.get32UUID();
			pd.put("USER_ID", id);	//ID 主键
			pd.put("LAST_LOGIN", DateUtil.getTime());				//最后登录时间
			pd.put("IP", "");						//IP
			pd.put("STATUS", "0");					//状态
			pd.put("NAME",telephone);
			pd.put("PASSWORD", "000000");
			pd.put("PHONE", telephone);
			pd.put("SKIN", "default");
			pd.put("RIGHTS", "");	
			pd.put("ROLE_ID", "3");
			pd.put("APPKEY", appkey);
			this.userService.saveU(pd);
			pd.clear();
			pd.put("USER_ID", id);
			pd = this.userService.findById(pd);
			if(pd.get("USER_ID")==null){
				msg = "no";
			}
			map.put("appkey", appkey);
			map.put("user", pd);
			
		}else if(msg.equals("null")){
			msg = "error";
			String describe = "企业名称为null";
			map.put("describe", describe);
		}else if(msg.equals("update")){
			this.enterpriseService.editEN(pd);
			msg="success";
		}
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 将字符串转换为md5加密模式
	 * @param strSrc
	 * @param md
	 * @return
	 */
	public String MD5(String strSrc,MessageDigest  md) {  
        byte[] bt = strSrc.getBytes();  
        md.update(bt);  
        String strDes = bytes2Hex(md.digest()); // to HexString  
        return strDes;  
    }  
    private String bytes2Hex(byte[] bts) {  
        StringBuffer des = new StringBuffer();  
        String tmp = null;  
        for (int i = 0; i < bts.length; i++) {  
            tmp = (Integer.toHexString(bts[i] & 0xFF));  
            if (tmp.length() == 1) {  
                des.append("0");  
            }  
            des.append(tmp);  
        }  
        return des.toString();  
    }  
	
    /**
     * 添加企业员工信息
     * @param users
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/user", method = RequestMethod.POST)
	@ResponseBody
	public Object addAllEnterpriseUser(@RequestBody String users) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject jsonObject = JSONObject.fromObject(users);
		JSONArray user = JSONArray.fromObject(jsonObject.get("aa"));
		List<PageData> pds = new ArrayList<PageData>();
		List<DiseaseAndUser> daup = new ArrayList<DiseaseAndUser>();
		List<DiseaseAndUser> dauj =  new ArrayList<DiseaseAndUser>();
		List<DiseaseAndUser> daug =  new ArrayList<DiseaseAndUser>();
		List<TagAndUser> tau = new ArrayList<TagAndUser>();
		String nullDisease = "";
		String nullTag = "";
		String msg = "success";
		boolean nullDT = true;
		boolean paramError = true;
		System.out.println(user);
		for(int i=0;i<user.size();i++){
			PageData pd1 = new PageData();
			JSONObject jo = JSONObject.fromObject(user.get(i));
			String name=null,birthday=null,sex=null,phone=null,marriage=null,height=null,weight=null,job=null,
			degree=null,placeofbirth=null,address=null,disease=null,tag=null,appkey=null;
			String userId = this.get32UUID();
			if(jo.get("name")!=null&&!jo.get("name").equals("")){
				name = jo.getString("name");
				pd1.put("NAME", name);
			}else{
				paramError = false;
			}
			if(jo.get("appkey")!=null && !jo.get("appkey").equals("")){
				appkey = jo.getString("appkey");
				pd1.put("APPKEY", appkey);
			}else{
				paramError = false;
			}
			if(jo.get("birthday")!=null&&!jo.get("birthday").equals("")){
				birthday = jo.getString("birthday");
				pd1.put("BIRTHDAY", birthday);
			}else{
				paramError = false;
			}
			if(jo.get("sex")!=null&&!jo.get("sex").equals("")){
				sex = jo.getString("sex");
				pd1.put("SEX", sex);
			}else{
				paramError = false;
			}
			if(jo.get("phone")!=null&&!jo.get("phone").equals("")){
				phone = jo.getString("phone");
				pd1.put("PHONE", phone);
			}else{
				paramError = false;
			}
			if(jo.get("marriage")!=null&&!jo.get("marriage").equals("")){
				marriage = jo.getString("marriage");
				pd1.put("MARRIAGESTATUS", "已婚");
			}else{
				paramError = false;
			}
			if(jo.get("height")!=null&&!jo.get("height").equals("")){
				height = jo.getString("height");
				int h = Integer.parseInt(height);
				pd1.put("HEIGHT", h);
			}else{
				paramError = false;
			}
			if(jo.get("weight")!=null&&!jo.get("weight").equals("")){
				weight = jo.getString("weight");
				int w = Integer.parseInt(weight);
				pd1.put("WEIGHT", w);
			}else{
				paramError = false;
			}
			if(jo.get("job")!=null&&!jo.get("job").equals("")){
				job = jo.getString("job");
				pd1.put("CAREER",job);
			}else{
				paramError = false;
			}
			if(jo.get("degree")!=null&&!jo.get("degree").equals("")){
				degree = jo.getString("degree");
				pd1.put("DEGREE", degree);
			}
			if(jo.get("placeofbirth")!=null&&!jo.get("placeofbirth").equals("")){
				placeofbirth = jo.getString("placeofbirth");
				pd1.put("BIRTHPLACE", placeofbirth);
			}
			if(jo.get("address")!=null&&!jo.get("address").equals("")){
				address = jo.getString("address");
				pd1.put("LIVEPLACE", address);
			}else{
				paramError = false;
			}
			pd1.put("USER_ID", userId);
			pds.add(pd1);
			if(jo.get("disease")!=null&&!jo.get("disease").equals("")){
				disease = jo.getString("disease");
				String[] diseases = disease.split(",");
				for (int j = 0; j < diseases.length; j++) {
					Disease diseased = this.diseaseService.findDiseaseByName(diseases[j]);
					if(diseased!=null){
						if(diseased.getISINHERITABLE()==1){
							DiseaseAndUser d = new DiseaseAndUser();
							d.setID(this.get32UUID());
							d.setUSER_ID(userId);
							d.setDISEASE_ID(diseased.getDISEASE_ID());
							dauj.add(d);
						}
						if(diseased.getISHIGHINCIDENCE()==1){
							DiseaseAndUser d = new DiseaseAndUser();
							d.setID(this.get32UUID());
							d.setUSER_ID(userId);
							d.setDISEASE_ID(diseased.getDISEASE_ID());
							daug.add(d);
						}
						DiseaseAndUser d = new DiseaseAndUser();
						d.setID(this.get32UUID());
						d.setUSER_ID(userId);
						d.setDISEASE_ID(diseased.getDISEASE_ID());
						daup.add(d);
					}else{
						nullDisease+=diseases[j]+",";
						nullDT = false;
					}
					
				}
			}else{
				paramError = false;
			}
			if(jo.get("tag")!=null&&!jo.get("tag").equals("")){
				tag = jo.getString("tag");
				String[] tags = tag.split(",");
				for (int j = 0; j < tags.length; j++) {
					Tag tagt = this.tagService.findTagByName(tags[j]);
					if(tagt!=null){
						TagAndUser t = new TagAndUser();
						t.setID(this.get32UUID());
						t.setTAG_ID(tagt.getTAG_ID());
						t.setUSER_ID(userId);
						tau.add(t);
					}else{
						nullTag += tags[j]+",";
						nullDT = false;
					}
				}
			}else{
				paramError = false;
			}
		}
		if(!paramError){
			map.put("result", "paramError");
			return AppUtil.returnObject(new PageData(), map);
		}
		if(nullDT){
			for (PageData pd2 : pds) {
				String id = this.appuserService.findEnterpriseUserByPhone(pd2.getString("PHONE"));
				if(id!=null&&!id.equals("")){
					pd2.put("USER_ID", id);
					this.appuserService.updateEnterpriseUser(pd2);
				}else{
					this.appuserService.saveEnterpriseUser(pd2);
				}
			}
			if(daup.size()>0){
				this.appuserService.saveEnterpriseUserDisease(daup);
			}
			System.out.println(dauj.size());
			if(dauj.size()>0){
				this.appuserService.saveEnterpriseUserDiseasefamily(dauj);
			}
			if(daug.size()>0){
				this.appuserService.saveEnterpriseUserDiseasefocus(daug);
			}
			if(tau.size()>0){
				this.appuserService.saveEnterpriseUserTag(tau);
			}
		}else{
			String miaoshu="";
			if(nullDisease!=null&&!nullDisease.equals("")){
				nullDisease = RepeatString.repeat(nullDisease);
				miaoshu+=nullDisease+"等疾病信息不存在。";
			}
			if(nullTag!=null && !nullTag.equals("")){
				nullTag = RepeatString.repeat(nullTag);
				miaoshu+=nullTag+"等标签信息不存在。";
			}
			msg = "defect";
			map.put("describe", miaoshu);
		}
		map.put("result", msg);
		
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**
	 * 根据用户电话获取体检项目 
	 * type:post
	 * 
	 * @param {"phone":"用户电话"}
	 * @return 当电话不为空，并且数据库中存在这个用户电话时、返回以下数据，需要注意的是，一个用户有多个体检项目，需要循环取值 
	 * 			{
	 *         "result": "success", 
	 *         "data": [ { 
	 *         			"REVISION": 版本, 				"STATUS":"状态，包括：已选中，已删除", 
	 *         			"DESCRIPTION": "详细描述", 		"GENERATEDTIME": 该记录生成时间,
	 *         			"FREQUENCY": "每年一次", 			"ORIGINATE": "指南来源", 
	 *         			"WORKER": "用于产生该记录的标记",		"SUBGROUP": "检查项目分组", 
	 *         			"SYSFLAG": "系统标记", 			"NAME": "检查项目名称",
	 *         			"FEATURES": "检查频率，是文字描述", 	"CHECKUPITEM_ID": "ID" 
	 *         			} ] 
	 *         }
	 *         当用户电话为空时返回：{"result": "error"} 
	 *         当根据电话查询出的数据为null时 返回：{"result": "no"}
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkupItems", method = RequestMethod.POST)
	@ResponseBody
	public Object getCheckItemsByGroup(@RequestBody String u) throws Exception {
		logBefore(logger, "查询--------根据用户ID，获取体检项目信息");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String msg = null,userId = null;
		PageData pd = new PageData();
		PageData data = new PageData();
		pd = this.getPageData();
		
		// 将String类型的数据转换为json
		JSONObject jasonObject = JSONObject.fromObject(u);
		if(jasonObject.get("phone")!=null && !jasonObject.get("phone").equals("")){
			pd.put("PHONE", jasonObject.get("phone"));
		}else{
			msg = "paramNull";
			map.put("result", msg);
			return AppUtil.returnObject(new PageData(), map);
		}
		if(jasonObject.get("appkey")!=null && !jasonObject.get("appkey").equals("")){
			pd.put("APPKEY", jasonObject.get("appkey"));
		}else{
			msg = "appkeyError";
			map.put("result", msg);
			return AppUtil.returnObject(new PageData(), map);
		}
		data = this.checkuppackageService.findByPhone(pd);
		String status = data.getString("STATUS");
		if(status.equals("ready")){
			List<PageData> pageDate = this.checkupitemService.findCIByIdOrSubGroup(pd);
			if (pageDate != null && pageDate.size() > 0) {
				msg = "success";
				map.put("data", pageDate);
			} else {
				msg = "no";
			}
		}else if(status.equals("pending")){
			msg = "pending";
		}
		
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

}
