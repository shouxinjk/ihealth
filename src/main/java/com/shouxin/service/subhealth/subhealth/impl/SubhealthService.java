package com.shouxin.service.subhealth.subhealth.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Tag;
import com.shouxin.entity.subhealth.SubhealthCategory;
import com.shouxin.util.PageData;
import com.shouxin.service.subhealth.subhealth.SubhealthManager;

/** 
 * 说明： 亚健康症状
 * 创建人：shouxin
 * 创建时间：2016-08-09
 * @version
 */
@Service("subhealthService")
public class SubhealthService implements SubhealthManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("SubhealthMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("SubhealthMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("SubhealthMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SubhealthMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SubhealthMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SubhealthMapper.findById", pd);
	}
	

	/**
	 * 获取所有亚健康分类ID和名字
	 * 
	 * @param pd
	 * @throws Exception
	 */
	// @Override
	@SuppressWarnings("unchecked")
	public List<PageData> subhealthcategory(Page page) throws Exception {
		return (List<PageData>) dao.findForList("SubhealthMapper.subhealthcategory", page);
	}

	/**
	 * 获取所有亚健康ID和名字
	 * 
	 * @param pd
	 * @throws Exception
	 */
	// @Override
	@SuppressWarnings("unchecked")
	public List<PageData> listsubhealth(Page page) throws Exception {
		return (List<PageData>) dao.findForList("SubhealthMapper.listsubhealth", page);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SubhealthMapper.deleteAll", ArrayDATA_IDS);
	}

	/***
	 * restfull接口获取所有为标签的亚健康  信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> restListAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("SubhealthMapper.restListAll", pd);
	}

	/**
	 * 微信接口查询该用户下的所有亚健康症状信息
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> restListSubhealthByUserID(String USER_ID) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("SubhealthMapper.restListSubhealthByUserID", USER_ID);
	}

	/**
	 * 微信接口添加该用户的亚健康症状信息
	 * @param pd
	 * @throws Exception
	 */
	public void restSaveUserSubhealth(PageData pd)throws Exception{
		dao.save("SubhealthMapper.restSaveUserSubhealth", pd);
	};
	
	/**
	 * 微信接口删除该用户的所有亚健康信息
	 * @param USER_ID
	 * @throws Exception
	 */
	public void restDeleteUserSubhealth(String USER_ID)throws Exception{
		dao.delete("SubhealthMapper.restDeleteUserSubhealth", USER_ID);
	}

	/**
	 * T通过标签分类id获取疾病信息
	 */
	@SuppressWarnings("unchecked")
	public List<SubhealthCategory> findAllCategoryIdSubhealth(String SUBHEALTHCATEGORY_ID) throws Exception {
		return (List<SubhealthCategory>) dao.findForList("SubhealthMapper.findAllCategoryIdSubhealth", SUBHEALTHCATEGORY_ID);
	}
	
}

