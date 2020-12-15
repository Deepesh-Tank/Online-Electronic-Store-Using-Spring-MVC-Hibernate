package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Payment;



@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public void savePay(Payment pay) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(pay);
	}
	@Override
	@Transactional
	public Payment getpay(int theId) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Payment> theQuery = currentSession.createQuery("from Payment where Oid=:x",Payment.class);
		theQuery.setParameter("x", theId);
		List<Payment> thelP = theQuery.getResultList();
		Payment thepay = new Payment();
		for(Payment temp : thelP)
		{
			thepay = temp ;
			break;
		}
		return thepay;
	}

}
