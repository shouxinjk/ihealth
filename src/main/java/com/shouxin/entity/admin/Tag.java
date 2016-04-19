package com.shouxin.entity.admin;

import java.util.Date;

public class Tag {

	private String TAG_ID;// varchar(100) NOT NULL,
	private String NAME;// varchar(255) DEFAULT NULL COMMENT '名称',
	private String EXPRESSION;// varchar(255) DEFAULT NULL COMMENT '表达式',
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '用户id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '时间',
	private TagCategory tagCategory;
	private String PARENT_ID;

	public String getTAG_ID() {
		return TAG_ID;
	}

	public void setTAG_ID(String tAG_ID) {
		TAG_ID = tAG_ID;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getEXPRESSION() {
		return EXPRESSION;
	}

	public void setEXPRESSION(String eXPRESSION) {
		EXPRESSION = eXPRESSION;
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

	public TagCategory getTagCategory() {
		return tagCategory;
	}

	public void setTagCategory(TagCategory tagCategory) {
		this.tagCategory = tagCategory;
	}

	public String getPARENT_ID() {
		return PARENT_ID;
	}

	public void setPARENT_ID(String pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}

}
