package com.shouxin.service.admin.tag.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.testng.log4testng.Logger;

import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.entity.admin.Tag;
import com.shouxin.util.PageData;
import com.shouxinjk.ihealth.data.Transfer;
import com.shouxin.service.admin.tag.TagManager;

/**
 * 说明： 标签信息 创建人：shouxin 创建时间：2016-04-10
 * 
 * @version
 */
@Service("tagService")
public class TagService implements TagManager {

	Logger logger = Logger.getLogger(TagService.class);
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 新增
	 * 
	 * @param pd
	 * @throws Exception
	 */
	// @Override
	public void save(PageData pd) throws Exception {
		dao.save("TagMapper.save", pd);
		//qchzhu: hook analysis interface
		Transfer transfer = Transfer.getInstance();
		try{
			transfer.transferTag(pd.getString("fieldName"), pd.getString("fieldType"));
		}catch(Exception ex){
			logger.error("fail to transfer tag.",ex);
		}
		//end hook analysis interface
	}

	/**
	 * 删除
	 * 
	 * @param pd
	 * @throws Exception
	 */
	// @Override
	public void delete(PageData pd) throws Exception {
		dao.delete("TagMapper.delete", pd);
	}

	/**
	 * 修改
	 * 
	 * @param pd
	 * @throws Exception
	 */
	// @Override
	public void edit(PageData pd) throws Exception {
		dao.update("TagMapper.edit", pd);
		//qchzhu: hook analysis interface
		Transfer transfer = Transfer.getInstance();
		try{
			transfer.transferTag(pd.getString("fieldName"), pd.getString("fieldType"));
		}catch(Exception ex){
			logger.error("fail to transfer tag.",ex);
		}
		//end hook analysis interface
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	// @Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TagMapper.datalistPage", page);
	}

	/**
	 * 列表(全部)
	 * 
	 * @param pd
	 * @throws Exception
	 */
	// @Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("TagMapper.listAll", pd);
	}

	/**
	 * 通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	// @Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("TagMapper.findById", pd);
	}

	/**
	 * 批量删除
	 * 
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	// @Override
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("TagMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 通过标签分类id获取标签数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findAllByTagCategoryId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("TagMapper.findALLByTagCategoryId", pd);
	}

	/**
	 * 批量增加用户所属的标签
	 * 
	 * @throws Exception
	 */
	public void addAll(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("TagMapper.userSaveTag", pd);
	}

	/**
	 * 删除用户所属的标签信息
	 * 
	 * @throws Exception
	 */
	public void deleteTagByUserID(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("TagMapper.deleteTagByUserID",pd);
	}
	
	/**
	 * 根据用户id获取属于这个用户的标签信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listTagByUserID(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("TagMapper.findALLByUserID", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findAllGroupByUId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("TagMapper.findALLByUserID", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findALLByGroup(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("TagMapper.findALLByGroup", pd);
	}

	/**
	 * 根据标签名称查询标签信息
	 */
	public Tag findTagByName(String NAME) throws Exception {
		return (Tag) dao.findForObject("TagMapper.findTagByName", NAME);
	}

}
