package com.dao;

import java.util.List;

import com.domain.Product;
import com.domain.Review;
import com.domain.User;
import com.utils.BaseDao;

public class ReviewDao extends BaseDao<Review>{
	public List<Review> getReviewByUser(User user){
		return this.hibernateTemplate.find("from Review where userId=?", user.getUserId());
	}

	public List<Review> getReviewByProduct(Product product) {
		return this.hibernateTemplate.find("from Review where productId=?", product.getProductId());
	}
}
