package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.annotation.WebServlet;

@Controller
@WebServlet
public class OrderController {
	
	@PostMapping(value = "/placeOrder")
	public ModelAndView placeOrder(ModelAndView m) {
		return m;
	}
}
