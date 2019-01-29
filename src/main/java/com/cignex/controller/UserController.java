package com.cignex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cignex.model.User;
import com.cignex.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@PostMapping("/save")
	private String save(@RequestBody User user) {
		userService.saveuser(user);
		return "save";
	}
	

	@GetMapping("/list")
	private List<User> getAll(){
		return userService.getAllUser();
		
	}
}
