package com.demo.service;

import com.demo.model.User;

public interface UserService {
	User save(User u);
	User findByUsernameAndPassword(String username,String password);
	User findById(int id);
}
