package com.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.domain.Orders;
import com.domain.Page;
import com.domain.ReceiveInfo;
import com.domain.Review;
import com.domain.ShopCar;
import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.service.OrderService;
import com.service.ReviewService;
import com.service.ShopCarService;
import com.service.UserService;
import com.utils.BaseAction;
import com.utils.Tools;

public class UserAction extends BaseAction<User> {
	private UserService userService;
	private ShopCarService shopCarService;
	private OrderService orderService;
	private ReviewService reviewService;
	
	private File uploadImage;
	private String uploadImageContentType;
	private String uploadImageFileName;
	
	private String message;
	private String key;
	
	public String getUserList() {
		String pageNum = ServletActionContext.getRequest().getParameter("pageNum");
		Page page = this.userService.getPageUsers(pageNum);
		ActionContext.getContext().put("page", page);

		return LIST;
	}
	
	public String getUserByFuzzy(){
		if( !"".equals(ServletActionContext.getRequest().getParameter("key")) ){
			key = ServletActionContext.getRequest().getParameter("key");
		}
		
		String pageNum = ServletActionContext.getRequest().getParameter("pageNum");
		Page page = this.userService.getPageUsersByFuzzy(pageNum, key);
		
		ActionContext.getContext().put("page", page);
		ActionContext.getContext().put("key", key);
		
		return "fuzzyList";
	}
	
	public String getUserById(){
		User user = null;
		
		try {
			user = this.userService.getUserById(Long.valueOf(key));
		} catch (NumberFormatException e) {
			ActionContext.getContext().put("msg", "请输入数字！");
		}
		
		List<User> list = new ArrayList<User>();
		list.add(user);
		
		ActionContext.getContext().put("list", list);
		
		return "queryList";
	}
	
	public String addUI() {
		ActionContext.getContext().getValueStack().getRoot().clear();
		
		return ADD;
	}
	
	public String registerUser(){
		User user = new User();
		BeanUtils.copyProperties(this.getModel(), user);
		
		user.setIcon(uploadImageFileName);
		ShopCar shopCar = new ShopCar();
		shopCar.setUser(user);
		
		this.userService.saveUser(user);
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("username", user.getName());
		session.setAttribute("role", "买家");
		session.setAttribute("userId", user.getUserId());
		session.setMaxInactiveInterval(60*60*24);
		
		return SUCCESS;
	}

