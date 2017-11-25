package com.sub.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.sub.DAO.HotplaceDAO;
import com.sub.DAO.SubwaySpotDAO;

@Service
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
	 * 역근처 SubwaySpot 지정 핫플레이스를 노출할 함수를 만든다.
	 */
	public ArrayList getHotInfo(HashMap map) {
		return ssDAO.getHotInfo(map);
	}
}
