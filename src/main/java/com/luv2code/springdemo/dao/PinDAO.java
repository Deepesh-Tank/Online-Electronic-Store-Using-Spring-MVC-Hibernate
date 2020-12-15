package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.Pin;

public interface PinDAO {

	void savethepin(Pin thepin);

	List<Pin> getallpins();

	Pin getorderbypin(int theIds);

	void deletebyorderid(int theIds);

	List<Pin> getempty();

}
