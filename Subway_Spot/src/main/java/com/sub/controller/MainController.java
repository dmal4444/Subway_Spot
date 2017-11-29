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
import com.sub.VO.ReplyVO;
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
	@ResponseBody
	public HashMap getHotPlaceList(HotplaceVO vo){
		//�Ķ���� �ް�
		//DB���� �ҷ�����
		int nowPage=vo.getNowPage();
		int total = mainS.getTotal(vo);
		
		PageUtil pInfo = new PageUtil(nowPage, total);
		int start=(nowPage -1)*(pInfo.listCount)+1;
		int end=start + (pInfo.listCount-1);
		
		vo.setStart(start);
		vo.setEnd(end);

		HashMap map = new HashMap();

		ArrayList list=mainS.getHotInfo(vo);
		
		map.put("nowPage", nowPage);
		map.put("PINFO", pInfo);
		map.put("LIST", list);
		map.put("lat", vo.getLat());
		map.put("lng", vo.getLng());
		
		return map;
		
		
	}
	
	//���÷��̽� ��Ŀ ������ �Լ�
	 @RequestMapping("/Hotplace")
	   //   �ڡڡ�ResponseBody�� View�� �ʿ�� ���� �ʴ´�.
	   public @ResponseBody ArrayList getHotplace(double lat, double lng){
	      HashMap map = new HashMap();

	      map.put("lat", lat);
	      map.put("lng", lng);
	      ArrayList hotlist = mainS.getHotMarker(map);
	      
	      return hotlist;
	   }
	 
	 //��ã�� �˻��� �ڵ� �޾ƿ��� �Լ�
	 @RequestMapping("/findStnCode")
	 @ResponseBody
	 public HashMap getStnCode(@RequestParam(value=("from")) String from, @RequestParam(value=("to")) String to){
		//�Ķ���� �ް�(vo�� ���� ����)
		//DB���� ������.
		 StationVO Fvo=mainS.getCode(from);
		 StationVO Tvo=mainS.getCode(to);

		 HashMap map = new HashMap();
		 map.put("FCODE", Fvo.getCode());
		 map.put("TCODE", Tvo.getCode());
		 map.put("FXPOINT", Fvo.getXpoint());
		 map.put("FYPOINT", Fvo.getYpoint());
		 map.put("TXPOINT", Tvo.getXpoint());
		 map.put("TYPOINT", Tvo.getYpoint());

		 return map;
	 }
	 
	 //��ã�� �� ��ǥ �޾ƿ��� �Լ�
	 @RequestMapping("/findStnCoords")
	 @ResponseBody
	 public ArrayList getStnCoords(@RequestParam(value=("station")) String station, HotplaceVO vo){
		 		 
		 ArrayList list =mainS.getCoords(station);	 

		 return list;
	 }
	 
	//�� ������ ���� ������ �Լ�
	    @RequestMapping("/Tabinfo")
	    @ResponseBody
	      //   �ڡڡ�ResponseBody�� View�� �ʿ�� ���� �ʴ´�.
	      public  ArrayList getTabinfo(double lat, double lng){
	         HashMap map = new HashMap();

	         map.put("lat", lat);
	         map.put("lng", lng);
	         ArrayList hotlist = mainS.getTabinfo(map);
	         
	         return hotlist;
	      }
	 
	   // reply ��� �Լ�
	   @RequestMapping("/ReplyProc")
	   @ResponseBody
	   public String replyProc(ReplyVO rVO) {
	      mainS.insertReply(rVO);	
	      
	      
	      return "({result: 1})";
	   }
	   
	
	   @RequestMapping("/ReplyList")
	   @ResponseBody
	   public ArrayList displayReply(int num) {
	      System.out.println("displayReply = " + num);
	      ArrayList replylist = mainS.displayReply(num);
	      return  replylist ;
	   }
	    

}
