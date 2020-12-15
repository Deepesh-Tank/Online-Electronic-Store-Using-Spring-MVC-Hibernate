package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.Buyer;

public interface buyerDAO {
	public List<Buyer> getBuyers();
	public Buyer getBuyer(String UserName);
	public void saveBuyer(Buyer theBuyer);
}
