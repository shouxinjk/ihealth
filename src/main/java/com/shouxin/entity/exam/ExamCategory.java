package com.shouxin.entity.exam;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ExamCategory implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String EXAMCATEGORY_ID;// varchar(100) NOT NULL,
	private String NAME;// varchar(255) DEFAULT NULL COMMENT '检查项目分类名称',
	private String DESCRIPTION;// varchar(255) DEFAULT NULL COMMENT '描述',
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '创建该记录员工id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '创建该记录时间',
	private String PARENT_ID;// 父级列表id
	private String treeUrl;
	private String target;
	private List<ExamCategory> subExamCategory;
	private ExamCategory examCategory;
	private boolean hasExamCategory = false;
	private List<ExamItem> examItems;

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

	public String getPARENT_ID() {
		return PARENT_ID;
	}

	public void setPARENT_ID(String pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}

	public String getTreeUrl() {
		return treeUrl;
	}

	public void setTreeUrl(String treeUrl) {
		this.treeUrl = treeUrl;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public List<ExamCategory> getSubExamCategory() {
		return subExamCategory;
	}

	public void setSubExamCategory(List<ExamCategory> subExamCategory) {
		this.subExamCategory = subExamCategory;
	}

	public ExamCategory getExamCategory() {
		return examCategory;
	}

	public void setExamCategory(ExamCategory examCategory) {
		this.examCategory = examCategory;
	}

	public boolean isHasExamCategory() {
		return hasExamCategory;
	}

	public void setHasExamCategory(boolean hasExamCategory) {
		this.hasExamCategory = hasExamCategory;
	}

}
