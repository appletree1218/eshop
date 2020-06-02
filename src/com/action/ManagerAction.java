package com.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.domain.Manager;
import com.opensymphony.xwork2.ActionContext;
import com.service.ManagerService;
import com.utils.BaseAction;

public class ManagerAction extends BaseAction<Manager>{
	private ManagerService managerService;
	
	private String message;
	private String newPassowrd;
	
	public String checkPassword(){
		Manager manager = this.managerService.getManagerByName(this.getModel().getName());
		
		if( manager==null ){
			this.message = "密码错误！";
		}else{
			if( manager.getPassword().equals(this.getModel().getPassword()) ){
				this.message = "";
			}else{
				this.message = "密码错误！";
			}
		}

		return SUCCESS;
	}
	
	public String updateManager(){
		Manager manager = new Manager();
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		String name = (String)session.getAttribute("name");
		
		manager = this.managerService.getManagerByName(name);
		manager.setPassword(newPassowrd);
		
		this.managerService.updateManager(manager);
		
		ActionContext.getContext().put("message", "修改成功");
		
		return UPDATE;
	}

	public ManagerService getManagerService() {
		return managerService;
	}
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	public String getMessage() {
		return message;
	}
	public String getNewPassowrd() {
		return newPassowrd;
	}
	public void setNewPassowrd(String newPassowrd) {
		this.newPassowrd = newPassowrd;
	}
}
