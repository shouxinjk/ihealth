package com.shouxin.service.medical.medicalceneradmin.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;
import com.shouxin.service.medical.medicalceneradmin.MedicalCenerAdminManager;

/** 
 * 说明： 体检中心管理员信息
 * 创建人：shouxin
 * 创建时间：2016-04-06
 * @version
 */
@Service("medicalceneradminService")
public class MedicalCenerAdminService implements MedicalCenerAdminManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	
	public void save(PageData pd)throws Exception{
		dao.save("MedicalCenerAdminMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	
	public void delete(PageData pd)throws Exception{
		dao.delete("MedicalCenerAdminMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	
	public void edit(PageData pd)throws Exception{
		dao.update("MedicalCenerAdminMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MedicalCenerAdminMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MedicalCenerAdminMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MedicalCenerAdminMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MedicalCenerAdminMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

