package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.CartDao;
import com.demo.model.Cart;
import com.demo.model.User;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cd;

	@Override
	public Cart save(Cart c) {
		return cd.save(c);
	}

	@Override
	public List<Cart> findByUser(User user) {
		return cd.findByUser(user);
	}

	@Override
	public Cart findById(int id) {
		return cd.findById(id);
	}

	@Override
	public int deleteById(int id) {
		return cd.deleteById(id);
	}
}
