package com.domain;

import java.io.Serializable;
import java.util.Set;

public class ShopCar implements Serializable, Comparable<ShopCar>{
	private Long scId;
	private Long amount;
	private Boolean mark = false;
	
	private Product product;
	private User user;
	private Set<Orders> orders;
	
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Long getScId() {
		return scId;
	}
	public void setScId(Long scId) {
		this.scId = scId;
	}
	public Boolean getMark() {
		return mark;
	}
	public void setMark(Boolean mark) {
		this.mark = mark;
	}
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	@Override
	public int compareTo(ShopCar shopCar) {
		return product.getProductId().compareTo(shopCar.product.getProductId());
	}
}
