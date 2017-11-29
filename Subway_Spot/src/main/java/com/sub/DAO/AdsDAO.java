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
	
	//��Ϻ��� ����
	public ArrayList getAdsList(HashMap map){
		return (ArrayList)sqlSession.selectList("AdsSQL.getAdsList", map);
	}
	
	//�۾��� ����
	public void getAdsWrite(AdsVO vo){
		sqlSession.insert("AdsSQL.getAdsWrite", vo);
	}
	
	//�󼼺��� ����
	public AdsVO getAdsDetail(int oriNo){
		return (AdsVO)sqlSession.selectOne("AdsSQL.getAdsDetail", oriNo);
	}
	
	//�� ���� ���ϱ� ����
	public int getTotal(){
		return (Integer)sqlSession.selectOne("AdsSQL.getTotal");
	}
	
	//�����ϱ� ���� ����
	public void getAdsModify(AdsVO vo){
		sqlSession.update("AdsSQL.getAdsModify", vo);
	}
	
	//�����ϱ� ���� ����
	public void deleteAds(HashMap map){
		sqlSession.delete("AdsSQL.deleteAds", map);
	}

	
}
