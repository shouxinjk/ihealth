package com.shouxin.entity.medical;

import java.util.Date;
import java.util.List;

/**
 * 
 * 类名称：体检中心、医院
 * 
 * @author shouxin 作者单位： 联系方式： 修改时间：2016年4月6日
 * @version 2.0
 */
public class MedicalCenter {
	private String MEDICALCENTER_ID; // 体检中心id
	private String STATUS; // 状态
	private String NAME; // 名称
	private String LOCATION; // 所在地址描述
	private String DESCRIPTION; // 体检中心介绍
	private String LOGOURL; // LOGO图片url
	private String createBY; // 创建该项目用户id
	private Date createON; // 创建该记录时间
	private MedicalCenter parent;
	private List<MedicalExamItem> examItems;
	private List<MedicalCenerAdmin> cenerAdmins;

	public String getSTATUS() {
		return STATUS;
	}

	public List<MedicalCenerAdmin> getCenerAdmins() {
		return cenerAdmins;
	}

	public void setCenerAdmins(List<MedicalCenerAdmin> cenerAdmins) {
		this.cenerAdmins = cenerAdmins;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getLOCATION() {
		return LOCATION;
	}

	public void setLOCATION(String lOCATION) {
		LOCATION = lOCATION;
	}

	public String getDESCRIPTION() {
		return DESCRIPTION;
	}

	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}

	public String getLOGOURL() {
		return LOGOURL;
	}

	public void setLOGOURL(String lOGOURL) {
		LOGOURL = lOGOURL;
	}

	public MedicalCenter getParent() {
		return parent;
	}

	public void setParent(MedicalCenter parent) {
		this.parent = parent;
	}

	public String getMEDICALCENTER_ID() {
		return MEDICALCENTER_ID;
	}

	public void setMEDICALCENTER_ID(String mEDICALCENTER_ID) {
		MEDICALCENTER_ID = mEDICALCENTER_ID;
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

	public List<MedicalExamItem> getExamItems() {
		return examItems;
	}

	public void setExamItems(List<MedicalExamItem> examItems) {
		this.examItems = examItems;
	}

}
