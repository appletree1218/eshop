package com.test;

import static org.junit.Assert.*;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import com.dao.ProductDao;
import com.domain.Product;
import com.domain.User;

public class TestProduct {

	@Test
	public void test() {
		SessionFactory sf =  new Configuration().configure("hibernate/hibernate.cfg.xml").buildSessionFactory();
		Session session =  sf.openSession();
		
//		Transaction transaction = session.beginTransaction();
//		transaction.begin();
//		
//		String[] images = {"12","23","34"};
//		Product product = new Product();
//		product.setImages(images);
//		session.save(product);
		
//		transaction.commit();
		
		Product product = (Product) session.get(Product.class, 1L);
		String images = product.getImages();
		
		for(String image : images.split(",")){
			System.out.println(image);
		}
		
		session.close();
		sf.close();
	}

}
