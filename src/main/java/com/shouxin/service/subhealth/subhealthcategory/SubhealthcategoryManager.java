package com.shouxin.service.subhealth.subhealthcategory;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.subhealth.SubhealthCategory;
import com.shouxin.util.PageData;

/** 
 * 说明： 亚健康分类接口
 * 创建人：shouxin
 * 创建时间：2016-08-09
 * @version
 */
public interface SubhealthcategoryManager{

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
	 * 通过id获取子级列表
	 * @param PARENTID
	 * @return
	 * @throws Exception
	 */
	public List<SubhealthCategory> listSubhealthCategorybyParentID(String PARENTID)throws Exception;
	
	/**
	 * 递归出所有的自己列表
	 * @param PARENTID
	 * @return
	 * @throws Exception
	 */
	public List<SubhealthCategory> listSubhealthCategoryby(String PARENTID)throws Exception;
	
	/**
	 * 递归出所有的自己列表
	 * @param PARENTID
	 * @return
	 * @throws Exception
	 */
	public List<SubhealthCategory> listSubhealthCategory(String PARENTID)throws Exception;
	
	
	
}

