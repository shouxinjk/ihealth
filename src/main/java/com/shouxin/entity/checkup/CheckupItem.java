package com.shouxin.entity.checkup;

import java.io.Serializable;
import java.util.Set;

import com.shouxin.entity.system.User;


/**
 * 推送给用户的体检项目
 * @author sks
 *
 */
public class CheckupItem implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String CHECKUPITEM_ID;		// ID
	private String SUBGROUP;			// 检查项目分组
	private String NAME;				// 检查项目名称
	private Set<String> FEATURES;		// 特性，是一组数值
	private String FREQUENCY;			// 检查频率，是文字描述
	private String STATUS;				// 状态，是枚举类型，包括：已选中，已删除
	private String ORIGINATE;			// 指南来源
	private String DESCRIPTION;			// 详细描述
	private String GENERATEDTIME;		// 该记录生成时间
	private String WORKER;				// 用于产生该记录的标记
	private Integer REVISION;			// 版本
	private String SYSFLAG;				// 系统标记

	private CheckupPackage checkupPackage;	// 体检套餐
	private User users;						// 用户
	
	
	public String getCHECKUPITEM_ID() {
		return CHECKUPITEM_ID;
	}
	public void setCHECKUPITEM_ID(String cHECKUPITEM_ID) {
		CHECKUPITEM_ID = cHECKUPITEM_ID;
	}
	public String getSUBGROUP() {
		return SUBGROUP;
	}
	public void setSUBGROUP(String sUBGROUP) {
		SUBGROUP = sUBGROUP;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public Set<String> getFEATURES() {
		return FEATURES;
	}
	public void setFEATURES(Set<String> fEATURES) {
		FEATURES = fEATURES;
	}
	public String getFREQUENCY() {
		return FREQUENCY;
	}
	public void setFREQUENCY(String fREQUENCY) {
		FREQUENCY = fREQUENCY;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public String getORIGINATE() {
		return ORIGINATE;
	}
	public void setORIGINATE(String oRIGINATE) {
		ORIGINATE = oRIGINATE;
	}
	public String getDESCRIPTION() {
		return DESCRIPTION;
	}
	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}
	public String getGENERATEDTIME() {
		return GENERATEDTIME;
	}
	public void setGENERATEDTIME(String gENERATEDTIME) {
		GENERATEDTIME = gENERATEDTIME;
	}
	public String getWORKER() {
		return WORKER;
	}
	public void setWORKER(String wORKER) {
		WORKER = wORKER;
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
	public CheckupPackage getCheckupPackage() {
		return checkupPackage;
	}
	public void setCheckupPackage(CheckupPackage checkupPackage) {
		this.checkupPackage = checkupPackage;
	}
	public User getUsers() {
		return users;
	}
	public void setUsers(User users) {
		this.users = users;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
