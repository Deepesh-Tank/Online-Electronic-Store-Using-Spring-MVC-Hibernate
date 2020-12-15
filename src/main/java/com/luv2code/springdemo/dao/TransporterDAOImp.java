package com.luv2code.springdemo.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springdemo.entity.Product;
import com.luv2code.springdemo.entity.Transporter;

@Repository
public class TransporterDAOImp implements TransporterDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public Transporter getTransporter(String UserName) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Transporter theTransporter = new Transporter();
		theTransporter = currentSession.get(Transporter.class, UserName);
		return theTransporter;
	}

	@Override
	public void saveTransporter(Transporter thetransporter) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(thetransporter);
	}

	@Override
	public List<Transporter> getTransporterByState(String stated) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Transporter> theQuery = currentSession.createQuery("from Transporter where state=:x",Transporter.class);
		theQuery.setParameter("x", stated);
		List<Transporter> theTransporters = theQuery.getResultList();
		return theTransporters;
	}

	@Override
	public List<Transporter> getdistincttransporter() {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Transporter> theQuery = currentSession.createQuery("from Transporter group by state",Transporter.class);
		List<Transporter> theTransporters = theQuery.getResultList();
		return theTransporters;
	}

	@Override
	public List<Transporter> gettransporters() {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Transporter> theQuery = currentSession.createQuery("from Transporter  ",Transporter.class);
		List<Transporter> theTransporters = theQuery.getResultList();
		return theTransporters;
		 
	}

}
