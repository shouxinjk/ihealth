package com.shouxin.util;

public enum StatusEunm {
	
	NEW("新建",1),
	DOCTOREXAMIN("医生已审核",2),
	OPERATIONSUPPLEMENT("运维已补充",3),
	OPERATIONEXAMINE("运维已审核",4),
	PUBLISH("已发布",5),
	EXPIRED("已失效",6);
	
	private String name;
	private int index;
	
	private StatusEunm(String name,int index){
		this.name = name;
		this.index = index;
	}
	
	/**
	 * 根据枚举name值获取index
	 * @param name
	 * @return
	 */
	public int getIndexByName(String name){
		for(StatusEunm statu : StatusEunm.values()){
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
	public String getNameByIndex(int index){
		for(StatusEunm statu:StatusEunm.values()){
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
