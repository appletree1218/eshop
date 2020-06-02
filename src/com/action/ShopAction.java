package com.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.domain.Business;
import com.domain.Page;
import com.domain.Shop;
import com.domain.Status;
import com.opensymphony.xwork2.ActionContext;
import com.service.BusinessService;
import com.service.ShopService;
import com.service.StatusService;
import com.utils.BaseAction;
import com.utils.Tools;

public class ShopAction extends BaseAction<Shop>{
	private ShopService shopService;
	private StatusService statusService;
	private BusinessService businessService;
	
	private File uploadImage;
	private String uploadImageContentType;
	private String uploadImageFileName;
	
	private Long statusId;
	private String key;
	private String message;
	
	public String getShopList(){
		String pageNum = ServletActionContext.getRequest().getParameter("pageNum");
		Page page = this.shopService.getPageShops(pageNum);
		ActionContext.getContext().put("page", page);
		
		List<Status> statusList = this.statusService.getStatusList();
		ActionContext.getContext().put("statusList", statusList);
		
		return LIST;
	}
	
	public String getShopByFuzzy(){
		if( !"".equals(ServletActionContext.getRequest().getParameter("key")) ){
			key = ServletActionContext.getRequest().getParameter("key");
		}
		
		String pageNum = ServletActionContext.getRequest().getParameter("pageNum");
		Page page = this.shopService.getPageShopsByFuzzy(pageNum, key);
		
		ActionContext.getContext().put("page", page);
		ActionContext.getContext().put("key", key);
		
		return "fuzzyList";
	}
	
	public String getShopById(){
		Shop shop = null;
		
		try {
			shop = this.shopService.getShopById(Long.valueOf(key));
		} catch (NumberFormatException e) {
			ActionContext.getContext().put("msg", "请输入数字！");
		}
		
		List<Shop> list = new ArrayList<Shop>();
		list.add(shop);
		
		ActionContext.getContext().put("list", list);
		
		return "queryList";
	}
	
	public String addUI(){
		ActionContext.getContext().getValueStack().getRoot().clear();
		
		//查询出所有的状态
		List<Status> statusList = this.statusService.getStatusBySign(0L);
		ActionContext.getContext().put("statusList", statusList);
		
		return ADD;
	}
	
	public String addShop(){
		Shop shop = new Shop();
		BeanUtils.copyProperties(this.getModel(), shop);
		
		Status status = this.statusService.getStatusById(statusId);
		
		if(status!=null){
			shop.setStatus(status);
		}
		
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
			shop.setLogo(uploadImageFileName);
		}else{
			shop.setLogo("logo.jpg");
		}

		this.shopService.saveShop(shop);
		
		return ACTION2ACTION;
	}
	
	public String updateUI(){
		String shopId = ServletActionContext.getRequest().getParameter("shopId");
		Shop shop = this.shopService.getShopById(Long.parseLong(shopId));
		BeanUtils.copyProperties(shop, this.getModel());
		
		//查询出所有的状态
		List<Status> statusList = this.statusService.getStatusList();
		this.setStatusId(shop.getStatus().getStatusId());;
		ActionContext.getContext().put("statusList", statusList);
		
		return UPDATE;
	}
	
	public String updateShop(){
		Shop shop = new Shop();
		BeanUtils.copyProperties(this.getModel(), shop);
		
		Status status = this.statusService.getStatusById(statusId);
		shop.setStatus(status);
		
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
		
		this.shopService.updateShop(shop);
		
		return ACTION2ACTION;
	}
	
	public String updateShopStatus(){
		String shopId = ServletActionContext.getRequest().getParameter("shopId");
		String satusId = ServletActionContext.getRequest().getParameter("statusId");
		Shop shop = this.shopService.getShopById(Long.valueOf(shopId));
		Status status = this.statusService.getStatusById(Long.valueOf(satusId));
		
		shop.setStatus(status);
		
		this.shopService.updateShop(shop);
		this.message = "success";
		
		return SUCCESS;
	}
	
	/**
	 * 店铺注册
	 * @return
	 */
	public String registerShop(){
		Shop shop = new Shop();
		BeanUtils.copyProperties(this.getModel(), shop);
		
		//获取当前登陆人
		Map<String, Object> session = ActionContext.getContext().getSession();
		String name = (String) session.get("username");
		//设置对应商家
		Business business = businessService.getBusinessByName(name);
		shop.getBusinesses().add(business);
		//新注册店铺默认状态默认为待审核
		Status status = this.statusService.getStatusById(2L);
		status.getShops().add(shop);
		shop.setStatus(status);
		//处理注册时间（自动填写）
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String formateDate = format.format(date);
		shop.setRegTime(formateDate);
		
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
			shop.setLogo(uploadImageFileName);
		}else{
			shop.setLogo("logo.jpg");
		}

		business.setShop(shop);
		this.shopService.saveShop(shop);
		
		return SUCCESS;
	}
	
	public String deleteShop(){
		Map<String, String[]> map = ServletActionContext.getRequest().getParameterMap();
		Set<String> sets = map.keySet();
		
		for (String s : sets) {
			this.shopService.deleteShopById( Long.valueOf((map.get(s)[0])) );
		}
		
		return ACTION2ACTION;
	}
	
	/**
	 * 店铺添加店员
	 * @return
	 */
	public String shopAddEmployee(){
		String shopId = ServletActionContext.getRequest().getParameter("shopId");
		String businessId = ServletActionContext.getRequest().getParameter("businessId");
		
		Shop shop = this.shopService.getShopById(Long.valueOf(shopId));
		Business business = this.businessService.getBusinessById(Long.valueOf(businessId));
		business.setShop(shop);
		
		try {
			this.businessService.updateBusiness(business);
			this.message = "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			this.message = "failed";
		}
		
		return SUCCESS;
	}
	
	public String checkIsExit(){
		this.message="";
		
		Shop shop = this.shopService.getShopByName( Tools.decodeUtil(this.getModel().getName()) );

		if(shop!=null){
			this.message = "该店铺名已存在！";
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
	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}
	public Long getStatusId() {
		return statusId;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getMessage() {
		return message;
	}
	public BusinessService getBusinessService() {
		return businessService;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}

	@Override
	public void addFieldError(String fieldName, String errorMessage) {
		// TODO Auto-generated method stub
		super.addFieldError(fieldName, errorMessage);
		System.out.println("fildName:"+fieldName+",errorMessage:"+errorMessage);
	}
}
