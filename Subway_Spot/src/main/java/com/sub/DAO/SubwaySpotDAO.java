package com.sub.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.sub.VO.HotplaceVO;

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
	public ArrayList getHotInfo(HotplaceVO vo){
		return (ArrayList) sqlSession.selectList("subwaySpot.getHotInfo", vo);
	}
	
	public int getTotal(HotplaceVO vo){
		return sqlSession.selectOne("subwaySpot.getTotal", vo);
	}
	
	public ArrayList getHotMarker(HashMap map){
		return (ArrayList) sqlSession.selectList("subwaySpot.getHotMarker", map);
		
	}
	
	//���ڵ� �޾ƿ��� ���� �Լ�
	public int getCode(String from){
		return (Integer) sqlSession.selectOne("subwaySpot.getCode", from);
	}
	
	//����ǥ �޾ƿ��� �����Լ�
	public ArrayList getCoords(String station){
		
		return(ArrayList) sqlSession.selectList("subwaySpot.getCoords", station);
	}
	
}
