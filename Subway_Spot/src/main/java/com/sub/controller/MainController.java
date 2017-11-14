package com.sub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/PathFinder")
	public String getFinder(){
		System.out.println("PathFinder");
		return "PathFinder";
		
	}

}
