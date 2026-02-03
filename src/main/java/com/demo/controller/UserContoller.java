package com.demo.controller;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Book;
import com.demo.model.BookOrder;
import com.demo.model.Cart;
import com.demo.model.User;
import com.demo.service.BookService;
import com.demo.service.CartService;
import com.demo.service.OrderService;
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
	
	@Autowired
	private OrderService os;
	
	@GetMapping(value = "/userHome")
	public ModelAndView userHome(ModelAndView m) {
		m.setViewName("userHome");
		return m;
	}
	
	@GetMapping("/user")
	public ModelAndView user(
	        @RequestParam(required = false) String page,
	        @RequestParam(required = false) String category,
	        @RequestParam(required = false, defaultValue = "0") int user_id) {

	    ModelAndView m = new ModelAndView("userHome");

	    // Fetch user by ID
	    User user = us.findById(user_id);
	    m.addObject("user", user);
	    m.addObject("page", page);

	    // Load books if page=books
	    if ("books".equals(page)) {
	        List<Book> list;

	        if (category != null && !"all".equals(category)) {
	            list = bs.findByCategory(category);
	        } else {
	            list = bs.findAll();
	        }

	        m.addObject("listOfBooks", list);
	    }

	    // Load cart if page=cart
	    if ("cart".equals(page)) {
	        List<Cart> list = cs.findByUser(user);
	        m.addObject("cartList", list);
	    }
	    
	    if("orders".equals(page)) {
	    	System.out.println("in orders");
	    	List<BookOrder> orders = os.findByUserIdOrderByIdDesc(user_id);
	    	m.addObject("orders", orders);
	    	for(BookOrder bo : orders) System.out.println(bo);
	    	System.out.println(orders.size());
	    	System.out.println("user id:"+user_id);
	    }

	    return m;
	}
}
