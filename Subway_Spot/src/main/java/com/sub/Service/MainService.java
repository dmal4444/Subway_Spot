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
	 * ��Ŀ�� ���� �Լ��� �����.
	 */
	public ArrayList setMarker() {
		return ssDAO.setMarker();		
	}
	/**
	 * ���÷��̽� ��Ŀ�� ���� �Լ��� �����.
	 */
	public ArrayList setHotMarker() {
		return ssDAO.setHotMarker();		
	}
	
	/**
	 * Hotplace�� info�� �������Լ�
	 * @param vo
	 * @return
	 */

	public ArrayList getHotInfo(HotplaceVO vo){
		
		ArrayList list = ssDAO.getHotInfo(vo);
		return list;
		
	}
	
	//Hotplace�� marker�� �������Լ�
	public ArrayList getHotMarker(HashMap map){
		ArrayList list = ssDAO.getHotMarker(map);
		
		return list;
		
	}
	
	//�� ������ ������ ������ �Լ�
	public int getTotal(HotplaceVO vo){
		
		return  ssDAO.getTotal(vo); 
	}
	
	//�˻��� �ڵ� ���ϱ� �Լ�
	public StationVO getCode(String from){
		return (StationVO) ssDAO.getCode(from);
	}
	
	//��ã�� �� �ڵ� ���ϱ� �Լ�
	public ArrayList getCoords(String station){
		return (ArrayList)ssDAO.getCoords(station);
	}
	
	//Hotplace Click�� �� �����쿡 ������ ���� �Է��Լ�
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
