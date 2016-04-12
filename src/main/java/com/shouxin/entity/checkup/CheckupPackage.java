package com.shouxin.entity.checkup;

import java.io.Serializable;

import com.shouxin.entity.system.User;

/**
 * 推送给用户的体检套餐，包含有多个体检项目
 * @author sks
 *
 */
public class CheckupPackage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String CHECKUPPACKAGE_ID;	// ID
	private String WORKER;				// 生成该记录的标记
	private String GENERATEDTIME;		// 该记录生成时间
	private String EFFECTIVEFROM;		// 开始生效时间
	private String EXPIREON;			// 失效时间
	private String STATUS;				// 状态
	private Integer REVISION;			// 版本
	private String SYSFLAG;				// 系统标记
	
	private User users;		//关联user对象
	
	public User getUsers() {
		return users;
	}
	public void setUsers(User users) {
		this.users = users;
	}
	public Integer getREVISION() {
		return REVISION;
	}
	public void setREVISION(Integer rEVISION) {
		REVISION = rEVISION;
	}
	public String getSYSFLAG() {
		return SYSFLAG;
	}
	public void setSYSFLAG(String sYSFLAG) {
		SYSFLAG = sYSFLAG;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCHECKUPPACKAGE_ID() {
		return CHECKUPPACKAGE_ID;
	}
	public void setCHECKUPPACKAGE_ID(String cHECKUPPACKAGE_ID) {
		CHECKUPPACKAGE_ID = cHECKUPPACKAGE_ID;
	}
	public String getWORKER() {
		return WORKER;
	}
	public void setWORKER(String wORKER) {
		WORKER = wORKER;
	}
	public String getGENERATEDTIME() {
		return GENERATEDTIME;
	}
	public void setGENERATEDTIME(String gENERATEDTIME) {
		GENERATEDTIME = gENERATEDTIME;
	}
	public String getEFFECTIVEFROM() {
		return EFFECTIVEFROM;
	}
	public void setEFFECTIVEFROM(String eFFECTIVEFROM) {
		EFFECTIVEFROM = eFFECTIVEFROM;
	}
	public String getEXPIREON() {
		return EXPIREON;
	}
	public void setEXPIREON(String eXPIREON) {
		EXPIREON = eXPIREON;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}	
	
}
