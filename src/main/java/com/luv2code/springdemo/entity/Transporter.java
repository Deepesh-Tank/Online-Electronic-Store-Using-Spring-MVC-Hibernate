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
@Table(name="transporter")
public class Transporter {
	
	
	
	@Id
	@Column(name="username")
	public String userName;
	
	
	@Column(name="state")
	public String state;
	
	
	@Column(name="company")
	public String company;
	
	
	@Column(name="pw")
	public int pw;
	
	
	@Size(min=8,message="*permit number if of exactly of 8 digits")
	@Size(max=8,message="*permit number if of exactly of 8 digits")
	@Column(name="permit")
	public String permit;
	
	
	@Column(name="name")
	public String name;
	
	
	@validEmail
	@Column(name="email")
	public String email;
	
	@Column(name="contacts")
	@Size(min=10,message="*could not be less than 10 digits")
	@Size(max=10,message="*could not be greater than 10 digits")
	@Pattern(regexp = "^[0-9]{1,16}", message = "Numbers only!")
	public String contacts;
	
	@NotNull(message="*can't leave empty")
	@Column(name="address")
	public String address;

	 

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getPw() {
		return pw;
	}

	public void setPw(int pw) {
		this.pw = pw;
	}

	public String getPermit() {
		return permit;
	}

	public void setPermit(String permit) {
		this.permit = permit;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Transporter() {
	
	}

	public Transporter(String state) {
		this.state = state;
	}
	
}
