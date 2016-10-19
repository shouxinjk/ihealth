package com.shouxin.service.subhealth.subhealth;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Tag;
import com.shouxin.entity.subhealth.SubhealthCategory;
import com.shouxin.util.PageData;

/** 
 * 说明： 亚健康症状接口
 * 创建人：shouxin
 * 创建时间：2016-08-09
 * @version
 */
public interface SubhealthManager{

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
	
	/***
	 * restfull接口获取所有为标签的亚健康  信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> restListAll(PageData pd)throws Exception;
	
	/**
	 * 微信接口查询该用户下的所有亚健康症状信息
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public List<PageData> restListSubhealthByUserID(String USER_ID)throws Exception;
	
	/**
	 * 微信接口添加该用户的亚健康症状信息
	 * @param pd
	 * @throws Exception
	 */
	public void restSaveUserSubhealth(PageData pd)throws Exception;
	
	/**
	 * 微信接口删除该用户的所有亚健康信息
	 * @param USER_ID
	 * @throws Exception
	 */
	public void restDeleteUserSubhealth(String USER_ID)throws Exception;

	/**
	 * 获取所有亚健康分类ID和名字
	 * @param page
	 * @return
	 */
	public List<PageData> subhealthcategory(Page page)throws Exception;
	
	/**
	 * 获取所有亚健康ID和名字
	 * @param page
	 * @return
	 */
	public List<PageData> listsubhealth(Page page)throws Exception;

	public List<SubhealthCategory> findAllCategoryIdSubhealth(String SUBHEALTHCATEGORY_ID)throws Exception;

	
}

 