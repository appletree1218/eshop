package com.service;

import java.util.List;

import com.dao.TypeDao;
import com.dao.TypeDao;
import com.domain.Page;
import com.domain.Type;

public class TypeService {
	private TypeDao typeDao;
	
	public List<Type> getTypeList(){
		return this.typeDao.getAllEntities();
	}
	
	public Page getPageTypes(String pageNum) {
		int num = 1;
		
		if(pageNum!=null&&!"".equals(pageNum.trim())){
			num = Integer.parseInt(pageNum);
		}
		
		int totalRecords = this.getTypeList().size();
		
		Page page = new Page(num, totalRecords);
		List lists = this.typeDao.getPageEntities(page.getStartIndex(), page.getPageSize());
		page.setRecords(lists);
		
		return page;
	}
	
	public Type getTypeById(Long id){
		return this.typeDao.getEntityById(id);
	}
	
	public Type getTypeByName(String name){
		List<Type> typeList = this.typeDao.getTypeByName(name);
		
		if(typeList.size()>0){
			return typeList.get(0);
		}
		
		return null;
	}
	
	/**
	 * 根据parentId获得产品里类型名称
	 * @return
	 */
	public String getTypeNameByParentId(Long parentId){
		Type type = this.typeDao.getTypeByParentId(parentId);
		return type == null ? null : type.getName();
	}
	
	public List<Type> getTypeListByParentId(Long parentId){
		return this.typeDao.getTypeListByParentId(parentId);
	}
	
	public void saveType(Type type){
		this.typeDao.saveEntity(type);
	}
	
	public void updateType(Type type){
		this.typeDao.updateEntity(type);
	}
	
	public void deleteTypeById(Long id){
		this.typeDao.deleteEntityById(id);
	}

	public TypeDao getTypeDao() {
		return typeDao;
	}
	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}
}
