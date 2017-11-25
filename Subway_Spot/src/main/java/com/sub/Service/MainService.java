package com.sub.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.sub.DAO.SubwaySpotDAO;

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
	public ArrayList getHotInfo(HashMap map){
		ArrayList list = ssDAO.getHotInfo(map);

		return list;
		
	}
	
	//Hotplace의 marker를 얻어오는함수
	public ArrayList getHotMarker(HashMap map){
		ArrayList list = ssDAO.getHotMarker(map);
		
		return list;
		
	}
}
