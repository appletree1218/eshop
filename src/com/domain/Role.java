package com.domain;

import java.io.Serializable;
import java.util.Set;

public class Role implements Serializable{
	private Long roleId;
	private String name;
	
	private Set<Business> businesses;
	
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Business> getBusinesses() {
		return businesses;
	}
	public void setBusinesses(Set<Business> businesses) {
		this.businesses = businesses;
	}
}
