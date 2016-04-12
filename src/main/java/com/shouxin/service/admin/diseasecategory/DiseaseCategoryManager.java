package com.shouxin.service.admin.diseasecategory;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.DiseaseCategory;
import com.shouxin.util.PageData;

/** 
 * 说明： 疾病分类接口
 * 创建人：shouxin
 * 创建时间：2016-04-08
 * @version
 */
public interface DiseaseCategoryManager{

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
	 * 通过父级id获取其子级列表
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<DiseaseCategory> listSubDiseaseCategoryByParentId(String parentID)throws Exception;
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<DiseaseCategory> listAllDiseaseCategory(String parentID) throws Exception;
	

	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<DiseaseCategory> listAllDiseaseCategoryTree(String parentID) throws Exception;
}

