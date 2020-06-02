package com.service;

import java.util.Iterator;
import java.util.List;

import com.dao.BusinessDao;
import com.domain.Business;
import com.domain.Page;

public class BusinessService{
	private BusinessDao businessDao;
	
	public List<Business> getBusinessList(){
		return this.businessDao.getAllEntities();
	}
	
	public Page getPageBusinesss(String pageNum) {
		int num = 1;
		
		if(pageNum!=null&&!"".equals(pageNum.trim())){
			num = Integer.parseInt(pageNum);
		}
		
		int totalRecords = this.getBusinessList().size();
		
		Page page = new Page(num, totalRecords);
		List<Business> lists = this.businessDao.getPageEntities(page.getStartIndex(), page.getPageSize());
		page.setRecords(lists);
		
		return page;
	}
	
	public List<Business> getBusinessByShopIdButMyself(Long shopId, Long businessId){
		List<Business> businessList = this.businessDao.getBusinessByShopId(shopId);
		
		for(Iterator<Business> iter = businessList.iterator();iter.hasNext();){
			if(iter.next().getBusinessId() == businessId){
				iter.remove();
			}
		}
		
		return businessList;
	}
	
	public List<Business> getBusinessByNameAndId(String name, Long id){
		return this.businessDao.getBusinessByNameAndId(name, id);
	}
	
//	public Page getBusinessByRole(String pageNum, Long roleId){
//		int num = 1;
//		
//		if(pageNum!=null&&!"".equals(pageNum.trim())){
//			num = Integer.parseInt(pageNum);
//		}
//		
//		int totalRecords = this.businessDao.getBusinessByRole(, roleId).size();
//		
//		this.businessDao.getBusinessByRole(page, roleId);
//	}
	
	public void saveBusiness(Business business){
		this.businessDao.saveEntity(business);
	}

	public Business getBusinessById(Long id) {
		return this.businessDao.getEntityById(id);
	}

	public BusinessDao getBusinessDao() {
		return businessDao;
	}
	public void setBusinessDao(BusinessDao businessDao) {
		this.businessDao = businessDao;
	}

	public void updateBusiness(Business business) {
		this.businessDao.updateEntity(business);
	}

	public void deleteBusinessById(Long id) {
		this.businessDao.deleteEntityById(id);
	}

	public Business getBusinessByUAndP(String name, String password) {
		return this.businessDao.getBusinessByUAndP(name, password);
	}

	public Business getBusinessByName(String name) {
		List<Business> businessList = this.businessDao.getBusinessByName(name);
		
		if(businessList.size()>0){
			return businessList.get(0);
		}
		
		return null;
	}

	public Page getPageBusinesssByFuzzy(String pageNum, String key) {
		int num = 1;
		
		if(pageNum!=null&&!"".equals(pageNum.trim())){
			num = Integer.parseInt(pageNum);
		}
		
		int totalRecords = this.getBusinessByFuzzy(key).size();
		
		Page page = new Page(num, totalRecords);
		List<Business> lists = this.businessDao.getPageEntitiesByFuzzy(page.getStartIndex(), page.getPageSize(), key);
		page.setRecords(lists);
		
		return page;
	}

	private List<Business> getBusinessByFuzzy(String key) {
		return this.businessDao.getBusinessByFuzzy(key);
	}
}
