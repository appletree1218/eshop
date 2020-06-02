package com.dao;

import java.util.List;

import com.domain.Display;
import com.utils.BaseDao;

public class DisplayDao extends BaseDao<Display>{
	public Display getDisplayByLocation(int location){
		List<Display> list = this.hibernateTemplate.find("from Display where location=?", location);
		
		return list.size()>0?list.get(0):null;
	}
	
	public void deleteDisplayByLocation(int location) {
		Display display = getDisplayByLocation(location);
		this.hibernateTemplate.delete(display);
	}
	
}
