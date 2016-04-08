package com.shouxin.service.exam.examfrequency.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;
import com.shouxin.service.exam.examfrequency.ExamFrequencyManager;

/** 
 * 说明： 医学检查频率
 * 创建人：shouxin
 * 创建时间：2016-04-07
 * @version
 */
@Service("examfrequencyService")
public class ExamFrequencyService implements ExamFrequencyManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	
	public void save(PageData pd)throws Exception{
		dao.save("ExamFrequencyMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	
	public void delete(PageData pd)throws Exception{
		dao.delete("ExamFrequencyMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	
	public void edit(PageData pd)throws Exception{
		dao.update("ExamFrequencyMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ExamFrequencyMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ExamFrequencyMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ExamFrequencyMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ExamFrequencyMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

