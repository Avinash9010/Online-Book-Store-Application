package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.User;
import com.demo.service.UserService;

@Controller
public class SignupController {

    @Autowired
    private UserService us;

    @GetMapping("/signup")
    public String signupPage() {
        return "signUp";
    }

    @PostMapping("/signup")
    public ModelAndView signupRequest(
            ModelAndView m,
            String firstname,
            String lastname,
            String number,
            String username,
            String email,
            String password,
            String confirmPassword) {

        if (!password.equals(confirmPassword)) {
            m.addObject("msg", "Passwords do not match");
            m.setViewName("signUp");
            return m;
        }

        User u = new User();
        u.setFirstname(firstname);
        u.setLastname(lastname);
        u.setNumber(number);
        u.setUsername(username);
        u.setEmail(email);
        u.setPassword(password);

        us.save(u);

        m.addObject("msg", "Signup successful. Please login.");
        m.setViewName("login");
        return m;
    }
}

