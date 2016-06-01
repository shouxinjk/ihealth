package com.shouxin.service.solrj;

import java.util.List;

import com.shouxin.entity.admin.Article;
import com.shouxin.entity.solr.ArticleSolr;
import com.shouxin.util.PageData;

public interface SolrManager {
	
	//向solr服务器添加数据
	public boolean save(Object obj)throws Exception;
	//根据ID删除数据
	public boolean delById(Object obj)throws Exception;
	//根据ID查询数据
	public List<Object> findById(Object obj)throws Exception;
	//查询所有数据
	public List<Object> findAll()throws Exception;
	
	/**
	 * 保存文章的接口
	 * @param article
	 * @return
	 * @throws Exception
	 */
	public boolean saveArticle(ArticleSolr articleSolr)throws Exception;
	
	
	public boolean delArticle(String id)throws Exception;
	
	public StringBuffer findByParams(ArticleSolr articleSolr)throws Exception;
}
