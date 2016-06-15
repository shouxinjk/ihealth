package com.shouxin.service.exam.examitem.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.exam.ExamCategory;
import com.shouxin.entity.exam.ExamItem;
import com.shouxin.util.PageData;
import com.shouxin.service.exam.examcategory.ExamCategoryManager;
import com.shouxin.service.exam.examitem.ExamItemManager;

/** 
 * 说明： 医学体检项目
 * 创建人：shouxin
 * 创建时间：2016-04-07
 * @version
 */
@Service("examitemService")
public class ExamItemService implements ExamItemManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="examcategoryService")
	private ExamCategoryManager examcategoryService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ExamItemMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ExamItemMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ExamItemMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ExamItemMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ExamItemMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ExamItemMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ExamItemMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 获取所有数据（递归子列表）
	 * @param parentID
	 * @return
	 * @throws Exception
	 */
	public List<ExamCategory> listAllExamCategory(String parentID) throws Exception {
		// TODO Auto-generated method stub
		List<ExamCategory> examCategory = examcategoryService.listSubExamCategoryByParentID(parentID);
		for (ExamCategory cate : examCategory) {
			List<ExamCategory> examCategory2 = this.listAllExamCategory(cate.getEXAMCATEGORY_ID());
			cate.setTarget("treeFrame");
			cate.setTreeUrl("examitem/list.do?EXAMCATEGORY_ID="+cate.getEXAMCATEGORY_ID());
			cate.setSubExamCategory(examCategory2);
			
		}
		return examCategory;
	}
	/**通过id获取ExamCategory数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findExamCategoryById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return examcategoryService.findById(pd);
	}
	
	/**
	 * 通过EXAMCATEGORY_ID查询检查分类信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listItemByExamCategoryID(String EXAMCATEGORY_ID) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ExamItemMapper.listItemByItemCategory_id", EXAMCATEGORY_ID);
	}

	public ExamItem findById(String EXAMITEM_ID) throws Exception {
		// TODO Auto-generated method stub
		return (ExamItem) dao.findForObject("ExamItemMapper.findByIdMap", EXAMITEM_ID);
	}
	
	
	
}

