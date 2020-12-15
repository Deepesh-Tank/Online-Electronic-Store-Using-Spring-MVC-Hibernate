package com.luv2code.springdemo.dao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Cart;
import com.luv2code.springdemo.entity.Orders;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public void saveOrder(Orders theOrder) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theOrder);
	}

	@Override
	@Transactional
	public List<Orders> getOrdersWithStatus(int i) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Orders> theQuery = currentSession.createQuery("from Orders where status=:x",Orders.class);
		theQuery.setParameter("x",i);
		List<Orders> theOrders = theQuery.getResultList();
		return theOrders;
	}

	@Override
	@Transactional
	public void changeOrder(int theId, int i) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Orders theProduct = currentSession.get(Orders.class, theId);
		theProduct.setStatus(i);
		currentSession.saveOrUpdate(theProduct);
	}

	@Override
	@Transactional
	public void deleteOrder(int theId) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Orders theProduct = currentSession.get(Orders.class, theId);
		currentSession.remove(theProduct);
	}

	@Override
	@Transactional
	public List<Orders> getOrdersWithStatusandtuser(int i, String userName) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Orders> theQuery = currentSession.createQuery("from Orders where status=:x and tuser=:y",Orders.class);
		theQuery.setParameter("x",i);
		theQuery.setParameter("y",userName);
		List<Orders> theOrders = theQuery.getResultList();
		return theOrders;
	}

	@Override
	@Transactional
	public List<Orders> getallOrders() {
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Orders> theQuery = currentSession.createQuery("from Orders",Orders.class);
		List<Orders> theOrders = theQuery.getResultList();
		return theOrders;
	}

	@Override
	@Transactional
	public List<Orders> getorderbyuser(String userName) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Orders> theQuery = currentSession.createQuery("from Orders where buser=:y",Orders.class);
		theQuery.setParameter("y",userName);
		List<Orders> theOrders = theQuery.getResultList();
		return theOrders;
	}

	@Override
	@Transactional
	public Orders getorderbyid(int ot) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Orders ans = currentSession.get(Orders.class, ot);
		return ans;
	}

	@Override
	@Transactional
	public int getlastOrdernull() {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("select max(p.orderId) from Orders p");
		int x =  (int) theQuery.getResultList().get(0);
		return x;
	}

	 
	
}
