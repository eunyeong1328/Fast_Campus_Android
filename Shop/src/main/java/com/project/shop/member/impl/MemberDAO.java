package com.project.shop.member.impl;

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
		System.out.println("하이");
		MemberVO member = (MemberVO)sqlSession.selectOne("mappers.member.login",user);
		System.out.println("SQL RESULT : " +member);
		return member;
	}
	
	public int insertMember(MemberVO vo) {//ȸ������
		return sqlSession.insert("mappers.member.insertMember",vo);
	}
}
