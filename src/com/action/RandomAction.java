package com.action;

import java.io.ByteArrayInputStream;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.utils.SecurityCode;

public class RandomAction extends ActionSupport{
	private ByteArrayInputStream inputStream;
	
	public String execute(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		ByteArrayInputStream is = SecurityCode.getSecurityCode(session);
		this.setInputStream(is);
		
		return SUCCESS;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}
}
