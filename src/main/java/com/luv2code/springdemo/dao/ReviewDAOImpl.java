package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.ProductReview;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public void saveNewReview(ProductReview newReview) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(newReview);
	}

	@Override
	@Transactional
	public List<ProductReview> getallreviewbyid(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<ProductReview> theQuery = currentSession.createQuery("from ProductReview where proId=:x",ProductReview.class);
		theQuery.setParameter("x", theId);
		List<ProductReview> r = theQuery.getResultList();
		return r;
	}
	
}
