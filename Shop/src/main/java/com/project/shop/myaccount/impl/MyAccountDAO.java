package com.project.shop.myaccount.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.member.MemberVO;

@Repository("myAccountDAO")
public class MyAccountDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{
		MemberVO memberVO = (MemberVO)sqlSession.selectOne("mappers.myaccount.selectMyDetailInfo",member_id);
		return memberVO;
	}
	
	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException{
		System.out.println("MyAccountDAO = " + memberMap.get("member_id"));
		sqlSession.update("mappers.myaccount.modifyMemberInfo",memberMap);
	}
}
