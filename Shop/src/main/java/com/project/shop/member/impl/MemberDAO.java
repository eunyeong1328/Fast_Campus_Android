package com.project.shop.member.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.member.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberVO login(MemberVO user) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mappers.member.login",user);
		return member;
	}
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mappers.member.insertNewMember", memberVO);
	}
	
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mappers.member.selectOverlappedID",id);
		return result;
	}
	
	public MemberVO SnsLogin(MemberVO user) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mappers.member.SnsLogin",user);
		return member;
	}

}
