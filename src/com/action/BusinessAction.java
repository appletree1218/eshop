package com.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Order;
import org.springframework.beans.BeanUtils;

import com.domain.Business;
import com.domain.Orders;
import com.domain.Page;
import com.domain.Product;
import com.domain.Role;
import com.domain.Shop;
import com.domain.ShopCar;
import com.opensymphony.xwork2.ActionContext;
import com.service.BusinessService;
import com.service.OrderService;
import com.service.RoleService;
import com.service.ShopCarService;
import com.service.ShopService;
import com.service.StatusService;
import com.utils.BaseAction;
import com.utils.Tools;

public class BusinessAction extends BaseAction<Business> {
	private BusinessService businessService;
	private RoleService roleService;
	private ShopService shopService;
	private StatusService statusService;
	private OrderService orderService;
	private ShopCarService shopCarService;
	
	private File uploadImage;
	private String uploadImageContentType;
	private String uploadImageFileName;
	
	private Long roleId;
	private Long statusId;
	private Long shopId;
	private String name;
	private String key;
	
	private String address;
	
	private String message = "";

	public String getBusinessList() {
		String pageNum = ServletActionContext.getRequest().getParameter("pageNum");
		Page page = this.businessService.getPageBusinesss(pageNum);
		ActionContext.getContext().put("page", page);

		return LIST;
	}
	
	public String getBusinessByFuzzy(){
		if( !"".equals(ServletActionContext.getRequest().getParameter("key")) ){
			key = ServletActionContext.getRequest().getParameter("key");
		}
		
		String pageNum = ServletActionContext.getRequest().getParameter("pageNum");
		Page page = this.businessService.getPageBusinesssByFuzzy(pageNum, key);
		
		ActionContext.getContext().put("page", page);
		ActionContext.getContext().put("key", key);
		
		return "fuzzyList";
	}
	
	public String getBusinessById(){
		Business business = null;
		
		try {
			business = this.businessService.getBusinessById(Long.valueOf(key));
		} catch (NumberFormatException e) {
			ActionContext.getContext().put("msg", "请输入数字！");
		}
		
		List<Business> list = new ArrayList<Business>();
		list.add(business);
		
		ActionContext.getContext().put("list", list);
		
		return "queryList";
	}
	
	public String registerBusiness(){
		Business business = new Business();
		BeanUtils.copyProperties(this.getModel(), business);
		
		Role role = this.roleService.getRoleById(roleId);
		business.setRole(role);
		
		this.businessService.saveBusiness(business);
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("username", business.getName());
		session.setAttribute("role", "商家");
		session.setMaxInactiveInterval(60*60*24);
		
		return SUCCESS;
	}

	public String addUI() {
		ActionContext.getContext().getValueStack().getRoot().clear();
		
		//查询出所有的角色
		List<Role> roleList = this.roleService.getRoleList();
		ActionContext.getContext().put("roleList", roleList);
		
		return ADD;
	}

	public String addBusiness() {
		//保存数据
		Business business = new Business();
		BeanUtils.copyProperties(this.getModel(), business);
		
		Role role = this.roleService.getRoleById(roleId);
		business.setRole(role);
		
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
			business.setIcon(uploadImageFileName);
		}else{
			business.setIcon("Koala.jpg");
		}

		this.businessService.saveBusiness(business);
		
