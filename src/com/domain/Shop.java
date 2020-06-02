package com.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Shop implements Serializable{
	private Long shopId;
	private String name;
	private String regTime;
	private String description;
	private String address;
	private String logo;
	
	private Set<Business> businesses = new HashSet<Business>();
	private Set<Product> products = new HashSet<Product>();
	private Set<Orders> orders = new HashSet<Orders>();
	
	private Status status;

	public Long getShopId() {
		return shopId;
	}
	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Set<Business> getBusinesses() {
		return businesses;
	}
	public void setBusinesses(Set<Business> businesses) {
		this.businesses = businesses;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
}
