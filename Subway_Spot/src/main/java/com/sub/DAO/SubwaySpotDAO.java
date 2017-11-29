package com.sub.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.sub.VO.HotplaceVO;
import com.sub.VO.ReplyVO;
import com.sub.VO.StationVO;

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
		return (ArrayList) sqlSession.selectList("subwaySpot.getHotInfo", vo);
	}
	
	public int getTotal(HotplaceVO vo){
		return sqlSession.selectOne("subwaySpot.getTotal", vo);
	}
	
	public ArrayList getHotMarker(HashMap map){
		return (ArrayList) sqlSession.selectList("subwaySpot.getHotMarker", map);
		
	}
	
	//역코드 받아오기 실행 함수
	public StationVO getCode(String from){
		return (StationVO) sqlSession.selectOne("subwaySpot.getCode", from);
	}
	
	//역좌표 받아오기 실행함수
	public ArrayList getCoords(String station){
		
		return(ArrayList) sqlSession.selectList("subwaySpot.getCoords", station);
	}
	
	//Tab 정보 받아오기 실행함수
	public ArrayList getTabinfo(HashMap map){
	      return (ArrayList) sqlSession.selectList("subwaySpot.getTabinfo", map);
	      
	}
	
	//댓글 집어넣기 실행함수
    public void insertReply(ReplyVO vo){
       sqlSession.insert ("subwaySpot.insertReply", vo);         
 }
 
    //댓글 꺼내기 실행함수
    public ArrayList displayReply(int num){
       return (ArrayList) sqlSession.selectList("subwaySpot.displayReply", num);
       
    }
	
	
}
