package com.shouxin.service.exam.examguideline;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;

/** 
 * 说明： 医学体检指南接口
 * 创建人：shouxin
 * 创建时间：2016-04-07
 * @version
 */
public interface ExamGuideLineManager{

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
	
	/**
	 * 修改指南规则
	 * @param pd
	 * @throws Exception
	 */
	public void editRule(PageData pd) throws Exception;
	
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
	 * 修改状态
	 * @throws Exception
	 */
	public void auditing(PageData pd) throws Exception;
	
	/**
	 * 查询运维审核后的指南
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listRelease(Page page) throws Exception;
	
	/**
	 * 医生已提交指南列表
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listVerfiy(Page page) throws Exception;
	
}

