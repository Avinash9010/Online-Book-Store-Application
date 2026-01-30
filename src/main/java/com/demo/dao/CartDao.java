package com.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.demo.model.Cart;
import com.demo.model.User;

@Repository
public interface CartDao extends JpaRepository<Cart, Integer> {
	Cart save(Cart c);
	List<Cart> findByUser(User user);
	Cart findById(int id);
	
	@Query(value = "delete from Cart where id=?1", nativeQuery = true)
	@Modifying
	int deleteById(int id);
}
