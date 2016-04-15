package com.shouxin.entity.exam;

import java.util.Date;

public class ExamSolution {

	private String EXAMSOLUTION_ID;//
	private String NAME;
	private String SUBGROUP;// '检查手段分组标记',
	private int RISKTYPE;// '干预手段对应风险',
	private int STARTAGE; // '开始检查年龄',
	private int ENDAGE;// '结束检查年龄',
	private String FEATURES;// '医学检查手段',
	private String createBY;// 创建记录用户id
	private Date createON;// 创建记录时间
	private String EXAMGUIDELINE_ID; // 医学体检指南外键id
	private String EXAMITEM_ID;

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getEXAMITEM_ID() {
		return EXAMITEM_ID;
	}

	public void setEXAMITEM_ID(String eXAMITEM_ID) {
		EXAMITEM_ID = eXAMITEM_ID;
	}

	public int getRISKTYPE() {
		return RISKTYPE;
	}

	public String getEXAMGUIDELINE_ID() {
		return EXAMGUIDELINE_ID;
	}

	public void setEXAMGUIDELINE_ID(String eXAMGUIDELINE_ID) {
		EXAMGUIDELINE_ID = eXAMGUIDELINE_ID;
	}

	public void setRISKTYPE(int rISKTYPE) {
		RISKTYPE = rISKTYPE;
	}

	private ExamFrequency frequency;

	public String getEXAMSOLUTION_ID() {
		return EXAMSOLUTION_ID;
	}

	public void setEXAMSOLUTION_ID(String eXAMSOLUTION_ID) {
		EXAMSOLUTION_ID = eXAMSOLUTION_ID;
	}

	public String getSUBGROUP() {
		return SUBGROUP;
	}

	public void setSUBGROUP(String sUBGROUP) {
		SUBGROUP = sUBGROUP;
	}

	// public String getRISKTYPE() {
	// return RISKTYPE;
	// }
	//
	// public void setRISKTYPE(String rISKTYPE) {
	// RISKTYPE = rISKTYPE;
	// }

	public int getSTARTAGE() {
		return STARTAGE;
	}

	public void setSTARTAGE(int sTARTAGE) {
		STARTAGE = sTARTAGE;
	}

	public int getENDAGE() {
		return ENDAGE;
	}

	public void setENDAGE(int eNDAGE) {
		ENDAGE = eNDAGE;
	}

	public String getFEATURES() {
		return FEATURES;
	}

	public void setFEATURES(String fEATURES) {
		FEATURES = fEATURES;
	}

	public String getCreateBY() {
		return createBY;
	}

	public void setCreateBY(String createBY) {
		this.createBY = createBY;
	}

	public Date getCreateON() {
		return createON;
	}

	public void setCreateON(Date createON) {
		this.createON = createON;
	}

	public ExamFrequency getFrequency() {
		return frequency;
	}

	public void setFrequency(ExamFrequency frequency) {
		this.frequency = frequency;
	}

}
