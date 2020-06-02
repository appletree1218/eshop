package com.action;

import java.io.InputStream;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.domain.Business;
import com.domain.Manager;
import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BusinessService;
import com.service.ManagerService;
import com.service.UserService;
import com.utils.BaseAction;
import com.utils.SecurityCode;

public class LoginAction extends ActionSupport{
	private UserService userService;
	private BusinessService businessService;
	private ManagerService managerService;
	
	private String message;
	
	private String role;
	private String name;
	private String password;
	private String verifyCode;
	
	//检查用户名和密码
	public String checkUAndP(){
		Manager manager = this.managerService.getManagerByUAndP(name, password);

		if(manager==null){
			this.message = "用户名或密码错误！";
		}else{
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("name", name);
			session.setMaxInactiveInterval(60*60*24);
			
			if( verifyCode.equalsIgnoreCase( (String) session.getAttribute("temp")) ){
				this.message = "";
			}else{
				this.message = "验证码错误！";
			}
		}
		
		return SUCCESS;
	}
	
	public String checkForeUAndP(){
		if("买家".equals(role)){
			User user = this.userService.getUserByUAndP(name, password);
			
			if(user==null){
				this.message = "用户名或密码错误！";
			}else{
				this.message = "";
				
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("username", name);
				session.setAttribute("userId", user.getUserId());
			}
		}else{
			Business business = this.businessService.getBusinessByUAndP(name, password);
			
			if(business==null){
				this.message = "用户名或密码错误！";
			}else{
				this.message = "";
				
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("username", name);
			}
		}
		
		return SUCCESS;
	}
	
	public String forward(){
		return "action2action";
	}
	
	public String login(){
		ServletActionContext.getRequest().getSession().setAttribute("role", role);
		
		return "login";
	}

	public ManagerService getManagerService() {
		return managerService;
	}
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public BusinessService getBusinessService() {
		return businessService;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}public String getMessage() {
		return message;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
}