		return ACTION2ACTION;
	}
	
	public String deleteBusiness(){
		Map<String, String[]> map = ServletActionContext.getRequest().getParameterMap();
		Set<String> sets = map.keySet();
		
		for (String s : sets) {
			this.businessService.deleteBusinessById( Long.valueOf((map.get(s)[0])) );
		}
		
		return ACTION2ACTION;
	}
	
	public String updateUI(){
		String businessId = ServletActionContext.getRequest().getParameter("businessId");
		Business business = this.businessService.getBusinessById(Long.parseLong(businessId));
		BeanUtils.copyProperties(business, this.getModel());
		
		//查询出所有的角色
		List<Role> roleList = this.roleService.getRoleList();
		ActionContext.getContext().put("roleList", roleList);
		
		//查询出所有的店铺
		List<Shop> shopList = this.shopService.getShopList();
		ActionContext.getContext().put("shopList", shopList);
		
		if( business.getRole()!=null ){
			this.setRoleId(business.getRole().getRoleId());
		}
		
		if( business.getShop()!=null ){
			this.setShopId(business.getShop().getShopId());
		}
		
		return UPDATE;
	}
	
	public String updateBusiness(){
		Business business = new Business();
		BeanUtils.copyProperties(this.getModel(), business);
		
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
			business.setIcon(uploadImageFileName);
		}
		
		Role role = this.roleService.getRoleById(roleId);
		business.setRole(role);
		
		Shop shop = this.shopService.getShopById(shopId);
		business.setShop(shop);
		
		this.businessService.updateBusiness(business);
		
		return ACTION2ACTION;
	}
	
	public String forwardProduct(){
		String username = (String) ServletActionContext.getRequest().getSession().getAttribute("username");
		String currentNum = ServletActionContext.getRequest().getParameter("currentNum");
		int i_currentNum = 0;
		
		if(currentNum != null){
			i_currentNum = Integer.valueOf(currentNum);
		}
		
		Business business = this.businessService.getBusinessByName(username);
		
		BeanUtils.copyProperties(business, this.getModel());
		
		
		//查询出所有的角色
		List<Role> roleList = this.roleService.getRoleList();
		ActionContext.getContext().put("roleList", roleList);
		
		if(business.getShop()!=null && business.getShop().getStatus().getStatusId()!=2){
			Set<Product> productList = business.getShop().getProducts();
			
			if(productList.size() > 0){
				List<Product> list = new ArrayList<Product>(productList);
				
				List<Product> pageList = Tools.convertPageList(list, i_currentNum, 5);
				
				Page page = new Page(i_currentNum, list.size());
				page.setTotalPage(list.size() % 5 == 0 ? list.size() / 5 : list.size() / 5 + 1);
				
				ActionContext.getContext().put("pageList", pageList);
				ActionContext.getContext().put("page", page);
			}
		}
		
		return "forwardProduct";
	}
	
	public String forwardShop(){
		String username = (String) ServletActionContext.getRequest().getSession().getAttribute("username");
		
		Business business = this.businessService.getBusinessByName(username);
		
		BeanUtils.copyProperties(business, this.getModel());
		
		//查询出所有的角色
		List<Role> roleList = this.roleService.getRoleList();
		ActionContext.getContext().put("roleList", roleList);
		
		//查询出所有的店铺
		Shop shop = null;
		if(business.getShop()!=null){
			shop = this.shopService.getShopById( business.getShop().getShopId() );
		}
		ActionContext.getContext().put("shop", shop);
		
		//前台根据flag进行判断显示
		String flag = ServletActionContext.getRequest().getParameter("flag");
		
		//店员查询
		List<Business> businessList;
		if("2".equals(flag)){
			//店铺人员管理
			businessList = this.businessService.getBusinessByShopIdButMyself(shop.getShopId(), business.getBusinessId());
			ActionContext.getContext().put("shopEmployee", businessList);
		}else if("3".equals(flag)){
			//订单管理
			List<Orders> orderList = this.orderService.getOrdersByUser(business.getBusinessId());
			
			ActionContext.getContext().put("orderList", orderList);
		}
		
		ActionContext.getContext().put("flag", flag);
		
		return "forwardShop";
	}
	
	public String forwardDetail(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String number = request.getParameter("number");
		
		if(number != null && !"".equals(number)){
			Orders orders = this.orderService.getOrdersByNumber(number);
			
			ActionContext.getContext().put("orders", orders);
		}
		
		return "orderDetail";
	}
	
	/**
	 * 商家店铺人员管理时删除店员
	 */
	public String deleteShopEmployee(){
		String strId = ServletActionContext.getRequest().getParameter("id");
		
		Business business = this.businessService.getBusinessById(Long.valueOf(strId));
		business.setShop(null);
		
		try {
			this.businessService.updateBusiness(business);
			this.message = "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			this.message = "failed";
		}
		
		return SUCCESS;
	}
	
	/**
	 * 前台店铺信息更改
	 * @return
	 */
	public String foreUpdateShop(){
		Shop shop = this.shopService.getShopById(shopId);
		
		if(uploadImage!=null){
			String path = ServletActionContext.getServletContext().getRealPath("/icons");
			File file = new File(path, uploadImageFileName);
			
			try {
				FileUtils.copyFile(uploadImage, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			uploadImage.delete();
			shop.setLogo(uploadImageFileName);
		}
		
		shop.setAddress(address);
		shop.setDescription(this.getModel().getDescription());
		
		this.shopService.updateShop(shop);
		
		String businessName = (String) ActionContext.getContext().getSession().get("username");
		Business business = this.businessService.getBusinessByName(businessName);
		BeanUtils.copyProperties(business, this.getModel());
		
		ActionContext.getContext().put("shop", this.businessService.getBusinessByName(businessName).getShop());
		ServletActionContext.getRequest().setAttribute("shop", this.businessService.getBusinessByName(businessName).getShop());
		
		return "foreUpdate";
	}
	
	public String businessCenter(){
		String username = (String) ServletActionContext.getRequest().getSession().getAttribute("username");
		Business business = this.businessService.getBusinessByName(username);
		BeanUtils.copyProperties(business, this.getModel());
		
		//查询出所有的角色
		List<Role> roleList = this.roleService.getRoleList();
		ActionContext.getContext().put("roleList", roleList);
		
		return "businessCenter";
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	public String ajaxUpatePwd(){
		String confirmPwd = ServletActionContext.getRequest().getParameter("confirmPwd");
		String username = ServletActionContext.getRequest().getParameter("username");
		
		if(username!=null && !"".equals(username)){
			Business business = this.businessService.getBusinessByName(username);
			
			if(confirmPwd!=null && !"".equals(confirmPwd)){
				business.setPassword(confirmPwd);
			}
			
			try {
				this.businessService.updateBusiness(business);
				this.message = "success";
			} catch (Exception e) {
				this.message = "failed";
			}
		}
		
		return SUCCESS;
	}
	
	public String updatePwd(){
		String username = (String) ServletActionContext.getRequest().getSession().getAttribute("username");
		Business business = this.businessService.getBusinessByName(username);
		BeanUtils.copyProperties(business, this.getModel());
		
		return "updatePwd";
	}
	
	public String checkIsExit(){
		Business business = this.businessService.getBusinessByName(Tools.decodeUtil(this.getModel().getName()));

		if(business!=null){
			this.message = "该商家名已存在！";
		}else{
			this.message="";
		}
		
		return SUCCESS;
	}
	
	public String fuzzyQuery(){
		return "fuzzyQuery";
	}
	
	public String query(){
		return "query";
	}
	
	public String roleQuery(){
		return "roleQuery";
	}
	
	public BusinessService getBusinessService() {
		return businessService;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public String getMessage() {
		return message;
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
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
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
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Long getShopId() {
		return shopId;
	}
	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}
	public ShopService getShopService() {
		return shopService;
	}
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}
	public StatusService getStatusService() {
		return statusService;
	}
	public void setStatusService(StatusService statusService) {
		this.statusService = statusService;
	}
	public Long getStatusId() {
		return statusId;
	}
	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public ShopCarService getShopCarService() {
		return shopCarService;
	}
	public void setShopCarService(ShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}
}
