package com.service;

import java.util.List;
import java.util.Set;

import com.dao.ProductDao;
import com.domain.Product;

public class ProductService {
	private ProductDao productDao;
	
	public void saveProduct(Product product){
		this.productDao.saveEntity(product);
	}
	
	public void updateProduct(Product product){
		this.productDao.updateEntity(product);
	}
	
	public Product getProductById(Long id){
		return this.productDao.getEntityById(id);
	}
	
	//根据类型进行查询
	public List<Product> getAllProdductByTypeId(Long typeId){
		return this.productDao.getAllProdductByTypeId(typeId);
	}
	
	/**
	 * 模糊查询
	 * @param name
	 * @return
	 */
	public List<Product> getAllProductByKey(String key){
		return this.productDao.getAllProductByKey(key);
	}
	
	public void updateProductList(Set<Product> products) {
		for(Product product : products){
			this.productDao.updateEntity(product);
		}
	}
	
	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
}
