package com.luv2code.springdemo.dao;

import java.util.List;

import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.States;

@Repository
public class StateDAOImpl implements StateDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public boolean getifstate(String state) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<States> theQuery = currentSession.createQuery("from States where state=:x",States.class);
		theQuery.setParameter("x", state);
		List<States> theStates = theQuery.getResultList();
		int l=0;
		for(States t : theStates)
		{
			l++;
		}
		if(l>0)
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}

	@Override
	@Transactional
	public void saveState(@Valid States theState) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theState);
	}

	@Override
	@Transactional
	public List<States> getAllStates() {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<States> theQuery = currentSession.createQuery("from States",States.class);
		List<States> theStates = theQuery.getResultList();
		return theStates;
	}
	
}
