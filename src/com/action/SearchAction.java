package com.action;

import java.util.ArrayList;
import java.util.List;

import com.domain.Display;
import com.domain.Product;
import com.domain.Shop;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ProductService;
import com.service.ShopService;

public class SearchAction extends ActionSupport{
	private ProductService productService;
	private ShopService shopService;
	
	private String key;
	private String type;
	
	public String getList(){
		String index = "search";
		List list = new ArrayList();
		
		if("".equals(key)){
			index = "index";
		}else{
			if("商品".equals(type)){
				list = this.productService.getAllProductByKey(key);
				
				for (int i = 0; i < list.size(); i++) {
					if(((Product) list.get(i)).getImages()!=null && !"".equals(((Product) list.get(i)).getImages())){
						((Product) list.get(i)).setImages( ((Product) list.get(i)).getImages().split(",")[0] );
					}
				}
					
			}else if( "店铺".equals(type) ){
				list = this.shopService.getAllShopByKey(key);
			}
		}
		
		ActionContext.getContext().put("list", list);
		ActionContext.getContext().put("type", type);
		ActionContext.getContext().put("key", key);
		
		return index;
	}

	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public ShopService getShopService() {
		return shopService;
	}
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}
}
