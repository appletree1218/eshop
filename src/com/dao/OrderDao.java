package com.dao;

import java.util.List;

import com.domain.Orders;
import com.utils.BaseDao;

public class OrderDao extends BaseDao<Orders>{
	public List<Orders> getOrdersByNumber(String number){
		return this.hibernateTemplate.find("from Orders where number=?", number);
	}

	public List<Orders> getOrdersByUser(Long id) {
		return this.hibernateTemplate.find("from Orders where userId=?", id);
	}
	
	public Long saveOrder(Orders orders){
		return (Long) this.hibernateTemplate.save(orders);
	}
}
