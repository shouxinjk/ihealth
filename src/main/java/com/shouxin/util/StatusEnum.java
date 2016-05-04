package com.shouxin.util;

public enum StatusEnum {
	
	NEW("新建",1),
	SUBMIT("已提交",18),
	DOCTOREXAMIN("医生已审核",2),
	OPERATIONSUPPLEMENT("运维已补充",3),
	OPERATIONEXAMINE("运维已审核",4),
	PUBLISH("已发布",5),
	EXPIRED("已失效",6),
	//体检项目表
	ALREADYENABLED("已选中",7),HASBEENDELETED("已删除",8),
	//用户表
	DISABLE("禁用",9),ENABLE("启用",10),
	//体检套餐表
	HASBEENGENERATED("已生成",11),ALREADYSELECTED("已选定",12),GENERATIONIN("生成中",13),
	//文章状态
	SUBMITTED("已提交",14),THEAPPROVED("已审核",15),CANCELTHERELEASE("取消发布",16),AUDITDIDNOTPASS("审核未通过",17);
	
	private String name;
	private int index;
	
	private StatusEnum(String name,int index){
		this.name = name;
		this.index = index;
	}
	
	/**
	 * 根据枚举name值获取index
	 * @param name
	 * @return
	 */
	public static int getIndexByName(String name){
		for(StatusEnum statu : StatusEnum.values()){
			if(statu.getName().equals(name)){
				return statu.getIndex();
			}
		}
		return 0;
	}
	
	/**
	 * 根据枚举index值获name
	 * @param index
	 * @return
	 */
	public static String getNameByIndex(int index){
		for(StatusEnum statu:StatusEnum.values()){
			if(statu.getIndex()==index){
				return statu.getName();
			}
		}
		return null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	
	

}
