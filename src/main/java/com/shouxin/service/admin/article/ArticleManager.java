package com.shouxin.service.admin.article;

import java.util.List;
import com.shouxin.entity.Page;
import com.shouxin.util.PageData;

/** 
 * 说明： 文章信息管理接口
 * 创建人：shouxin
 * 创建时间：2016-04-13
 * @version
 */
public interface ArticleManager{

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
	
	public void deleteTags(PageData pd)throws Exception;
	
	
	public void deleteDiseases(PageData pd)throws Exception;
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
	 * 新增标签跟文章的关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveTagAndArticle(PageData pd)throws Exception;
	
	/**
	 * 新增疾病跟文章的关系
	 * @param pd
	 * @throws Exception
	 */
	public void saveDiseaseAndArticle(PageData pd)throws Exception;
	
	public List<PageData> findAllTags(PageData pd)throws Exception;
	
	/**前20条数据 按时间降序排序
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listByTopTwenty(PageData pd)throws Exception;
	
	/**
	 * 根据文章ID 查询所关联的标签信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findTagsByArticleId(PageData pd)throws Exception;
	
	/**
	 * 根据文章ID 查询所关联的疾病信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findDiseaseByArticleId(PageData pd)throws Exception;
	
	
}

