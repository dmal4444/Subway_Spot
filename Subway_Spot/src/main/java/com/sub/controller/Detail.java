package com.sub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Detail")
public class Detail {
	
	@RequestMapping("/DetailForm")
	public String Detail(){
		return "Detail/DetailForm";
	}
	
	@RequestMapping("/Bus")
	public String Bus(){
		return "Detail/Bus";
	}
	
	@RequestMapping("/Test")
	public String Test(){
		return "Detail/Test";
	}
	
}
