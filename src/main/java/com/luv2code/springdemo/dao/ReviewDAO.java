package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.ProductReview;

public interface ReviewDAO {

	void saveNewReview(ProductReview newReview);

	List<ProductReview> getallreviewbyid(int theId);

}
