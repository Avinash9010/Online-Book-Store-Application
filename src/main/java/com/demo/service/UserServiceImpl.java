package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.UserDao;
import com.demo.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao ud;
	
	@Override
	public User save(User u) {
		return ud.save(u);
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		return ud.findByUsernameAndPassword(username, password);
	}

}
