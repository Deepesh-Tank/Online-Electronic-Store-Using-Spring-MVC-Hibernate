package com.luv2code.springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cart")
public class Cart {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="cart_id")
	public int cartId;
	
	@Column(name="product_id")
	public int cartProductId;
	
	@Column(name="price")
	public int cartPrice;
	
	@Column(name="weight")
	public int weight;
	
	@Column(name="quantity")
	public int quantity;
	
	 
	
	 

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	@Column(name="buyer_id")
	public String CartBuyerUserName;

	public int getCartProductId() {
		return cartProductId;
	}

	public void setCartProductId(int cartProductId) {
		this.cartProductId = cartProductId;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getCartBuyerUserName() {
		return CartBuyerUserName;
	}

	public void setCartBuyerUserName(String cartBuyerUserName) {
		CartBuyerUserName = cartBuyerUserName;
	}

	public int getCartId() {
		return cartId;
	}
	
}
