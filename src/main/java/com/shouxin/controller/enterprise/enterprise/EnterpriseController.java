package com.shouxin.controller.enterprise.enterprise;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.shouxin.controller.base.BaseController;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Disease;
import com.shouxin.entity.admin.DiseaseAndUser;
import com.shouxin.entity.admin.Tag;
import com.shouxin.entity.admin.TagAndUser;
import com.shouxin.entity.system.Role;
import com.shouxin.util.AppUtil;
import com.shouxin.util.Const;
import com.shouxin.util.FileDownload;
import com.shouxin.util.FileUpload;
import com.shouxin.util.GetPinyin;
import com.shouxin.util.ObjectExcelView;
import com.shouxin.util.PageData;
import com.shouxin.util.PathUtil;
import com.shouxin.util.RepeatString;
import com.shouxin.util.Tools;
import com.shouxin.util.Jurisdiction;
import com.shouxin.util.ObjectExcelRead;
import com.shouxin.service.admin.disease.DiseaseManager;
import com.shouxin.service.admin.tag.TagManager;
import com.shouxin.service.enterprise.enterprise.EnterpriseManager;
import com.shouxin.service.system.appuser.AppuserManager;

/** 
 * 说明：企业管理
 * 创建人：shouxin
 * 创建时间：2016-06-28
 */
@Controller
@RequestMapping(value="/enterprise")
public class EnterpriseController extends BaseController {
	
