package com.service;

import java.util.List;

import com.dao.UserDao;
import com.domain.Business;
import com.domain.Page;
import com.domain.User;

public class UserService {
	private UserDao userDao;
	
	public List<User> getUserList(){
		List<User> userList = this.userDao.getAllEntities();
		
		return userList;
	}
	
	public Page getPageUsersByFuzzy(String pageNum, String key) {
		int num = 1;
		
		if(pageNum!=null&&!"".equals(pageNum.trim())){
			num = Integer.parseInt(pageNum);
		}
		
		int totalRecords = this.getUserByFuzzy(key).size();
		
		Page page = new Page(num, totalRecords);
		List<User> lists = this.userDao.getPageEntitiesByFuzzy(page.getStartIndex(), page.getPageSize(), key);
		page.setRecords(lists);
		
		return page;
	}
	
	public Page getPageUsers(String pageNum) {
		int num = 1;
		
		if(pageNum!=null&&!"".equals(pageNum.trim())){
			num = Integer.parseInt(pageNum);
		}
		
		int totalRecords = this.getUserList().size();
		
		Page page = new Page(num, totalRecords);
		List<User> lists = this.userDao.getPageEntities(page.getStartIndex(), page.getPageSize());
		page.setRecords(lists);
		
		return page;
	}
	
	public List<User> getUsersByFuzzy(String key){
		return this.userDao.getUsersByFuzzy(key);
	}
	
	public User getUerByName(String name){
		List<User> userList = this.userDao.getUserByName(name);
		
		if(userList.size()>0){
			return userList.get(0);
		}
		
		return null;
	}
	
	public Long saveUser(User user){
		return this.userDao.saveUser(user);
	}
	
	public void updateUser(User user){
		this.userDao.updateEntity(user);
	}
	
	public void deleteUserById(Long id){
		this.userDao.deleteEntityById(id);
	}
	
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User getUserByUAndP(String name, String password) {
		return this.userDao.getUserByUAndP(name, password);
	}
	
	public List<User> getUserByFuzzy(String key){
		return this.userDao.getUsersByFuzzy(key);
	}

	public User getUserById(Long id) {
		return this.userDao.getEntityById(id);
	}
}
