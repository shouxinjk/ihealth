package com.shouxin.util;

import java.util.HashSet;
import java.util.Iterator;

public class RepeatString {
	
	public static String repeat(String str){
		str = str.substring(0, str.length()-1);
		String aaArray[] = str.split(",");
        HashSet<String> hs = new HashSet<String>();
        for(String s : aaArray){
            hs.add(s);
        }
        Iterator<String> it = hs.iterator();
        String aa_=null;
        if(it.hasNext()){
        	aa_ = hs.toString().replace("[", "").replace("]", "");//去除相同项的字符串
        }
		return aa_;
	}

}
