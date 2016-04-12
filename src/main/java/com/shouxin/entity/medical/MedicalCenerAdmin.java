package com.shouxin.entity.medical;

import java.util.Date;

/**
 * 
 * 类名称：体检中心或医院科室管理员信息 类描述：
 * 
 * @author shouxin 作者单位： 联系方式： 创建时间：2015年7月27日
 * @version 2.0
 */

public class MedicalCenerAdmin {

	private String MEDICALCENERADMIN_ID; // 医院管理员信息id
	private String DEPARTMENT; // 所属部门或科室
	private String TITLE; // 职位
	private String createBY; // 创建该项目用户id
	private Date createON; // 创建该记录时间
	private MedicalCenter center;

	public MedicalCenter getCenter() {
		return center;
	}

	public void setCenter(MedicalCenter center) {
		this.center = center;
	}

	public String getMEDICALCENERADMIN_ID() {
		return MEDICALCENERADMIN_ID;
	}

	public void setMEDICALCENERADMIN_ID(String mEDICALCENERADMIN_ID) {
		MEDICALCENERADMIN_ID = mEDICALCENERADMIN_ID;
	}

	public String getCreateBY() {
		return createBY;
	}

	public void setCreateBY(String createBY) {
		this.createBY = createBY;
	}

	public String getDEPARTMENT() {
		return DEPARTMENT;
	}

	public void setDEPARTMENT(String dEPARTMENT) {
		DEPARTMENT = dEPARTMENT;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public Date getCreateON() {
		return createON;
	}

	public void setCreateON(Date createON) {
		this.createON = createON;
	}

}
