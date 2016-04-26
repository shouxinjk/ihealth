package com.shouxin.entity.admin;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String ARTICLE_ID;		// ID
	private String TITLE;			// 标题
	private String AUTHOR;			// 作者
	private String LOGOURL;			// 照片url
	private String URL;				// 内容url
	private String SUMMARY;			// 摘要
	private String PUBLISHTIME;		// 发布时间
	private String CREATEBY;		// 创建记录员工id
	private Date CREATEON;			// 创建记录时间
	private String STATUS;			// 状态：新建--已提交--已审核--已发布--取消发布
	
	public String getARTICLE_ID() {
		return ARTICLE_ID;
	}
	public void setARTICLE_ID(String aRTICLE_ID) {
		ARTICLE_ID = aRTICLE_ID;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getAUTHOR() {
		return AUTHOR;
	}
	public void setAUTHOR(String aUTHOR) {
		AUTHOR = aUTHOR;
	}
	public String getLOGOURL() {
		return LOGOURL;
	}
	public void setLOGOURL(String lOGOURL) {
		LOGOURL = lOGOURL;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public String getSUMMARY() {
		return SUMMARY;
	}
	public void setSUMMARY(String sUMMARY) {
		SUMMARY = sUMMARY;
	}
	public String getPUBLISHTIME() {
		return PUBLISHTIME;
	}
	public void setPUBLISHTIME(String pUBLISHTIME) {
		PUBLISHTIME = pUBLISHTIME;
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
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	
}
