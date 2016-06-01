package com.shouxin.entity.medical;

import java.util.Date;
import java.util.List;

public class MedicalOrder {

	private String MEDICALORDER_ID;			// varchar(100) NOT NULL,
	private String  MEDICALORDERNO;			// varchar(255) DEFAULT NULL COMMENT '订单号',
	private Date  MEDICALORDERGENERATIONTIME;	// timestamp NULL DEFAULT NULL COMMENT '订单生成时间',
	private Date MEDICALORDERBOOKINGTIME;		// timestamp NULL DEFAULT NULL COMMENT '订单预约时间',
	private Date  MEDICALORDEREXECUTIONTIME;	// timestamp NULL DEFAULT NULL COMMENT '订单实际执行时间',
	private double  MEDICALORDERTOTALAMOUNT;	// double(11,0) DEFAULT NULL COMMENT '订单总金额',
	private String  STATUS;				// set('审核','提交','新建') DEFAULT '新建' COMMENT '订单状态',
	private String  CREATEBY;			// varchar(255) DEFAULT NULL COMMENT '创建该记录用户',
	private Date  CREATEON;				// timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',
	private String MEDICALCENTER_ID;
	private String NAME;//
	private List<MedicalExamItem> items;
	public List<MedicalExamItem> getItems() {
		return items;
	}
	public void setItems(List<MedicalExamItem> items) {
		this.items = items;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getMEDICALORDER_ID() {
		return MEDICALORDER_ID;
	}
	public void setMEDICALORDER_ID(String mEDICALORDER_ID) {
		MEDICALORDER_ID = mEDICALORDER_ID;
	}
	public String getMEDICALORDERNO() {
		return MEDICALORDERNO;
	}
	public void setMEDICALORDERNO(String mEDICALORDERNO) {
		MEDICALORDERNO = mEDICALORDERNO;
	}
	public Date getMEDICALORDERGENERATIONTIME() {
		return MEDICALORDERGENERATIONTIME;
	}
	public void setMEDICALORDERGENERATIONTIME(Date mEDICALORDERGENERATIONTIME) {
		MEDICALORDERGENERATIONTIME = mEDICALORDERGENERATIONTIME;
	}
	public Date getMEDICALORDERBOOKINGTIME() {
		return MEDICALORDERBOOKINGTIME;
	}
	public void setMEDICALORDERBOOKINGTIME(Date mEDICALORDERBOOKINGTIME) {
		MEDICALORDERBOOKINGTIME = mEDICALORDERBOOKINGTIME;
	}
	public Date getMEDICALORDEREXECUTIONTIME() {
		return MEDICALORDEREXECUTIONTIME;
	}
	public void setMEDICALORDEREXECUTIONTIME(Date mEDICALORDEREXECUTIONTIME) {
		MEDICALORDEREXECUTIONTIME = mEDICALORDEREXECUTIONTIME;
	}
	public double getMEDICALORDERTOTALAMOUNT() {
		return MEDICALORDERTOTALAMOUNT;
	}
	public void setMEDICALORDERTOTALAMOUNT(double mEDICALORDERTOTALAMOUNT) {
		MEDICALORDERTOTALAMOUNT = mEDICALORDERTOTALAMOUNT;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
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
	public String getMEDICALCENTER_ID() {
		return MEDICALCENTER_ID;
	}
	public void setMEDICALCENTER_ID(String mEDICALCENTER_ID) {
		MEDICALCENTER_ID = mEDICALCENTER_ID;
	}
	@Override
	public String toString() {
		return "MedicalOrder [MEDICALORDER_ID=" + MEDICALORDER_ID + ", MEDICALORDERNO=" + MEDICALORDERNO
				+ ", MEDICALORDERGENERATIONTIME=" + MEDICALORDERGENERATIONTIME + ", MEDICALORDERBOOKINGTIME="
				+ MEDICALORDERBOOKINGTIME + ", MEDICALORDEREXECUTIONTIME=" + MEDICALORDEREXECUTIONTIME
				+ ", MEDICALORDERTOTALAMOUNT=" + MEDICALORDERTOTALAMOUNT + ", STATUS=" + STATUS + ", CREATEBY="
				+ CREATEBY + ", CREATEON=" + CREATEON + ", MEDICALCENTER_ID=" + MEDICALCENTER_ID + "]";
	}


}
