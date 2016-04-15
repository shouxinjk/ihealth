package com.shouxin.util;

/**
 * 体检项目状态信息的枚举类
 * @author sks
 * ALREADYENABLED 已选中
 * HASBEENDELETED 已删除
 *
 */
public enum StatusEnum {
	ALREADYENABLED("已选中"),HASBEENDELETED("已删除");
	
	private String value;
	
	private StatusEnum(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
