package com.shouxin.service.medical.medicalcenter;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.medical.MedicalCenter;
import com.shouxin.util.PageData;

/** 
 * 说明： 体检中心接口
 * 创建人：shouxin
 * 创建时间：2016-05-19
 * @version
 */
public interface MedicalCenterManager{

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
	public List<PageData> ListDigui(Page page,List<PageData> pd)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll()throws Exception;

	/**
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listRelAll(Page page) throws Exception;
	
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
	 * 修改体检中心状态
	 * @param pd
	 * @throws Exception
	 */
	public void auditing(PageData pd)throws Exception;
	
	public List<MedicalCenter> listParentIDPage(String MEDICALCENTER_ID)throws Exception;
	
	/**
	 * 添加体检中心管理员信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveCenterAdmin(PageData pd)throws Exception;
	
}

