package com.shouxin.service.solrj.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;

import com.shouxin.entity.admin.Article;
import com.shouxin.entity.solr.ArticleSolr;
import com.shouxin.service.solrj.SolrManager;
import com.shouxin.util.PageData;


public class SolrManagerImpl implements SolrManager {

	//solr connection Object
	private SolrClient cilent = null;
	//solr input Object
	private SolrInputDocument doc = null;
	//solr update Object
	private UpdateResponse response = null;
	
	//solr 
	private QueryResponse queryResponse = null;
	//solr connection url
	private String url = "http://localhost:8983/solr/gettingstarted";
	
	public SolrManagerImpl(String url){
		this.url = url;
		try {
			cilent = new HttpSolrClient(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean save(Object obj) throws Exception {
		doc = new SolrInputDocument();
		return true;
	}

	public boolean delById(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return true;
	}

	public List<Object> findById(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Object> findAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean saveArticle(ArticleSolr articleSolr) throws Exception {
		doc = new SolrInputDocument();
		doc.addField("id", articleSolr.getARTICLE_ID());
		doc.addField("title", articleSolr.getTITLE());
		doc.addField("summary", articleSolr.getSUMMARY());
		doc.addField("url", articleSolr.getURL());
		doc.addField("content", null);
		/*doc.addField("tags", articleSolr.getTags());
		doc.addField("personalDiseases", articleSolr.getPersonalDiseases());
		doc.addField("familyDiseases", articleSolr.getFamilyDiseases());
		doc.addField("concernDiseases", articleSolr.getConcernDiseases());*/
		doc.addField("tags", null);
		doc.addField("personalDiseases", null);
		doc.addField("familyDiseases", null);
		doc.addField("concernDiseases", null);
		try {
			response = cilent.add(doc);
			cilent.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean delArticle(String id) throws Exception {
		try {
			response = cilent.deleteById(id);
			cilent.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public StringBuffer findByParams(ArticleSolr articleSolr) throws Exception {
		StringBuffer sb = new StringBuffer();
		if (articleSolr.getTags() != null && articleSolr.getTags() != "") {
			sb.append("tags:"+articleSolr.getTags()+"");
		}
		if (articleSolr.getPersonalDiseases() != null && articleSolr.getPersonalDiseases() != "") {
			sb.append(",personalDiseases:"+articleSolr.getPersonalDiseases()+"");
		}
		if (articleSolr.getFamilyDiseases() != null && articleSolr.getFamilyDiseases() !="") {
			sb.append(",familyDiseases:"+articleSolr.getFamilyDiseases()+"");
		}
		if (articleSolr.getConcernDiseases()!=null && articleSolr.getConcernDiseases() !="") {
			sb.append(",concernDiseases:"+articleSolr.getConcernDiseases()+"");
		}
		SolrQuery params = new SolrQuery(sb.toString());
		queryResponse = cilent.query(params);
		SolrDocumentList list = queryResponse.getResults();
		System.out.println(list);
		sb = new StringBuffer();
		for (SolrDocument solrDocument : list) {
			//test
			System.out.println(solrDocument.getFieldValue("id"));
			//将查询出的数据添加到PageData中
			sb.append(solrDocument.getFieldValue("id")+",");
			
		}
		return sb;
	}

}
