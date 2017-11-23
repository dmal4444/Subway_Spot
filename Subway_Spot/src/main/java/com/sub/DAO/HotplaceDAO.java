package com.sub.DAO;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;


public class HotplaceDAO extends SqlSessionDaoSupport {
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	public ArrayList hotPlaceinfo() {
		System.out.println("HotplaceDAO - hotPlaceinfo() »£√‚"); 
		return (ArrayList) sqlSession.selectList("subwaySpot.hotPlaceinfo");
	}
}

