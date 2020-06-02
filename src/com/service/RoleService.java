package com.service;

import java.util.List;

import com.dao.RoleDao;
import com.domain.Role;

public class RoleService {
	private RoleDao roleDao;
	
	public List<Role> getRoleList(){
		return this.roleDao.getAllEntities();
	}
	
	public Role getRoleById(Long id){
		return this.roleDao.getEntityById(id);
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}
}