	public String addUser() {
		//保存数据
		User user = new User();
		BeanUtils.copyProperties(this.getModel(), user);
		
		//图片上传
		if(uploadImage!=null){
			String path = ServletActionContext.getServletContext().getRealPath("/icons");
			File file = new File(path, uploadImageFileName);
			
			try {
				FileUtils.copyFile(uploadImage, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			uploadImage.delete();
			user.setIcon(uploadImageFileName);
		}else{
			user.setIcon("Koala.jpg");
		}
		
		this.userService.saveUser(user);
		
		return ACTION2ACTION;
	}
	
	public String deleteUser(){
		Map<String, String[]> map = ServletActionContext.getRequest().getParameterMap();
		Set<String> sets = map.keySet();
		
		for (String s : sets) {
			this.userService.deleteUserById( Long.valueOf((map.get(s)[0])) );
		}
		
		return ACTION2ACTION;
	}
	
	public String updateUI(){
		String userId = ServletActionContext.getRequest().getParameter("userId");
		User user = this.userService.getUserById(Long.parseLong(userId));
		BeanUtils.copyProperties(user, this.getModel());
		
		return UPDATE;
	}
	
	public String updateUser(){
		User user = new User();
		BeanUtils.copyProperties(this.getModel(), user);
	
		//图片上传
		if(uploadImage!=null){
			String path = ServletActionContext.getServletContext().getRealPath("/icons");
			File file = new File(path, uploadImageFileName);
			
			try {
				FileUtils.copyFile(uploadImage, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			uploadImage.delete();
			user.setIcon(uploadImageFileName);
		}
		
		this.userService.updateUser(user);
		
		return ACTION2ACTION;
	}
	
	public String checkIsExit(){
		this.message="";
		
		User user = this.userService.getUerByName( Tools.decodeUtil(this.getModel().getName()) );

		if(user!=null){
			this.message = "该用户名已存在！";
		}else{
			this.message="";
		}
		
		return SUCCESS;
	}
	
	public String userCenter(){
		String username = (String) ServletActionContext.getRequest().getSession().getAttribute("username");
		User user = this.userService.getUerByName(username);
		BeanUtils.copyProperties(user, this.getModel());
		
		return "userCenter";
	}
	
	/**
	 * 跳转到修改密码页面
	 * @return
	 */
	public String updatePwd(){
		String username = (String) ServletActionContext.getRequest().getSession().getAttribute("username");
		User user = this.userService.getUerByName(username);
		BeanUtils.copyProperties(user, this.getModel());
		
		return "updatePwd";
	}
	
	/**
	 * 跳转到订单管理
	 */
	public String orderManageUI(){
		String username = (String) ServletActionContext.getRequest().getSession().getAttribute("username");
		User user = this.userService.getUerByName(username);
		BeanUtils.copyProperties(user, this.getModel());
		
		//查询出该用户下的所有订单
		List<Orders> orderList = this.orderService.getOrdersByUser(user.getUserId());
		Review review = this.reviewService.getReviewByUser(user);

		ActionContext.getContext().put("orderList", orderList);
		ActionContext.getContext().put("review", review);
		
		return "orderManage";
	}
	
	/**
	 * 跳转到订单信息页面
	 * @return
	 */
	public String orderDetailUI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String orderId = request.getParameter("orderId");
		
		if(orderId!=null && !"".equals(orderId)){
			Orders orders = this.orderService.getOrdersById(Long.valueOf(orderId));
			ReceiveInfo receiveInfo = orders.getReceiveInfo();
			Set<ShopCar> shopCarSets = orders.getShopcars();
			
			ActionContext.getContext().put("receiveInfo", receiveInfo);
			ActionContext.getContext().put("orders", orders);
			ActionContext.getContext().put("shopCarSets", shopCarSets);
		}
		
		return "orderDetail";
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	public String ajaxUpatePwd(){
		String confirmPwd = ServletActionContext.getRequest().getParameter("confirmPwd");
		String username = ServletActionContext.getRequest().getParameter("username");
		
		if(username!=null && !"".equals(username)){
			User user = this.userService.getUerByName(username);
			
			if(confirmPwd!=null && !"".equals(confirmPwd)){
				user.setPassword(confirmPwd);
			}
			
			try {
				this.userService.updateUser(user);
				this.message = "success";
			} catch (Exception e) {
				this.message = "failed";
			}
		}
		
		return SUCCESS;
	}
	
	public String forwardReview(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String number = request.getParameter("number");
		String productId = request.getParameter("productId");
		
		if(number != null && !"".equals(number)){
			Orders orders = this.orderService.getOrdersByNumber(number);
			
			for (ShopCar shopCar : orders.getShopcars()) {
				if( shopCar.getProduct().getProductId().equals( Long.valueOf(productId) ) ){
					ActionContext.getContext().put("product", shopCar.getProduct());
				}
			}
		}
		
		return "review";
	}
	
	public String fuzzyQuery(){
		return "fuzzyQuery";
	}
	
	public String query(){
		return "query";
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
	public ShopCarService getShopCarService() {
		return shopCarService;
	}
	public void setShopCarService(ShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}
	public File getUploadImage() {
		return uploadImage;
	}
	public void setUploadImage(File uploadImage) {
		this.uploadImage = uploadImage;
	}
	public String getUploadImageContentType() {
		return uploadImageContentType;
	}
	public void setUploadImageContentType(String uploadImageContentType) {
		this.uploadImageContentType = uploadImageContentType;
	}
	public String getUploadImageFileName() {
		return uploadImageFileName;
	}
	public void setUploadImageFileName(String uploadImageFileName) {
		this.uploadImageFileName = uploadImageFileName;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public ReviewService getReviewService() {
		return reviewService;
	}
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
}
