package com.shouxin.service.medical.order.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.medical.MedicalExamItem;
import com.shouxin.entity.medical.Order;
import com.shouxin.entity.medical.OrderItem;
import com.shouxin.service.medical.order.OrderManager;
import com.shouxin.util.PageData;

/** 
 * 说明： 体检中心订单（小订单）
 * 创建人：shouxin
 * 创建时间：2016-05-19
 * @version
 */
@Service("orderService")
public class OrderService implements OrderManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("OrderMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("OrderMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("OrderMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrderMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrderMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrderMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrderMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 查询该订单下所有体检项目
	 */
	@SuppressWarnings("unchecked")
	public List<MedicalExamItem> findExamItemByOrderId(String pd) throws Exception {
		return (List<MedicalExamItem>) dao.findForList("OrderMapper.findExamItemByOrderId", pd);
	}
	
	/**
	 * 修改订单状态
	 */
	public void updateOrderStatus(PageData pd) throws Exception {
		dao.update("OrderMapper.auditing", pd);
	}
	
	/**
	 * 通过id获取数据
	 */
	public Order findByIdString(String ORDER_ID) throws Exception {
		return (Order)dao.findForObject("OrderMapper.findByIdString", ORDER_ID);
	}

	/**
	 * 查询该订单有多少个体检中心的体检项目
	 */
	@SuppressWarnings("unchecked")
	public List<MedicalExamItem> findCenterIDByOrderId(String pd) throws Exception {
		return (List<MedicalExamItem>) dao.findForList("OrderMapper.findCenterIDByOrderId", pd);
	}

	/**
	 * 根据体检手段id获取体检项目id
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String findExamItemByExamSolutionId(String EXAMSOLUTION_ID) throws Exception {
		return (String) dao.findForObject("OrderMapper.findExamItemByExamSolutionId", EXAMSOLUTION_ID);
	}
	
	/**
	 * 为该订单添加购买的项目
	 * @param items
	 * @throws Exception
	 */
	public void saveOrderItem(List<OrderItem> items) throws Exception {
		dao.save("OrderMapper.saveOrderItem", items);
	}

	/**
	 * 展示单个状态下的订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPart(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OrderMapper.dataPartlistPage", page);
	}

	/**
	 * 查询当天流水号
	 * @param ORDERNOSTR
	 * @return
	 * @throws Exception
	 */
	public String getMaxOrderNo(String ORDERNOSTR) throws Exception {
		return (String) dao.findForObject("OrderMapper.getMaxOrderNo", ORDERNOSTR);
	}

	/**
	 * 修改订单总金额
	 * @param pd
	 * @throws Exception
	 */
	public void editOrderPrice(PageData pd) throws Exception {
		dao.update("OrderMapper.editOrderPrice", pd);
	}
	
	/**
	 * 通过订单号获取订单信息
	 * @param ORDERNO
	 * @return
	 * @throws Exception
	 */
	public PageData findByOrderNoString(String ORDERNO)throws Exception{
		return (PageData) dao.findForObject("OrderMapper.findByOrderNoString", ORDERNO);
	}

	public void editTime(PageData pd) throws Exception {
		dao.update("OrderMapper.editTime", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> listAllByUserID(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OrderMapper.listAllByUserID", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> listAllOrderByUserIDAndUserID(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OrderMapper.listAllOrderByUserIDAndUserID", pd);
	}

	public PageData findOrder(String ORDER_ID) throws Exception {
		return (PageData) dao.findForObject("OrderMapper.findOrder", ORDER_ID);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findOrderExamitem(String ORDER_ID) throws Exception {
		return (List<PageData>) dao.findForList("OrderMapper.findOrderExamitem", ORDER_ID);
	}
	
	
}

