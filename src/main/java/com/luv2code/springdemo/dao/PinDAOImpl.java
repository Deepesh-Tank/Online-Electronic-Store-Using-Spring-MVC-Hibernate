package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Pin;
import com.luv2code.springdemo.entity.Product;

@Repository
public class PinDAOImpl implements PinDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void savethepin(Pin thepin) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(thepin);
	}

	@Override
	@Transactional
	public List<Pin> getallpins() {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Pin> theQuery = currentSession.createQuery("from Pin ",Pin.class);
		List<Pin> thepins = theQuery.getResultList();
		return thepins;
	}

	@Override
	@Transactional
	public Pin getorderbypin(int theIds) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Pin> theQuery = currentSession.createQuery("from Pin where orderId=:x",Pin.class);
		theQuery.setParameter("x", theIds);
		List<Pin> thePins = theQuery.getResultList();
		return thePins.get(0);
	}

	@Override
	@Transactional
	public void deletebyorderid(int theIds) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Pin where orderId=:x");
		theQuery.setParameter("x", theIds);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public List<Pin> getempty() {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Pin> theQuery = currentSession.createQuery("from Pin where orderId=:x",Pin.class);
		theQuery.setParameter("x", 100000);
		List<Pin> thePins = theQuery.getResultList();
		return thePins; 
	}
}
