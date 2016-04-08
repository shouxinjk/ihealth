package com.shouxin.entity.exam;

import java.util.Date;
import java.util.List;

public class ExamFrequency {
	
	private String EXAMFREQUENCY_ID;// varchar(100) NOT NULL,
	private String NAME;// varchar(255) DEFAULT NULL COMMENT '名称',
	private String EXPRESSION;// varchar(255) DEFAULT NULL COMMENT 'CRON表达式，定义检查的间隔频率',
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '创建该记录员工的id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '创建该记录的时间',
	private List<ExamSolution> solutions;

	public String getEXAMFREQUENCY_ID() {
		return EXAMFREQUENCY_ID;
	}

	public void setEXAMFREQUENCY_ID(String eXAMFREQUENCY_ID) {
		EXAMFREQUENCY_ID = eXAMFREQUENCY_ID;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getEXPRESSION() {
		return EXPRESSION;
	}

	public void setEXPRESSION(String eXPRESSION) {
		EXPRESSION = eXPRESSION;
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

	public List<ExamSolution> getSolutions() {
		return solutions;
	}

	public void setSolutions(List<ExamSolution> solutions) {
		this.solutions = solutions;
	}

}
