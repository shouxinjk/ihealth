package com.shouxin.entity.medical;

import java.util.Date;

public class Order {

	private String ORDER_ID;			// varchar(100) NOT NULL,
	private String  ORDERNO;			// varchar(255) DEFAULT NULL COMMENT '订单号',
	private Date  ORDERGENERATIONTIME;	// timestamp NULL DEFAULT NULL COMMENT '订单生成时间',
	private Date  ORDERBOOKINGTIME;		// timestamp NULL DEFAULT NULL COMMENT '订单预约时间',
	private Date  ORDEREXECUTIONTIME;	// timestamp NULL DEFAULT NULL COMMENT '订单实际执行时间',
	private double  ORDERTOTALAMOUNT;	// double(11,0) DEFAULT NULL COMMENT '订单总金额',
	private String  STATUS;				// set('审核','提交','新建') DEFAULT '新建' COMMENT '订单状态',
	private String  CREATEBY;			// varchar(255) DEFAULT NULL COMMENT '创建该记录用户',
	private Date  CREATEON;				// timestamp NULL DEFAULT NULL COMMENT '创建该记录时间',

	public String getORDER_ID() {
		return ORDER_ID;
	}

	public void setORDER_ID(String oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}

	public String getORDERNO() {
		return ORDERNO;
	}

	public void setORDERNO(String oRDERNO) {
		ORDERNO = oRDERNO;
	}

	public Date getORDERGENERATIONTIME() {
		return ORDERGENERATIONTIME;
	}

	public void setORDERGENERATIONTIME(Date oRDERGENERATIONTIME) {
		ORDERGENERATIONTIME = oRDERGENERATIONTIME;
	}

	public Date getORDERBOOKINGTIME() {
		return ORDERBOOKINGTIME;
	}

	public void setORDERBOOKINGTIME(Date oRDERBOOKINGTIME) {
		ORDERBOOKINGTIME = oRDERBOOKINGTIME;
	}

	public Date getORDEREXECUTIONTIME() {
		return ORDEREXECUTIONTIME;
	}

	public void setORDEREXECUTIONTIME(Date oRDEREXECUTIONTIME) {
		ORDEREXECUTIONTIME = oRDEREXECUTIONTIME;
	}

	public double getORDERTOTALAMOUNT() {
		return ORDERTOTALAMOUNT;
	}

	public void setORDERTOTALAMOUNT(double oRDERTOTALAMOUNT) {
		ORDERTOTALAMOUNT = oRDERTOTALAMOUNT;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
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
}
