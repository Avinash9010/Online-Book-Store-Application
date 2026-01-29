package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.AdminDao;
import com.demo.model.Admin;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao ad;

	@Override
	public Admin findByUsernameAndPassword(String username, String password) {
		return ad.findByUsernameAndPassword(username, password);
	}
	
	
}
