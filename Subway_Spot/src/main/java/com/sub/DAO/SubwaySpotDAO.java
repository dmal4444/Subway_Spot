package com.sub.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

public class SubwaySpotDAO extends SqlSessionDaoSupport {
	//	����(���ؼ�) ó���� ���ؼ� �̹� <bean> ó���� SqlSession�� �ڵ� ���� ��Ű��.
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
