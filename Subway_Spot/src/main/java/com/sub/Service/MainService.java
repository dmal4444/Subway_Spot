package com.sub.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.sub.DAO.SubwaySpotDAO;
import com.sub.UTIL.PageUtil;
import com.sub.VO.HotplaceVO;
import com.sub.VO.ReplyVO;
import com.sub.VO.StationVO;

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
	
	/**
	 * Hotplace의 info를 얻어오는함수
	 * @param vo
	 * @return
	 */

	public ArrayList getHotInfo(HotplaceVO vo){
		
		ArrayList list = ssDAO.getHotInfo(vo);
		return list;
		
	}
	
	//Hotplace의 marker를 얻어오는함수
	public ArrayList getHotMarker(HashMap map){
		ArrayList list = ssDAO.getHotMarker(map);
		
		return list;
		
	}
	
	//총 페이지 개수를 얻어오는 함수
	public int getTotal(HotplaceVO vo){
		
		return  ssDAO.getTotal(vo); 
	}
	
	//검색역 코드 구하기 함수
	public StationVO getCode(String from){
		return (StationVO) ssDAO.getCode(from);
	}
	
	//길찾기 역 코드 구하기 함수
	public ArrayList getCoords(String station){
		return (ArrayList)ssDAO.getCoords(station);
	}
	
	//Hotplace Click시 탭 윈도우에 보여줄 정보 입력함수
	 public ArrayList getTabinfo(HashMap map){
	      ArrayList list = ssDAO.getTabinfo(map);
	      
	      return list;
	 }
	      
	 public void insertReply(ReplyVO vo){
	     ssDAO.insertReply(vo);        
	       }   
	       
	       public ArrayList displayReply(int num){
	          ArrayList list = ssDAO.displayReply(num);
	          
	          return list;
	          
	       }      
	   
	
	  
}
