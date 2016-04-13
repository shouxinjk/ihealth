package com.shouxin.entity.exam;

import java.util.Date;

public class ExamSolution {

	private String EXAMSOLUTION_ID;/// varchar(100) NOT NULL,
	private String SUBGROUP;// varchar(255) DEFAULT NULL COMMENT '检查手段分组标记',
//	private String RISKTYPE;// varchar(255) DEFAULT NULL COMMENT '干预手段对应风险',
	public enum RISKTYPE{
		DANGER("高危"),
		ORDINARY("普通");
		private RISKTYPE(String value){
			this.valueOf(value);
		}
	}
	private int STARTAGE; // int(11) NOT NULL COMMENT '开始检查年龄',
	private int ENDAGE;// varchar(255) DEFAULT NULL COMMENT '结束检查年龄',
	private String FEATURES;// varchar(255) DEFAULT NULL COMMENT '医学检查手段',
	private String createBY;//
	private Date createON;//
	private ExamGuideline guideline;
	private ExamItem examItem;
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

//	public String getRISKTYPE() {
//		return RISKTYPE;
//	}
//
//	public void setRISKTYPE(String rISKTYPE) {
//		RISKTYPE = rISKTYPE;
//	}

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

	public ExamGuideline getGuideline() {
		return guideline;
	}

	public void setGuideline(ExamGuideline guideline) {
		this.guideline = guideline;
	}

	public ExamItem getExamItem() {
		return examItem;
	}

	public void setExamItem(ExamItem examItem) {
		this.examItem = examItem;
	}

	public ExamFrequency getFrequency() {
		return frequency;
	}

	public void setFrequency(ExamFrequency frequency) {
		this.frequency = frequency;
	}

}
