package com.luv2code.springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.luv2code.springsecurity.demo.validation.validEmail;

@Entity
@Table(name="customer")
public class Buyer {
	@Id
	@Column(name="id")
	private String id;
	

	@Column(name="first_name")
	private String firstName;
	

	@Column(name="last_name")
	private String lastName;
	
	@validEmail
	@Column(name="email")
	private String email;
	
 
	@Column(name="shop_name")
	private String shopName;
	

	@Size(min=8,message="*Shop License if of exactly of 8 digits")
	@Size(max=8,message="*Shop License if of exactly of 8 digits")
	@Column(name="shop_license")
	private String shopLicense;
	
	
	@Size(min=10,message="*could not be less than 10 digits")
	@Size(max=10,message="*could not be greater than 10 digits")
	@Pattern(regexp = "^[0-9]{1,16}", message = "Numbers only!")
	@Column(name="contacts")
	private String contacts;
	

	@Column(name="local_address")
	private String address;
	
	
	@Column(name="city")
	private String city;
	
	
	@Column(name="state")
	private String state;

	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopLicense() {
		return shopLicense;
	}
	public void setShopLicense(String shopLicense) {
		this.shopLicense = shopLicense;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Buyer() {
		// TODO Auto-generated constructor stub
	}

	
}
