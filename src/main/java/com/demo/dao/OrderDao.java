package com.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.demo.model.BookOrder;

@Repository
public interface OrderDao extends JpaRepository<BookOrder, Integer> {
	
	BookOrder save(BookOrder bo);
	List<BookOrder> findByUserId(int user_id);
	List<BookOrder> findAll();
	BookOrder findById(int id);
}
