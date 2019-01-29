package com.cignex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cignex.model.User;
import com.cignex.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

	public User saveuser(User user) {
		return userRepository.save(user);
	}
	
	public List<User> getAllUser(){
		return userRepository.findAll();
	}
}
