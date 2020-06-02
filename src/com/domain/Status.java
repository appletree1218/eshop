package com.domain;

import java.io.Serializable;
import java.util.Set;

public class Status implements Serializable{
	private Long statusId;
	private String name;
	private Long sign;
	
	private Set<Product> products;
	private Set<Orders> orders;
	private Set<Shop> shops;
	
	public Long getStatusId() {
		return statusId;
	}
	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	public Set<Shop> getShops() {
		return shops;
	}
	public void setShops(Set<Shop> shops) {
		this.shops = shops;
	}
	public Long getSign() {
		return sign;
	}
	public void setSign(Long sign) {
		this.sign = sign;
	}
}
