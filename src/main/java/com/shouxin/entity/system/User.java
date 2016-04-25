package com.shouxin.entity.system;

import java.util.Date;
import java.util.List;

import com.shouxin.entity.Page;

/**
 * 
* 类名称：用户
* 类描述： 
* @author  shouxin
* 作者单位： 
* 联系方式：
* 创建时间：2014年6月28日
* @version 1.0
 */
public class User {
	private String USER_ID;		//用户id
	private String USERNAME;	//用户名
	private String PASSWORD; 	//密码
	private String NAME;		//姓名
	private String RIGHTS;		//权限
	private String ROLE_ID;		//角色id
	private String LAST_LOGIN;	//最后登录时间
	private String IP;			//用户登录ip地址
	private String STATUS;		//状态
	private String SKIN;		//皮肤
	
	private String BZ;
	private String NUMBER;
	
	/*合并用户信息*/
	private String PHONE;			// 电话号码
	private String EMAIL;			// 电子邮件
	private String OPENID;			// 对应微信OPENID
	private String ALIAS;			// 昵称
	private String BIRTHDAY;			// 生日
	private String SEX;				// 性别
	private String BIRTHPLACE;		// 出生地
	private String LIVEPLACE;		// 居住地
	private String MARRIAGESTATUS;	// 婚姻状态
	private String CAREER;			// 职业
	private String DEGREE;			// 学历
	private String AVATAR;			// 用户图像
	private String HEIGHT;			// 身高
	private String WEIGHT;			// 体重
	
	private Role role;			//角色对象
	private Page page;			//分页对象
	
	private User parentUser;	//父关联
	private List<User> childrenUser;	//子关联
	
	public User getParentUser() {
		return parentUser;
	}
	public void setParentUser(User parentUser) {
		this.parentUser = parentUser;
	}
	public List<User> getChildrenUser() {
		return childrenUser;
	}
	public void setChildrenUser(List<User> childrenUser) {
		this.childrenUser = childrenUser;
	}
	public String getSKIN() {
		return SKIN;
	}
	public void setSKIN(String sKIN) {
		SKIN = sKIN;
	}
	
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getRIGHTS() {
		return RIGHTS;
	}
	public void setRIGHTS(String rIGHTS) {
		RIGHTS = rIGHTS;
	}
	public String getROLE_ID() {
		return ROLE_ID;
	}
	public void setROLE_ID(String rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}
	public String getLAST_LOGIN() {
		return LAST_LOGIN;
	}
	public void setLAST_LOGIN(String lAST_LOGIN) {
		LAST_LOGIN = lAST_LOGIN;
	}
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getBZ() {
		return BZ;
	}
	public void setBZ(String bZ) {
		BZ = bZ;
	}
	public String getNUMBER() {
		return NUMBER;
	}
	public void setNUMBER(String nUMBER) {
		NUMBER = nUMBER;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getOPENID() {
		return OPENID;
	}
	public void setOPENID(String oPENID) {
		OPENID = oPENID;
	}
	public String getALIAS() {
		return ALIAS;
	}
	public void setALIAS(String aLIAS) {
		ALIAS = aLIAS;
	}
	
	
	public String getBIRTHDAY() {
		return BIRTHDAY;
	}
	public void setBIRTHDAY(String bIRTHDAY) {
		BIRTHDAY = bIRTHDAY;
	}
	public String getSEX() {
		return SEX;
	}
	public void setSEX(String sEX) {
		SEX = sEX;
	}
	public String getBIRTHPLACE() {
		return BIRTHPLACE;
	}
	public void setBIRTHPLACE(String bIRTHPLACE) {
		BIRTHPLACE = bIRTHPLACE;
	}
	public String getLIVEPLACE() {
		return LIVEPLACE;
	}
	public void setLIVEPLACE(String lIVEPLACE) {
		LIVEPLACE = lIVEPLACE;
	}
	public String getMARRIAGESTATUS() {
		return MARRIAGESTATUS;
	}
	public void setMARRIAGESTATUS(String mARRIAGESTATUS) {
		MARRIAGESTATUS = mARRIAGESTATUS;
	}
	public String getCAREER() {
		return CAREER;
	}
	public void setCAREER(String cAREER) {
		CAREER = cAREER;
	}
	public String getDEGREE() {
		return DEGREE;
	}
	public void setDEGREE(String dEGREE) {
		DEGREE = dEGREE;
	}
	public String getAVATAR() {
		return AVATAR;
	}
	public void setAVATAR(String aVATAR) {
		AVATAR = aVATAR;
	}
	public String getHEIGHT() {
		return HEIGHT;
	}
	public void setHEIGHT(String hEIGHT) {
		HEIGHT = hEIGHT;
	}
	public String getWEIGHT() {
		return WEIGHT;
	}
	public void setWEIGHT(String wEIGHT) {
		WEIGHT = wEIGHT;
	}
	
	
	
	
}
