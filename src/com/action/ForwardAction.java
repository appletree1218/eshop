package com.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.domain.Business;
import com.domain.Display;
import com.domain.Orders;
import com.domain.Page;
import com.domain.Product;
import com.domain.ReceiveInfo;
import com.domain.Role;
import com.domain.Shop;
import com.domain.ShopCar;
import com.domain.Type;
import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BusinessService;
import com.service.DisplayService;
import com.service.OrderService;
import com.service.ProductService;
import com.service.ReceiveInfoService;
import com.service.RoleService;
import com.service.ShopCarService;
import com.service.TypeService;
import com.service.UserService;
import com.utils.Tools;

public class ForwardAction extends ActionSupport{
	private RoleService roleService;
	private ShopCarService shopCarService;
	private TypeService typeService;
	private BusinessService businessService;
	private ProductService productService;
	private DisplayService displayService;
	private UserService userService;
	private OrderService orderService;
	private ReceiveInfoService receiveInfoService;
	
	private List<Type> childList;
	
	private String id = "";
	private String name = ""; 
	
	public String index(){
		return "index";
	}
	
	public String left(){
		return "left";
	}
	
	public String right(){
		return "right";
	}
	
	public String top(){
		return "top";
	}
	
	public String bottom(){
		return "bottom";
	}
	
	public String login(){
		return "login";
	}
	
	public String register(){
		List<Role> roleList = this.roleService.getRoleList();
		
		ActionContext.getContext().put("roleList", roleList);
		
		return "register";
	}
	
	public String registerShop(){
		return "registerShop";
	}
	
	public String main(){
		ServletActionContext.getRequest().getSession().removeAttribute("username");
		
		return "main";
	}
	
	public String back(){
		return "back";
	}
	
	public String updatePassword(){
		return "update";
	}
	
	public String forwardIndex(){
		//目录
		List<Type> typeList = this.typeService.getTypeList();
		ActionContext.getContext().put("typeList", typeList);
		//首页商品
		List<Display> displayList = this.displayService.getAllDisplay();
		for(Display d : displayList){
			if(d.getImages()!=null && !"".equals(d.getImages())){
				d.setImages( d.getImages().split(",")[0] );
			}
		}
		ActionContext.getContext().put("displayList", displayList);
		
		return "index";
	}
	
	public String forwardCatalog(){
		List<Type> typeList = this.typeService.getTypeList();
		ActionContext.getContext().put("typeList", typeList);
		String currentNum = ServletActionContext.getRequest().getParameter("currentNum");
		
		//查询出某一类型的商品来
		String typeId = ServletActionContext.getRequest().getParameter("typeId");
		
		if(typeId!=null && !"".equals(typeId)){
			List<Product> typeProductList = this.productService.getAllProdductByTypeId( Long.valueOf(typeId) );
			
			for(Product d : typeProductList){
				if(d.getImages()!=null && !"".equals(d.getImages())){
					d.setImages( d.getImages().split(",")[0] );
				}
			}
			
			List<Product> pageList = Tools.convertPageList(typeProductList, Integer.valueOf(currentNum), 9);
			Page page = new Page(Integer.valueOf(currentNum), typeProductList.size());
			page.setTotalPage(typeProductList.size() % 9 == 0 ? typeProductList.size() / 9 : typeProductList.size() / 9 + 1);
			
			ActionContext.getContext().put("typeId", typeId);
			ActionContext.getContext().put("page", page);
			ActionContext.getContext().put("typeProductList", pageList);
		}
		
		return "catalogIndex";
	}
	
	public String quit(){
		ServletActionContext.getRequest().getSession().removeAttribute("name");
		
		return "quit";
	}
	
	public String shopCar(){
		//查询出该用户的购物车中是否有商品
		String userId = ServletActionContext.getRequest().getParameter("userId");
		boolean isExist = shopCarService.isExistUser( Long.valueOf(userId) );
		//查询购物车里的商品
		List<ShopCar> shopCarList = this.shopCarService.getShopCarByUserId( Long.valueOf(userId) );
		List<Product> productList = new ArrayList<Product>();
		for (ShopCar car : shopCarList) {
			Product product = this.productService.getProductById( car.getProduct().getProductId() );
			
			if(product.getImages().contains(",")){
				product.setImages(product.getImages().substring(0, product.getImages().indexOf(",")));
			}
			
			productList.add(product);
		}
		
		Collections.sort(productList);
		Collections.sort(shopCarList);
		
		ActionContext.getContext().put("productList", productList);
		ActionContext.getContext().put("shopCarList", shopCarList);
		ActionContext.getContext().put("isExist", isExist);
		
		return "shopCar";
	}
	
