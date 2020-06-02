package com.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.aspectj.apache.bcel.generic.SIPUSH;
import org.springframework.beans.BeanUtils;

import com.domain.Display;
import com.domain.Product;
import com.mchange.v2.beans.BeansUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.DisplayService;
import com.service.ProductService;

public class ShowAction extends ActionSupport{
	private File uploadImage;
	private String uploadImageContentType;
	private String uploadImageFileName;
	
	private String index;
	private String productId;
	
	private String message;
	
	private DisplayService displayService;
	private ProductService productService;
	
	public String loginAdver(){
		return "loginAdver";
	}
	
	public String showAdver(){
		return "showAdver";
	}
	
	/**
	 * 商品展示
	 * @return
	 */
	public String showProduct(){
		if( productId != null && !"".equals(productId) ){
			Product product = this.productService.getProductById(Long.valueOf(productId));
			List<Product> productList = new ArrayList<Product>();
			productList.add(product);
			
			ActionContext.getContext().put("productList", productList);
		}
		
		return "showProduct";
	}
	
	/**
	 * 更换商品展示产品
	 */
	public String ajaxChangeProduct(){
		String num = ServletActionContext.getRequest().getParameter("param");
		String id = ServletActionContext.getRequest().getParameter("id");
		
		if(id != null && !"".equals(id)){
			Product product = this.productService.getProductById(Long.valueOf(id));
			Display display = new Display();
			BeanUtils.copyProperties(product, display);
			
			try {
				if(num!=null && !"".equals(num)){
					display.setLocation(Integer.parseInt(num));
					this.displayService.deleteDisplayByLocation( Integer.valueOf(num) );
					this.displayService.saveDisplay(display);
					this.message = "success";
				}
			} catch (Exception e) {
				this.message = "failed";
			}
		}
			
		return SUCCESS;
	}
	
	/**
	 * 更换登陆广告图片
	 * @return
	 */
	public String changeAdver(){
		if(uploadImage!=null){
			String path = ServletActionContext.getServletContext().getRealPath("/icons");
			File file = new File(path, "adver.png");
			try {
				FileUtils.copyFile(uploadImage, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			uploadImage.delete();
		}
		
		return "loginAdver";
	}
	
	/**
	 * 更换广告展示图片
	 * @return
	 */
	public String changeShowAdver(){
		String fileName = "adver0"+index+".png";
		
		if(uploadImage!=null){
			String path = ServletActionContext.getServletContext().getRealPath("/icons");
			File file = new File(path,fileName);
			
			try {
				FileUtils.copyFile(uploadImage, file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			uploadImage.delete();
		}
		
		return "showAdver";
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
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public DisplayService getDisplayService() {
		return displayService;
	}
	public void setDisplayService(DisplayService displayService) {
		this.displayService = displayService;
	}
}
