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
	public ModelAndView Bus(StationVO vo){
		
		//���� �Ķ���� �ޱ�(vo�� �ޱ�ΰ���)
		ModelAndView mv=new ModelAndView();
		//�𵨷� �����
		mv.addObject("from", vo.getFrom());
		mv.addObject("to", vo.getTo());
		//�並 ȣ��
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
	public ModelAndView goodproc(HttpServletRequest req, HttpSession session, StationVO vo){
		
		//���� �Ķ���� �ޱ�(vo�� �ޱ�ΰ���)
		ModelAndView mv=new ModelAndView();
		//�𵨷� �����
		mv.addObject("from", vo.getFrom());
		mv.addObject("to", vo.getTo());
		//�並 ȣ��
		mv.setViewName("/Detail/DetailForm");
		return mv;
		
		
	}
}
