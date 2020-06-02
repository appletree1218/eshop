package com.service;

import java.util.List;

import com.dao.ReviewDao;
import com.domain.Product;
import com.domain.Review;
import com.domain.User;

public class ReviewService {
	private ReviewDao reviewDao;
	
	public Review getReviewByUser(User user){
		List<Review> list = this.reviewDao.getReviewByUser(user);
		
		return list.size() > 0 ? list.get(0) : null;
	}
	
	public List<Review> getReviewByProduct(Product product) {
		return this.reviewDao.getReviewByProduct(product);
	}
	
	public void saveReview(Review review){
		this.reviewDao.saveEntity(review);
	}

	public ReviewDao getReviewDao() {
		return reviewDao;
	}
	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}
}
