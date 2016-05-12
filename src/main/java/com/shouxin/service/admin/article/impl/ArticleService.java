package com.shouxin.service.admin.article.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shouxin.dao.DaoSupport;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;
import com.shouxin.service.admin.article.ArticleManager;

/** 
 * 说明： 文章信息管理
 * 创建人：shouxin
 * 创建时间：2016-04-13
 * @version
 */
@Service("articleService")
public class ArticleService implements ArticleManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void save(PageData pd)throws Exception{
		dao.save("ArticleMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("ArticleMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public void edit(PageData pd)throws Exception{
		dao.update("ArticleMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ArticleMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ArticleMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ArticleMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	//@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ArticleMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 新增标签跟文章的关系
	 */
	public void saveTagAndArticle(PageData pd) throws Exception {
		dao.save("ArticleMapper.saveTagAndArticle", pd);
		
	}

	/**
	 * 新增疾病跟文章的关系
	 */
	public void saveDiseaseAndArticle(PageData pd) throws Exception {
		dao.save("ArticleMapper.saveDiseaseAndArticle", pd);
		
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findAllTags(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("ArticleMapper.findAllTags", pd);
	}
	
	/**
	 * 查询前20条数据 按创建时间逆序排序
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByTopTwenty(PageData pd) throws Exception {
		
		return (List<PageData>)dao.findForList("ArticleMapper.listByTopTwenty", pd);
	}

	/**
	 * 根据文章ID 查询关联的标签信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findTagsByArticleId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ArticleMapper.findTagsByArticleId", pd);
	}

	
	/**
	 * 根据文章ID 查询关联的疾病信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findDiseaseByArticleId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ArticleMapper.findDiseaseByArticleId", pd);
	}

	public void deleteTags(PageData pd) throws Exception {
		
		dao.delete("ArticleMapper.deleteTags", pd);
	}

	public void deleteDiseases(PageData pd) throws Exception {
		dao.delete("ArticleMapper.deleteDiseases", pd);
		
	}

	@SuppressWarnings("unchecked")
	public List<PageData> auditListPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ArticleMapper.auditListPage", page);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> articleReleasePage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ArticleMapper.articleReleasePage", page);
	}

	
}

