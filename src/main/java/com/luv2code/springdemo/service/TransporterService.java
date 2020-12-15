package com.luv2code.springdemo.service;

import java.util.List;

import com.luv2code.springdemo.entity.Transporter;

public interface TransporterService {
	public Transporter getTransporter(String UserName);
	public void saveTransporter(Transporter thetransporter);
	public List<Transporter> getTransporterByState(String stated);
	public List<Transporter> getdistincttransporter();
	public List<Transporter> gettransporters();
}
