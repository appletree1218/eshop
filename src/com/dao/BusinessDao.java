package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.domain.Business;
import com.utils.BaseDao;

public class BusinessDao extends BaseDao<Business>{

	public Business getBusinessByUAndP(String name, String password) {
		List<Business> businessList = this.hibernateTemplate.find("from Business where name=? and password=?",new Object[]{name,password});
		
		if(businessList.size()==0){
			return null;
		}
		
		return businessList.get(0);
	}

	public List<Business> getBusinessByName(String name) {
		return this.hibernateTemplate.find("from Business where name=?",name);
	}
	
	public List<Business> getBusinessByShopId(Long id) {
		return this.hibernateTemplate.find("from Business where shopId=?",id);
	}

	public List<Business> getBusinessByFuzzy(String key) {
		return this.hibernateTemplate.find("from Business where name like '%"+key+"%'");
	}
	
	@SuppressWarnings("unchecked")
	public List<Business> getBusinessByNameAndId(String name, Long id){
		return this.hibernateTemplate.find("from Business where name like ? and businessId=?", new Object[]{name, id});
	}
	
	@SuppressWarnings("unchecked")
	public List<Business> getBusinessByRole(final int startIndex, final int pageSize, final Long roleId) {
		return this.hibernateTemplate.executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from Business where roleId="+roleId);
				query.setFirstResult(startIndex);
				query.setMaxResults(pageSize);
				
				return query.list();
			}
		});
	}
}
