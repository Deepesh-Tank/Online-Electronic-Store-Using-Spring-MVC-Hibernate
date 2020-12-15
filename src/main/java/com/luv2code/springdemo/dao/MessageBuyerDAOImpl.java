package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.MessageBuyer;
import com.luv2code.springdemo.entity.Product;

@Repository
public class MessageBuyerDAOImpl implements MessageBuyerDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void saveit(MessageBuyer temp) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(temp);
	}

	@Override
	@Transactional
	public List<MessageBuyer> getalllist() {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<MessageBuyer> theQuery = currentSession.createQuery("from MessageBuyer where status=:x",MessageBuyer.class);
		theQuery.setParameter("x", 0);
		List<MessageBuyer> list = theQuery.getResultList();
		return list;
	}

	@Override
	@Transactional
	public MessageBuyer getbyId(int theId) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		MessageBuyer theProduct = currentSession.get(MessageBuyer.class, theId);
		return theProduct;
	}

	@Override
	@Transactional
	public List<MessageBuyer> getlistbystatus(int i) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<MessageBuyer> theQuery = currentSession.createQuery("from MessageBuyer where status=:x",MessageBuyer.class);
		theQuery.setParameter("x", i);
		List<MessageBuyer> list = theQuery.getResultList();
		return list;
		 
	}

	@Override
	@Transactional
	public List<MessageBuyer> getlistbystatusanduser(int i, String userName) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<MessageBuyer> theQuery = currentSession.createQuery("from MessageBuyer where status=:x and buser=:y",MessageBuyer.class);
		theQuery.setParameter("x", i);
		theQuery.setParameter("y", userName);
		List<MessageBuyer> list = theQuery.getResultList();
		return list;
	}
}
