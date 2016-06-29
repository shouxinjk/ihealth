package com.shouxin.entity.admin;

public class DiseaseAndUser {
	private String ID;
	private String USER_ID;
	private String DISEASE_ID;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getDISEASE_ID() {
		return DISEASE_ID;
	}

	public void setDISEASE_ID(String dISEASE_ID) {
		DISEASE_ID = dISEASE_ID;
	}

	@Override
	public String toString() {
		return "DiseaseAndUser [ID=" + ID + ", USER_ID=" + USER_ID + ", DISEASE_ID=" + DISEASE_ID + "]";
	}

}
