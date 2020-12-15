package com.luv2code.springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="states")
public class States {
	@Id
	@Column(name="state")
	public String state;
	
 
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	 
	
}
