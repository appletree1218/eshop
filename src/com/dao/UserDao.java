package com.dao;

import java.util.List;

import com.domain.ShopCar;
import com.domain.User;
import com.utils.BaseDao;

public class UserDao extends BaseDao<User>{
	public List<User> getUserByName(String name){
		return this.hibernateTemplate.find("from User where name=?",name);
	}
	
	public Long saveUser(User user){
		return (Long) this.hibernateTemplate.save(user);
	}

	public User getUserByUAndP(String name, String password) {
		List<User> userList = this.hibernateTemplate.find("from User where name=? and password=?",new Object[]{name,password});
		
		if(userList.size()==0){
			return null;
		}
		
		return userList.get(0);
	}
	
	public List<User> getUsersByFuzzy(String key){
		return this.hibernateTemplate.find("from User where name like '%"+key+"%'");
	}
}		
