package com.shouxin.entity.exam;

import java.util.Date;
import java.util.List;

public class ExamCotegory {

	private String EXAMCATEGORY_ID;// varchar(100) NOT NULL,
	private String NAME;// varchar(255) DEFAULT NULL COMMENT '检查项目分类名称',
	private String DESCRIPTION;// varchar(255) DEFAULT NULL COMMENT '描述',
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
	private List<ExamItem> examItems;
	private ExamCotegory parent;

	public String getEXAMCATEGORY_ID() {
		return EXAMCATEGORY_ID;
	}

	public void setEXAMCATEGORY_ID(String eXAMCATEGORY_ID) {
		EXAMCATEGORY_ID = eXAMCATEGORY_ID;
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

	public List<ExamItem> getExamItems() {
		return examItems;
	}

	public void setExamItems(List<ExamItem> examItems) {
		this.examItems = examItems;
	}

	public ExamCotegory getParent() {
		return parent;
	}

	public void setParent(ExamCotegory parent) {
		this.parent = parent;
	}

}
