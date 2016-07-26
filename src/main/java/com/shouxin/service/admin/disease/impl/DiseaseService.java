package com.shouxin.service.admin.disease.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Disease;
import com.shouxin.util.PageData;
import com.shouxin.service.admin.disease.DiseaseManager;

/**
 * 说明： 疾病 创建人：shouxin 创建时间：2016-04-07
 * 
 * @version
 */
@Service("diseaseService")
public class DiseaseService implements DiseaseManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 新增
	 * 
	 * @param pd
	 * @throws Exception
	 */

	public void save(PageData pd) throws Exception {
		dao.save("DiseaseMapper.save", pd);
	}

	/**
	 * 删除
	 * 
	 * @param pd
	 * @throws Exception
	 */

	public void delete(PageData pd) throws Exception {
		dao.delete("DiseaseMapper.delete", pd);
	}

	/**
	 * 修改
	 * 
	 * @param pd
	 * @throws Exception
	 */

	public void edit(PageData pd) throws Exception {
		dao.update("DiseaseMapper.edit", pd);
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */

	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("DiseaseMapper.datalistPage", page);
	}

	/**
	 * 列表(全部)
	 * 
	 * @param pd
	 * @throws Exception
	 */

	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("DiseaseMapper.listAll", pd);
	}

	/**
	 * 通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */

	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("DiseaseMapper.findById", pd);
	}

	/**
	 * 批量删除
	 * 
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */

	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("DiseaseMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * T通过疾病分类id获取疾病信息
	 */
	@SuppressWarnings("unchecked")
	public List<Disease> listDiseaseByDiseaseCategoryID(String DISEASECATEGORY_ID) throws Exception {
		return (List<Disease>) dao.findForList("DiseaseMapper.getDiseaseAndCategoryByID", DISEASECATEGORY_ID);
	}

	/**
	 * 查询所有家族疾病
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllIsInheritable(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("DiseaseMapper.listAllisInheritable", pd);
	}

	/**
	 * 查询所有关注疾病
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllIsHighIncidence(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("DiseaseMapper.listAllisHighIncidence", pd);
	}

	/**
	 * 为这个用户添加个人疾病信息
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void userSavepPersonalDisease(PageData pd) throws Exception {
		dao.save("DiseaseMapper.userSavepPersonalDisease", pd);
	}

	/**
	 * 为这个用户添加家族疾病信息
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void userSavepFamilyDisease(PageData pd) throws Exception {
		dao.save("DiseaseMapper.userSavepFamilyDisease", pd);
	}

	/**
	 * 为这个用户添加关注疾病信息
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void userSavepFocusDisease(PageData pd) throws Exception {
		dao.save("DiseaseMapper.userSavepFocusDisease", pd);
	};

	/**
	 * 删除这个用户的个人疾病信息
	 */
	public void deleteDiseaseByUserID(PageData pd) throws Exception {
		dao.delete("DiseaseMapper.deletePersonalDiseaseByUserID", pd);
	}

	/**
	 * 删除这个用户的家族疾病信息
	 */
	public void deleteFamilyDiseaseByUserID(PageData pd) throws Exception {
		dao.delete("DiseaseMapper.deleteFamilyDiseaseByUserID", pd);
	}

	/**
	 * 删除这个用户的关注疾病信息
	 */
	public void deleteFocusDiseaseByUserID(PageData pd) throws Exception {
		dao.delete("DiseaseMapper.deleteFocusDiseaseByUserID", pd);
	}
	/**
	 * 查询该用户下的所有疾病信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllByUserID(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("DiseaseMapper.listDiseaseByUserID", pd);
	}

	/**
	 * 查询该用户下的所有家族疾病信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllByUserIDIsInherItable(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("DiseaseMapper.listDiseaseByUserIDIsInherItable", pd);
	}

	/**
	 * 查询该用户下的所有关注信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllByUserIDIsHighIncaidence(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("DiseaseMapper.listDiseaeByUserIDIsHighIncaidence", pd);
	}
	
	/**
	 * 根据疾病名称查询疾病信息
	 */
	public Disease findDiseaseByName(String NAME) throws Exception {
		return (Disease) dao.findForObject("DiseaseMapper.findDiseaseByName", NAME);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> getDiseaseAndCategoryByIDPD(String id) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("DiseaseMapper.getDiseaseAndCategoryByIDPD",id);
	}

	

}
