package com.shouxin.service.enterprise.enterprise.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;
import com.shouxin.service.enterprise.enterprise.EnterpriseManager;

/** 
 * 说明： 企业管理
 * 创建人：shouxin
 * 创建时间：2016-06-28
 * @version
 */
@Service("enterpriseService")
public class EnterpriseService implements EnterpriseManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("EnterpriseMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("EnterpriseMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("EnterpriseMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("EnterpriseMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("EnterpriseMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("EnterpriseMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("EnterpriseMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 根据管理员id查询该管理员属于哪个企业
	 * @param SYS_USER_ID
	 * @return
	 * @throws Exception
	 */
	public String findadminbyuserid(String SYS_USER_ID) throws Exception {
		return (String) dao.findForObject("EnterpriseMapper.findadminbyuserid", SYS_USER_ID);
	}

	/**
	 * 查询该企业下的所有企业用户
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> dataEnterpriseUserlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnterpriseMapper.dataEnterpriseUserlistPage", page);
	}
	
	/**
	 * 根据企业的appkey查询企业信息
	 * @param APPKEY
	 * @return
	 * @throws Exception
	 */
	public PageData findEnterpriseByAppkey(String APPKEY) throws Exception {
		return (PageData) dao.findForObject("EnterpriseMapper.findEnterpriseByAppkey", APPKEY);
	}
	
	/**
	 * 根据企业appkey修改信息
	 */
	public void editEN(PageData pd) throws Exception {
		dao.update("EnterpriseMapper.editEN", pd);
	}
	
	/**
	 * 根据管理员id查询企业appkey
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public String findAppkeyByUserid(String USER_ID) throws Exception {
		return (String) dao.findForObject("EnterpriseMapper.findAppkeyByUserid", USER_ID);
	}
	
	/**删除企业用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteUser(PageData pd) throws Exception {
		dao.delete("EnterpriseMapper.deleteUser", pd);
	}

	/**
	 * 添加企业管理员信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveEnterpriseAdmin(PageData pd) throws Exception {
		dao.save("EnterpriseMapper.saveEnterpriseAdmin", pd);
	}

	/***
	 * 查询出所有的企业如果已经是管理员了就查询出该管理员管理的所有企业
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listEnterptise(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("EnterpriseMapper.listEnterptise", pd);
	}
	
	/**
	 * 审核企业，修改企业状态	
	 * @param pd
	 * @throws Exception
	 */
	public void editStatus(PageData pd) throws Exception {
		dao.update("EnterpriseMapper.editStatus", pd);
	}

	/**
	 * 查询出需要审核的企业
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> dataStatuslistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnterpriseMapper.dataStatuslistPage", page);
	}

	/**
	 * 根据userid查询出该企业用户的信息和所属企业id
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public PageData findEnterpriseUserByUserid(String USER_ID) throws Exception {
		return (PageData) dao.findForObject("EnterpriseMapper.findEnterpriseUserByUserid", USER_ID);
	}
	
}

