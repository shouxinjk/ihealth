package com.shouxin.service.exam.examitem;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.exam.ExamCategory;
import com.shouxin.entity.exam.ExamItem;
import com.shouxin.util.PageData;

/** 
 * 说明： 医学体检项目接口
 * 创建人：shouxin
 * 创建时间：2016-04-07
 * @version
 */
public interface ExamItemManager{

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
	public ExamItem findById(String EXAMITEM_ID)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	
	/**
	 * 获取所有数据（递归子列表）
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<ExamCategory> listAllExamCategory(String parentID) throws Exception;
	
	/**通过id获取ExamCategory数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findExamCategoryById(PageData pd)throws Exception;
	
	/**
	 * 通过EXAMCATEGORY_ID查询检查分类信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listItemByExamCategoryID(String EXAMCATEGORY_ID) throws Exception;
	
	/**
	 * 通过检查手段名字查询体检服务项目
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findMedical(PageData pd)throws Exception;

	/**根据体检手段统计服务项目数	
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listcount(Page page)throws Exception;
	
}

