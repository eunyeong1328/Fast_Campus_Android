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
	
	public MemberVO login(Map<String, String> loginMap) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mappers.member.login",loginMap);
		return member;
	}
	
	public int insertMember(MemberVO vo) {//회원가입
		return sqlSession.insert("mappers.member.insertMember",vo);
	}
}
