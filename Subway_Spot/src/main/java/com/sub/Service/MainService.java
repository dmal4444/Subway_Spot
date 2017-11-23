package com.sub.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.sub.DAO.HotplaceDAO;
import com.sub.DAO.SubwaySpotDAO;

@Service
public class MainService {

	@Autowired
	private SubwaySpotDAO ssDAO;
//	private HotplaceDAO hpDAO;
	
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
	 * ����ó SubwaySpot ���� ���÷��̽��� ������ �Լ��� �����.
	 */
	public ArrayList hotplaceInfo() {
		return ssDAO.hotPlaceinfo();
	}
}
