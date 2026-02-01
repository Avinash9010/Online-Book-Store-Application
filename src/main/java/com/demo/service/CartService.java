package com.demo.service;

import java.util.List;

import com.demo.model.Cart;
import com.demo.model.User;

public interface CartService {
	Cart save(Cart c);
	List<Cart> findByUser(User user);
	Cart findById(int id);
	int deleteById(int id);
	int deleteByUserId(int user_id);
}
