package com.shouxin.entity.medical;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 类名称：医学检查项目 类描述：
 * 
 * @author shouxin 作者单位： 联系方式： 修改时间：2015年12月16日
 * @version 2.0
 */

public class MedicalExamItem implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String MEDICALEXAMITEM_ID; // 检查项目id
	private String NAME; // '名称',
	private double PRICE; // '价格',
	private double PRICE2; // '建议价格',
	private String TIPS; // '检查项目提示',
	private String STATUS; // '状态',
	private String createBY; // 创建该项目用户id
	private Date createON; // 创建该记录时间
	private MedicalCenter center; // 体检中心或医院

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public double getPRICE() {
		return PRICE;
	}

	public void setPRICE(double pRICE) {
		PRICE = pRICE;
	}

	public double getPRICE2() {
		return PRICE2;
	}

	public void setPRICE2(double pRICE2) {
		PRICE2 = pRICE2;
	}

	public String getTIPS() {
		return TIPS;
	}

	public void setTIPS(String tIPS) {
		TIPS = tIPS;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public MedicalCenter getCenter() {
		return center;
	}

	public void setCenter(MedicalCenter center) {
		this.center = center;
	}

	public String getMEDICALEXAMITEM_ID() {
		return MEDICALEXAMITEM_ID;
	}

	public void setMEDICALEXAMITEM_ID(String mEDICALEXAMITEM_ID) {
		MEDICALEXAMITEM_ID = mEDICALEXAMITEM_ID;
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

}
