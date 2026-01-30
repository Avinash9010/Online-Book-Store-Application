package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Cart;
import com.demo.model.User;
import com.demo.service.BookService;
import com.demo.service.CartService;
import com.demo.service.UserService;

import jakarta.servlet.annotation.WebServlet;

@Controller
@WebServlet
public class CartController {
	
	@Autowired
	private UserService us;
	
	@Autowired
	private BookService bs;
	
	@Autowired
	private CartService cs;
	
	@GetMapping(value = "/addToCart")
	public ModelAndView addToCart(@RequestParam(required = false) int book_id, 
			@RequestParam(required = false) int user_id,
			@RequestParam(required = false) String category) {
		
		Cart c = new Cart();
		c.setUser(us.findById(user_id));
		c.setBook(bs.findById(book_id));
		c.setQuantity(1);
		
		Cart c1 = cs.save(c);
		System.out.println(c1);

		ModelAndView m = new ModelAndView("userHome");
		if(category.equals("all")) m.addObject("listOfBooks", bs.findAll());
		else m.addObject("listOfBooks", bs.findByCategory(category));
		m.addObject("page", "books");
		return m;
	}
	
	@GetMapping(value = "/decreaseQty")
	public ModelAndView decreaseQty(@RequestParam(required = false) int cart_id,
			@RequestParam(required = false, defaultValue = "0") int user_id) {
		Cart c = cs.findById(cart_id);
		c.setQuantity(c.getQuantity()-1);
		Cart c1 = cs.save(c);
		ModelAndView m = new ModelAndView("userHome");
		List<Cart> list = cs.findByUser(us.findById(user_id));
		m.addObject("cartList", list);
		m.addObject("page", "cart");
		m.addObject("user", us.findById(user_id));
		return m;
	}
	
	@GetMapping(value = "/increaseQty")
	public ModelAndView increaseQty(@RequestParam(required = false) int cart_id,
			@RequestParam(required = false, defaultValue = "0") int user_id) {
		Cart c = cs.findById(cart_id);
		c.setQuantity(c.getQuantity()+1);
		Cart c1 = cs.save(c);
		System.out.println(c1);
		ModelAndView m = new ModelAndView("userHome");
		List<Cart> list = cs.findByUser(us.findById(user_id));
		m.addObject("cartList", list);
		m.addObject("page", "cart");
		m.addObject("user", us.findById(user_id));
		return m;
	}
	
	@GetMapping(value = "/removeFromCart")
	public ModelAndView removeFromCart(@RequestParam(required = false) int cart_id,
			@RequestParam(required = false) int user_id) {
		
		int check = cs.deleteById(cart_id);
		System.out.println(check);
		ModelAndView m = new ModelAndView("userHome");
		List<Cart> list = cs.findByUser(us.findById(user_id));
		m.addObject("cartList", list);
		m.addObject("page", "cart");
		m.addObject("user", us.findById(user_id));
		return m;
	}
}
