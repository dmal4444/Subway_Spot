package com.sub.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.sub.DAO.SubwaySpotDAO;

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
	public ArrayList getHotInfo(HashMap map){
		ArrayList list = ssDAO.getHotInfo(map);

		return list;
		
	}
	
	//Hotplace�� marker�� �������Լ�
	public ArrayList getHotMarker(HashMap map){
		ArrayList list = ssDAO.getHotMarker(map);
		
		return list;
		
	}
}
