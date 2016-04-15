package com.shouxin.util;

public enum YesOrNoEnum {
	YES("是", 1),
	NO("否", 2);

	private String value;
	private int index;

	private YesOrNoEnum(String value,int index){
		this.value = value;
		this.index = index;
	}
	
	
	/**
	 * 根据枚举name值获取index
	 * @param name
	 * @return
	 */
	public int getIndexByName(String value){
		for(YesOrNoEnum yesOrNo : YesOrNoEnum.values()){
			if(yesOrNo.getValue().equals(value)){
				return yesOrNo.getIndex();
			}
		}
		return 0;
	}
	
	/**
	 * 根据枚举index值获name
	 * @param index
	 * @return
	 */
	public String getNameByIndex(int index){
		for(YesOrNoEnum yesOrNo:YesOrNoEnum.values()){
			if(yesOrNo.getIndex()==index){
				return yesOrNo.getValue();
			}
		}
		return null;
	}
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

}
