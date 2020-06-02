package com.action;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.domain.Page;
import com.domain.Type;
import com.opensymphony.xwork2.ActionContext;
import com.service.TypeService;
import com.utils.BaseAction;
import com.utils.Tools;


public class TypeAction extends BaseAction<Type> {
	private TypeService typeService;
	
	private String message;
	
	public String getTypeList() {
		String pageNum = ServletActionContext.getRequest().getParameter("pageNum");
		Page page = this.typeService.getPageTypes(pageNum);
		ActionContext.getContext().put("page", page);
		
		return LIST;
	}
	
	public String addUI() {
		ActionContext.getContext().getValueStack().getRoot().clear();
		List<Type> typeList = this.typeService.getTypeList();
		
		for(Iterator<Type> iter = typeList.iterator();iter.hasNext();){
			Type type = iter.next();
			
			if(type.getParentId() != 0){
				iter.remove();
			}
		}
		
		ActionContext.getContext().put("typeList", typeList);
		
		return ADD;
	}
	
	public String addType() {
		//保存数据
		Type type = new Type();
		BeanUtils.copyProperties(this.getModel(), type);
		
		if(type.getParentId()==null){
			type.setParentId(0L);
		}
		
		this.typeService.saveType(type);
		
		return ACTION2ACTION;
	}
	
	public String updateUI(){
		String typeId = ServletActionContext.getRequest().getParameter("typeId");
		Type type = this.typeService.getTypeById(Long.parseLong(typeId));
		BeanUtils.copyProperties(type, this.getModel());
		
		List<Type> typeList = this.typeService.getTypeList();
		for(Iterator<Type> iter = typeList.iterator();iter.hasNext();){
			Type t = iter.next();
			
			if(t.getParentId() != 0){
				iter.remove();
			}
		}
		ActionContext.getContext().put("typeList", typeList);
		
		return UPDATE;
	}
	
	public String updateType(){
		Type type = new Type();
		BeanUtils.copyProperties(this.getModel(), type);
		
		if(type.getParentId()==null){
			type.setParentId(0L);
		}
		
		this.typeService.updateType(type);
		
		return ACTION2ACTION;
	}
	
	public String deleteType(){
		Map<String, String[]> map = ServletActionContext.getRequest().getParameterMap();
		Set<String> sets = map.keySet();
		for (String s : sets) {
			try {
				this.typeService.deleteTypeById(Long.parseLong(map.get(s)[0]));
			} catch (Exception e) {
				System.out.println("已删除数据");
			}
		}
		
		return ACTION2ACTION;
	}
	
	public String checkIsExit(){
		Type type = this.typeService.getTypeByName(Tools.decodeUtil(this.getModel().getName()));

		if(type!=null){
			this.message = "该产品类型已存在！";
		}else{
			this.message="";
		}
		
		return SUCCESS;
	}

	public TypeService getTypeService() {
		return typeService;
	}
	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
