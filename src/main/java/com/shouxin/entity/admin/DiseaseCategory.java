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
