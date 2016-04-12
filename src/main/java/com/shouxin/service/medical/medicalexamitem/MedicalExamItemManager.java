package com.shouxin.service.medical.medicalexamitem;

import java.util.List;
import java.util.Map;

import com.shouxin.entity.Page;
import com.shouxin.util.PageData;

/** 
 * 说明： 医学检查项目接口
 * 创建人：shouxin
 * 创建时间：2016-04-06
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
	
	
	public List<PageData> listExamItemAndCenter(PageData pd)throws Exception;
	
}

