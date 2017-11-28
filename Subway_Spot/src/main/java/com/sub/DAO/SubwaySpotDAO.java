package com.sub.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.sub.VO.HotplaceVO;

public class SubwaySpotDAO extends SqlSessionDaoSupport {
	//	세션(컨넥션) 처리를 위해서 이미 <bean> 처리된 SqlSession을 자동 주입 시키자.
	@Autowired
	public SqlSessionTemplate sqlSession;

	public ArrayList setMarker() {
		return (ArrayList) sqlSession.selectList("subwaySpot.setMarker");
	}
	public ArrayList setHotMarker() {
		return (ArrayList) sqlSession.selectList("subwaySpot.setHotMarker");
	}
	public ArrayList getHotInfo(HotplaceVO vo){
		System.out.println(vo.getStart()+":  DAO start");
		System.out.println(sqlSession.selectList("subwaySpot.getHotInfo", vo)+"  :DAO hotinfo");
		return (ArrayList) sqlSession.selectList("subwaySpot.getHotInfo", vo);
	}
	
	public int getTotal(HotplaceVO vo){
		System.out.println(sqlSession.selectOne("subwaySpot.getTotal", vo)+"  :dao getTotal");
		return sqlSession.selectOne("subwaySpot.getTotal", vo);
	}
	
	public ArrayList getHotMarker(HashMap map){
		return (ArrayList) sqlSession.selectList("subwaySpot.getHotMarker", map);
		
	}
	public ArrayList getTabinfo(HashMap map){
		return (ArrayList) sqlSession.selectList("subwaySpot.getTabinfo", map);
		
	}
	public ArrayList insertReply(int num){
		return (ArrayList) sqlSession.selectList("subwaySpot.insertReply", num);
		
	}	
	public ArrayList displayReply(int num){
		return (ArrayList) sqlSession.selectList("subwaySpot.displayReply", num);
		
	}
	
}
