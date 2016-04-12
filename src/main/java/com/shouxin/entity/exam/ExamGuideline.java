package com.shouxin.entity.exam;

import java.util.Date;
import java.util.List;

public class ExamGuideline {
	private String EXAMGUIDELINE_ID;// varchar(100) NOT NULL,
	private String ORIGINATE; // varchar(255) DEFAULT NULL COMMENT '来源',
	private String DESCRIPTION;// varchar(255) DEFAULT NULL COMMENT '指南详细描述',
	private String CONCERNEDFACTORS;// varchar(255) DEFAULT NULL COMMENT
									// '关注因素描述',
	private String HIGHRISKDEFINE;// varchar(255) DEFAULT NULL COMMENT '高危人群识别',
	private String HIGHRISKEXPRESSION; // varchar(255) DEFAULT NULL COMMENT
										// '高危人群识别脚本',
	private String LOWRISKDEFINE; // varchar(255) DEFAULT NULL COMMENT '普通人群识别',
	private String LOWRISKEXPRESSION;// varchar(255) DEFAULT NULL COMMENT
										// '普通人群识别脚本',
	private String STATUS;// varchar(255) DEFAULT NULL COMMENT '状态',
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
	private List<ExamSolution> solutions;

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

	public List<ExamSolution> getSolutions() {
		return solutions;
	}

	public void setSolutions(List<ExamSolution> solutions) {
		this.solutions = solutions;
	}

}
