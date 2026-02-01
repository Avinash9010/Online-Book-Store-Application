package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.OrderDao;
import com.demo.model.BookOrder;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao od;

	@Override
	public BookOrder save(BookOrder bo) {
		return od.save(bo);
	}

	@Override
	public List<BookOrder> findByUserId(int user_id) {
		return od.findByUserId(user_id);
	}

	@Override
	public List<BookOrder> findAll() {
		return od.findAll();
	}

	@Override
	public BookOrder findById(int id) {
		return od.findById(id);
	}
}
