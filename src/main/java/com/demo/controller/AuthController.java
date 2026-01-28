package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Book;
import com.demo.model.User;
import com.demo.service.BookService;
import com.demo.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserService us;

    @Autowired
    private BookService bs;

    // Login Page
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // Login Request
    @PostMapping("/login")
    public ModelAndView loginRequest(
            ModelAndView m,
            String username,
            String password,
            HttpServletRequest req) {

        User u = us.findByUsernameAndPassword(username, password);

        if (u == null) {
            m.addObject("msg", "Invalid Username or Password");
            m.setViewName("login");
            return m;
        }

        HttpSession session = req.getSession();
        session.setAttribute("uid", u.getId());

        List<Book> list = bs.findAll();
        m.addObject("listOfBooks", list);
        m.setViewName("index");
        
        System.out.println(u);

        return m;
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate(); // BEST
        }
        return "login";
    }
}
