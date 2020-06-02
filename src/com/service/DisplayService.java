package com.service;

import java.util.Collections;
import java.util.List;

import com.dao.DisplayDao;
import com.domain.Display;

public class DisplayService {
	private DisplayDao displayDao;
	
	public List<Display> getAllDisplay(){
		List<Display> list = this.displayDao.getAllEntities();
		Collections.sort(list);
		return list;
	}
	
	public void saveDisplay(Display display) {
		this.displayDao.saveEntity(display);
	}
	
	public void deleteDisplayByLocation(int location) {
		this.displayDao.deleteDisplayByLocation(location);
	}

	public DisplayDao getDisplayDao() {
		return displayDao;
	}
	public void setDisplayDao(DisplayDao displayDao) {
		this.displayDao = displayDao;
	}
}
