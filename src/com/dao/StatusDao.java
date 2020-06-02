package com.dao;

import java.util.List;

import com.domain.Status;
import com.utils.BaseDao;

public class StatusDao extends BaseDao<Status>{
	public List<Status> getStatusBySign(Long sign){
		return this.hibernateTemplate.find("from Status where sign=?", sign);
	}
}
