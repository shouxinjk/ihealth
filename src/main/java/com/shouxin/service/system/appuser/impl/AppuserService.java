package com.shouxin.service.system.appuser.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.service.system.appuser.AppuserManager;
import com.shouxin.util.PageData;


/**类名称：AppuserService
 * @author shouxin
 * 修改时间：2015年11月6日
 */
@Service("appuserService")
public class AppuserService implements AppuserManager{

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
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception{
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
	
}

