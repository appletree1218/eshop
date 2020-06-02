package com.domain;

import java.io.Serializable;
import java.util.Set;

public class User implements Serializable{
	private Long userId;
	private String name;
	private String identityId;
	private String email;
	private String phone;
	private String password;
	private String icon="Koala.jpg";
	private String description;
	
	private Set<Review> reviews;
	private Set<Orders> orders;
	private Set<Product> products;
	private Set<ReceiveInfo> receiveInfos;
//	private ShopCar shopCar;
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdentityId() {
		return identityId;
	}
	public void setIdentityId(String identityId) {
		this.identityId = identityId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<Review> getReviews() {
		return reviews;
	}
	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
//	public ShopCar getShopCar() {
//		return shopCar;
//	}
//	public void setShopCar(ShopCar shopCar) {
//		this.shopCar = shopCar;
//	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	public Set<ReceiveInfo> getReceiveInfos() {
		return receiveInfos;
	}
	public void setReceiveInfos(Set<ReceiveInfo> receiveInfos) {
		this.receiveInfos = receiveInfos;
	}
}
