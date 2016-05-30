package com.shouxin.service.medical.medicalorder;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.medical.MedicalOrder;
import com.shouxin.entity.medical.MedicalOrderItem;
import com.shouxin.util.PageData;

/** 
 * 说明： 平台订单（大订单）接口
 * 创建人：shouxin
 * 创建时间：2016-05-19
 * @version
 */
public interface MedicalOrderManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 批量增加体检中心订单
	 * @param medicalOrder
	 * @throws Exception
	 */
	public void saveAll(List<MedicalOrder> medicalOrder )throws Exception;
	
	/**
	 * 批量增加体检中心订单的体检项目
	 * @param medicalOrder
	 * @throws Exception
	 */
	public void saveItemAll(List<MedicalOrderItem> medicalOrderItem )throws Exception;
	
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
	 * 通过订单ID，查询所有体检项目信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findItemsById(PageData pd)throws Exception;
	
}

