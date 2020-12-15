package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.Transporter;

public interface TransporterDAO {
	public Transporter getTransporter(String UserName);
	public void saveTransporter(Transporter thetransporter);
	public List<Transporter> getTransporterByState(String stated);
	public List<Transporter> getdistincttransporter();
	public List<Transporter> gettransporters();
}
