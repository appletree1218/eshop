package com.service;

import java.util.List;

import com.dao.ShopDao;
import com.domain.Page;
import com.domain.Shop;
import com.domain.User;

public class ShopService{
	private ShopDao shopDao;
	
	public Page getPageShops(String pageNum){
		int num = 1;
		
		if(pageNum!=null&&!"".equals(pageNum.trim())){
			num = Integer.parseInt(pageNum);
		}
		
		int totalRecords = this.getShopList().size();
		
		Page page = new Page(num, totalRecords);
		List<Shop> lists = this.shopDao.getPageEntities(page.getStartIndex(), page.getPageSize());
		
		page.setRecords(lists);
		
		return page;
	}
	
	public Shop getShopByName(String name){
		List<Shop> shopList = this.shopDao.getShopByName(name);
		
		if(shopList.size()>0){
			return shopList.get(0);
		}
		
		return null;
	}

	public List<Shop> getShopList() {
		return this.shopDao.getAllEntities();
	}

	public ShopDao getShopDao() {
		return shopDao;
	}
	public void setShopDao(ShopDao shopDao) {
		this.shopDao = shopDao;
	}

	public void saveShop(Shop shop) {
		this.shopDao.saveEntity(shop);
	}

	public Shop getShopById(Long id) {
		return this.shopDao.getEntityById(id);
		
	}

	public void updateShop(Shop shop) {
		this.shopDao.updateEntity(shop);
	}

	public void deleteShopById(Long id) {
		this.shopDao.deleteEntityById(id);
	}

	public List<Shop> getAllShopByKey(String key) {
		return this.shopDao.getAllShopByKey(key);
	}

	public Page getPageShopsByFuzzy(String pageNum, String key) {
		int num = 1;
		
		if(pageNum!=null&&!"".equals(pageNum.trim())){
			num = Integer.parseInt(pageNum);
		}
		
		int totalRecords = this.getShopByFuzzy(key).size();
		
		Page page = new Page(num, totalRecords);
		List<Shop> lists = this.shopDao.getPageEntitiesByFuzzy(page.getStartIndex(), page.getPageSize(), key);
		page.setRecords(lists);
		
		return page;
	}

	private List getShopByFuzzy(String key) {
		return this.shopDao.getShopByFuzzy(key);
	}
}
