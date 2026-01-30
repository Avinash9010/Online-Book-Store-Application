package com.demo.controller;

import java.util.Iterator;
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
import com.demo.service.CartService;
import com.demo.service.UserService;

import jakarta.servlet.annotation.WebServlet;

@Controller
@WebServlet
public class UserContoller {
	
	@Autowired
	private BookService bs;
	
	@Autowired
	private CartService cs;
	
	@Autowired
	private UserService us;
	
	@GetMapping(value = "/userHome")
	public ModelAndView userHome(ModelAndView m) {
		m.setViewName("userHome");
		return m;
	}
	
	@GetMapping(value = "/user")
	public ModelAndView user(@RequestParam(required = false) String page,
			@RequestParam(required = false) String category,
			@RequestParam(required = false, defaultValue = "0") int user_id) {
		ModelAndView m = new ModelAndView("userHome");
		
		if(page.equals("books")) {
			List<Book> list = bs.findAll();
			if(category != null && "all".equals(category)) {
				m.addObject("listOfBooks", list);
			}
			else if(category != null) {
				list = bs.findByCategory(category);
				m.addObject("listOfBooks", list);
			}
			else {
				m.addObject("listOfBooks", list);
			}
		}
		if(page.equals("cart")) {
			List<Cart> list = cs.findByUser(us.findById(user_id));
			m.addObject("cartList", list);
			for(Cart c:list) System.out.println(c);
		}
		m.addObject("user", us.findById(user_id));
		m.addObject("page", page);
		return m;
	}
}
