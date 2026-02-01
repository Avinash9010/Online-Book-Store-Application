package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.demo.controller.AddBookController;
import com.demo.dao.CartDao;
import com.demo.model.Cart;
import com.demo.model.User;

@Service
@Transactional
public class CartServiceImpl implements CartService {

    private final AddBookController addBookController;
	
	@Autowired
	private CartDao cd;

    CartServiceImpl(AddBookController addBookController) {
        this.addBookController = addBookController;
    }

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

	@Override
	public int deleteByUserId(int user_id) {
		return cd.deleteByUserId(user_id);
	}
}
