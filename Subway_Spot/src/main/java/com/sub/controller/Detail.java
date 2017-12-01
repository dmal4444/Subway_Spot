package com.sub.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sub.VO.StationVO;

@Controller
@RequestMapping("/Detail")
public class Detail {
		
	@RequestMapping("/Exit")
	public ModelAndView Bus(int fcode){
		
		//할일 파라메터 받기(vo로 받기로결정)
		ModelAndView mv=new ModelAndView();
		//모델로 만들고
		
		mv.addObject("code", fcode);
		//뷰를 호출
		mv.setViewName("/Detail/Exit");
		return mv;

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
	
	@RequestMapping("/DetailForm")
	public ModelAndView goodproc(HttpServletRequest req, HttpSession session, int tcode){
		
		//할일 파라메터 받기(vo로 받기로결정)
		ModelAndView mv=new ModelAndView();
		//모델로 만들고
		mv.addObject("code", tcode);
		//뷰를 호출
		mv.setViewName("/Detail/DetailForm");
		return mv;
		
		
	}
	
	@RequestMapping("/GoodProc")
	public ModelAndView goodproc(HttpServletRequest req, HttpSession session){
		String good = req.getParameter("good");
		session.setAttribute("GOOD", good);
		
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../Detail/DetailForm.sub");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/Good1Proc")
	public ModelAndView good1proc(HttpServletRequest req, HttpSession session){
		String good1 = req.getParameter("good1");
		session.setAttribute("GOOD1", good1);
		
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../Detail/Exit.sub");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/exitp")
	public ModelAndView exitp(int code){
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("code", code);
		mv.setViewName("Detail/Exit");
		return mv;
	}
	
	@RequestMapping("/timep")
	public ModelAndView timep(int code){
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("code", code);
		mv.setViewName("Detail/DetailForm");
		return mv;
	}
}
