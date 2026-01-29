package com.demo.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Book;
import com.demo.service.BookService;

@Controller
public class AddBookController {
	
	@Autowired
	private BookService bs;
	
	@GetMapping(value = "/addBook")
	public ModelAndView m2(ModelAndView m) {
		m.setViewName("addBook");
		return m;
	}
	
	@PostMapping(value = "/addBook")
	public ModelAndView addBook(ModelAndView m, String name,String category, String description, double price, MultipartFile image) throws IOException {
		System.out.println(name);
		System.out.println(description);
		System.out.println(price);
		System.out.println(image.getOriginalFilename());
		Book b = new Book();
		b.setName(name);
		b.setCategory(category);
		b.setDescription(description);
		b.setPrice(price);
		b.setImage(image.getBytes());
		Book b1 = bs.save(b);
		if(b1 != null) m.addObject("msg", "book inserted successfully");
		else m.addObject("msg", "book not inserted successfully");
		m.setViewName("index");
		return m;
	}
}
