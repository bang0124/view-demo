package com.aircuve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/view")
public class ViewController {
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET) 
	public String home() {
		
		return "login/login";
	}
	
	
	
	@RequestMapping(value="/result", method=RequestMethod.GET) 
	public String regist() {
		
		return "login/result";
	}
	
}
