package com.dao;

import java.util.List;

import com.domain.Manager;
import com.utils.BaseDao;

public class ManagerDao extends BaseDao<Manager>{
	public Manager getManagerByUAndP(String name, String password){
		List<Manager> managerList = this.hibernateTemplate.find("from Manager where name=? and password=?",new Object[]{name,password});
		
		if(managerList.size()==0){
			return null;
		}
		
		return managerList.get(0);
	}

	public Manager getManagerByName(String name) {
		List<Manager> managerList = this.hibernateTemplate.find("from Manager where name=?",name);
		
		if(managerList.size()==0){
			return null;
		}
		
		return managerList.get(0);
	}
}
