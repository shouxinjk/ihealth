package com.shouxin.entity.exam;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ExamItem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String EXAMITEM_ID;// ,
	private String NAME;// '名称',
	private String DESCRIPTION;// '描述',
	private String CREATEBY;// '创建该记录员工id',
	private Date CREATEON;// '创建该记录时间',
	private ExamCategory cotegory;

	public String getEXAMITEM_ID() {
		return EXAMITEM_ID;
	}

	public void setEXAMITEM_ID(String eXAMITEM_ID) {
		EXAMITEM_ID = eXAMITEM_ID;
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

	public ExamCategory getCotegory() {
		return cotegory;
	}

	public void setCotegory(ExamCategory cotegory) {
		this.cotegory = cotegory;
	}

}
