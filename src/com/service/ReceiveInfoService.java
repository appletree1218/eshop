package com.service;

import java.util.List;

import com.dao.ReceiveInfoDao;
import com.domain.ReceiveInfo;

public class ReceiveInfoService {
	private ReceiveInfoDao receiveInfoDao;

	public List<ReceiveInfo> getReceiveInfoByUserId(Long userId){
		return this.receiveInfoDao.getReceiveInfoByUserId(userId);
	}
	
	public void saveReceiveInfo(ReceiveInfo receiveInfo) {
		this.receiveInfoDao.saveEntity(receiveInfo);
	}
	
	public void updateReceiveInfo(ReceiveInfo receiveInfo) {
		this.receiveInfoDao.updateEntity(receiveInfo);
	}
	
	public void deleteReceiveInfo(Long id){
		this.receiveInfoDao.deleteEntityById(id);
	}
	
	public ReceiveInfo getReceiveInfoById(Long id){
		return this.receiveInfoDao.getEntityById(id);
	}
	
	public void saveOrUpdateReceiveInfo(ReceiveInfo receiveInfo){
		this.receiveInfoDao.saveOrUpdateEntity(receiveInfo);
	}
	
	public ReceiveInfoDao getReceiveInfoDao() {
		return receiveInfoDao;
	}
	public void setReceiveInfoDao(ReceiveInfoDao receiveInfoDao) {
		this.receiveInfoDao = receiveInfoDao;
	}
}
