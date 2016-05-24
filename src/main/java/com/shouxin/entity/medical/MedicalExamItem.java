package com.shouxin.entity.medical;

import java.util.Date;

public class MedicalExamItem {

	private String MEDICALEXAMITEM_ID;	// varchar(100) NOT NULL,
	private String NAME;				// varchar(255) DEFAULT NULL COMMENT '体检项目名称',
	private String DESCRIPTION;			// varchar(255) DEFAULT NULL COMMENT '体检项目说明',
	private String FEATURES;			// varchar(255) DEFAULT NULL COMMENT '体检项目特征',
	private double SELLINGPRICE;		// double(11,0) DEFAULT NULL COMMENT '体检项目销售价格',
	private double SETTLEMENTPRICE;		// double(11,0) DEFAULT NULL COMMENT '体检项目结算价格',
	private String LOGO;				// varchar(255) DEFAULT NULL COMMENT '体检项目logo图片url地址',
	private String STATUS;				// set('审核','提交','新建') DEFAULT '新建' COMMENT '体检项目状态',
	private Date EFFECTIVETIME;			// varchar(32) DEFAULT NULL COMMENT '体检项目生效时间',
	private Date EXPIRETIME;			// varchar(32) DEFAULT NULL COMMENT '体检项目失效时间',
	private String CREATEBY;			// varchar(255) DEFAULT NULL COMMENT '创建该记录用户id',
	private Date CREATEON;				// timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',

	public String getMEDICALEXAMITEM_ID() {
		return MEDICALEXAMITEM_ID;
	}

	public void setMEDICALEXAMITEM_ID(String mEDICALEXAMITEM_ID) {
		MEDICALEXAMITEM_ID = mEDICALEXAMITEM_ID;
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

	public String getFEATURES() {
		return FEATURES;
	}

	public void setFEATURES(String fEATURES) {
		FEATURES = fEATURES;
	}

	public double getSELLINGPRICE() {
		return SELLINGPRICE;
	}

	public void setSELLINGPRICE(double sELLINGPRICE) {
		SELLINGPRICE = sELLINGPRICE;
	}

	public double getSETTLEMENTPRICE() {
		return SETTLEMENTPRICE;
	}

	public void setSETTLEMENTPRICE(double sETTLEMENTPRICE) {
		SETTLEMENTPRICE = sETTLEMENTPRICE;
	}

	public String getLOGO() {
		return LOGO;
	}

	public void setLOGO(String lOGO) {
		LOGO = lOGO;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public Date getEFFECTIVETIME() {
		return EFFECTIVETIME;
	}

	public void setEFFECTIVETIME(Date eFFECTIVETIME) {
		EFFECTIVETIME = eFFECTIVETIME;
	}

	public Date getEXPIRETIME() {
		return EXPIRETIME;
	}

	public void setEXPIRETIME(Date eXPIRETIME) {
		EXPIRETIME = eXPIRETIME;
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

	@Override
	public String toString() {
		return "MedicalExamItem [MEDICALEXAMITEM_ID=" + MEDICALEXAMITEM_ID + ", NAME=" + NAME + ", DESCRIPTION="
				+ DESCRIPTION + ", FEATURES=" + FEATURES + ", SELLINGPRICE=" + SELLINGPRICE + ", SETTLEMENTPRICE="
				+ SETTLEMENTPRICE + ", LOGO=" + LOGO + ", STATUS=" + STATUS + ", EFFECTIVETIME=" + EFFECTIVETIME
				+ ", EXPIRETIME=" + EXPIRETIME + ", CREATEBY=" + CREATEBY + ", CREATEON=" + CREATEON + "]";
	}
	
	
}
