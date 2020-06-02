package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.domain.Product;
import com.utils.BaseDao;

public class ProductDao extends BaseDao<Product>{

	public List<Product> getAllProductByKey(String key) {
		SessionFactory sf = hibernateTemplate.getSessionFactory();
		Session session = sf.openSession();
		@SuppressWarnings("unchecked")
		List<Product> list = session.createQuery("select p " +
				"from Product p, Type t where t.typeId=p.type.typeId and (p.name like ? or p.description like ? or t.name like ?)")
			   .setParameter(0, "%"+key+"%")
		       .setParameter(1, "%"+key+"%")
		       .setParameter(2, "%"+key+"%")
		       .list();
		
		return list;
	}
	
	public List<Product> getAllProdductByTypeId(Long typeId){
		return this.hibernateTemplate.find("from Product where typeId=?", typeId);
	}
}
