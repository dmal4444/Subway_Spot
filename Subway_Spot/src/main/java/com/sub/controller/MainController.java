package com.sub.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sub.Service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainS;
		
	@RequestMapping("/PathFinder")
	public String getFinder(){
		System.out.println("PathFinder");
		return "PathFinder";
	}
	
	@RequestMapping("/main")	
	public ModelAndView getMain() throws Exception {	
		//	set Marker
		ArrayList list = mainS.setMarker(); 
		ArrayList hlist = mainS.setHotMarker();
		
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(list);	
		String hresult = mapper.writeValueAsString(hlist);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("MLIST",result);
		mv.addObject("HLIST",hresult);
		
		mv.setViewName("/main");		
		return mv;		
	}
	
	@RequestMapping("/TabWindow")
	public String getTab(){
		return "List/TabWindow";
	}
	
	@RequestMapping("/Hotplace")
	//	★★★ResponseBody는 View를 필요로 하지 않는다.
	public @ResponseBody ArrayList getHotplace(double lat, double lng){

		HashMap map = new HashMap();

		map.put("lat", lat);
		map.put("lng", lng);
		System.out.println(map);
		ArrayList hotlist = mainS.getHotInfo(map);
		
		return hotlist;
	}
	
	@RequestMapping("/List")
	public String getList(){
		return "List/List";
	}
	
	@RequestMapping("/test")
	public String getTest(){
		return "List/test";
	}

}
