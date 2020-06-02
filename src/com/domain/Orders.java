package com.domain;

import java.io.Serializable;
import java.util.Set;
import java.util.TreeSet;

public class Orders implements Serializable, Comparable<Orders>{
	private Long orderId;
	private String number;
	private Long amount;
	private Double price;
	private String createDate;
	private String description;
	
	private Set<ShopCar> shopcars = new TreeSet<ShopCar>();
	private Set<Shop> shops = new TreeSet<Shop>();;

	private ReceiveInfo receiveInfo;
	private Status status;
	private User user;
	
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public Set<ShopCar> getShopcars() {
		return shopcars;
	}
	public void setShopcars(Set<ShopCar> shopcars) {
		this.shopcars = shopcars;
	}
	public Set<Shop> getShops() {
		return shops;
	}
	public void setShops(Set<Shop> shops) {
		this.shops = shops;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public ReceiveInfo getReceiveInfo() {
		return receiveInfo;
	}
	public void setReceiveInfo(ReceiveInfo receiveInfo) {
		this.receiveInfo = receiveInfo;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	@Override
	public int compareTo(Orders o) {
		return orderId.compareTo(o.orderId);
	}
}
