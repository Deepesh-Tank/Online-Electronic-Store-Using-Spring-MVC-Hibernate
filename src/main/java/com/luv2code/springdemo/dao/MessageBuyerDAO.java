package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.MessageBuyer;

public interface MessageBuyerDAO {

	void saveit(MessageBuyer temp);

	List<MessageBuyer> getalllist();

	MessageBuyer getbyId(int theId);

	List<MessageBuyer> getlistbystatus(int i);

	List<MessageBuyer> getlistbystatusanduser(int i, String userName);

}