	public String pay(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String scId = request.getParameter("scId");
		
		List<ShopCar> shopcarList = new ArrayList<ShopCar>();
		List<Product> productList = new ArrayList<Product>();

		try {
			username = URLDecoder.decode(username, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(username!=null && !"".equals(username)){
			User user = this.userService.getUerByName(username);
			
			Long amount = 0L;
			double totalPrice = 0D;

			if(scId != null && scId.contains(",")){
				String[] scIds = scId.split(",");
				
				for (String id : scIds) {
					ShopCar shopCar = this.shopCarService.getShopCarById(Long.valueOf(id));
					shopcarList.add(shopCar);
				}
			}else if(scId != null && !"".equals(scId)){
				ShopCar shopCar = this.shopCarService.getShopCarById(Long.valueOf(scId));
				shopcarList.add(shopCar);
			}
			
			for (ShopCar shopCar : shopcarList) {
				productList.add(shopCar.getProduct());
				
				amount += shopCar.getAmount();
				totalPrice += shopCar.getProduct().getPrice() * shopCar.getAmount();
			}
			
			//查看是否有收货信息
			List<ReceiveInfo> infoList = this.receiveInfoService.getReceiveInfoByUserId(user.getUserId());
			Collections.sort(infoList);
			Collections.sort(productList);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("amount", amount);
			map.put("totalPrice", totalPrice);
			
			ActionContext.getContext().put("infoList", infoList);
			ActionContext.getContext().put("map", map);
			ActionContext.getContext().put("productList", productList);
			ActionContext.getContext().put("shopcarList", shopcarList);
		}
		
		return "pay";
	}
	
	public String search(){
		return "search";
	}
	
	public String queryAndAdd(){
		List<Business> businessList = new ArrayList<Business>();
		Business business = new Business();
		
		if("".equals(id) && !"".equals(name)){
			business = this.businessService.getBusinessByName(name);
			
			if(business != null){
				businessList.add(business);
			}
		}else if(!"".equals(id) && "".equals(name)){
			business = this.businessService.getBusinessById(Long.valueOf(id));
			if(business != null){
				businessList.add(business);
			}
		}else if(!"".equals(id) && !"".equals(name)){
			businessList = this.businessService.getBusinessByNameAndId(name, Long.valueOf(id));
		}
		
		ActionContext.getContext().put("businessList", businessList);
		
		return "queryAndAdd";
	}
	
	public String addProduct(){
		//将所有大类查询出来
		List<Type> typeList = this.typeService.getTypeListByParentId(0L);
		
		ActionContext.getContext().put("typeList", typeList);
		
		return "addProduct";
	}
	
	public String ajaxAddSelectType(){
		String parentId = ServletActionContext.getRequest().getParameter("parentId");
		
		if(parentId!=null && !"".equals(parentId)){
			this.childList = this.typeService.getTypeListByParentId(Long.valueOf(parentId));
		}
		
		return SUCCESS;
	}
	
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	public ShopCarService getShopCarService() {
		return shopCarService;
	}
	public void setShopCarService(ShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}
	public TypeService getTypeService() {
		return typeService;
	}
	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BusinessService getBusinessService() {
		return businessService;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public List<Type> getChildList() {
		return childList;
	}
	public void setChildList(List<Type> childList) {
		this.childList = childList;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public DisplayService getDisplayService() {
		return displayService;
	}
	public void setDisplayService(DisplayService displayService) {
		this.displayService = displayService;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public ReceiveInfoService getReceiveInfoService() {
		return receiveInfoService;
	}
	public void setReceiveInfoService(ReceiveInfoService receiveInfoService) {
		this.receiveInfoService = receiveInfoService;
	}
}
