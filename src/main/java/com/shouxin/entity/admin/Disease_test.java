package com.shouxin.entity.admin;

/**
 * 默认疾病数据
 * 
 * @author yxd1
 *
 */
public class Disease_test {

	private String ID;// 默认疾病数据id
	private String NAME;// 默认疾病数据名称

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}
	
	@Override
	public String toString() {
		return "Disease_test [ID=" + ID + ", NAME=" + NAME + "]";
	}

}
