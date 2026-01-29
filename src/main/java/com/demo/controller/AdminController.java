package com.demo.controller;

import java.util.List;

import org.eclipse.tags.shaded.org.apache.bcel.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Admin;
import com.demo.model.Book;
import com.demo.service.AdminService;
import com.demo.service.BookService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;
	
	@Autowired
	private BookService bs;
	
	@GetMapping(value = "/adminLogin")
	public ModelAndView login(ModelAndView m) {
		m.setViewName("adminLogin");
		return m;
	}
	
	@PostMapping(value = "/adminLogin")
	public ModelAndView loginRequest(ModelAndView m,String username,String password) {
		Admin a1 = as.findByUsernameAndPassword(username, password);
		System.out.println(a1);
		if(a1 == null) {
			m.addObject("msg", "Invalid Username or Password");
            m.setViewName("adminLogin");
		}
		else m.setViewName("adminMain");
		return m;
	}
	
	@GetMapping(value = "adminLogout")
	public ModelAndView logout(ModelAndView m) {
		m.setViewName("adminLogin");
		return m;
	}
	
	@GetMapping("/admin")
	public ModelAndView admin(
	        @RequestParam(required = false) String page,
	        @RequestParam(required = false) String keyword) {

	    ModelAndView m = new ModelAndView("adminMain");
	    
	    System.out.println(page);
	    System.out.println(keyword);

	    if ("adminListBooks".equals(page)) {
	        if (keyword != null && !keyword.isEmpty()) {
	        	List<Book> list = bs.findByAny(keyword);
	        	for(Book b:list) System.out.println(b);
	            m.addObject("listOfBooks",list);
	        } else {
	            m.addObject("listOfBooks", bs.findAll());
	        }
	    }

	    m.addObject("page", page);
	    return m;
	}

	
//	@GetMapping("/admin")
//	public ModelAndView admin(
//	        @RequestParam(required = false, defaultValue = "home") String page) {
//
//	    ModelAndView m = new ModelAndView("adminMain");
//	    System.out.println(page);
//	    if ("adminListBooks".equals(page)) {
//	    	List<Book> list = bs.findAll();
//	    	for(Book b:list) System.out.println(b);
//	        m.addObject("listOfBooks", list);
//	    }
//
//	    m.addObject("page", page);
//	    return m;
//	}
}
