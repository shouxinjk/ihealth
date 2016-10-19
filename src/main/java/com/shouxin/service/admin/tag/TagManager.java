package com.shouxin.service.admin.tag;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Disease;
import com.shouxin.entity.admin.Tag;
import com.shouxin.util.PageData;

/** 
 * 说明： 标签信息接口
 * 创建人：shouxin
 * 创建时间：2016-04-10
 * @version
 */
public interface TagManager{

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
	 * 批量增加用户所属的标签
	 * @throws Exception
	 */
	public void addAll(PageData pd) throws Exception;
	
	/**通过标签分类id获取标签数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findAllByTagCategoryId(PageData pd)throws Exception;
	
	/**
	 * 通过用户id获取tag数据  并按TAGCATEGORY_ID 分组
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findALLByGroup(PageData pd)throws Exception;
	
	/**
	 * 删除用户所属的标签信息
	 * @throws Exception
	 */
	public void deleteTagByUserID(PageData pd) throws Exception;
	
	/**
	 * 根据用户id获取属于这个用户的标签信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listTagByUserID(PageData pd)throws Exception;
	

	public List<PageData> findAllGroupByUId(PageData pd)throws Exception;
	
	/**
	 * 根据标签名称查询标签信息
	 * @param NAME
	 * @return
	 * @throws Exception
	 */
	public Tag findTagByName(String NAME) throws Exception;
	
	/**
	 * 获取所有标签分类ID和名字
	 * @param page
	 * @return
	 */
	public List<PageData> tagcategory(Page page)throws Exception;
	
	/**
	 * 获取所有标签ID和名字
	 * @param page
	 * @return
	 */
	public List<PageData> listTag(Page page)throws Exception;

	public List<Tag> findAllByTagCategoryIdTag(String TAGCATEGORY_ID) throws Exception;
	
}

