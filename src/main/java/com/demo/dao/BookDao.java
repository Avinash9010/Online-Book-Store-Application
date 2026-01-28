package com.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.demo.model.Book;
import com.demo.model.User;

@Repository
public interface BookDao extends JpaRepository<Book, Integer> {
	Book save(Book b);
	List<Book> findAll();
	
	@Query(value = "select image from Book where id=?1",nativeQuery = true)
	byte[] findImageById(int id);
	Book findById(int id);
}