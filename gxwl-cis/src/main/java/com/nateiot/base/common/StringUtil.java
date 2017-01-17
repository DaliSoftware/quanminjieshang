package com.nateiot.base.common;

import java.util.ArrayList;
import java.util.List;

public class StringUtil {
	
	/**
	 * 
	 * 用fengefu字符串分割str 并将分割后的值保存到list并返回
	 * @param str 
	 * @param fengefu
	 * @return
	 */
	public static  List<Long> splitStrToLongList(String str, String fengefu){
		String strs[] = str.split(fengefu);
		List<Long> list = new ArrayList<Long>(strs.length);
		for(int i = 0; i < strs.length; i ++){
			list.add(Long.parseLong(strs[i]));
		}
		return list;
	}
}
