package com.shouxin.service.admin.tagcategory.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.DiseaseCategory;
import com.shouxin.entity.admin.TagCategory;
import com.shouxin.util.PageData;
import com.shouxin.service.admin.tagcategory.TagCategoryManager;

/** 
 * 说明： 标签分类
 * 创建人：shouxin
 * 创建时间：2016-04-10
 * @version
 */
@Service("tagcategoryService")
public class TagCategoryService implements TagCategoryManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("TagCategoryMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("TagCategoryMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("TagCategoryMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TagCategoryMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TagCategoryMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TagCategoryMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("TagCategoryMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 通过parentID获取子级列表
	 * @param parentID
	 * @return
	 */
	public List<TagCategory> listSubTagCategoryByParentId(String parentID) throws Exception {
		// TODO Auto-generated method stub
		return (List<TagCategory>) dao.findForList("TagCategoryMapper.listSubTagCategorybyParentID", parentID);
	}
	
	/**
	 * 获取所有数据并通过递归获取所有子级列表
	 * @param parentID
	 * @return
	 */
	public List<TagCategory> listAllTagCategory(String parentID) throws Exception {
		List<TagCategory> TagCategory = this.listSubTagCategoryByParentId(parentID);
		for (TagCategory cate : TagCategory) {
			List<TagCategory> tag = this.listAllTagCategory(cate.getTAGCATEGORY_ID());
			for (TagCategory tagCategory2 : tag) {
				tagCategory2.setTreeUrl("tag/list.do?TAGCATEGORY_ID="+tagCategory2.getTAGCATEGORY_ID());
				tagCategory2.setTarget("treeFrame");
			}
			cate.setSubTagCategory(tag);
		}
		return TagCategory;
	}
	/**
	 * 获取所有数据并通过递归获取所有子级列表
	 * @param parentID
	 * @return
	 */
	public List<TagCategory> listAllTagCategoryTree(String parentID) throws Exception {
		List<TagCategory> TagCategory = this.listSubTagCategoryByParentId(parentID);
		for (TagCategory cate : TagCategory) {
			List<TagCategory> tag = this.listAllTagCategory(cate.getTAGCATEGORY_ID());
			cate.setTreeUrl("tagcategory/list.do?TAGCATEGORY_ID="+cate.getTAGCATEGORY_ID());
			cate.setTarget("treeFrame");
			cate.setSubTagCategory(tag);
		}
		return TagCategory;
	}
	
}

