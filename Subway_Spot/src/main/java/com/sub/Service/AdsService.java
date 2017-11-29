package com.sub.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.sub.DAO.AdsDAO;
import com.sub.UTIL.PageUtil;
import com.sub.VO.AdsVO;

public class AdsService {
	@Autowired
	private AdsDAO aDAO;
	
	//��Ϻ���
	public ArrayList getAdsList(int nowPage, PageUtil pInfo){
		int start = (nowPage -1)*(pInfo.listCount)+1;
		int end = start + (pInfo.listCount-1);
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList list = aDAO.getAdsList(map);
		
		return list;
	}
	
	//�۾���
	public void getAdsWrite(AdsVO vo){
		aDAO.getAdsWrite(vo);
	}
	
	//�󼼺���
	public AdsVO getAdsDetail(int oriNo){
		return (AdsVO)aDAO.getAdsDetail(oriNo);
	}
	
	//�Ѱ���
	public int getTotal(){
		return (Integer)aDAO.getTotal();
	}
	
	//�����ϱ�
	public void getAdsModify(AdsVO vo){
		aDAO.getAdsModify(vo);
	}
	
	//�����ϱ�
	public void deleteAds(HashMap map){
		aDAO.deleteAds(map);
	}

}
