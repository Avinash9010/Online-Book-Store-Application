package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Cart;
import com.demo.model.User;
import com.demo.service.CartService;
import com.demo.service.UserService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

@Controller
@WebServlet
public class CheckoutController {
	
	@Autowired
	private CartService cs;
	
	@Autowired
	private UserService us;

	@GetMapping(value = "/checkout")
	public ModelAndView checkOut(ModelAndView m, @RequestParam(required = false, defaultValue = "0") int user_id) {
		System.out.println(user_id);
		User user = us.findById(user_id);
		List<Cart> list = cs.findByUser(user);
		m.addObject("cartList", list);
		m.addObject("user", user);
		m.setViewName("checkout");
		return m;
	}
}
