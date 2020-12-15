package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.Cart;


public interface CartDAO {
	public List<Cart> getCarts();

	public void saveCart(Cart theCart);

	public Cart getCart(int p);

	public void deleteAllCarts();
}
