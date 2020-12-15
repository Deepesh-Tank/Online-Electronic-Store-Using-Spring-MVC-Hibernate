package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.Product;

public interface ProductDAO {
	public List<Product> getAllProducts();

	public void saveProduct(Product theProduct);

	public Product getProduct(int theId);

	public void deleteProduct(int theId);

	public List<Product> getEmptyList();
}
