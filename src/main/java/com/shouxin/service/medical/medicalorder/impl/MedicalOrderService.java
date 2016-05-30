package com.shouxin.service.medical.medicalorder.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.medical.MedicalOrder;
import com.shouxin.entity.medical.MedicalOrderItem;
import com.shouxin.service.medical.medicalorder.MedicalOrderManager;
import com.shouxin.util.PageData;

/** 
 * 说明： 平台订单（大订单）
 * 创建人：shouxin
 * 创建时间：2016-05-19
 * @version
 */
@Service("medicalorderService")
public class MedicalOrderService implements MedicalOrderManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("MedicalOrderMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("MedicalOrderMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("MedicalOrderMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MedicalOrderMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MedicalOrderMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MedicalOrderMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MedicalOrderMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 通过订单ID，查询所有体检项目信息
	 * @param MEDICALORDER_ID 体检项目ID
	 * @return 体检项目详情
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findItemsById(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("MedicalOrderMapper.findItemsById", pd);
	}

	/**
	 * 批量增加体检中心订单
	 */
	public void saveAll(List<MedicalOrder> medicalOrder) throws Exception {
		// TODO Auto-generated method stub
		dao.save("MedicalOrderMapper.insertAll", medicalOrder);
	}
	
	/**
	 * 批量增加体检中心订单体检项目
	 */
	public void saveItemAll(List<MedicalOrderItem> medicalOrderItem) throws Exception {
		// TODO Auto-generated method stub
		dao.save("MedicalOrderMapper.insertItemAll", medicalOrderItem);
	}
	
}

