package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.BookDao;
import com.demo.model.Book;
import com.demo.model.User;

@Service
@Transactional
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bd;
	
	@Override
	public Book save(Book b) {
		return bd.save(b);
	}

	@Override
	public List<Book> findAll() {
		return bd.findAll();
	}

	@Override
	public byte[] findImageById(int id) {
		return bd.findImageById(id);
	}

	@Override
	public Book findById(int id) {
		return bd.findById(id);
	}

	@Override
	public List<Book> findByAny(String str) {
		return bd.findByAny(str);
	}

	@Override
	public List<Book> findByCategory(String category) {
		return bd.findByCategory(category);
	}
}