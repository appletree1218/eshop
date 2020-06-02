package com.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.domain.*;
import com.opensymphony.xwork2.ActionContext;
import com.service.*;
import com.utils.*;

public class OrderAction extends BaseAction<Orders>{
	private OrderService orderService;
	private ReceiveInfoService receiveInfoService;
	private ShopCarService shopCarService;
	private ProductService productService;
	private UserService userService;
	private StatusService statusService;
	
	private String message;
	
	//ajax
	public String updateOrderStatus(){
		
		
		return SUCCESS;
	}
	
	//ajax
	public String updateOrder(){
		String receiveId = ServletActionContext.getRequest().getParameter("receiveId");
		String orderNumber = ServletActionContext.getRequest().getParameter("orderNumber");
		
		if(receiveId!=null && !"".equals(receiveId)){
			ReceiveInfo receiveInfo = this.receiveInfoService.getReceiveInfoById(Long.valueOf(receiveId));
			
			if(orderNumber!=null && !"".equals(orderNumber)){
				Orders orders = this.orderService.getOrdersByNumber(orderNumber);
				orders.setReceiveInfo(receiveInfo);
				
				this.orderService.updateOrder(orders);
			}
		}
		
		return SUCCESS;
	}
	
	//ajax
	public String deleteOrder(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String orderNumber = request.getParameter("number");
		
		if(orderNumber!=null && !"".equals(orderNumber)){
			Orders orders = this.orderService.getOrdersByNumber(orderNumber);
			try {
				this.orderService.deleteOrder(orders);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		return SUCCESS;
	}
	
	//ajax
	/**
	 * 是否填写了收货信息
	 * @return
	 */
	public String isExistReceiveInfo(){
		String number = ServletActionContext.getRequest().getParameter("number");
		
		if(number!=null && !"".equals(number)){
			Orders orders = this.orderService.getOrdersByNumber(number);
			
			if(orders.getReceiveInfo()==null){
				this.message = "failed";
			}else{
				this.message = "success";
			}
		}
		
		return SUCCESS;
	}
	
	//ajax
	public String cancelOrder(){
		String number = ServletActionContext.getRequest().getParameter("number");
		
		if(number != null && !"".equals(number)){
			Orders orders = this.orderService.getOrdersByNumber(number);
			Status status = this.statusService.getStatusById(11L);
			orders.setStatus(status);
			
			try {
				this.orderService.updateOrder(orders);
				
				this.message = "success";
			} catch (Exception e) {
				this.message = "failed";
			}
		}
		
		return SUCCESS;
	}
	
	//ajax
	/**
	 * 提交订单
	 * @return
	 */
	public String submitOrder(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String scIds = request.getParameter("scIds");
		String username = request.getParameter("username");
		String receiveId = request.getParameter("receiveId");

		if(username!=null && !"".equals(username)){
			User user = this.userService.getUerByName(username);
			
			List<ShopCar> shopCarList = new ArrayList<ShopCar>();
			List<Shop> shopList = new ArrayList<Shop>();
			
			Long amount = 0L;
			String number = "";
			
			double totalPrice = 0D;

			if(scIds != null && scIds.contains(",")){
				String[] scIdArray = scIds.split(",");
				
				for (String scId : scIdArray) {
					ShopCar shopCar = this.shopCarService.getShopCarById(Long.valueOf(scId));
					shopCarList.add(shopCar);
				}
				
				for (ShopCar shopCar : shopCarList) {
					shopList.add( shopCar.getProduct().getShop() );
					
					amount += shopCar.getAmount();
					totalPrice += shopCar.getProduct().getPrice() * shopCar.getAmount();
				}
				
			}else{
				ShopCar shopCar = this.shopCarService.getShopCarById(Long.valueOf(scIds));
				Product product = shopCar.getProduct();
				
				shopList.add( product.getShop() );
				shopCarList.add(shopCar);
				
				amount += shopCar.getAmount();
				totalPrice += product.getPrice() * shopCar.getAmount();
			}
			
			Orders orders = new Orders();
			number = Tools.createOrderNum();
			orders.setNumber(number);
			orders.setAmount(amount);
			//订单相应商品维护上相应的店铺
			orders.setShops(new HashSet<Shop>(shopList));
			orders.setUser(user);
			orders.setCreateDate(Tools.createDate());
			orders.setPrice(totalPrice);
			orders.setShopcars(new HashSet<ShopCar>(shopCarList));
			
			if(receiveId!=null && !"".equals(receiveId)){
				ReceiveInfo receiveInfo = this.receiveInfoService.getReceiveInfoById(Long.valueOf(receiveId));
				orders.setReceiveInfo(receiveInfo);
			}
			
			try {
				this.orderService.saveOrder(orders);
				//将购物车中商品与订单号关联，购物车中不再显示
				//生成订单后，更新产品库存
				Set<Product> productSet = new HashSet<Product>();
				
				for(ShopCar shopCar : shopCarList){
					Product product = shopCar.getProduct();
					
					if( shopCar.getProduct().getProductId() == product.getProductId() ){
						product.setAmount( product.getAmount() - shopCar.getAmount() );
					}
					
					shopCar.setMark(true);
					productSet.add(product);
				}
				
				this.shopCarService.updateShopCarList(shopCarList);
				this.productService.updateProductList(productSet);
					
				ActionContext.getContext().put("shopCarList", shopCarList);
				ActionContext.getContext().put("order", orders);
				
				this.message = "success";
			} catch (Exception e) {
				this.message = "success";
				System.out.println("--------------"+e.getMessage()+"--------------");
			}
		}
		
		return SUCCESS;
	}

	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public ReceiveInfoService getReceiveInfoService() {
		return receiveInfoService;
	}
	public void setReceiveInfoService(ReceiveInfoService receiveInfoService) {
		this.receiveInfoService = receiveInfoService;
	}
	public String getMessage() {
		return message;
	}
	public ShopCarService getShopCarService() {
		return shopCarService;
	}
	public void setShopCarService(ShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public StatusService getStatusService() {
		return statusService;
	}
	public void setStatusService(StatusService statusService) {
		this.statusService = statusService;
	}
}
