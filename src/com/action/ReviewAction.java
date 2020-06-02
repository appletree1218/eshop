package com.action;

import java.util.List;

import com.domain.Orders;
import com.domain.Product;
import com.domain.Review;
import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.service.OrderService;
import com.service.ProductService;
import com.service.ReviewService;
import com.service.UserService;
import com.utils.BaseAction;
import com.utils.Tools;

public class ReviewAction extends BaseAction<Review>{
	private ReviewService reviewService;
	private UserService userService;
	private ProductService productService;
	private OrderService orderService;
	
	private String username;
	private String productId;
	
	public String publishReview(){
		if(username != null && !"".equals(username)){
			User user = this.userService.getUerByName(username);
			
			if(productId != null && !"".equals(productId)){
				Product product = this.productService.getProductById(Long.valueOf(productId));
				
				Review review = new Review();
				review.setProduct(product);
				review.setUser(user);
				review.setReviewTime(Tools.createDate());
				review.setContent(this.getModel().getContent());
				
				this.reviewService.saveReview(review);
			}
			
			List<Orders> orderList = this.orderService.getOrdersByUser(user.getUserId());
			Review review = this.reviewService.getReviewByUser(user);

			ActionContext.getContext().put("orderList", orderList);
			ActionContext.getContext().put("review", review);
		}
		
		return "orderManage";
	}

	public ReviewService getReviewService() {
		return reviewService;
	}
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
