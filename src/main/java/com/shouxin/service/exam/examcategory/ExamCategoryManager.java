package com.shouxin.service.exam.examcategory;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.exam.ExamCategory;
import com.shouxin.util.PageData;

/** 
 * 说明： 医学检查分类接口
 * 创建人：shouxin
 * 创建时间：2016-04-12
 * @version
 */
public interface ExamCategoryManager{

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
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**
	 * 通过父级id获取其所有子级列表
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<ExamCategory> listSubExamCategoryByParentID(String parentID) throws Exception;
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<ExamCategory> listAllExamCategory(String parentID) throws Exception;
	
}

 