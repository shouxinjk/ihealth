package com.shouxin.service.medical.medicalexamitem.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.service.medical.medicalexamitem.MedicalExamItemManager;
import com.shouxin.util.PageData;

/** 
 * 说明： 体检中心体检项目
 * 创建人：shouxin
 * 创建时间：2016-05-19
 * @version
 */
@Service("medicalexamitemService")
public class MedicalExamItemService implements MedicalExamItemManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("MedicalExamItemMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("MedicalExamItemMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("MedicalExamItemMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MedicalExamItemMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MedicalExamItemMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MedicalExamItemMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MedicalExamItemMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 * 根据 登陆用户id获取体检中心id
	 */
	public PageData findAdminByUserId(String userId) throws Exception {
		return (PageData) dao.findForObject("MedicalExamItemMapper.findadminbyuserid", userId);
	}
	
	/**
	 * 跟据体检项目id修改体检项目状态
	 * @param pd
	 * @throws Exception
	 */
	public void auditing(PageData pd) throws Exception {
		dao.update("MedicalExamItemMapper.auditing", pd);
	}
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listrel(Page page) throws Exception {
		return (List<PageData>) dao.findForList("MedicalExamItemMapper.datarellistPage", page);
	}

	/**
	 * 根据checkupitemid查询体检中心体检项目
	 * @param CHECKEDUPITEM_ID
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listMedicalItemByCheckuoItemId(String CHECKEDUPITEM_ID) throws Exception {
		return (List<PageData>) dao.findForList("MedicalExamItemMapper.listMedicalItemByCheckuoItemId", CHECKEDUPITEM_ID);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> dataplatformrellistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("MedicalExamItemMapper.dataplatformrellistPage", page);
	}
	
}

