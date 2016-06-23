package com.shouxin.service.admin.disease;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Disease;
import com.shouxin.util.PageData;

/** 
 * 说明： 疾病接口
 * 创建人：shouxin
 * 创建时间：2016-04-07
 * @version
 */
public interface DiseaseManager{

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
	
	/**
	 * 查询所有家族疾病信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllIsInheritable(PageData pd) throws Exception;
	
	/**
	 * 查询所有关注疾病
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllIsHighIncidence(PageData pd) throws Exception;
	
	/**
	 * 查询该用户下的所有疾病信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllByUserID(PageData pd)throws Exception;
	
	/**
	 * 查询该用户下的所有家族疾病信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllByUserIDIsInherItable(PageData pd)throws Exception;
	
	/**
	 * 查询该用户下的所有关注疾病信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllByUserIDIsHighIncaidence(PageData pd)throws Exception;
	
	
	/**
	 * 为这个用户添加个人疾病信息
	 * @param pd
	 * @throws Exception
	 */
	public void userSavepPersonalDisease(PageData pd) throws Exception;
	
	/**
	 * 为这个用户添加家族疾病信息
	 * @param pd
	 * @throws Exception
	 */
	public void userSavepFamilyDisease(PageData pd) throws Exception;
	
	/**
	 * 为这个用户添加关注疾病信息
	 * @param pd
	 * @throws Exception
	 */
	public void userSavepFocusDisease(PageData pd) throws Exception;
	
	/**
	 * 删除这个用户的所有的疾病信息
	 * @throws Exception
	 */
	public void deleteDiseaseByUserID(PageData pd) throws Exception;
	/**
	 * 删除这个用户的所有的疾病信息
	 * @throws Exception
	 */
	public void deleteFamilyDiseaseByUserID(PageData pd) throws Exception;
	/**
	 * 删除这个用户的所有的疾病信息
	 * @throws Exception
	 */
	public void deleteFocusDiseaseByUserID(PageData pd) throws Exception;
	
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
	
	public List<Disease> listDiseaseByDiseaseCategoryID(String DISEASECATEGORY_ID)throws Exception;
	
	/**
	 * 根据疾病名称查询疾病信息
	 * @param NAME
	 * @return
	 * @throws Exception
	 */
	public Disease findDiseaseByName(String NAME) throws Exception;
	
}

