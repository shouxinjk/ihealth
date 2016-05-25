package com.shouxin.service.admin.diseasecategory.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.DiseaseCategory;
import com.shouxin.util.Logger;
import com.shouxin.util.PageData;
import com.shouxin.service.admin.diseasecategory.DiseaseCategoryManager;

/** 
 * 说明： 疾病分类
 * 创建人：shouxin
 * 创建时间：2016-04-08
 * @version
 */
@Service("diseasecategoryService")
public class DiseaseCategoryService implements DiseaseCategoryManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("DiseaseCategoryMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("DiseaseCategoryMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("DiseaseCategoryMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("DiseaseCategoryMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DiseaseCategoryMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DiseaseCategoryMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("DiseaseCategoryMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<DiseaseCategory> listAllDiseaseCategory(String parentID) throws Exception {
		// TODO Auto-generated method stub
		return (List<DiseaseCategory>) dao.findForList("DiseaseCategoryMapper.listSubDiseaseCategorybyParentID", parentID);
	}

	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<DiseaseCategory> listSubDiseaseCategoryByParentId(String parentID) throws Exception {
		// TODO Auto-generated method stub
		List<DiseaseCategory> diseaseCategory = this.listAllDiseaseCategory(parentID);
		for (DiseaseCategory cate : diseaseCategory) {
			List<DiseaseCategory> dis = this.listSubDiseaseCategoryByParentId(cate.getDISEASECATEGORY_ID());
			cate.setTreeUrl("disease/list.do?DISEASECATEGORY_ID="+cate.getDISEASECATEGORY_ID());
			cate.setTarget("treeFrame");
			cate.setSubDiseaseCategory(dis);	
		}
		
		return diseaseCategory;
	}
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<DiseaseCategory> listAllDiseaseCategoryTree(String parentID) throws Exception {
		// TODO Auto-generated method stub
				List<DiseaseCategory> diseaseCategory = this.listAllDiseaseCategory(parentID);
				for (DiseaseCategory cate : diseaseCategory) {
					List<DiseaseCategory> dis = this.listAllDiseaseCategoryTree(cate.getDISEASECATEGORY_ID());
					cate.setTreeUrl("diseasecategory/list.do?DISEASECATEGORY_ID="+cate.getDISEASECATEGORY_ID());
					cate.setTarget("treeFrame");
					cate.setSubDiseaseCategory(dis);
				}
				return diseaseCategory;
	}
	/**
	 * 模拟树状结构
	 * @param parentID
	 * @param prefix
	 * @return
	 * @throws Exception
	 */
	public List<DiseaseCategory> listAllDiseaseByTree(String parentID,String prefix)throws Exception{
		@SuppressWarnings("unchecked")
		List<DiseaseCategory> c = (List<DiseaseCategory>) dao.findForList("DiseaseCategoryMapper.listSubDiseaseCategorybyParentID", parentID);
		if(!parentID.equals("0")){
			prefix += "--";
		}
		for (DiseaseCategory di : c) {
			
			di.setNAME(prefix+di.getNAME());
			di.setPrefix(prefix);
		}
		return c;
	}
	/**
	 * 模拟树状结构
	 * @param parentID
	 * @param prefix
	 * @return
	 * @throws Exception
	 */
	public List<DiseaseCategory> listAllDiseaseByTree2(String parentID,String prefix) throws Exception {
		List<DiseaseCategory> diseaseCategories = this.listAllDiseaseByTree(parentID, prefix);
		for (DiseaseCategory cate : diseaseCategories) {
			cate.setTreeUrl("diseasecategory/list.do?DISEASECATEGORY_ID="+cate.getDISEASECATEGORY_ID());
			cate.setTarget("treeFrame");
			List<DiseaseCategory> diseaseCategories2 = this.listAllDiseaseByTree2(cate.getDISEASECATEGORY_ID(),cate.getPrefix());
			cate.setSubDiseaseCategory(diseaseCategories2);
		}
		return diseaseCategories;
	}
	
	@SuppressWarnings("unchecked")
	public List<DiseaseCategory> findAllDiseases() throws Exception {
		// TODO Auto-generated method stub
		return (List<DiseaseCategory>) dao.findForList("DiseaseCategoryMapper.findAllDiseases", null);
	}

	@SuppressWarnings("unchecked")
	public List<DiseaseCategory> findAllIsInheritabl() throws Exception {
		
		return (List<DiseaseCategory>) dao.findForList("DiseaseCategoryMapper.findAllIsInheritabl", null);
	}
	
}

