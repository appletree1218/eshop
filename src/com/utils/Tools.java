package com.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Random;
import java.util.UUID;

public class Tools {
	/**
	 * 将所有的list转化成pageList
	 * @param list
	 * @param currentNum 当前页码
	 * @param pageSize 一页所能容纳的数据
	 * @return
	 */
	public static List convertPageList(List list, int currentNum,int pageSize){
		List pageList = new ArrayList();
		int totalNum = list.size() % pageSize == 0 ? list.size() / pageSize : list.size() / pageSize + 1;
		
		if(currentNum > totalNum){
			currentNum = totalNum;
		}else if(currentNum < 1){
			currentNum = 1;
		}
		
		//当前页中数据开始的索引
		int currentIndex = (currentNum-1) * pageSize;
		
		Collections.sort(list);
		
		for(int i = currentIndex; i < pageSize + currentIndex; i++){
			if(i < list.size()){
				pageList.add(list.get(i));
			}
		}
		
		return pageList;
	}
	
	/**
	 * 将图片名称数组拼成用“，”隔开的字符串
	 * @param strs 字符数组 
	 * @return
	 */
	public static String convertString(String[] strs){
		StringBuilder builder = new StringBuilder();
		
		for(int i = 0;i < strs.length;i++){
			if(builder.length() > 0){
				builder.append(",");
			}
			
			builder.append(strs[i]);
		}
		
		return builder.toString();
	}
	
	/**
	 * 将字符串转换成List
	 * @return
	 */
	public static List<String> convertStringList(String str){
		String[] strArray = null;
		List<String> list = new ArrayList<String>();
		
		if(str.contains(",")){
			strArray = str.split(",");
			
			for(String s : strArray){
				list.add(s);
			}
		}
		
		return list;
	}
	
	public static String decodeUtil(String name){
		String decodeName = null;
		
		try {
			decodeName = URLDecoder.decode(name,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return decodeName;
	}
	
	/**
	 * 生成订单号
	 * @return
	 */
	public static String createOrderNum(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replaceAll("-", "").toUpperCase();
	}
	
	/**
	 * 生成订单创建时间
	 */
	public static String createDate(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return format.format(date);
	}
}


