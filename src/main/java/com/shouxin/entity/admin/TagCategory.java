package com.shouxin.entity.admin;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class TagCategory implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String TAGCATEGORY_ID;// varchar(100) NOT NULL,
	private String NAME;// varchar(255) DEFAULT NULL COMMENT '标签分类名称',
	private String MATETYPE;// varchar(255) DEFAULT NULL COMMENT '特性',
	private int ISEXCLUSIVE;// int(11) NOT NULL COMMENT '是否多选',
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '用户id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '时间',
	private String PARENT_ID;// varchar(255) DEFAULT NULL COMMENT '父级id',
	private TagCategory tagCategory;
	private List<TagCategory> subTagCategory;
	private String target;
	private boolean hasTagCategory = false;
	private String treeUrl;
	private List<Tag> tags;
	
	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public String getTAGCATEGORY_ID() {
		return TAGCATEGORY_ID;
	}

	public void setTAGCATEGORY_ID(String tAGCATEGORY_ID) {
		TAGCATEGORY_ID = tAGCATEGORY_ID;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getMATETYPE() {
		return MATETYPE;
	}

	public void setMATETYPE(String mATETYPE) {
		MATETYPE = mATETYPE;
	}

	public int getISEXCLUSIVE() {
		return ISEXCLUSIVE;
	}

	public void setISEXCLUSIVE(int iSEXCLUSIVE) {
		ISEXCLUSIVE = iSEXCLUSIVE;
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

	public String getPARENT_ID() {
		return PARENT_ID;
	}

	public void setPARENT_ID(String pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}

	public TagCategory getTagCategory() {
		return tagCategory;
	}

	public void setTagCategory(TagCategory tagCategory) {
		this.tagCategory = tagCategory;
	}

	public List<TagCategory> getSubTagCategory() {
		return subTagCategory;
	}

	public void setSubTagCategory(List<TagCategory> subTagCategory) {
		this.subTagCategory = subTagCategory;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public boolean isHasTagCategory() {
		return hasTagCategory;
	}

	public void setHasTagCategory(boolean hasTagCategory) {
		this.hasTagCategory = hasTagCategory;
	}

	public String getTreeUrl() {
		return treeUrl;
	}

	public void setTreeUrl(String treeUrl) {
		this.treeUrl = treeUrl;
	}


}
