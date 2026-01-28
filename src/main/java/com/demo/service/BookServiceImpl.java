package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.BookDao;
import com.demo.model.Book;

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

}