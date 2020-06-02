package com.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.domain.ReceiveInfo;
import com.domain.User;
import com.service.ReceiveInfoService;
import com.service.UserService;
import com.utils.BaseAction;

public class ReceiveInfoAction extends BaseAction<ReceiveInfo>{
	private ReceiveInfoService receiveInfoService;
	private UserService userService;
	
	private String username;
	private String province;
	private String city;
	private String country;
	
	private String message;
	
	public String addUI(){
		return "addUI";
	}
	
	//ajax
	public String add(){
		ReceiveInfo receiveInfo = new ReceiveInfo();
		BeanUtils.copyProperties(this.getModel(), receiveInfo);
		
		country = ServletActionContext.getRequest().getParameter("country");
		city = ServletActionContext.getRequest().getParameter("city");
		province = ServletActionContext.getRequest().getParameter("province");
		
		if(username!=null && !"".equals(username)){
			User user = this.userService.getUerByName(username);
			receiveInfo.setUser(user);
			receiveInfo.setProvince(province);
			receiveInfo.setCity(city);
			receiveInfo.setCountry(country);
		}
		
		this.receiveInfoService.saveReceiveInfo(receiveInfo);
		
		return SUCCESS;
	}
	
	public String updateUI(){
		String receiveId = ServletActionContext.getRequest().getParameter("receiveId");
		if(receiveId!=null && !"".equals(receiveId)){
			ReceiveInfo receiveInfo = this.receiveInfoService.getReceiveInfoById( Long.valueOf(receiveId) );
			BeanUtils.copyProperties(receiveInfo, this.getModel());
		}
		
		return "updateUI";
	}
	
	//ajax
	public String update(){
		ReceiveInfo receiveInfo = new ReceiveInfo();
		BeanUtils.copyProperties(this.getModel(), receiveInfo);
		
		country = ServletActionContext.getRequest().getParameter("country");
		city = ServletActionContext.getRequest().getParameter("city");
		province = ServletActionContext.getRequest().getParameter("province");
		
		if(username!=null && !"".equals(username)){
			User user = this.userService.getUerByName(username);
			receiveInfo.setUser(user);
			receiveInfo.setProvince(province);
			receiveInfo.setCity(city);
			receiveInfo.setCountry(country);
		}
		
		this.receiveInfoService.updateReceiveInfo(receiveInfo);
		
		return SUCCESS;
	}
	
	//ajax
	public String delete(){
		String id = ServletActionContext.getRequest().getParameter("receiveId");
		
		if(id!=null && !"".equals(id)){
			try {
				this.receiveInfoService.deleteReceiveInfo(Long.valueOf(id));
				this.message = "success";
			} catch (NumberFormatException e) {
				this.message = "failed";
			}
		}
		
		return SUCCESS;
	}
	
	public ReceiveInfoService getReceiveInfoService() {
		return receiveInfoService;
	}
	public void setReceiveInfoService(ReceiveInfoService receiveInfoService) {
		this.receiveInfoService = receiveInfoService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMessage() {
		return message;
	}
}
