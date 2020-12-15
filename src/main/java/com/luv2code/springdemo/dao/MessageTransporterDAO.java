package com.luv2code.springdemo.dao;

 
import java.util.List;

import com.luv2code.springdemo.entity.MessageTransporter;

public interface MessageTransporterDAO {

	void saveit(MessageTransporter temp);

	List<MessageTransporter> getalllist();

	MessageTransporter getbyId(int theId);

	List<MessageTransporter> getlistbystatus(int i);

	List<MessageTransporter> getlistbystatusanduser(int i, String userName);

 

}
