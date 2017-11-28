package com.sub.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sub.Service.MainService;
import com.sub.UTIL.PageUtil;
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

	
	//����ð� ��ư
	@RequestMapping("/findProc2")
	public ModelAndView findProc(StationVO vo){
		//�Ķ���� �ް�(vo�� ���� ����)
		//���� �����.
		ModelAndView mv = new ModelAndView();
		mv.addObject("from",vo.getFrom());
		mv.addObject("to", vo.getTo());
		
		RedirectView rv = new RedirectView("./Detail/DetailForm.sub");
		mv.setView(rv);
		return mv;
	}
	
	//�ⱸ �󼼺��� ��ư
	@RequestMapping("/findProc")
	public ModelAndView findProc2(StationVO vo){
		//�Ķ���� �ް�(vo�� ���� ����)
		//���� �����.
		ModelAndView mv = new ModelAndView();
		mv.addObject("from",vo.getFrom());
		mv.addObject("to", vo.getTo());
		
		RedirectView rv = new RedirectView("./Detail/Exit.sub");
		mv.setView(rv);
		return mv;
	}
	
	//���÷��̽� ���� ������ �Լ� 
	@RequestMapping("/hotPlaceList")
	public @ResponseBody ArrayList getHotPlaceList(HotplaceVO vo/*, @RequestParam(value="nowPage", defaultValue="1") int nowPage*/){
		System.out.println("List ȣ��");
		//�Ķ���� �ް�
		//DB���� �ҷ�����
//		int total = mainS.getTotal(vo);
		System.out.println("vo ȣ��");
		System.out.println(vo.getStart()+" start page");
		/*PageUtil pInfo = new PageUtil(nowPage, total);*/
		
		ArrayList list=mainS.getHotInfo(vo/*, pInfo, nowPage*/);

		return list;
		
		
	}
	
	//���÷��̽� ��Ŀ ������ �Լ�
	 @RequestMapping("/Hotplace")
	 @ResponseBody
	   //   �ڡڡ�ResponseBody�� View�� �ʿ�� ���� �ʴ´�.
	   public  ArrayList getHotplace(double lat, double lng){
		 System.out.println("getHotplace ȣ��");
	      HashMap map = new HashMap();

	      map.put("lat", lat);
	      map.put("lng", lng);
	      System.out.println(map);
	      ArrayList hotlist = mainS.getHotMarker(map);
	      
	      return hotlist;
	   }
	 
		//�� ������ ���� ������ �Լ�
	 @RequestMapping("/Tabinfo")
	 @ResponseBody
	   //   �ڡڡ�ResponseBody�� View�� �ʿ�� ���� �ʴ´�.
	   public  ArrayList getTabinfo(double lat, double lng){
		 System.out.println("getHotplace ȣ��");
	      HashMap map = new HashMap();

	      map.put("lat", lat);
	      map.put("lng", lng);
	      System.out.println(map);
	      ArrayList hotlist = mainS.getTabinfo(map);
	      
	      return hotlist;
	   }

}
