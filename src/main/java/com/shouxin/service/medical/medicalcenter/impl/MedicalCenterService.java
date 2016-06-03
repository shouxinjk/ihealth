package com.shouxin.service.medical.medicalcenter.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.service.medical.medicalcenter.MedicalCenterManager;
import com.shouxin.util.PageData;

/** 
 * 说明： 体检中心
 * 创建人：shouxin
 * 创建时间：2016-05-19
 * @version
 */
@Service("medicalcenterService")
public class MedicalCenterService implements MedicalCenterManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("MedicalCenterMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("MedicalCenterMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("MedicalCenterMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MedicalCenterMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MedicalCenterMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MedicalCenterMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MedicalCenterMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 修改体检中心状态
	 */
	public void auditing(PageData pd) throws Exception {
		dao.update("MedicalCenterMapper.auditing", pd);
		
	}
	
	/**
	 * 查询审核页面列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listRelAll(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("MedicalCenterMapper.datarellistPage", page);
	}
	
}

