package com.service;

import java.util.List;

import org.hibernate.criterion.Order;

import com.dao.OrderDao;
import com.dao.ShopCarDao;
import com.domain.Orders;
import com.domain.ShopCar;

public class ShopCarService {
	private ShopCarDao shopCarDao;
	private OrderDao orderDao;
	
	public ShopCar getShopCarByUAndP(Long userId, Long productId, boolean isNull){
		List<ShopCar> list = this.shopCarDao.getShopCarByUAndP(userId, productId, isNull);
		return list.size()>0?list.get(0):null;
	}
	
	public List<ShopCar> getAmountByUser(Long userId){
		List<ShopCar> list = this.shopCarDao.getAmountByUser(userId);
		return list;
	}
	
	public void saveOrUpdateShopCar(ShopCar shopCar){
		this.shopCarDao.saveOrUpdateShopCar(shopCar);
	}
	
	public void saveShopCar(ShopCar shopCar){
		this.shopCarDao.saveEntity(shopCar);
	}
	
	public void updateShopCar(ShopCar shopCar) {
		this.shopCarDao.updateEntity(shopCar);
	}
	
	public void updateShopCarList(List<ShopCar> shopCarList) {
		for (ShopCar shopCar : shopCarList) {
			shopCar.setMark(true);
			this.shopCarDao.updateEntity(shopCar);
		}
	}
	
	public boolean isExistUser(Long userId){
		return this.shopCarDao.isExistUser(userId);
	}
	
	public List<ShopCar> getShopCarByUserId(Long userId){
		return this.shopCarDao.getShopCarByUserId(userId);
	}
	
	public ShopCar getShopCarById(Long id){
		return this.shopCarDao.getEntityById(id);
	}
	
	public void deleteShopCarById(Long id){
		this.shopCarDao.deleteEntityById(id);
	}
	
	public void deleteShopCar(ShopCar shopCar){
		this.shopCarDao.deleteEntity(shopCar);
	}

	public ShopCarDao getShopCarDao() {
		return shopCarDao;
	}
	public void setShopCarDao(ShopCarDao shopCarDao) {
		this.shopCarDao = shopCarDao;
	}
	public OrderDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
}
