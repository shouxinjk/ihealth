package com.shouxin.entity.solr;

import com.shouxin.entity.admin.Article;

/**
 * 文章结果
 * @author sks
 *
 */
public class ArticleSolr extends Article{

	private static final long serialVersionUID = 1L;
	
	private String tags;	//用户标签
	private String personalDiseases;	//个人疾病
	private String familyDiseases;	//遗传疾病
	private String concernDiseases;	//关注疾病
	
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getPersonalDiseases() {
		return personalDiseases;
	}
	public void setPersonalDiseases(String personalDiseases) {
		this.personalDiseases = personalDiseases;
	}
	public String getFamilyDiseases() {
		return familyDiseases;
	}
	public void setFamilyDiseases(String familyDiseases) {
		this.familyDiseases = familyDiseases;
	}
	public String getConcernDiseases() {
		return concernDiseases;
	}
	public void setConcernDiseases(String concernDiseases) {
		this.concernDiseases = concernDiseases;
	}
	
	
	
}
