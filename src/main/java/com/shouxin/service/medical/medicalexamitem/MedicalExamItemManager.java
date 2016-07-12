package com.shouxin.service.medical.medicalexamitem;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;

/** 
 * 说明： 体检中心体检项目接口
 * 创建人：shouxin
 * 创建时间：2016-05-19
 * @version
 */
public interface MedicalExamItemManager{

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
	
	/**审核体检项目列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listrel(Page page)throws Exception;
	
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
	 * 根据登陆用户id获取体检中心ID
	 * @param userId
	 * @throws Exception
	 */
	public String findAdminByUserId(String userId) throws Exception;
	
	/**
	 * 跟据体检项目id修改体检项目状态
	 * @param pd
	 * @throws Exception
	 */
	public void auditing(PageData pd)throws Exception;
	
	/**
	 * 根据checkupitemid查询体检中心体检项目
	 * @param CHECKEDUPITEM_ID
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listMedicalItemByCheckuoItemId(String CHECKEDUPITEM_ID)throws Exception;
	
}

