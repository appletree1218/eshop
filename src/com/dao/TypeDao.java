package com.dao;

import java.util.List;

import com.domain.Type;
import com.utils.BaseDao;

public class TypeDao extends BaseDao<Type>{

	public List<Type> getTypeByName(String name) {
		return this.hibernateTemplate.find("from Type where name=?",name);
	}
	
	/**
	 * 通过父节点id获得父节点对应的产品类型对象
	 * @return
	 */
	public Type getTypeByParentId(Long parentId){
		List<Type> typeList = this.hibernateTemplate.find("from Type where parentId=?", parentId);
		return typeList.size() > 0 ? typeList.get(0) : null;
	}
	
	public List<Type> getTypeListByParentId(Long parentId){
		List<Type> typeList = this.hibernateTemplate.find("from Type where parentId=?", parentId);
		return typeList;
	}
}
