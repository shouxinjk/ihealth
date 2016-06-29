package com.shouxin.entity.admin;

public class TagAndUser {

	private String ID;
	private String USER_ID;
	private String TAG_ID;

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

	public String getTAG_ID() {
		return TAG_ID;
	}

	public void setTAG_ID(String tAG_ID) {
		TAG_ID = tAG_ID;
	}

	@Override
	public String toString() {
		return "TagAndUser [ID=" + ID + ", USER_ID=" + USER_ID + ", TAG_ID=" + TAG_ID + "]";
	}

}
