package com.shouxin.util;

/**
 * 学历
 * @author sks
 *
 */
public enum DegreeEnum {
	/**
	 * 学历，是枚举类型，包括：
	 * 		小学primary school、
	 * 		初中 junior middle school、
	 * 		高中high school、
	 * 		中专secondary specialized school
	 * 		大专junior college
	 * 		本科 undergraduate、
	 * 		硕士 master、
	 * 		博士learned scholar
	 */
	
	PRIMARYSCHOOL("小学",1),
	JUNIORMIDDLESCHOOL("初中",2),
	HIGHSCHOOL("高中",3),
	SECONDARYSPECIALIZEDSCHOOL("中专",4),
	JUNIORCOLLEGE("大专",5),
	UNDERGRADUATE("本科",6),
	MARSTER("硕士",7),
	LEARNEDSCHOLAR("博士",8);
	
	private String name;
	private int index;
	
	private DegreeEnum(String name,int index){
		this.name = name;
		this.index = index;
	}
	
	/**
	 * 根据枚举name值获取index
	 * @param name
	 * @return
	 */
	public static int getIndexByName(String name){
		
		for (DegreeEnum degreeEnum : DegreeEnum.values()) {
			if (degreeEnum.getName().equals(name)) {
				return degreeEnum.getIndex();
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
		for(DegreeEnum degreeEnum:DegreeEnum.values()){
			if(degreeEnum.getIndex()==index){
				return degreeEnum.getName();
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
