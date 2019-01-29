package com.cignex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Web {

	@GetMapping("/")
	private String home() {
		return "home";
	}
}
