package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Book;
import com.demo.service.BookService;

import jakarta.servlet.annotation.WebServlet;

@Controller
@WebServlet
public class HomeController {
	
	@Autowired
	private BookService bs;
	
	@GetMapping(value = "/home")
	public ModelAndView m1(ModelAndView m,@RequestParam String category) {
		System.out.println(category);
		List<Book> list = bs.findByCategory(category);
		System.out.println(list.isEmpty());
		for(Book b:list) System.out.println(b);
		m.addObject("listOfBooks", list);
		m.setViewName("home");
		return m;
	}
}
