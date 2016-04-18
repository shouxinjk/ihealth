package com.shouxin.util;
/**
 * 婚姻状况枚举
 * @author sks
 *
 */
public enum MarriageStatusEnum {
	
	//unmarried 未婚
	//married 已婚
	//cohabitation 同居
	//divorce 离异
	//The widow 寡居
	UNMARRIED("未婚",1),
	MARRIED("已婚",2),
	COHABITATION("同居",3),
	DIVORCE("离异",4),
	THEWIDOW("寡居",5);
	
    private String name;
    private int index;
    
    private MarriageStatusEnum(String name,int index){
    	this.name = name;
    	this.index = index;
    }
    
    
    /**
	 * 根据枚举name值获取index
	 * @param name
	 * @return
	 */
	public static int getIndexByName(String name){
		for(MarriageStatusEnum marriageStatusEnum : MarriageStatusEnum.values()){
			if(marriageStatusEnum.getName().equals(name)){
				return marriageStatusEnum.getIndex();
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
		for(MarriageStatusEnum marriageStatusEnum:MarriageStatusEnum.values()){
			if(marriageStatusEnum.getIndex()==index){
				return marriageStatusEnum.getName();
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
