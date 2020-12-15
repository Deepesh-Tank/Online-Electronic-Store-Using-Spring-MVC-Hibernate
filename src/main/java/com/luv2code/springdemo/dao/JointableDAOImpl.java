package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Jointable;
import com.luv2code.springdemo.entity.Orders;


@Repository
public class JointableDAOImpl implements JointableDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	@Transactional
	public List<Jointable> getlisting(String userName, int theId) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Jointable> theQuery = currentSession.createQuery("from Jointable where user=:x and productId=:y",Jointable.class);
		theQuery.setParameter("x", userName);
		theQuery.setParameter("y", theId);
		List<Jointable> jointables = theQuery.getResultList();
		return jointables;
	}
	@Override
	@Transactional
	public void savelisting(String userName, int theId) {
		// TODO Auto-generated method stub
		Jointable neww = new Jointable();
		neww.setUser(userName);
		neww.setProductId(theId);
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(neww);
	}
	@Override
	@Transactional
	public void saves(String userName, int m, int idoforder) {
		// TODO Auto-generated method stub
		Jointable neww = new Jointable();
		neww.setUser(userName);
		neww.setProductId(m);
		neww.setOrderid(idoforder);
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(neww);
	}
	@Override
	@Transactional
	public List<Jointable> getByUser(String userName) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Jointable> theQuery = currentSession.createQuery("from Jointable where user=:x",Jointable.class);
		theQuery.setParameter("x", userName);
		List<Jointable> jointables = theQuery.getResultList();
		Query<Jointable> theQuerys = currentSession.createQuery("from Jointable where user=:x",Jointable.class);
		theQuerys.setParameter("x", "------------------------------");
		List<Jointable> temp = theQuerys.getResultList();
		//List<Jointable> temp = new List<Jointable>();
		System.out.println("THat CONDITIONAL STATEMENT IS WORKING");
		for(Jointable t:jointables)
		{
			int ot = t.getOrderid();
			Orders theOrder = orderDAO.getorderbyid(ot);
			System.out.println("THat CONDITIONAL STATEMENT IS WORKING + " + ot);
			if(theOrder.getStatus()==2)
			{
				
				System.out.println("THIS CONDITIONAL STATEMENT IS WORKING");
				temp.add(t);
			}
		}
		return temp;
	}
	 
	
}
