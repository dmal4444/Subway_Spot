package com.sub.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sub.Service.MainService;
import com.sub.VO.HotplaceVO;
import com.sub.VO.StationVO;
import com.sub.VO.SubwaySpotVO;

@Controller
public class MainController {
	@Autowired
	private MainService mainS;
	
	@RequestMapping("/PathFinder")
	public String getFinder(){
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
	
	@RequestMapping("/List")
	public String getList(){
		return "List/List";
	}

	
	//운행시간 버튼
	@RequestMapping("/findProc2")
	public ModelAndView findProc(StationVO vo){
		//파라메터 받고(vo로 받을 예정)
		//모델을 만든다.
		ModelAndView mv = new ModelAndView();
		mv.addObject("from",vo.getFrom());
		mv.addObject("to", vo.getTo());
		
		RedirectView rv = new RedirectView("./Detail/DetailForm.sub");
		mv.setView(rv);
		return mv;
	}
	
	//출구 상세보기 버튼
	@RequestMapping("/findProc")
	public ModelAndView findProc2(StationVO vo){
		//파라메터 받고(vo로 받을 예정)
		//모델을 만든다.
		ModelAndView mv = new ModelAndView();
		mv.addObject("from",vo.getFrom());
		mv.addObject("to", vo.getTo());
		
		RedirectView rv = new RedirectView("./Detail/Exit.sub");
		mv.setView(rv);
		return mv;
	}
	
	//핫플레이스 정보 얻어오는 함수 
	@RequestMapping("/hotPlaceList")
	public @ResponseBody ArrayList getHotPlaceList(double lat, double lng){
		System.out.println(lat +" " + lng);
		System.out.println("List 호출");
		//파라메터 받고(double로 받고)
		//DB에서 불러오고
		HashMap map= new HashMap();
		map.put("lat", lat);
		map.put("lng", lng);

		ArrayList list=mainS.getHotInfo(map);

		return list;
		
		
	}
	
	 @RequestMapping("/Hotplace")
	   //   ★★★ResponseBody는 View를 필요로 하지 않는다.
	   public @ResponseBody ArrayList getHotplace(double lat, double lng){
		 System.out.println("getHotplace 호출");
	      HashMap map = new HashMap();

	      map.put("lat", lat);
	      map.put("lng", lng);
	      System.out.println(map);
	      ArrayList hotlist = mainS.getHotMarker(map);
	      
	      return hotlist;
	   }

}
