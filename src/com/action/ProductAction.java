package com.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.domain.Product;
import com.domain.Review;
import com.domain.Shop;
import com.domain.Status;
import com.domain.Type;
import com.opensymphony.xwork2.ActionContext;
import com.service.ProductService;
import com.service.ReviewService;
import com.service.ShopService;
import com.service.StatusService;
import com.service.TypeService;
import com.utils.BaseAction;
import com.utils.Tools;

public class ProductAction extends BaseAction<Product> {
	private ProductService productService;
	private ShopService shopService;
	private TypeService typeService;
	private StatusService statusService;
	private ReviewService reviewService;

	private String productStatus;
	private String childType;
	private String shopId;
	
	private File[] uploadImages;
	private String[] uploadImagesContentType;
	private String[] uploadImagesFileName;
	
	private String message = "";

	public String addProduct() {
		Product product = new Product();
		BeanUtils.copyProperties(this.getModel(), product);
		
		Shop shop = this.shopService.getShopById(Long.valueOf(shopId));
		product.setShop(shop);
		product.setStatus(this.statusService.getStatusById(Long.valueOf(productStatus)));
		if(childType!=null && !"".equals(childType)){
			Type type = this.typeService.getTypeById(Long.valueOf(childType));
			product.setType(type);
		}

		if (uploadImages != null) {
			String path = ServletActionContext.getServletContext().getRealPath(
					"/icons");
			for(int i = 0;i < uploadImages.length;i++){
				File file = new File(path, uploadImagesFileName[i]);
				
				try {
					FileUtils.copyFile(uploadImages[i], file);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				uploadImages[i].delete();
			}

			String imageFileName = Tools.convertString(uploadImagesFileName);
			product.setImages(imageFileName);
		}

		this.productService.saveProduct(product);

		return "addProduct";
	}
	
	public String updateProductUI(){
		String id = ServletActionContext.getRequest().getParameter("productId");
		List<String> imageList = new ArrayList<String>();
		
		if(id!=null||"".equals(id)){
			Product product = this.productService.getProductById( Long.valueOf(id) );
			
			String images = product.getImages();
			
			if(images.contains(",")){
				String[] imageArray = images.split(",");
				for (String image : imageArray) {
					imageList.add(image);
				}
			}
			
			//将所有大类查询出来
			List<Type> typeList = this.typeService.getTypeListByParentId(0L);
			
			BeanUtils.copyProperties(product, this.getModel());
			ActionContext.getContext().put("typeList", typeList);
			ActionContext.getContext().put("imageList", imageList);
		}
		
		return "updateProductUI";
	}
	
	/**
	 * 假删除，将商品状态设置成“删除”状态
	 * @return
	 */
	public String ajaxFalseDelProduct(){
		String id = ServletActionContext.getRequest().getParameter("id");
		
		if(id != null && !"".equals(id) ){
			Product product = this.productService.getProductById(Long.valueOf(id));
			Status status = this.statusService.getStatusById(6L);
			product.setStatus(status);
			
			try {
				this.productService.updateProduct(product);
				this.message = "success";
			} catch (Exception e) {
				this.message = "failed";
			}
		}
		
		return SUCCESS;
	}
	
	public String updateProduct(){
		Product product = this.productService.getProductById(this.getModel().getProductId());
		
		if(productStatus!=null && !"".equals(productStatus)){
			Status status = this.statusService.getStatusById(Long.valueOf(productStatus));
			product.setStatus(status);
		}
		
		if(childType!=null && !"".equals(childType)){
			Type type = this.typeService.getTypeById(Long.valueOf(childType));
			product.setType(type);
		}
		
		if(uploadImages!=null){
			String path = ServletActionContext.getServletContext().getRealPath("/icons");
			
			for (int i = 0; i < uploadImages.length; i++) {
				File file = new File(path, uploadImagesFileName[i]);
				
				try {
					FileUtils.copyFile(uploadImages[i], file);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				uploadImages[i].delete();
			}
			
			String imagesFileName = Tools.convertString(uploadImagesFileName);
			product.setImages(imagesFileName);
		}
		
		product.setAmount(this.getModel().getAmount());
		product.setDescription(this.getModel().getDescription());
		product.setName(this.getModel().getName());
		product.setPrice(this.getModel().getPrice());
		
		this.productService.updateProduct(product);
		
		return "updateProduct";
	}
	
	public String forwardDetail(){
		String id = ServletActionContext.getRequest().getParameter("id");
		
		if(id!=null && !"".equals(id)){
			Product product = this.productService.getProductById(Long.valueOf(id));
			String strImages = product.getImages();
			List<String> imageList = null;
			
			if(strImages!=null && !"".equals(strImages)){
				imageList = Tools.convertStringList(strImages);
			}
			
			ActionContext.getContext().put("product", product);
			ActionContext.getContext().put("imageList", imageList);
			
			//查询出该商品的所有评价
			List<Review> reviewList = this.reviewService.getReviewByProduct(product);
			ActionContext.getContext().put("reviewList", reviewList);
		}
		
		return "productDetail";
	}
	
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public String getChildType() {
		return childType;
	}
	public void setChildType(String childType) {
		this.childType = childType;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public ShopService getShopService() {
		return shopService;
	}
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}
	public TypeService getTypeService() {
		return typeService;
	}
	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}
	public File[] getUploadImages() {
		return uploadImages;
	}
	public void setUploadImages(File[] uploadImages) {
		this.uploadImages = uploadImages;
	}
	public String[] getUploadImagesContentType() {
		return uploadImagesContentType;
	}
	public void setUploadImagesContentType(String[] uploadImagesContentType) {
		this.uploadImagesContentType = uploadImagesContentType;
	}
	public String[] getUploadImagesFileName() {
		return uploadImagesFileName;
	}
	public void setUploadImagesFileName(String[] uploadImagesFileName) {
		this.uploadImagesFileName = uploadImagesFileName;
	}
	public StatusService getStatusService() {
		return statusService;
	}
	public void setStatusService(StatusService statusService) {
		this.statusService = statusService;
	}
	public String getMessage() {
		return message;
	}
	public ReviewService getReviewService() {
		return reviewService;
	}
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
}