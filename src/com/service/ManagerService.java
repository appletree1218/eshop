package com.service;

import com.dao.ManagerDao;
import com.domain.Manager;

public class ManagerService {
	private ManagerDao managerDao;
	
	public Manager getManagerByUAndP(String name,String password){
		return this.managerDao.getManagerByUAndP(name, password);
	}

	public ManagerDao getManagerDao() {
		return managerDao;
	}
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	public Manager getManagerByName(String name) {
		return this.managerDao.getManagerByName(name);
	}

	public void updateManager(Manager manager) {
		this.managerDao.updateEntity(manager);
	}
}
