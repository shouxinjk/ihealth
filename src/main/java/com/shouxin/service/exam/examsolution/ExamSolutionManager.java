package com.shouxin.service.exam.examsolution;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;

/** 
 * 说明： 医学检查手段接口
 * 创建人：shouxin
 * 创建时间：2016-04-07
 * @version
 */
public interface ExamSolutionManager{

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
	 * 通过指南id获取高危人群检查手段
	 * @param EXAMGUIDELINEID
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listExamSolutionByExamGuidelineID(String EXAMGUIDELINEID)throws Exception ;
	
	/**
	 * 链接检查项目表获取所有数据
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllExamSolutionAndExamItem(PageData pd) throws Exception;
	
}

