package com.project.shop.admin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.member.MemberVO;

@Repository("adminMemberDao")
public class AdminMemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<MemberVO> listMember(Map<String, Object> condMap) throws DataAccessException{
		ArrayList<MemberVO>  memberList=(ArrayList)sqlSession.selectList("mapper.admin.member.listMember",condMap);
		return memberList;
	}
	

	

}
