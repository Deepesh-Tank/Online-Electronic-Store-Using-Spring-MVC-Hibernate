package com.luv2code.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.dao.buyerDAO;
import com.luv2code.springdemo.entity.Buyer;

@Service
public class BuyerServiceImpl implements BuyerService {

	@Autowired
	private buyerDAO bbuyerDAO;
	
	@Override
	@Transactional
	public List<Buyer> getBuyers() {
		// TODO Auto-generated method stub
		return bbuyerDAO.getBuyers();
	}

	@Override
	@Transactional
	public Buyer getBuyer(String UserName) {
		// TODO Auto-generated method stub
		return bbuyerDAO.getBuyer(UserName);
	}

	@Override
	@Transactional
	public void saveBuyer(Buyer theBuyer) {
		// TODO Auto-generated method stub
		bbuyerDAO.saveBuyer(theBuyer);
	}

}
