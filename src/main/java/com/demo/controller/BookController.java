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
	
	@GetMapping(value = "/addBook")
	public ModelAndView m2(ModelAndView m) {
		m.setViewName("addBook");
		return m;
	}
	
	@PostMapping(value = "/addBook/req1")
	public ModelAndView m3(ModelAndView m, String name, String description, double price, MultipartFile image) throws IOException {
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
	public void m4(@PathVariable int id, HttpServletResponse res) throws IOException {
		byte[] image = bs.findImageById(id);
		OutputStream o1 = res.getOutputStream();
		o1.write(image);
		o1.flush();
		o1.close();
	}
}