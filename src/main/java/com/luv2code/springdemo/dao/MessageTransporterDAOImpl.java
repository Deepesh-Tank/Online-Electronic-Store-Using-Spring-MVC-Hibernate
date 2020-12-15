package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.MessageBuyer;
import com.luv2code.springdemo.entity.MessageTransporter;

@Repository
public class MessageTransporterDAOImpl implements MessageTransporterDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void saveit(MessageTransporter temp) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(temp);
	}

	@Override
	@Transactional
	public List<MessageTransporter> getalllist() {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<MessageTransporter> theQuery = currentSession.createQuery("from MessageTransporter where status=:x",MessageTransporter.class);
		theQuery.setParameter("x", 0);
		List<MessageTransporter> list = theQuery.getResultList();
		return list;
	}

	@Override
	@Transactional
	public MessageTransporter getbyId(int theId) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		MessageTransporter theProduct = currentSession.get(MessageTransporter.class, theId);
		return theProduct;		 
	}

	@Override
	@Transactional
	public List<MessageTransporter> getlistbystatus(int i) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<MessageTransporter> theQuery = currentSession.createQuery("from MessageTransporter where status=:x",MessageTransporter.class);
		theQuery.setParameter("x", i);
		List<MessageTransporter> list = theQuery.getResultList();
		return list;
		 
	}

	@Override
	@Transactional
	public List<MessageTransporter> getlistbystatusanduser(int i, String userName) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<MessageTransporter> theQuery = currentSession.createQuery("from MessageTransporter where status=:x and tuser=:y",MessageTransporter.class);
		theQuery.setParameter("x", i);
		theQuery.setParameter("y", userName);
		List<MessageTransporter> list = theQuery.getResultList();
		return list;
	}

 
	
}
