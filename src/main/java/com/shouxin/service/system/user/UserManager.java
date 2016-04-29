package com.shouxin.service.system.user;

import java.util.List;

import com.shouxin.entity.Page;
import com.shouxin.entity.system.User;
import com.shouxin.util.PageData;


/** 用户接口类
 * @author  shouxin
 * 修改时间：2015.11.2
 */
public interface UserManager {
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByNameAndPwd(PageData pd)throws Exception;
	
	/**更新登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLogin(PageData pd)throws Exception;
	
	/**通过用户ID获取用户信息和角色信息
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public User getUserAndRoleById(String USER_ID) throws Exception;
	
	/**通过USERNAEME获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUsername(PageData pd)throws Exception;
	
	public PageData findByPhone(PageData pd)throws Exception;
	
	/**列出某角色下的所有用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllUserByRoldId(PageData pd) throws Exception;
	
	/**保存用户IP
	 * @param pd
	 * @throws Exception
	 */
	public void saveIP(PageData pd)throws Exception;
	
	/**用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listUsers(Page page)throws Exception;
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUE(PageData pd)throws Exception;
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUN(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception;
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception;
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteU(PageData pd)throws Exception;
	
	/**
	 * 根据用户关联关系表中的useranduser_id删除用户关联
	 * @param pd useranduser_id
	 * @throws Exception
	 */
	public void deleteRelationUser(PageData pd)throws Exception;
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllU(String[] USER_IDS)throws Exception;
	
	/**用户列表(全部)
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllUser(PageData pd)throws Exception;
	
	/**
	 * 根据输入的值 模糊查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findLike(PageData pd)throws Exception;
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getUserCount(String value)throws Exception;
	
	/**
	 * 根据用户ID查询文章信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findArticlesById(PageData pd)throws Exception;
	
	/**
	 * 根据用户ID获取标签信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findTagById(PageData pd)throws Exception;
	
	/**
	 * 根据用户ID 获取疾病信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findDiseaseById(PageData pd)throws Exception;
	
	/**
	 * 根据用户ID 获取家族疾病信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findFhDiseaseByUserId(PageData pd)throws Exception;
	
	/**
	 * 通过传入的用户ID  获取关联的用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findUsersById(PageData pd)throws Exception;
	
	
	/**
	 * 新增关联用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveRelationUser(PageData pd)throws Exception;
	
	/**
	 * 新增标签跟用户的关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveUserAndTag(PageData pd)throws Exception;
	
	/**
	 * 新增既往疾病跟用户的关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveUserAndDisease(PageData pd)throws Exception;
	
	/**
	 * 新增家族遗传疾病跟用户的关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveUserAndFhDisease(PageData pd)throws Exception;
	
	/**
	 * 根据用户ID 查询所关联的标签信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findTagsByUserId(PageData pd)throws Exception;
	
	/**
	 * 根据用户ID 查询所关联的疾病信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findDiseaseByUserId(PageData pd)throws Exception;
	
	
	public void deleteTags(PageData pd)throws Exception;
	
	
	public void deleteDiseases(PageData pd)throws Exception;
	
	public void deleteFhDiseases(PageData pd)throws Exception;
	
	/**
	 * 查询当前用户关系是否存在
	 */
	public PageData findConnectionWhether(PageData pd)throws Exception;
}
