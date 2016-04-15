package com.shouxin.service.checkup.checkuppackage;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.entity.checkup.CheckupPackage;
import com.shouxin.util.PageData;

/** 
 * 说明： 体检套餐管理接口
 * 创建人：shouxin
 * 创建时间：2016-04-10
 * @version
 */
public interface CheckupPackageManager{

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
	
	/**
	 * 根据用户ID获取体检套餐信息 多个体检套餐
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<CheckupPackage> listAllById(String id)throws Exception;
	
}

