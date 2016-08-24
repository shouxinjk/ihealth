package com.shouxin.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderNo {
	private static int max_orderNo = 999999;
	private static int min_orderNo = 1;
	
	public static String getDateStr(){
		SimpleDateFormat s = new SimpleDateFormat("yyMMdd");
		Date d = new Date();
		String d1 = s.format(d);
		return d1;
	}
	
	public static String getOrderNo(String maxOrderNo){
		String newOrderNo = "";
		String d1 = getDateStr();
		if(maxOrderNo == null){
			newOrderNo = d1+"000001";
		}else{
			String serial = maxOrderNo.substring(6, maxOrderNo.length());
			int serialNum = Integer.parseInt(serial);
			if(serialNum == max_orderNo){
				newOrderNo = "max";
			}else{
				int nextNum = serialNum+1;
				switch ((nextNum+"").length()) {
				case 1:
					newOrderNo += d1+"00000"+nextNum;
					break;
				case 2:
					newOrderNo += d1+"0000"+nextNum;
					break;
				case 3:
					newOrderNo += d1+"000"+nextNum;
					break;
				case 4:
					newOrderNo += d1+"00"+nextNum;
					break;
				case 5:
					newOrderNo += d1+"0"+nextNum;
					break;
				default:
					newOrderNo += d1+""+nextNum;
					break;
				}
			}
		}
		return newOrderNo;
	}
	
	public static void main(String[] args) {
		System.out.println(OrderNo.getOrderNo("160718999999"));
	}

}
