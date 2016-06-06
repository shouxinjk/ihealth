package com.shouxin.entity.medical;

public class OrderItem {

	private String ORDERITEM_ID;
	private String ORDER_ID;
	private String MEDICALEXAMITEM_ID;

	public String getORDERITEM_ID() {
		return ORDERITEM_ID;
	}

	public void setORDERITEM_ID(String oRDERITEM_ID) {
		ORDERITEM_ID = oRDERITEM_ID;
	}

	public String getORDER_ID() {
		return ORDER_ID;
	}

	public void setORDER_ID(String oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}

	public String getMEDICALEXAMITEM_ID() {
		return MEDICALEXAMITEM_ID;
	}

	public void setMEDICALEXAMITEM_ID(String mEDICALEXAMITEM_ID) {
		MEDICALEXAMITEM_ID = mEDICALEXAMITEM_ID;
	}

}
