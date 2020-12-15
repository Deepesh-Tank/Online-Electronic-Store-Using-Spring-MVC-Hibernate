package com.luv2code.springdemo.service;

import java.util.List;

import com.luv2code.springdemo.entity.Buyer;

public interface BuyerService {
	public List<Buyer> getBuyers();
	public Buyer getBuyer(String UserName);
	public void saveBuyer(Buyer theBuyer);
}
