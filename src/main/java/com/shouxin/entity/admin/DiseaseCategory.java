package com.shouxin.entity.admin;

import java.util.Date;
import java.util.List;

public class DiseaseCategory {

	private String DISEASECATEGORY_ID;// varchar(100) NOT NULL,
	private String NAME;// varchar(255) DEFAULT NULL COMMENT '名称',
	private String DESCRIPTION;// varchar(255) DEFAULT NULL COMMENT '描述',
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '创建记录时间',
	private DiseaseCategory category;
	private List<DiseaseCategory> subDiseaseCategory;
	private String target;
	private boolean hasDiseaseCategory = false;
	private String treeUrl;
	private String PARENT_ID;

	@Override
	public String toString() {
		return "DiseaseCategory [DISEASECATEGORY_ID=" + DISEASECATEGORY_ID + ", NAME=" + NAME + ", DESCRIPTION="
				+ DESCRIPTION + ", CREATEBY=" + CREATEBY + ", CREATEON=" + CREATEON + ", category=" + category
				+ ", subDiseaseCategory=" + subDiseaseCategory + ", target=" + target + ", hasDiseaseCategory="
				+ hasDiseaseCategory + ", treeUrl=" + treeUrl + ", PARENT_ID=" + PARENT_ID + ", diseases=" + diseases
				+ "]";
	}

	public String getPARENT_ID() {
		return PARENT_ID;
	}

	public void setPARENT_ID(String pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}

	public List<DiseaseCategory> getSubDiseaseCategory() {
		return subDiseaseCategory;
	}

	public void setSubDiseaseCategory(List<DiseaseCategory> subDiseaseCategory) {
		this.subDiseaseCategory = subDiseaseCategory;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getTreeUrl() {
		return treeUrl;
	}

	public boolean isHasDiseaseCategory() {
		return hasDiseaseCategory;
	}

	public void setHasDiseaseCategory(boolean hasDiseaseCategory) {
		this.hasDiseaseCategory = hasDiseaseCategory;
	}

	public void setTreeUrl(String treeUrl) {
		this.treeUrl = treeUrl;
	}

	private List<Disease> diseases;

	public String getDISEASECATEGORY_ID() {
		return DISEASECATEGORY_ID;
	}

	public void setDISEASECATEGORY_ID(String dISEASECATEGORY_ID) {
		DISEASECATEGORY_ID = dISEASECATEGORY_ID;
	}

	public DiseaseCategory getCategory() {
		return category;
	}

	public void setCategory(DiseaseCategory category) {
		this.category = category;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getDESCRIPTION() {
		return DESCRIPTION;
	}

	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}

	public String getCREATEBY() {
		return CREATEBY;
	}

	public void setCREATEBY(String cREATEBY) {
		CREATEBY = cREATEBY;
	}

	public Date getCREATEON() {
		return CREATEON;
	}

	public void setCREATEON(Date cREATEON) {
		CREATEON = cREATEON;
	}

	public List<Disease> getDiseases() {
		return diseases;
	}

	public void setDiseases(List<Disease> diseases) {
		this.diseases = diseases;
	}

}
