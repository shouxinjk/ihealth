package com.shouxin.entity.subhealth;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class SubhealthCategory implements Serializable {

	private String SUBHEALTHCATEGORY_ID;
	private String NAME;
	private String DESCRIPTION;
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '创建记录时间',
	private String PARENTID;
	private SubhealthCategory subhealthCategory;
	private List<SubhealthCategory> subhealthCategorys;
	private String target;
	private boolean hasSubhealthCategory = false;
	private String treeUrl;

	public String getSUBHEALTHCATEGORY_ID() {
		return SUBHEALTHCATEGORY_ID;
	}

	public void setSUBHEALTHCATEGORY_ID(String sUBHEALTHCATEGORY_ID) {
		SUBHEALTHCATEGORY_ID = sUBHEALTHCATEGORY_ID;
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

	public String getPARENTID() {
		return PARENTID;
	}

	public void setPARENTID(String pARENTID) {
		PARENTID = pARENTID;
	}

	public SubhealthCategory getSubhealthCategory() {
		return subhealthCategory;
	}

	public void setSubhealthCategory(SubhealthCategory subhealthCategory) {
		this.subhealthCategory = subhealthCategory;
	}

	public List<SubhealthCategory> getSubhealthCategorys() {
		return subhealthCategorys;
	}

	public void setSubhealthCategorys(List<SubhealthCategory> subhealthCategorys) {
		this.subhealthCategorys = subhealthCategorys;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public boolean isHasDiseaseCategory() {
		return hasSubhealthCategory;
	}

	public void setHasDiseaseCategory(boolean hasSubhealthCategory) {
		this.hasSubhealthCategory = hasSubhealthCategory;
	}

	public String getTreeUrl() {
		return treeUrl;
	}

	public void setTreeUrl(String treeUrl) {
		this.treeUrl = treeUrl;
	}

	@Override
	public String toString() {
		return "SubhealthCategory [SUBHEALTHCATEGORY_ID=" + SUBHEALTHCATEGORY_ID + ", NAME=" + NAME + ", DESCRIPTION="
				+ DESCRIPTION + ", CREATEBY=" + CREATEBY + ", CREATEON=" + CREATEON + ", PARENTID=" + PARENTID
				+ ", subhealthCategory=" + subhealthCategory + ", subhealthCategorys=" + subhealthCategorys
				+ ", target=" + target + ", hasSubhealthCategory=" + hasSubhealthCategory + ", treeUrl=" + treeUrl + "]";
	}

}
