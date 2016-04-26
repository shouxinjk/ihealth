package com.shouxin.entity.exam;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ExamGuideline implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String EXAMGUIDELINE_ID;//
	private String NAME;// 检查指南名称
	private String ORIGINATE; // '来源',
	private String DESCRIPTION;// '指南详细描述',
	private String CONCERNEDFACTORS;// '关注因素描述',
	private String HIGHRISKDEFINE;// '高危人群识别',
	private String HIGHRISKEXPRESSION; // '高危人群识别脚本',
	private String LOWRISKDEFINE; // '普通人群识别',
	private String LOWRISKEXPRESSION;// '普通人群识别脚本',
	private int STATUS;// '状态',
	private String CREATEBY;// '创建该记录员工id',
	private String DISEASE_ID;// 疾病外键id
	private Date CREATEON;// '创建该记录时间',

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public int getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}

	public String getDISEASE_ID() {
		return DISEASE_ID;
	}

	public void setDISEASE_ID(String dISEASE_ID) {
		DISEASE_ID = dISEASE_ID;
	}

	public String getEXAMGUIDELINE_ID() {
		return EXAMGUIDELINE_ID;
	}

	public void setEXAMGUIDELINE_ID(String eXAMGUIDELINE_ID) {
		EXAMGUIDELINE_ID = eXAMGUIDELINE_ID;
	}

	public String getORIGINATE() {
		return ORIGINATE;
	}

	public void setORIGINATE(String oRIGINATE) {
		ORIGINATE = oRIGINATE;
	}

	public String getDESCRIPTION() {
		return DESCRIPTION;
	}

	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}

	public String getCONCERNEDFACTORS() {
		return CONCERNEDFACTORS;
	}

	public void setCONCERNEDFACTORS(String cONCERNEDFACTORS) {
		CONCERNEDFACTORS = cONCERNEDFACTORS;
	}

	public String getHIGHRISKDEFINE() {
		return HIGHRISKDEFINE;
	}

	public void setHIGHRISKDEFINE(String hIGHRISKDEFINE) {
		HIGHRISKDEFINE = hIGHRISKDEFINE;
	}

	public String getHIGHRISKEXPRESSION() {
		return HIGHRISKEXPRESSION;
	}

	public void setHIGHRISKEXPRESSION(String hIGHRISKEXPRESSION) {
		HIGHRISKEXPRESSION = hIGHRISKEXPRESSION;
	}

	public String getLOWRISKDEFINE() {
		return LOWRISKDEFINE;
	}

	public void setLOWRISKDEFINE(String lOWRISKDEFINE) {
		LOWRISKDEFINE = lOWRISKDEFINE;
	}

	public String getLOWRISKEXPRESSION() {
		return LOWRISKEXPRESSION;
	}

	public void setLOWRISKEXPRESSION(String lOWRISKEXPRESSION) {
		LOWRISKEXPRESSION = lOWRISKEXPRESSION;
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
