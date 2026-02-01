package com.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Book;
import com.demo.model.Cart;
import com.demo.model.User;
import com.demo.service.BookService;
import com.demo.service.UserService;

import jakarta.servlet.annotation.WebServlet;

@Controller
@WebServlet
public class BuyController {
	
	@Autowired
	private BookService bs;
	
	@Autowired
	private UserService us;
	
	@GetMapping(value = "/buyBook")
	public ModelAndView buyBook(ModelAndView m,@RequestParam(required = false) int book_id, 
			@RequestParam(required = false) int user_id) {
		Book b = bs.findById(book_id);
		User u = us.findById(user_id);
		Cart c = new Cart();
		c.setBook(b);
		c.setUser(u);
		c.setQuantity(1);
		List<Cart> cartList = new ArrayList<Cart>();
		cartList.add(c);
		m.addObject("cartList", cartList);
		m.addObject("user",u);
		m.setViewName("checkout");
		return m;
	}
}
