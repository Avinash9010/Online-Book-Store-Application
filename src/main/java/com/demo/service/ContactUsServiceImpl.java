package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.ContactUsDao;
import com.demo.model.ContactUs;

@Service
@Transactional
public class ContactUsServiceImpl implements ContactUsService {
	
	@Autowired
	private ContactUsDao cd;

	@Override
	public ContactUs save(ContactUs c) {
		return cd.save(c);
	}

}
