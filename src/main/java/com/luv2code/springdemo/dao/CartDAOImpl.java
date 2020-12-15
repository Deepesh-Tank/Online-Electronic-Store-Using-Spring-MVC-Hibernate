package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Cart;
import com.luv2code.springdemo.entity.Product;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	@Transactional
	public List<Cart> getCarts() {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Cart> theQuery = currentSession.createQuery("from Cart",Cart.class);
		List<Cart> carts = theQuery.getResultList();
		return carts;
	}
	@Override
	@Transactional
	public void saveCart(Cart theCart) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theCart);
	}
	
	@Override
	@Transactional
	public Cart getCart(int p) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Cart theProduct = currentSession.get(Cart.class, p);
		return theProduct;
	}
	@Override
	@Transactional
	public void deleteAllCarts() {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Cart");
		theQuery.executeUpdate();
	}

}
