package com.shouxin.service.system.appuser.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.DiseaseAndUser;
import com.shouxin.entity.admin.Disease_test;
import com.shouxin.entity.admin.TagAndUser;
import com.shouxin.entity.admin.Tag_test;
import com.shouxin.entity.system.Sys_app_user_test;
import com.shouxin.service.system.appuser.AppuserManager;
import com.shouxin.util.PageData;
import com.shouxinjk.ihealth.data.Transfer;


/**类名称：AppuserService
 * @author shouxin
 * 修改时间：2015年11月6日
 */
@Service("appuserService")
public class AppuserService implements AppuserManager{

	Logger logger = Logger.getLogger(AppuserService.class);
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列出某角色下的所有会员
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllAppuserByRorlid(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.listAllAppuserByRorlid", pd);
	}
	
	/**会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.userlistPage", page);
	}
	
	/**通过用户名获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUsername(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUsername", pd);
	}
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByEmail(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByEmail", pd);
	}
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByNumber(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByNumber", pd);
	}
	
	/**
	 * transfer user from business system to analysis system
	 * 
	 * @param pd to query user info from
	 */
	private void transferUser(PageData pd){
		Transfer transfer = Transfer.getInstance();
		com.shouxinjk.ihealth.data.pojo.User user = new com.shouxinjk.ihealth.data.pojo.User();
		 user.setUser_id(pd.getString("USER_ID"));
		 user.setUserName(pd.getString("USERNAME"));
		 user.setName(pd.getString("NAME"));
		 user.setIp(pd.getString("IP"));
		 user.setPhone(pd.getString("PHONE"));
		 user.setEmail(pd.getString("EMAIL"));
		 user.setOpenid(pd.getString("OPENID"));
		 user.setAlias(pd.getString("ALIAS"));
		 user.setBirthday(pd.getString("BIRTHDAY"));
		 user.setSex(pd.getString("SEX"));
		 user.setBirthPlace(pd.getString("BIRTHPLACE"));
		 user.setLivePlace(pd.getString("LIVEPLACE"));
		 user.setMarriageStatus(pd.getString("MARRIAGESTATUS"));
		 user.setCareer(pd.getString("CAREER"));
		 user.setDegree(pd.getString("DEGREE"));
		 user.setAvatar(pd.getString("AVATAR"));
		 user.setHeight(Integer.parseInt(pd.get("HEIGHT").toString()));
		 user.setWeight(Integer.parseInt(pd.get("WEIGHT").toString()));
		 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		 int age = -1;
		 try {
			Date birthDate = format.parse(pd.getString("BIRTHDAY"));
			int year1 = birthDate.getYear();
			Date now = new Date();
			int year2 = now.getYear();
			age = year2-year1+1;
		} catch (ParseException e) {
			logger.error("cannot calcuate user age.",e);
		}
		user.setAge(age);
		transfer.transferUser(user);
	}
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveU", pd);
		//qchzhu: hook analysis interface
		transferUser(pd);
	}
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU1(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveU", pd);
	}
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteU(PageData pd)throws Exception{
		dao.delete("AppuserMapper.deleteU", pd);
	}
	
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception{
		dao.update("AppuserMapper.editU", pd);
		//qchzhu: hook analysis interface
		transferUser(pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUiId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUiId", pd);
	}
	
	/**全部会员
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.listAllUser", pd);
	}
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("AppuserMapper.deleteAllU", USER_IDS);
	}
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getAppUserCount(String value)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.getAppUserCount", value);
	}
	
	public void saveAppUserAndTag(PageData pd) throws Exception {
		dao.save("AppuserMapper.saveAppUserAndTag", pd);
	}

	public void saveAppUserAndPersonal(PageData pd) throws Exception {
		dao.save("AppuserMapper.saveAppUserAndPersonal", pd);
	}

	public void saveAppUserAndFocus(PageData pd) throws Exception {
		dao.save("AppuserMapper.saveAppUserAndFocus", pd);
	}

	public void saveAppUserAndFamily(PageData pd) throws Exception {
		dao.save("AppuserMapper.saveAppUserAndFamily", pd);
	}

	public void deleteTag(PageData pd) throws Exception {
		dao.delete("AppuserMapper.deleteTag", pd);
	}

	public void deletePersonal(PageData pd) throws Exception {
		dao.delete("AppuserMapper.deletePersonal", pd);
	}

	public void deleteFocus(PageData pd) throws Exception {
		dao.delete("AppuserMapper.deleteFocus", pd);
	}

	public void deleteFamily(PageData pd) throws Exception {
		dao.delete("AppuserMapper.deleteFamily", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findTagsById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.findTagsById", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findPersonalDiseasesById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.findPersonalDiseasesById", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findFocusDiseasesById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.findFocusDiseasesById", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findFamilyDiseasesById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.findFamilyDiseasesById", pd);
	}

	/**
	 * 根据电话号码查询会员信息
	 */
	public PageData findByPhone(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("AppuserMapper.findByPhone", pd);
	}

	/**
	 * 删除关联关系
	 */
	public void deleteRelationUser(PageData pd) throws Exception {
		dao.delete("AppuserMapper.deleteRelationUser", pd);
		
	}

	/**
	 * 根据用户ID查询所有的关联用户
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findUserCastUser(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.findUserCastUser", pd);
	}

	/**
	 * 新增用户关系
	 */
	public void saveRelationUser(PageData pd) throws Exception {
		dao.save("AppuserMapper.saveRelationUser", pd);
	}

	/**
	 * 查询关系是否存在
	 */
	public PageData findConnectionWhether(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.findConnectionWhether", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findLike(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("AppuserMapper.findLike", pd);
	}

	public PageData findByUserId(PageData pd) throws Exception {
		return (PageData)dao.findForObject("AppuserMapper.findByUserId", pd);
	}

	public PageData findByOpenId(PageData pd) throws Exception {
		return (PageData)dao.findForObject("AppuserMapper.findByOpenId", pd);
	}
	
	/**
	 * 查询默认疾病数据
	 */
	@SuppressWarnings("unchecked")
	public List<Disease_test> listDiseaseTest() throws Exception {
		return (List<Disease_test>) dao.findForList("AppuserMapper.listDiseaseTest", null);
	}

	/**
	 * 查询默认标签数据
	 */
	@SuppressWarnings("unchecked")
	public List<Tag_test> listTagTest() throws Exception {
		return (List<Tag_test>) dao.findForList("AppuserMapper.listTagTest", null);
	}
	
	/**
	 * 查询默认关心的人数据
	 */
	@SuppressWarnings("unchecked")
	public List<Sys_app_user_test> listUserTest() throws Exception {
		return (List<Sys_app_user_test>) dao.findForList("AppuserMapper.listUserTest", null);
	}

	/**
	 * 查询该用户是否修改基本信息
	 * @return
	 * @throws Exception
	 */
	public PageData findIsModifyByUserId(String USER_ID) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.findIsModifyByUserId", USER_ID);
	}
	
	/**
	 * 修改用户ismodify状态为已修改状态
	 * @param USER_ID
	 * @throws Exception
	 */
	public void editUserIsModify(String USER_ID) throws Exception {
		dao.update("AppuserMapper.editUserIsModify", USER_ID);
	}
	
	/**
	 * 批量添加企业用户
	 */
	public void saveEnterpriseUserAll(List<PageData> pd) throws Exception {
		dao.save("AppuserMapper.saveEnterpriseUserAll", pd);
	}
	/**
	 * 批量添加疾病信息
	 */
	public void saveEnterpriseUserDisease(List<DiseaseAndUser> dau) throws Exception {
		dao.save("AppuserMapper.saveEnterpriseUserDisease", dau);
	}
	/**
	 * 批量添加标签信息
	 */
	public void saveEnterpriseUserTag(List<TagAndUser> tau) throws Exception {
		dao.save("AppuserMapper.saveEnterpriseUserTag", tau);
	}

	public void saveEnterpriseUserDiseasefamily(List<DiseaseAndUser> dau) throws Exception {
		dao.save("AppuserMapper.saveEnterpriseUserDiseasefamily", dau);
	}

	public void saveEnterpriseUserDiseasefocus(List<DiseaseAndUser> dau) throws Exception {
		dao.save("AppuserMapper.saveEnterpriseUserDiseasefocus", dau);
	}
	
	/***
	 * 根据电话号查询企业用户id
	 * @param PHONE
	 * @return
	 * @throws Exception
	 */
	public String findEnterpriseUserByPhone(String PHONE) throws Exception {
		return (String) dao.findForObject("AppuserMapper.findEnterpriseUserByPhone", PHONE);
	}

	/**
	 * 修改企业用户信息
	 * @param USER_ID
	 * @throws Exception
	 */
	public void updateEnterpriseUser(PageData pd) throws Exception {
		dao.update("AppuserMapper.updateEnterpriseUser", pd);
	}

	/**
	 * 添加单个企业用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveEnterpriseUser(PageData pd) throws Exception {
		dao.save("AppuserMapper.saveEnterpriseUser", pd);
	}
	
	/**
	 * 查询出所有关心我的人
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listCareAboutMe(String USER_ID) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.listCareAboutMe", USER_ID);
	}

	public PageData findUserAndUser(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.findUserAndUser", pd);
	}

	public void updateModify(PageData pd) throws Exception {
		dao.update("AppuserMapper.updateModify", pd);
	}

	public void updatePrivacy(PageData pd) throws Exception {
		dao.update("AppuserMapper.updatePrivacy", pd);
	}
	
}

