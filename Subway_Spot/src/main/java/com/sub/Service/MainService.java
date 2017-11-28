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
	
	//Hotplace�� info�� �������Լ�
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
	
	//Hotplace�� marker�� �������Լ�
	public ArrayList getHotMarker(HashMap map){
		ArrayList list = ssDAO.getHotMarker(map);
		
		return list;
		
	}
	
	//Hotplace Click�� �� �����쿡 ������ ���� �Է��Լ�
	public ArrayList getTabinfo(HashMap map){
		ArrayList list = ssDAO.getTabinfo(map);
		
		return list;
		
	}	
	
	//�� ������ ������ ������ �Լ�
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
