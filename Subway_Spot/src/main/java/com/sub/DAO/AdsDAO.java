package com.sub.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.sub.VO.AdsVO;

public class AdsDAO extends SqlSessionDaoSupport {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	//목록보기 실행
	public ArrayList getAdsList(HashMap map){
		return (ArrayList)sqlSession.selectList("AdsSQL.getAdsList", map);
	}
	
	//글쓰기 실행
	public void getAdsWrite(AdsVO vo){
		sqlSession.insert("AdsSQL.getAdsWrite", vo);
	}
	
	//상세보기 실행
	public AdsVO getAdsDetail(int oriNo){
		return (AdsVO)sqlSession.selectOne("AdsSQL.getAdsDetail", oriNo);
	}
	
	//총 개수 구하기 실행
	public int getTotal(){
		return (Integer)sqlSession.selectOne("AdsSQL.getTotal");
	}
	
	//수정하기 질의 실행
	public void getAdsModify(AdsVO vo){
		sqlSession.update("AdsSQL.getAdsModify", vo);
	}
	
	//삭제하기 질의 실행
	public void deleteAds(HashMap map){
		sqlSession.delete("AdsSQL.deleteAds", map);
	}

	
}
