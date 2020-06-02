package com.dao;

import java.util.List;

import com.domain.ShopCar;
import com.utils.BaseDao;

public class ShopCarDao extends BaseDao<ShopCar>{
	public boolean isExistUser(Long userId){
		List<ShopCar> shopCarList = this.hibernateTemplate.find("from ShopCar where userId=? and mark=0", userId);
		return shopCarList.size() > 0 ? true : false;
	}
	
	public List<ShopCar> getShopCarByUserId(Long userId){
		return this.hibernateTemplate.find("from ShopCar where userId=? and mark=0", userId);
	}
	
	/**
	 * 根据userid和productid查询
	 * @param userId
	 * @param isNull 订单是否为空
	 * @return
	 */
	public List<ShopCar> getShopCarByUAndP(Long userId, Long productId, boolean isNull){
		if(isNull){
			return this.hibernateTemplate.find("from ShopCar where userId=? and productId=? and mark=1", new Object[]{userId, productId});
		}else{
			return this.hibernateTemplate.find("from ShopCar where userId=? and productId=? and mark=0", new Object[]{userId, productId});
		}
	}
	
	/**
	 * 根据userid查询
	 * @param userId
	 * @return
	 */
	public List<ShopCar> getAmountByUser(Long userId){
		return this.hibernateTemplate.find("from ShopCar where userId=? and mark=1", new Object[]{userId});
	}
	
	public void saveOrUpdateShopCar(ShopCar shopCar){
		this.hibernateTemplate.saveOrUpdate(shopCar);
	}
}
