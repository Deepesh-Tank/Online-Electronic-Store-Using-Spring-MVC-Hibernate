package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.Jointable;

public interface JointableDAO {

	List<Jointable> getlisting(String userName, int theId);

	void savelisting(String userName, int theId);

	void saves(String userName, int m, int idoforder);

	List<Jointable> getByUser(String userName);

 

}
