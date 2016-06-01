package com.shouxin.service.test;

import org.testng.annotations.Test;

import com.shouxin.util.UuidUtil;

import org.testng.annotations.BeforeClass;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrInputDocument;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.AfterTest;

public class SolrClientTest {
	
	private SolrClient cilent = null;
	private static final String URL = "http://localhost:8983/solr/gettingstarted";
	
	
	@BeforeClass
	public void beforeClass() {
		try {
			cilent = new HttpSolrClient(URL);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@AfterClass
	public void afterClass() {
		cilent = null;
		System.runFinalization();
		System.gc();
	}
	
	public final void print(Object o){
		System.out.println(o);
	}
	
	@Test
	public void f() {
		//step1 document
		//step2 add to index
		//step3 commit
		
		
		print(cilent);
		SolrInputDocument doc = new SolrInputDocument();
		doc.addField("id", "test000001");
		doc.addField("title", "测试文章提交AAAA");
		doc.addField("url", "http:localhost:8080");
		doc.addField("USER_ID", "CESHI");
		try {
			UpdateResponse response = cilent.add(doc);
			//UpdateResponse response = cilent.deleteById("test000001");
			print(cilent.commit());
			print(response);
			print("querytime:"+response.getQTime());
			print("ElapsedTime：" + response.getElapsedTime());
			print("status:" + response.getStatus());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@BeforeTest
	public void beforeTest() {
		
	}

	@AfterTest
	public void afterTest() {
		
	}

}
