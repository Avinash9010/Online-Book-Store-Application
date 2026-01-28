package com.demo.controller;

import java.io.IOException;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Book;
import com.demo.service.BookService;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@WebServlet
@MultipartConfig(maxFileSize = 999999999,maxRequestSize = 999999999)
public class BookController {
	
	@Autowired
	private BookService bs;
	
	@GetMapping(value = "/")
	public ModelAndView m1(ModelAndView m) {
		m.addObject("listOfBooks",bs.findAll());
		m.setViewName("home");
		return m;
	}
	
	@GetMapping(value = "/aboutUs")
	public ModelAndView aboutUs(ModelAndView m) {
		m.setViewName("aboutUs");
		return m;
	}
	
	@GetMapping(value = "/contactUs")
	public ModelAndView contactUs(ModelAndView m) {
		m.setViewName("contactUs");
		return m;
	}
	
	@GetMapping(value = "/signUp")
	public ModelAndView signUp(ModelAndView m) {
		m.setViewName("signUp");
		return m;
	}
	
	@PostMapping(value = "/signUp/req")
	public ModelAndView SignUpRequest(ModelAndView m,String name, String number, String email,
			String password, String confirmPassword) {
		System.out.println(name);
		System.out.println(number);
		System.out.println(email);
		System.out.println(password);
		System.out.println(confirmPassword);
		if(!password.equals(confirmPassword)) {
			m.addObject("msg", "password not matched");
			m.setViewName("signUp");
		}
		else m.setViewName("index");
		return m;
	}
	
	@GetMapping(value = "/login")
	public ModelAndView login(ModelAndView m) {
		m.setViewName("login");
		return m;
	}
	
	@GetMapping(value = "/buyBook")
	public ModelAndView buyBook(ModelAndView m) {
		m.setViewName("buyBook");
		return m;
	}
	
	@GetMapping(value = "/addBook")
	public ModelAndView m2(ModelAndView m) {
		m.setViewName("addBook");
		return m;
	}
	
	@PostMapping(value = "/addBook/req1")
	public ModelAndView addBook(ModelAndView m, String name, String description, double price, MultipartFile image) throws IOException {
		System.out.println(name);
		System.out.println(description);
		System.out.println(price);
		System.out.println(image.getOriginalFilename());
		Book b = new Book();
		b.setName(name);
		b.setDescription(description);
		b.setPrice(price);
		b.setImage(image.getBytes());
		Book b1 = bs.save(b);
		if(b1 != null) m.addObject("msg", "book inserted successfully");
		else m.addObject("msg", "book not inserted successfully");
		m.setViewName("index");
		return m;
	}
	
	@GetMapping(value = "/showimage/{id}")
	public void showImage(@PathVariable int id, HttpServletResponse res) throws IOException {
		byte[] image = bs.findImageById(id);
		OutputStream o1 = res.getOutputStream();
		o1.write(image);
		o1.flush();
		o1.close();
	}
	
	@GetMapping(value = "/updateBook")
	public ModelAndView m6(ModelAndView m) {
		m.setViewName("updateBook");
		return m;
	}
	
	@PostMapping("/updateBook/req")
	public ModelAndView updateBook(ModelAndView m,int id,String name,String description,Double price,
	        MultipartFile image) throws IOException {
		System.out.println(description);

	    Book b = new Book();
	    b.setId(id);
	    b.setName(name);
	    b.setDescription(description);

	    if (price != null) {
	        b.setPrice(price);
	    } else {
	        b.setPrice(bs.findById(id).getPrice()); // keep old price
	    }

	    if (image == null || image.getSize() == 0) {
	        b.setImage(bs.findImageById(id));
	    } else {
	        b.setImage(image.getBytes());
	    }

	    Book b1 = bs.save(b);
	    m.addObject("msg", b1 != null ? "Book updated successfully" : "Book not updated");
	    m.setViewName("index");
	    return m;
	}
}