package com.shouxin.service.medical.order;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.medical.MedicalExamItem;
import com.shouxin.entity.medical.Order;
import com.shouxin.util.PageData;

/** 
 * 说明： 体检中心订单（小订单）接口
 * 创建人：shouxin
 * 创建时间：2016-05-19
 * @version
 */
public interface OrderManager{

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
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public Order findByIdString(String ORDER_ID)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**
	 * 查询该订单下的所有体检项目信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<MedicalExamItem> findExamItemByOrderId(String pd) throws Exception;
	
	/**
	 * 修改订单状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateOrderStatus(PageData pd) throws Exception;
	
	/**
	 * 查询该订单下有多少个体检中心的体检项目
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<MedicalExamItem> findCenterIDByOrderId(String pd)throws Exception;
	
}

 