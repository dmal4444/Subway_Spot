package com.sub.Service;

import java.util.ArrayList;

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
}
