package com.shouxin.service.subhealth.subhealthcategory.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.subhealth.SubhealthCategory;
import com.shouxin.service.subhealth.subhealthcategory.SubhealthcategoryManager;
import com.shouxin.util.PageData;

/** 
 * 说明： 亚健康分类
 * 创建人：shouxin
 * 创建时间：2016-08-09
 * @version
 */
@Service("subhealthcategoryService")
public class SubhealthcategoryService implements SubhealthcategoryManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("SubhealthcategoryMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("SubhealthcategoryMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("SubhealthcategoryMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SubhealthcategoryMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SubhealthcategoryMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SubhealthcategoryMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SubhealthcategoryMapper.deleteAll", ArrayDATA_IDS);
	}
	
	@SuppressWarnings("unchecked")
	public List<SubhealthCategory> listSubhealthCategorybyParentID(String PARENTID) throws Exception {
		return (List<SubhealthCategory>) dao.findForList("SubhealthcategoryMapper.listSubhealthCategorybyParentID", PARENTID);
	}

	public List<SubhealthCategory> listSubhealthCategoryby(String PARENTID) throws Exception {
		List<SubhealthCategory> SubhealthCategory = listSubhealthCategorybyParentID(PARENTID);
		for (SubhealthCategory cate : SubhealthCategory) {
			List<SubhealthCategory> hea = listSubhealthCategoryby(cate.getSUBHEALTHCATEGORY_ID());
			cate.setTreeUrl("subhealth/list.do?SUBHEALTHCATEGORY_ID="+cate.getSUBHEALTHCATEGORY_ID());
			cate.setTarget("treeFrame");
			cate.setSubhealthCategorys(hea);
		}
		return SubhealthCategory;
	}

	public List<SubhealthCategory> listSubhealthCategory(String PARENTID) throws Exception {
		List<SubhealthCategory> SubhealthCategory = listSubhealthCategorybyParentID(PARENTID);
		for (SubhealthCategory cate : SubhealthCategory) {
			List<SubhealthCategory> hea = listSubhealthCategory(cate.getSUBHEALTHCATEGORY_ID());
			cate.setTreeUrl("subhealthcategory/list.do?SUBHEALTHCATEGORY_ID="+cate.getSUBHEALTHCATEGORY_ID());
			cate.setTarget("treeFrame");
			cate.setSubhealthCategorys(hea);
		}
		return SubhealthCategory;
	}
}

