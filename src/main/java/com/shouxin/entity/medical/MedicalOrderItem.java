package com.shouxin.entity.medical;

public class MedicalOrderItem {

	private String MEDICALORDERITEM_ID;
	private String MEDICALORDER_ID;
	private String MEDICALEXAMITEM_ID;

	public String getMEDICALORDERITEM_ID() {
		return MEDICALORDERITEM_ID;
	}

	public void setMEDICALORDERITEM_ID(String mEDICALORDERITEM_ID) {
		MEDICALORDERITEM_ID = mEDICALORDERITEM_ID;
	}

	public String getMEDICALORDER_ID() {
		return MEDICALORDER_ID;
	}

	public void setMEDICALORDER_ID(String mEDICALORDER_ID) {
		MEDICALORDER_ID = mEDICALORDER_ID;
	}

	public String getMEDICALEXAMITEM_ID() {
		return MEDICALEXAMITEM_ID;
	}

	public void setMEDICALEXAMITEM_ID(String mEDICALEXAMITEM_ID) {
		MEDICALEXAMITEM_ID = mEDICALEXAMITEM_ID;
	}

	@Override
	public String toString() {
		return "MedicalOrderItem [MEDICALORDERITEM_ID=" + MEDICALORDERITEM_ID + ", MEDICALORDER_ID=" + MEDICALORDER_ID
				+ ", MEDICALEXAMITEM_ID=" + MEDICALEXAMITEM_ID + "]";
	}

}
