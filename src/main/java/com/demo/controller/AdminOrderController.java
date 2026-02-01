package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.BookOrder;
import com.demo.service.OrderService;

import jakarta.servlet.annotation.WebServlet;

@Controller
@WebServlet
public class AdminOrderController {
	
	@Autowired
	private OrderService os;
	
	@GetMapping(value = "/updateStatus")
	public ModelAndView updateOrderStatus(@RequestParam(required = false) String status,
			@RequestParam(required = false) int order_id) {
		System.out.println(status);
		System.out.println(order_id);
		BookOrder bo = os.findById(order_id);
		bo.setStatus(status);
		BookOrder bo1 = os.save(bo);
		System.out.println(bo1);
		ModelAndView m = new ModelAndView("adminMain");
		List<BookOrder> orders = os.findAll();
		m.addObject("orders", orders);
		m.addObject("page", "adminOrders");
		return m;
	}
	
	
}
