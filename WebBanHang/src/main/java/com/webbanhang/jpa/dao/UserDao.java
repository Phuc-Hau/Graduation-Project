package com.webbanhang.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webbanhang.jpa.model.User;

public interface UserDao extends JpaRepository<User, Integer>{

	@Query("SELECT o FROM User o WHERE o.email = ?1 ")
	User findByEmail(String email);
	
	@Query("SELECT o FROM User o WHERE o.username = ?1 and o.password = ?2")
	User checkLogin(String username, String password);
	
	
	
}