	String menuUrl = "enterprise/list.do"; //菜单地址(权限用)
	@Resource(name="enterpriseService")
	private EnterpriseManager enterpriseService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	@Resource(name = "diseaseService")
	private DiseaseManager diseaseService;
	@Resource(name = "tagService")
	private TagManager tagService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Enterprise");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ENTERPRISE_ID", this.get32UUID());	//主键
		enterpriseService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 去导入exel表格页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goUploadExel")
	public ModelAndView getUploadExel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("enterprise/enterpriseuser/enterpriseuploadexcel");
		return mv;
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "appuser.xls", "appuser.xls");
	}
	
	/**
	 * 读取exel表格数据
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExel")
	public ModelAndView readExel(@RequestParam(value="excel",required=false) MultipartFile file)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		String USER_ID = Jurisdiction.getUserId();
		String appkey = this.enterpriseService.findAppkeyByUserid(USER_ID);
		String msg = "";
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "appuserexcel");							//执行上传
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);		//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			/*存入数据库操作======================================*/
			pd.put("STATUS", "0");					//状态
			pd.put("APPKEY", appkey);
			/**
			 * var0 :编号
			 * var1 :姓名
			 * var2 :手机
			 * var3 :身高
			 * var4  ：体重
			 * var5 :性别
			 * var6 :出生日期
			 * var7 :婚姻状况
			 * var8 :出生地
			 * var9：现住地
			 * var10:职位
			 * var11:疾病信息
			 * var12:生活方式信息
			 */
			for(int i=0;i<listPd.size();i++){	
				String userid = this.get32UUID();
				pd.put("USER_ID", userid);													//ID
				pd.put("NAME", listPd.get(i).getString("var1"));							//姓名
				pd.put("PHONE", listPd.get(i).getString("var2"));							//手机号
				pd.put("HEIGHT", Integer.parseInt(listPd.get(i).getString("var3")));		//身高
				pd.put("WEIGHT", Integer.parseInt(listPd.get(i).getString("var4")));		//体重
				pd.put("SEX", listPd.get(i).getString("var5"));								//性别
				pd.put("BIRTHDAY", listPd.get(i).getString("var6"));						//出生日期i
				pd.put("MARRIAGESTATUS", listPd.get(i).getString("var7"));					//婚姻状况
				pd.put("BIRTHPLACE", listPd.get(i).getString("var8"));						//出生地
				pd.put("LIVEPLACE", listPd.get(i).getString("var9"));						//现住地
				pd.put("CAREER", listPd.get(i).getString("var10"));							//职位信息
				if(appuserService.findEnterpriseUserByPhone(userid) != null && 
						!appuserService.findEnterpriseUserByPhone(userid).equals("")){
					this.appuserService.updateEnterpriseUser(pd);
				}else{
					this.appuserService.saveEnterpriseUser(pd);
					String[] diseases = listPd.get(i).getString("var11").split(",");
					String[] tags = listPd.get(i).getString("var12").split(",");
					List<DiseaseAndUser> dauj = new ArrayList<DiseaseAndUser>();
					List<DiseaseAndUser> daug = new ArrayList<DiseaseAndUser>();
					List<DiseaseAndUser> daup = new ArrayList<DiseaseAndUser>();
					List<TagAndUser> tau = new ArrayList<TagAndUser>();
					String nullDisease = "";
					String nullTag = "";
					boolean nullDt = true;
					for (int j = 0; j < diseases.length; j++) {
						Disease diseased = this.diseaseService.findDiseaseByName(diseases[j]);
						if(diseased!=null){
							if(diseased.getISINHERITABLE()==1){
								DiseaseAndUser d = new DiseaseAndUser();
								d.setID(this.get32UUID());
								d.setUSER_ID(userid);
								d.setDISEASE_ID(diseased.getDISEASE_ID());
								dauj.add(d);
							}
							if(diseased.getISHIGHINCIDENCE()==1){
								DiseaseAndUser d = new DiseaseAndUser();
								d.setID(this.get32UUID());
								d.setUSER_ID(userid);
								d.setDISEASE_ID(diseased.getDISEASE_ID());
								daug.add(d);
							}
							DiseaseAndUser d = new DiseaseAndUser();
							d.setID(this.get32UUID());
							d.setUSER_ID(userid);
							d.setDISEASE_ID(diseased.getDISEASE_ID());
							daup.add(d);
						}else{
							nullDisease+=diseases[j]+",";
							nullDt = false;
						}
					}
					
					for (int j = 0; j < tags.length; j++) {
						Tag tagt = this.tagService.findTagByName(tags[j]);
						if(tagt!=null){
							TagAndUser t = new TagAndUser();
							t.setID(this.get32UUID());
							t.setTAG_ID(tagt.getTAG_ID());
							t.setUSER_ID(userid);
							tau.add(t);
						}else{
							nullTag += tags[j]+",";
							nullDt = false;
						}
					}
					if(nullDt){
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
						msg = "success";
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
						mv.addObject("describe", miaoshu);
					}
				}
			}
			/*存入数据库操作======================================*/
			mv.addObject("msg",msg);
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Enterprise");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		enterpriseService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteUser")
	public void deleteUser(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Enterprise");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		enterpriseService.deleteUser(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Enterprise");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		enterpriseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editUser")
	public ModelAndView editUser() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Enterprise");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		this.appuserService.editU(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Enterprise");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String SYS_USER_ID = Jurisdiction.getUserId();
		String ENTERPRISE_ID = this.enterpriseService.findadminbyuserid(SYS_USER_ID);
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		if(null != ENTERPRISE_ID&&!"".equals(ENTERPRISE_ID)){
			pd.put("ENTERPRISE_ID", ENTERPRISE_ID);
		}
		page.setPd(pd);
		List<PageData>	varList = enterpriseService.list(page);	//列出Enterprise列表
		mv.setViewName("enterprise/enterprise/enterprise_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listEnterpriseUser")
	public ModelAndView listUser(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表EnterpriseUser");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String SYS_USER_ID = Jurisdiction.getUserId();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("SYS_USER_ID", SYS_USER_ID);
		page.setPd(pd);
		List<PageData>	varList = enterpriseService.dataEnterpriseUserlistPage(page);	//列出Enterprise列表
		mv.setViewName("enterprise/enterpriseuser/enterpriseuser_list");
		mv.addObject("varList", varList);
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
		mv.setViewName("enterprise/enterprise/enterprise_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddUser")
	public ModelAndView goAddUser()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("enterprise/enterpriseuser/enterpriseuser_edit");
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
		pd = enterpriseService.findById(pd);	//根据ID读取
		mv.setViewName("enterprise/enterprise/enterprise_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	  * @param
	  * @throws Exception
	  */
	@RequestMapping(value="/goEditUser")
	public ModelAndView goEditUser()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = this.appuserService.findByUiId(pd);	//根据ID读取
		mv.setViewName("enterprise/enterpriseuser/enterpriseuser_edit");
		mv.addObject("msg", "editUser");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Enterprise");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			enterpriseService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteUserAll")
	@ResponseBody
	public Object deleteUserAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Enterprise");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			this.appuserService.deleteAllU(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Enterprise到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("企业全程");	//1
		titles.add("企业简称");	//2
		titles.add("企业logo");	//3
		titles.add("联系人电话");	//4
		titles.add("地理位置");	//5
		titles.add("企业状态");	//6
		titles.add("经度纬度位置");	//7
		titles.add("营业执照信息");	//8
		titles.add("上级公司");	//9
		dataMap.put("titles", titles);
		List<PageData> varOList = enterpriseService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("ABBREVIATION"));	//2
			vpd.put("var3", varOList.get(i).getString("LOGO"));	//3
			vpd.put("var4", varOList.get(i).getString("TELEPHONE"));	//4
			vpd.put("var5", varOList.get(i).getString("LOCATION"));	//5
			vpd.put("var6", varOList.get(i).getString("STATUS"));	//6
			vpd.put("var7", varOList.get(i).getString("POSITION"));	//7
			vpd.put("var8", varOList.get(i).getString("BUSINESSLICENSE"));	//8
			vpd.put("var9", varOList.get(i).getString("PARENTID"));	//9
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
