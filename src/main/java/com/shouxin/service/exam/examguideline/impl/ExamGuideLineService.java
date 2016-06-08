package com.shouxin.service.exam.examguideline.impl;

import java.util.List;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;
import com.shouxin.util.StatusEnum;
import com.shouxinjk.ihealth.data.Transfer;
import com.shouxin.service.exam.examguideline.ExamGuideLineManager;

/**
 * 说明： 医学体检指南 创建人：shouxin 创建时间：2016-04-07
 * 
 * @version
 */
@Service("examguidelineService")
public class ExamGuideLineService implements ExamGuideLineManager {
	Logger logger = Logger.getLogger(ExamGuideLineService.class);
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 新增
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception {
		dao.save("ExamGuideLineMapper.save", pd);
	}

	/**
	 * 删除
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("ExamGuideLineMapper.delete", pd);
	}

	/**
	 * 修改
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("ExamGuideLineMapper.edit", pd);
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ExamGuideLineMapper.datalistPage", page);
	}

	/**
	 * 列表(全部)
	 * 
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ExamGuideLineMapper.listAll", pd);
	}

	/**
	 * 通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ExamGuideLineMapper.findById", pd);
	}

	/**
	 * 批量删除
	 * 
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("ExamGuideLineMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 修改指南规则
	 */
	public void editRule(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ExamGuideLineMapper.editRule", pd);
	}

	/**
	 * 修改指南状态
	 */
	public void auditing(PageData pd) throws Exception {
		dao.update("ExamGuideLineMapper.auditing", pd);
		//qchzhu: hook analysis interface
		Transfer transfer = Transfer.getInstance();
		String guideLineId = pd.getString("EXAMGUIDELINE_ID");
		String status = pd.getString("STATUS");
		logger.debug("try to tranfer guideLine to analysis system.[guideLineId]"+guideLineId+"[targte status]"+status);
		if(StatusEnum.PUBLISH.getName().equals(status)){
			logger.debug("try to release new guideLine.[guideLineId]"+guideLineId);
			transfer.releaseGuideLine(guideLineId);
		}else if(StatusEnum.EXPIRED.getName().equals(status)){
			logger.debug("try to disable guideLine.[guideLineId]"+guideLineId);
			transfer.cancelGuideLine(guideLineId);
		}
		//end
	}

	/**
	 * 查询运维审核后的指南
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listRelease(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ExamGuideLineMapper.dataReleaselistPage", page);
	}
	
	/**
	 * 医生已提交指南审核管理页面
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listVerfiy(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ExamGuideLineMapper.dataVerfiylistPage", page);
	}

	/**
	 * 运维已补充管理页面
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listRelVerfiy(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ExamGuideLineMapper.dataRelVerfiylistPage", page);
	}

}
