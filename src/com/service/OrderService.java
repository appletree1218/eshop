package com.service;

import java.util.List;

import com.dao.OrderDao;
import com.domain.Orders;
import com.domain.User;

public class OrderService {
	private OrderDao orderDao;
	
	public List<Orders> getAllOrders() {
		return this.orderDao.getAllEntities();
	}
	
	public Orders getOrdersById(Long orderId) {
		return this.orderDao.getEntityById(orderId);
	}
	
	public Orders getOrdersByNumber(String number){
		List<Orders> list =  this.orderDao.getOrdersByNumber(number);
		return list.size()>0?list.get(0):null;
	}
	
	public List<Orders> getOrdersByUser(Long id) {
		return this.orderDao.getOrdersByUser(id);
	}

	public void saveOrUpdateOrder(Orders orders) {
		this.orderDao.saveOrUpdateEntity(orders);
	}
	
	public void saveOrder(Orders orders){
		this.orderDao.saveEntity(orders);
	}
	
	public Long saveOrderReturn(Orders orders){
		return this.orderDao.saveOrder(orders);
	}

	public void updateOrder(Orders orders) {
		this.orderDao.updateEntity(orders);
	}
	
	public void deleteOrder(Orders orders) {
		this.orderDao.deleteEntity(orders);
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
}
