package com.shouxin.service.enterprise.enterprise;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;

/** 
 * 说明： 企业管理接口
 * 创建人：shouxin
 * 创建时间：2016-06-28
 * @version
 */
public interface EnterpriseManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**删除企业用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteUser(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**根据appkey修改
	 * @param pd
	 * @throws Exception
	 */
	public void editEN(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 查询该企业下的所有企业用户
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dataEnterpriseUserlistPage(Page page) throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**
	 * 根据管理员id查询该管理员属于哪个企业
	 * @param SYS_USER_ID
	 * @return
	 * @throws Exception
	 */
	public String findadminbyuserid(String SYS_USER_ID)throws Exception;
	
	/**
	 * 根据企业的appkey查询企业信息
	 * @param APPKEY
	 * @return
	 * @throws Exception
	 */
	public PageData findEnterpriseByAppkey(String APPKEY)throws Exception;
	
	/**
	 * 根据管理员id查询企业appkey
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public String findAppkeyByUserid(String USER_ID)throws Exception;
	
	/**
	 * 添加企业管理员信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveEnterpriseAdmin(PageData pd)throws Exception;
	
	/***
	 * 查询出所有的企业如果已经是管理员了就查询出该管理员管理的所有企业
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listEnterptise(PageData pd)throws Exception;
	
	/**
	 * 审核企业，修改企业状态
	 * @param pd
	 * @throws Exception
	 */
	public void editStatus(PageData pd)throws Exception;
	
	/**
	 * 查询出需要审核的企业
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dataStatuslistPage(Page page)throws Exception;
	
	/**
	 * 根据userid查询出该企业用户的信息和所属企业id
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public PageData findEnterpriseUserByUserid(String USER_ID)throws Exception;
	
} 

