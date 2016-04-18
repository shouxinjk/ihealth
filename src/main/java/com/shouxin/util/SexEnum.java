package com.shouxin.util;

/**
 * 性别
 * @author sks
 *
 */
public enum SexEnum {
	BOY("男"),GIRL("女");
	private String value;
	
	private SexEnum(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
}
