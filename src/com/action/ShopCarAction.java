package com.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.domain.Product;
import com.domain.ShopCar;
import com.domain.User;
import com.service.ProductService;
import com.service.ShopCarService;
import com.service.UserService;
import com.utils.BaseAction;

public class ShopCarAction extends BaseAction<ShopCar>{
	private ShopCarService shopCarService;
	private UserService userService;
	private ProductService productService;
	
	private String message;
	
	public String addShopCar(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String productId = request.getParameter("productId");
		String username = request.getParameter("username");
		String amount = request.getParameter("amount");
		
		if( username!=null && !"".equals(username) ){
			User user = this.userService.getUerByName(username);
			
			if( productId!=null && !"".equals(productId) && amount!=null && !"".equals(amount) ){
				ShopCar shopCar = new ShopCar();
				Product product = this.productService.getProductById(Long.valueOf(productId));
				shopCar.setProduct(product);
				shopCar.setUser(user);
				shopCar.setAmount( Long.valueOf(amount) );
				
				try {
					this.shopCarService.saveShopCar(shopCar);
					this.message = "success";
				} catch (Exception e) {
					this.message = "failed";
				}
			}
		}
		
		return SUCCESS;
	}
	
	public String ajaxUpdateAmount(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String username = request.getParameter("username");
		String productId = request.getParameter("productId");
		String amount = request.getParameter("amount");
		String scId = request.getParameter("scId");
		
		if(username!=null && !"".equals(username)){
			User user = this.userService.getUerByName(username);
			
			if(productId!=null && !"".equals(productId)){
				if(amount!=null && !"".equals(amount)){
					ShopCar shopCar = new ShopCar();
					Product product = this.productService.getProductById(Long.valueOf(productId));
					shopCar.setProduct(product);
					shopCar.setUser(user);
					shopCar.setAmount(Long.valueOf(amount));
					
					if(scId!=null && !"".equals(scId)){
						shopCar.setScId(Long.valueOf(scId));
						
						try {
							this.shopCarService.updateShopCar(shopCar);
							this.message = "success";
							System.out.println("-------------------log:更新成功-------------------");
						} catch (Exception e) {
							this.message = "failed";
							System.out.println("-------------------log:更新失败-------------------");
						}
					}
				}
			}
		}
		
		return SUCCESS;
	}
	
	public String ajaxDeleteShopCar(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String username = request.getParameter("username");
		String productId = request.getParameter("productId");
		
		if( username!=null && !"".equals(username) ) {
			User user = this.userService.getUerByName(username);
			
			if( productId!=null && !"".equals(productId)){
				ShopCar shopCar = this.shopCarService.getShopCarByUAndP( user.getUserId(), Long.valueOf(productId), true);
				try {
					this.shopCarService.deleteShopCar(shopCar);
					this.message = "success";
				} catch (Exception e) {
					this.message = "failed";
				}
			}
		}
		
		return SUCCESS;
	}
	
	public ShopCarService getShopCarService() {
		return shopCarService;
	}
	public void setShopCarService(ShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
}
