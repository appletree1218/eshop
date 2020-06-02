package com.dao;

import java.util.List;

import com.domain.ReceiveInfo;
import com.utils.BaseDao;

public class ReceiveInfoDao extends BaseDao<ReceiveInfo>{
	public List<ReceiveInfo> getReceiveInfoByUserId(Long userId){
		return this.hibernateTemplate.find("from ReceiveInfo where userId=?",userId);
	}
}
