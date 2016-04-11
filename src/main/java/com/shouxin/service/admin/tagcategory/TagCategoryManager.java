package com.shouxin.service.admin.tagcategory;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.TagCategory;
import com.shouxin.util.PageData;

/** 
 * 说明： 标签分类接口
 * 创建人：shouxin
 * 创建时间：2016-04-10
 * @version
 */
public interface TagCategoryManager{

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
	 * 通过parentID获取子级列表
	 * @param parentID
	 * @return
	 */
	public List<TagCategory> listSubTagCategoryByParentId(String parentID) throws Exception; 
	
	/**
	 * 获取所有数据并通过递归获取所有子级列表
	 * @param parentID
	 * @return
	 */
	public List<TagCategory> listAllTagCategory(String parentID) throws Exception;
	
	/**
	 * 获取所有数据并通过递归获取所有子级列表
	 * @param parentID
	 * @return
	 */
	public List<TagCategory> listAllTagCategoryTree(String parentID) throws Exception;
	
}

