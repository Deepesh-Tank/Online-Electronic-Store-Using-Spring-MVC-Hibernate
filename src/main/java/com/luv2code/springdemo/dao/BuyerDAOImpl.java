package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springdemo.entity.Buyer;
import com.luv2code.springdemo.entity.MessageBuyer;


@Repository
public class BuyerDAOImpl implements buyerDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Buyer> getBuyers() {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query< Buyer> theQuery = currentSession.createQuery("from  Buyer", Buyer.class);
		List<Buyer> all = theQuery.getResultList();
		return all;
	}

	@Override
	public Buyer getBuyer(String UserName) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		
		Buyer theBuyer = new Buyer();
		theBuyer = currentSession.get(Buyer.class, UserName);
		return theBuyer;
	}

	@Override
	public void saveBuyer(Buyer theBuyer) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theBuyer);
	}

}
