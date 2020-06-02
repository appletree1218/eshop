package com.service;

import java.util.List;

import com.dao.StatusDao;
import com.domain.Status;

public class StatusService {
	private StatusDao statusDao;
	
	public List<Status> getStatusList(){
		return this.statusDao.getAllEntities();
	}
	
	public List<Status> getStatusBySign(Long sign){
		return this.statusDao.getStatusBySign(sign);
	}

	public StatusDao getStatusDao() {
		return statusDao;
	}
	public void setStatusDao(StatusDao statusDao) {
		this.statusDao = statusDao;
	}

	public Status getStatusById(Long id) {
		return this.statusDao.getEntityById(id);
	}
}
