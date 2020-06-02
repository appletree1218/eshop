package com.dao;

import java.util.List;

import com.domain.Shop;
import com.domain.User;
import com.utils.BaseDao;

public class ShopDao extends BaseDao<Shop>{

	public List<Shop> getAllShopByKey(String key) {
		return this.hibernateTemplate.find("from Shop where name like ?","%"+key+"%");
	}

	public List<Shop> getShopByName(String name) {
		return this.hibernateTemplate.find("from Shop where name=?",name);
	}

	public List getShopByFuzzy(String key) {
		return this.hibernateTemplate.find("from Shop where name like '%"+key+"%'");
	}
}
