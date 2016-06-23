package com.shouxin.entity.system;

public class Sys_app_user_test {

	private String USER_ID;// 主键id
	private String NAME;// 姓名
	private String USERNAME;// 用户名称
	private String PHONE;// 电话
	private String SEX;// 性别
	private String MARRIAGESTATUS;// 婚姻状态
	private int HEIGHT;// 身高
	private int WEIGHT;// 体重

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getSEX() {
		return SEX;
	}

	public void setSEX(String sEX) {
		SEX = sEX;
	}

	public String getMARRIAGESTATUS() {
		return MARRIAGESTATUS;
	}

	public void setMARRIAGESTATUS(String mARRIAGESTATUS) {
		MARRIAGESTATUS = mARRIAGESTATUS;
	}

	@Override
	public String toString() {
		return "Sys_app_user_test [USER_ID=" + USER_ID + ", NAME=" + NAME + ", USERNAME=" + USERNAME + ", PHONE="
				+ PHONE + ", SEX=" + SEX + ", MARRIAGESTATUS=" + MARRIAGESTATUS + ", HEIGHT=" + HEIGHT + ", WEIGHT="
				+ WEIGHT + "]";
	}

	public int getHEIGHT() {
		return HEIGHT;
	}

	public void setHEIGHT(int hEIGHT) {
		HEIGHT = hEIGHT;
	}

	public int getWEIGHT() {
		return WEIGHT;
	}

	public void setWEIGHT(int wEIGHT) {
		WEIGHT = wEIGHT;
	}

}
