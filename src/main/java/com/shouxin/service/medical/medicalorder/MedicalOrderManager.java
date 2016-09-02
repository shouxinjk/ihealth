package com.shouxin.service.medical.medicalorder;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.medical.MedicalExamItem;
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
	
	/**
	 * 修改体检中心订单状态
	 * @param pd
	 * @throws Exception
	 */
	public void auditing(PageData pd)throws Exception;
	
	/**
	 * 修改平台订单的时候下属的体检中心订单一并需改
	 * @param pd
	 * @throws Exception
	 */
	public void auditingAll(PageData pd)throws Exception;
	
	/**
	 * 查询体检中心订单是否已经确认完
	 * @param ORDERNO
	 * @return
	 * @throws Exception
	 */
	public List<MedicalOrder> listMedicalOrderByOrderNo(String ORDERNO) throws Exception;
	
	/**
	 * 查询平台订单下所有体检中心订单
	 * @param ORDERNO
	 * @return
	 * @throws Exception
	 */
	public List<MedicalOrder> listAllMedicalOrderByOrderNo(String ORDERNO) throws Exception;
	
	/**
	 * 查询体检订单下的体检项目信息
	 * @param MEDICALORDER_ID
	 * @return
	 * @throws Exception
	 */
	public List<MedicalExamItem> listExamItemByMedicalOrderID(String MEDICALORDER_ID) throws Exception;
	
	/**
	 * 展示单个状态下的订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listPart(Page page)throws Exception;
	
	/**
	 * 根据订单编号查询所属体检中心订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listOrderByOrderId(PageData pd)throws Exception;
	
	public List<PageData> listAllOrderAndAbout(PageData pd)throws Exception;
	
	public void editTime(PageData pd)throws Exception;
	
	public List<PageData> listAllOrderAndUserid(PageData pd)throws Exception;
	
	public List<PageData> listAllSchedule(PageData pd)throws Exception;
	
	public List<PageData> listAllScheduleAndUserID(PageData pd)throws Exception;
	
	public List<PageData> findMedicalOrderExamitem(String MEDICALORDER_ID)throws Exception;
	
	public PageData findMedicalOrder(String MEDICALORDER_ID)throws Exception;
}

