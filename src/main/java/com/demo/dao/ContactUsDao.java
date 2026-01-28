package com.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.model.ContactUs;

@Repository
public interface ContactUsDao extends JpaRepository<ContactUs, Integer>{
	ContactUs save(ContactUs c);
}
