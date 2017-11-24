package com.sub.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


@Controller
@RequestMapping("/Detail")
public class Detail {
	
	@RequestMapping("/DetailForm")
	public String Detail(){
		return "Detail/DetailForm";
	}
	
	@RequestMapping("/Exit")
	public String Bus(){
		return "Detail/Exit";
	}
	
	@RequestMapping("/Test1")
	public String Test1(){
		return "Detail/Test1";
	}
	@RequestMapping("/Test")
	public String Test(){
		return "Detail/Test";
	}
	
	@RequestMapping("/Good")
	public String Good(){
		return "Detail/good";
	}
	
	@RequestMapping("/GoodProc")
	public ModelAndView goodproc(HttpServletRequest req, HttpSession session){
		String good = req.getParameter("good");
		session.setAttribute("GOOD", good);
		System.out.println(good);
		
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../Detail/DetailForm.sub");
		mv.setView(rv);
		return mv;
	}
}
