package com.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.demo.OnlineBookStoreApplication;
import com.demo.model.Address;
import com.demo.model.Book;
import com.demo.model.BookOrder;
import com.demo.model.Cart;
import com.demo.model.User;
import com.demo.service.CartService;
import com.demo.service.OrderService;
import com.demo.service.UserService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

    @Autowired
    private UserService us;

    @Autowired
    private CartService cs;
    
    @Autowired
    private OrderService os;

    @PostMapping("/placeOrder/{user_id}")
    public ModelAndView placeOrder(
            @RequestParam String firstname,
            @RequestParam String lastname,
            @RequestParam String email,
            @RequestParam String phone,
            @RequestParam String address,
            @RequestParam String city,
            @RequestParam String zipcode,
            @RequestParam String paymentMode,
            @PathVariable int user_id) {

        ModelAndView m = new ModelAndView("orderSuccess");

        User user = us.findById(user_id);
        List<Cart> cartList = cs.findByUser(user);
        
        double total = 0;
        Map<Book, Integer> bookMap = new HashMap<Book, Integer>();
        for(Cart c : cartList) {
        	bookMap.put(c.getBook(), c.getQuantity());
        	total += (c.getBook().getPrice()*c.getQuantity());
        }
        
        BookOrder bo = new BookOrder();
        bo.setFirstname(firstname);
        bo.setLastname(lastname);
        bo.setEmail(email);
        bo.setPhone(phone);
        bo.setPaymentmode(paymentMode);
        bo.setTotalprice(total);
        bo.setStatus("pending");
        
        Address ad = new Address();
        ad.setName(address);
        ad.setCity(city);
        ad.setZipcode(zipcode);
        
        bo.setAddress(ad);
        bo.setUser(user);
        
        bo.setBooksMap(bookMap);
        
        BookOrder bo1 = os.save(bo);
        System.out.println(bo1);

        m.addObject("user", user);
        return m;
    }
    
    @GetMapping(value = "/orderSuccess")
    public ModelAndView orderSuccess(ModelAndView m,
    		@RequestParam(required = false) int user_id,
    		HttpServletRequest req) {
    	
    	int check = cs.deleteByUserId(user_id);
    	System.out.println(check);
    	
    	User user = us.findById(user_id);
    	HttpSession session = req.getSession();
        session.setAttribute("user", user);
    	m.setViewName("userHome");
		return m;
	}
}
