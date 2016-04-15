package com.shouxin.entity.admin;

import java.sql.Date;

public class Disease {
	private String DISEASE_ID; // varchar(100) NOT NULL,
	private String NAME; // varchar(255) DEFAULT NULL COMMENT '名称',
	private String DESCRIPTION; // varchar(255) DEFAULT NULL COMMENT '描述',
	private int ISINHERITABLE; // int(11) NOT NULL COMMENT '是否遗传倾向',
	private int ISHIGHINCIDENCE; // int(11) NOT NULL COMMENT '是否高发',
	private String CREATEBY; // varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
	private Date CREATEON; // varchar(32) DEFAULT NULL COMMENT '创建记录时间',
	private String DISEASECATEGORY_ID;

	public String getDISEASECATEGORY_ID() {
		return DISEASECATEGORY_ID;
	}

	public void setDISEASECATEGORY_ID(String dISEASECATEGORY_ID) {
		DISEASECATEGORY_ID = dISEASECATEGORY_ID;
	}

	public String getDISEASE_ID() {
		return DISEASE_ID;
	}

	public void setDISEASE_ID(String dISEASE_ID) {
		DISEASE_ID = dISEASE_ID;
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

	public int getISINHERITABLE() {
		return ISINHERITABLE;
	}

	public void setISINHERITABLE(int iSINHERITABLE) {
		ISINHERITABLE = iSINHERITABLE;
	}

	public int getISHIGHINCIDENCE() {
		return ISHIGHINCIDENCE;
	}

	public void setISHIGHINCIDENCE(int iSHIGHINCIDENCE) {
		ISHIGHINCIDENCE = iSHIGHINCIDENCE;
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

}
