package com.luv2code.springdemo.dao;

import com.luv2code.springdemo.entity.Payment;

public interface PaymentDAO {
	public void savePay(Payment pay);

	public Payment getpay(int theId);
}
