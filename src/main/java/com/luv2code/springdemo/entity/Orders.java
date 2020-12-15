package com.luv2code.springdemo.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="orders")
public class Orders {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="order_id")
	public int orderId;
	
	@Column(name="order_description")
	public String orderDescription;
	
	@Column(name="amount")
	public int amount;
	
	@Column(name="samount")
	public int samount;
	
	@Column(name="sw")
	public int sww;
	
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name="orderdate")
	private Date date;
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getSww() {
		return sww;
	}

	public void setSww(int sww) {
		this.sww = sww;
	}
 
	@NotNull(message="*can't leave empty")
	@Column(name="address")
	public String address;
	
	@Column(name="tuser")
	public String tuser;
	
	@Column(name="buser")
	public String buser;
	
	public String getBuser() {
		return buser;
	}

	public void setBuser(String buser) {
		this.buser = buser;
	}

	@Column(name="status")
	public int status;
	
	@NotNull(message="*can't leave empty")
	@Column(name="state")
	public String state;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderDescription() {
		return orderDescription;
	}

	public void setOrderDescription(String orderDescription) {
		this.orderDescription = orderDescription;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getSamount() {
		return samount;
	}

	public void setSamount(int samount) {
		this.samount = samount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTuser() {
		return tuser;
	}

	public void setTuser(String tuser) {
		this.tuser = tuser;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	 
	
	
}
