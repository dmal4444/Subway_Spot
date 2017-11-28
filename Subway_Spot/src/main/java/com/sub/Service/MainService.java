package com.sub.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.sub.DAO.SubwaySpotDAO;
import com.sub.UTIL.PageUtil;
import com.sub.VO.HotplaceVO;

public class MainService {

	@Autowired
	private SubwaySpotDAO ssDAO;
	
	/**
	 * 마커를 찍을 함수를 만든다.
	 */
	public ArrayList setMarker() {
		return ssDAO.setMarker();		
	}
	/**
	 * 핫플레이스 마커를 찍을 함수를 만든다.
	 */
	public ArrayList setHotMarker() {
		return ssDAO.setHotMarker();		
	}
	
	//Hotplace의 info를 얻어오는함수
	public ArrayList getHotInfo(HotplaceVO vo/*, PageUtil pInfo, int nowPage*/){
		/*int start = (nowPage -1)*(pInfo.listCount)+1;*/
		/*int end = start + (pInfo.listCount-1);*/
		
		int start = vo.getStart();
		int end = vo.getEnd();
		
		start=1;
		end=3;
		
		ArrayList list = ssDAO.getHotInfo(vo);
		System.out.println(start+"start service");
		return list;
		
	}
	
	//Hotplace의 marker를 얻어오는함수
	public ArrayList getHotMarker(HashMap map){
		ArrayList list = ssDAO.getHotMarker(map);
		
		return list;
		
	}
	
	//Hotplace Click시 탭 윈도우에 보여줄 정보 입력함수
	public ArrayList getTabinfo(HashMap map){
		ArrayList list = ssDAO.getTabinfo(map);
		
		return list;
		
	}	
	
	//총 페이지 개수를 얻어오는 함수
	public int getTotal(HotplaceVO vo){
		
		return  ssDAO.getTotal(vo); 
	}
	
	public ArrayList insertReply(int num){
		ArrayList list = ssDAO.insertReply(num);
		
		return list;
		
	}	
	public ArrayList displayReply(int num){
		ArrayList list = ssDAO.displayReply(num);
		
		return list;
		
	}	
	
}
