package com.shouxin.service.exam.examcategory.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.exam.ExamCategory;
import com.shouxin.util.PageData;
import com.shouxin.service.exam.examcategory.ExamCategoryManager;

/** 
 * 说明： 医学检查分类
 * 创建人：shouxin
 * 创建时间：2016-04-12
 * @version
 */
@Service("examcategoryService")
public class ExamCategoryService implements ExamCategoryManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("ExamCategoryMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("ExamCategoryMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("ExamCategoryMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ExamCategoryMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ExamCategoryMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ExamCategoryMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ExamCategoryMapper.deleteAll", ArrayDATA_IDS);
	}

	@SuppressWarnings("unchecked")
	public List<ExamCategory> listSubExamCategoryByParentID(String parentID) throws Exception {
		// TODO Auto-generated method stub
		return (List<ExamCategory>) dao.findForList("ExamCategoryMapper.listSubExamCategoryByID", parentID);
	}
	


	public List<ExamCategory> listAllExamCategory(String parentID) throws Exception {
		// TODO Auto-generated method stub
		List<ExamCategory> examCategory = this.listSubExamCategoryByParentID(parentID);
		for (ExamCategory cate : examCategory) {
			cate.setTreeUrl("examcategory/list.do?EXAMCATEGORY_ID="+cate.getEXAMCATEGORY_ID());
			cate.setTarget("treeFrame");
			cate.setSubExamCategory(this.listAllExamCategory(cate.getEXAMCATEGORY_ID()));
		}
		return examCategory;
	}
	
	/**
	 * 指南管理模拟树状结构展示
	 */
	@SuppressWarnings("unchecked")
	public List<ExamCategory> listSubExamCategoryByParentID2(String parentID,String prefix) throws Exception {
		// TODO Auto-generated method stub
		List<ExamCategory> c = (List<ExamCategory>) dao.findForList("ExamCategoryMapper.listSubExamCategoryByID", parentID);
		if(!parentID.equals("0")){
			prefix += "--";
		}
		for (ExamCategory ca : c) {
			
			ca.setNAME(prefix+ca.getNAME());
			ca.setPrefix(prefix);
		}
		return c;
	}
	
	/**
	 * 指南管理模拟树状结构展示
	 */
	public List<ExamCategory> listAllExamCategory2(String parentID,String prefix) throws Exception {
		// TODO Auto-generated method stub
		List<ExamCategory> examCategory = this.listSubExamCategoryByParentID2(parentID,prefix);
		for (ExamCategory cate : examCategory) {
			cate.setTreeUrl("examcategory/list.do?EXAMCATEGORY_ID="+cate.getEXAMCATEGORY_ID());
			cate.setTarget("treeFrame");
			List<ExamCategory> examCategory2 = this.listAllExamCategory2(cate.getEXAMCATEGORY_ID(),cate.getPrefix());
			cate.setSubExamCategory(examCategory2);
		}
		return examCategory;
	}
	
}

