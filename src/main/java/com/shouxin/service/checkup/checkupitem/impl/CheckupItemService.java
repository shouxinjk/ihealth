package com.shouxin.service.checkup.checkupitem.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.checkup.CheckupItem;
import com.shouxin.util.PageData;
import com.shouxin.service.checkup.checkupitem.CheckupItemManager;

/** 
 * 说明： 体检项目管理
 * 创建人：shouxin
 * 创建时间：2016-04-10
 * @version
 */
@Service("checkupitemService")
public class CheckupItemService implements CheckupItemManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("CheckupItemMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("CheckupItemMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("CheckupItemMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CheckupItemMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CheckupItemMapper.listAll", pd);
	}
	
	/**
	 * Query for all checkup items by UserId
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listCheckupItemSummary(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CheckupItemMapper.listCheckupItemSummary", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CheckupItemMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CheckupItemMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 查询所有
	 * 根据checkpackageID查询所有体检项目
	 */
	@SuppressWarnings("unchecked")
	public List<CheckupItem> findAllById(String id) throws Exception {
		return (List<CheckupItem>) dao.findForList("CheckupItemMapper.findAllByIdlistPage", id);
	}

	/**
	 * 根据userID获取体检项目
	 */
	@SuppressWarnings("unchecked")
	public List<CheckupItem> findAllByUserId(String id) throws Exception {
		
		return (List<CheckupItem>) dao.findForList("CheckupItemMapper.findAllByUserId", id);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findCIByGroup(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("CheckupItemMapper.findCIByGroup", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findCIByIdOrSubGroup(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("CheckupItemMapper.findCIByIdOrSubGroup", pd);
	}

	/**
	 * 根据当前分组名，查询所有体检项目
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findByGroup(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("CheckupItemMapper.findByGroup", pd);
	}

	public void editAllStatus(PageData pd) throws Exception {
		dao.update("CheckupItemMapper.editAllStatus", pd);
		
	}

	public void editStatus(PageData pd) throws Exception {
		dao.update("CheckupItemMapper.editStatus", pd);
		
	}

	public void removeStatus(PageData pd) throws Exception {
		dao.update("CheckupItemMapper.removeStatus", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findlistPage(Page page) throws Exception {
		
		return (List<PageData>) dao.findForList("CheckupItemMapper.findlistPage", page);
	}

	/**
	 * 通过企业appkey和用户电话查询体检项目
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findCIByPhone(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("CheckupItemMapper.findCIByPhone", pd);
	}
	
}

