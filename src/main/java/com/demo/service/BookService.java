package com.demo.service;

import java.util.List;

import com.demo.model.Book;
import com.demo.model.User;

public interface BookService {
	Book save(Book b);
	List<Book> findAll();
	byte[] findImageById(int id);
	Book findById(int id);
}