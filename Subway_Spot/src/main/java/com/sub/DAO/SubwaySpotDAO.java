package com.sub.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

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
	public ArrayList getHotInfo(HashMap map){
		System.out.println(map+" DAO");
		return (ArrayList) sqlSession.selectList("subwaySpot.getHotInfo", map);
		
	}
	
}
