package com.utils;

import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.domain.Page;

public class BaseDao<T>{
	private Class<?> clazz;
	
	public HibernateTemplate hibernateTemplate;
	
	public BaseDao() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		this.clazz = (Class<?>) type.getActualTypeArguments()[0];
	}

	public void saveEntity(T t) {
		this.hibernateTemplate.save(t);
	}
	
	public void saveOrUpdateEntity(T t) {
		this.hibernateTemplate.saveOrUpdate(t);
	} 

	public void updateEntity(T t) {
		this.hibernateTemplate.update(t);
	}

	public void deleteEntityById(Long id) {
		T t = this.getEntityById(id);
		this.hibernateTemplate.delete(t);
	}
	
	public void deleteEntity(T t) {
		this.hibernateTemplate.delete(t);
	}

	public List<T> getAllEntities() {
		return this.hibernateTemplate.find("from "+this.clazz.getName());
	}
	
	@SuppressWarnings("unchecked")
	public List<T> getPageEntities(final int startIndex,final int pageSize) {
		return this.hibernateTemplate.executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from " + clazz.getName());
				query.setFirstResult(startIndex);
				query.setMaxResults(pageSize);
				
				return query.list();
			}
		});
	}
	
	@SuppressWarnings("unchecked")
	public List<T> getPageEntitiesByFuzzy(final int startIndex,final int pageSize, final String key) {
		return this.hibernateTemplate.executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from " + clazz.getName()+" where name like '%"+key+"%'");
				query.setFirstResult(startIndex);
				query.setMaxResults(pageSize);
				
				return query.list();
			}
		});
	}
	
	public T getEntityById(Long id) {
		return (T) this.hibernateTemplate.get(this.clazz, id);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}

