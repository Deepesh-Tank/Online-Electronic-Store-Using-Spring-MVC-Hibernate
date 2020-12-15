package com.luv2code.springdemo.dao;

import java.util.List;

import javax.validation.Valid;

import com.luv2code.springdemo.entity.States;

public interface StateDAO {

	boolean getifstate(String state);

	void saveState(@Valid States theState);

	List<States> getAllStates();

}
