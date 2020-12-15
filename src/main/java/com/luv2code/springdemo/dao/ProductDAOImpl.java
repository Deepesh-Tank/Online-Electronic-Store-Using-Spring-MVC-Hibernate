package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Product> theQuery = currentSession.createQuery("from Product",Product.class);
		List<Product> products = theQuery.getResultList();
		return products;
	}
	@Override
	@Transactional
	public void saveProduct(Product theProduct) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theProduct);
	}
	@Override
	@Transactional
	public Product getProduct(int theId) {
		Session currentSession=sessionFactory.getCurrentSession();
		Product theProduct = currentSession.get(Product.class, theId);
		// TODO Auto-generated method stub
		return theProduct;
	}
	@Override
	@Transactional
	public void deleteProduct(int theId) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Product where productId=:x");
		theQuery.setParameter("x", theId);
		theQuery.executeUpdate();
	}
	@Override
	@Transactional
	public List<Product> getEmptyList() {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Product> theQuery = currentSession.createQuery("from Product where productDescription=:z",Product.class);
		theQuery.setParameter("z", "for the getting the empty product list");
		List<Product> products = theQuery.getResultList();
		return products;
	}

}
