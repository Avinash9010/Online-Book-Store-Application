package com.demo.service;

import java.util.List;

import com.demo.model.BookOrder;

public interface OrderService {
	BookOrder save(BookOrder bo);
	List<BookOrder> findByUserId(int user_id);
	List<BookOrder> findAll();
	BookOrder findById(int id);
}
