package com.luv2code.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.dao.TransporterDAO;
import com.luv2code.springdemo.entity.Transporter;

@Service
public class TransporterServiceImp implements TransporterService {

	@Autowired
	private TransporterDAO ttransporterDAO;
	
	@Override
	@Transactional
	public Transporter getTransporter(String UserName) {
		// TODO Auto-generated method stub
		return ttransporterDAO.getTransporter(UserName);
	}

	@Override
	@Transactional
	public void saveTransporter(Transporter thetransporter) {
		// TODO Auto-generated method stub
		ttransporterDAO.saveTransporter(thetransporter);
	}

	@Override
	@Transactional
	public List<Transporter> getTransporterByState(String stated) {
		// TODO Auto-generated method stub
		return ttransporterDAO.getTransporterByState(stated);
	}

	@Override
	@Transactional
	public List<Transporter> getdistincttransporter() {
		// TODO Auto-generated method stub
		return ttransporterDAO.getdistincttransporter();
	}

	@Override
	@Transactional
	public List<Transporter> gettransporters() {
		// TODO Auto-generated method stub
		return ttransporterDAO.gettransporters();
	}

}
