package com.shouxin.service.checkup.checkupitem;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.checkup.CheckupItem;
import com.shouxin.util.PageData;

/** 
 * 说明： 体检项目管理接口
 * 创建人：shouxin
 * 创建时间：2016-04-10
 * @version
 */
public interface CheckupItemManager{

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
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	public void editAllStatus(PageData pd)throws Exception;
	
	public void editStatus(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**
	 * Query summarized checkup items by userId
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listCheckupItemSummary(PageData pd)throws Exception;
	
	
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
	 * 根据checkupPackageId 查询所有关联的checkupItem和User信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<CheckupItem> findAllById(String id)throws Exception;
	
	/**
	 * 根据userID获取所有体检项目信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<CheckupItem> findAllByUserId(String id)throws Exception;
	
	
	/**
	 * 根据userID获取所有体检项目信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCIByGroup(PageData pd)throws Exception;
	
	/**
	 * 根据userID获取所有体检项目信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCIByIdOrSubGroup(PageData pd)throws Exception;
	
	/**
	 * 根据当前分组名  查询所有项目
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByGroup(PageData pd)throws Exception;
	
	/**
	 * 删除该分组下面所有状态为已删除
	 * @param pd
	 * @throws Exception
	 */
	public void removeStatus(PageData pd) throws Exception;
	
	
	public List<PageData> findlistPage(Page page)throws Exception;
	
	/**
	 * 根据用户的电话查询体检项目
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCIByPhone(PageData pd) throws Exception;
	
	
}

