package com.shouxin.service.system.user.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.system.User;
import com.shouxin.service.system.user.UserManager;
import com.shouxin.util.PageData;


/** 系统用户
 * @author shouxin
 * 修改时间：2015.11.2
 */
@Service("userService")
public class UserService implements UserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.getUserInfo", pd);
	}
	
	/**更新登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("UserMapper.updateLastLogin", pd);
	}
	
	/**通过用户ID获取用户信息和角色信息
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public User getUserAndRoleById(String USER_ID) throws Exception {
		return (User) dao.findForObject("UserMapper.getUserAndRoleById", USER_ID);
	}
	
	/**通过USERNAEME获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUsername(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUsername", pd);
	}
	
	/**列出某角色下的所有用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllUserByRoldId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.listAllUserByRoldId", pd);
		
	}
	
	/**保存用户IP
	 * @param pd
	 * @throws Exception
	 */
	public void saveIP(PageData pd)throws Exception{
		dao.update("UserMapper.saveIP", pd);
	}
	
	/**用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listUsers(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.userlistPage", page);
	}
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUE", pd);
	}
	
	public PageData findByPhone(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("UserMapper.findByPhone", pd);
	}
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUN(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUN", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findById", pd);
	}
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception{
		dao.save("UserMapper.saveU", pd);
	}
	 
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception{
		dao.update("UserMapper.editU", pd);
	}
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteU(PageData pd)throws Exception{
		dao.delete("UserMapper.deleteU", pd);
	}
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("UserMapper.deleteAllU", USER_IDS);
	}
	
	/**用户列表(全部)
	 * @param USER_IDS
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.listAllUser", pd);
	}
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getUserCount(String value)throws Exception{
		return (PageData)dao.findForObject("UserMapper.getUserCount", value);
	}

	/**
	 * 根据用户ID查询文章信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findArticlesById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findArticlesById", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findTagById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findTagById", pd);
	}

	/**
	 * 根据用户ID 获取疾病信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findDiseaseById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findDiseaseById", pd);
	}

	/**
	 * 根据用户ID  获取所有的关联用户信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findUsersById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findUserCastUser", pd);
	}

	/**
	 * 根据用户关联关系表中的useranduser_id删除用户关联
	 */
	public void deleteRelationUser(PageData pd) throws Exception {
		dao.delete("UserMapper.deleteRelationUser", pd);
	}

	/**
	 * 新增关联用户
	 */
	public void saveRelationUser(PageData pd) throws Exception {
		dao.save("UserMapper.saveRelationUser", pd);
	}

	public void saveUserAndTag(PageData pd) throws Exception {
		dao.save("UserMapper.saveUserAndTag", pd);
		
	}

	public void saveUserAndDisease(PageData pd) throws Exception {
		dao.save("UserMapper.saveUserAndDisease", pd);
		
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findTagsByUserId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findTagsByUserId", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findDiseaseByUserId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findDiseaseByUserId", pd);
	}

	public void deleteTags(PageData pd) throws Exception {
		dao.delete("UserMapper.deleteTags", pd);
	}

	public void deleteDiseases(PageData pd) throws Exception {
		dao.delete("UserMapper.deleteDiseases", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findFhDiseaseByUserId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("UserMapper.findFhDiseaseByUserId", pd);
	}

	public void deleteFhDiseases(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("UserMapper.deleteFhDiseases", pd);
	}

	public void saveUserAndFhDisease(PageData pd) throws Exception {
		dao.save("UserMapper.saveUserAndFhDisease", pd);
		
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findLike(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("UserMapper.findLike", pd);
	}

	public PageData findConnectionWhether(PageData pd) throws Exception {
		
		return (PageData)dao.findForObject("UserMapper.findConnectionWhether", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findUsers(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("UserMapper.findUsers", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findAllUserByOpenId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("UserMapper.findAllUserByOpenId",pd);
	}
}
