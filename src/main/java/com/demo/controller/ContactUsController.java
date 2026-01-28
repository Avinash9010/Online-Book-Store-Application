package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.ContactUs;
import com.demo.service.ContactUsService;

@Controller
public class ContactUsController {
	
	@Autowired
	private ContactUsService cs;
	
	@GetMapping(value = "/contactUs")
	public ModelAndView contactUs(ModelAndView m) {
		m.setViewName("contactUs");
		return m;
	}
	
	@PostMapping(value = "/contactUs")
	public ModelAndView contactUsRequest(ModelAndView m,String firstname,String lastname,String country,String subject) {
		ContactUs c = new ContactUs();
		c.setFirstname(firstname);
		c.setLastname(lastname);
		c.setCountry(country);
		c.setSubject(subject);
		ContactUs c1 = cs.save(c);
		System.out.println(c1);
		if(c1 != null) m.addObject("msg", "Thank you for Submiting form our team will reach to you as soon as possible");
		else m.addObject("msg", "failed to submit form please resubmit form");
		m.setViewName("contactUs");
		return m;
	}
}
