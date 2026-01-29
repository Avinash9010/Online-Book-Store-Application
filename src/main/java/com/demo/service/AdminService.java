package com.demo.service;

import com.demo.model.Admin;

public interface AdminService {
	Admin findByUsernameAndPassword(String username, String password);
}
