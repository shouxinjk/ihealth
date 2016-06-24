package com.shouxin.service.system.appuser;

import java.util.List;

import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Disease_test;
import com.shouxin.entity.admin.Tag_test;
import com.shouxin.entity.system.Sys_app_user_test;
import com.shouxin.util.PageData;


/** 会员接口类
 * @author  shouxin
 * 修改时间：2015.11.2
 */
public interface AppuserManager {
	
	/**列出某角色下的所有会员
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllAppuserByRorlid(PageData pd) throws Exception;
	
	/**会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listPdPageUser(Page page)throws Exception;
	
	/**通过用户名获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUsername(PageData pd)throws Exception;
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByEmail(PageData pd)throws Exception;
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByNumber(PageData pd)throws Exception;
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception;
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU1(PageData pd)throws Exception;
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteU(PageData pd)throws Exception;
	
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUiId(PageData pd)throws Exception;
	
	/**
	 * 通过手机号码获取用户数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByPhone(PageData pd)throws Exception;
	
	/**全部会员
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllUser(PageData pd)throws Exception;
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllU(String[] USER_IDS)throws Exception;
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getAppUserCount(String value)throws Exception;
	
	/**
	 * 保存会员跟标签的关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveAppUserAndTag(PageData pd)throws Exception;
	
	/**
	 * 保存会员跟个人疾病关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveAppUserAndPersonal(PageData pd)throws Exception;
	
	/**
	 * 保存会员跟关注疾病的关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveAppUserAndFocus(PageData pd)throws Exception;
	
	/**
	 * 保存会员跟家族遗传疾病的关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveAppUserAndFamily(PageData pd)throws Exception;
	
	/**
	 * 根据会员ID 删除会员跟标签的关系
	 * @param pd
	 * @throws Exception
	 */
	public void deleteTag(PageData pd)throws Exception;
	
	/**
	 * 根据会员ID 删除会员跟个人疾病的关系
	 * @param pd
	 * @throws Exception
	 */
	public void deletePersonal(PageData pd)throws Exception;
	
	/**
	 * 根据会员ID 删除会员跟关注疾病的关系
	 * @param pd
	 * @throws Exception
	 */
	public void deleteFocus(PageData pd)throws Exception;
	
	/**
	 * 根据会员ID 删除会员跟家族遗传疾病的关系
	 * @param pd
	 * @throws Exception
	 */
	public void deleteFamily(PageData pd)throws Exception;
	
	
	/**
	 * 根据ID查询 会员跟标签的关系
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findTagsById(PageData pd)throws Exception;
	
	/**
	 * 根据ID查询 会员跟个人疾病的关系
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPersonalDiseasesById(PageData pd)throws Exception;
	
	/**
	 * 根据ID查询 会员跟关注疾病的关系
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findFocusDiseasesById(PageData pd)throws Exception;
	
	/**
	 * 根据ID查询 会员跟家族遗传疾病的关系
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findFamilyDiseasesById(PageData pd)throws Exception;
	
	/**
	 * 根据用户关联关系表中的useranduser_id删除用户关联
	 * @param pd useranduser_id
	 * @throws Exception
	 */
	public void deleteRelationUser(PageData pd)throws Exception;
	
	/**
	 * 通过传入的用户ID  获取关联的用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findUserCastUser(PageData pd)throws Exception;
	
	/**
	 * 新增关联用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveRelationUser(PageData pd)throws Exception;
	
	/**
	 * 查询当前用户关系是否存在
	 */
	public PageData findConnectionWhether(PageData pd)throws Exception;
	
	/**
	 * 根据输入的值 模糊查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findLike(PageData pd)throws Exception;
	
	public PageData findByUserId(PageData pd)throws Exception;
	
	public PageData findByOpenId(PageData pd)throws Exception;
	
	/**
	 * 查询疾病模板数据
	 * @return
	 * @throws Exception
	 */
	public List<Disease_test> listDiseaseTest() throws Exception;
	
	/**
	 * 查询标签模板数据
	 * @return
	 * @throws Exception
	 */
	public List<Tag_test> listTagTest() throws Exception;
	
	/**
	 * 查询默认关心的人数据
	 * @return
	 * @throws Exception
	 */
	public List<Sys_app_user_test> listUserTest() throws Exception;
	
	/**
	 * 查询该用户是否修改基本信息
	 * @return
	 * @throws Exception
	 */
	public PageData findIsModifyByUserId(String USER_ID) throws Exception;
	
	/**
	 * 修改用户ismodify状态为已修改状态
	 * @param USER_ID
	 * @throws Exception
	 */
	public void editUserIsModify(String USER_ID)throws Exception;
}

