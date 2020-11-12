package com.project.shop.member.impl;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED) 
//DAO에서 처리한 쿼리문이 정상적으로 완료가 되고,처리 도중 에러가 났을 때 DAO에서 처리한 쿼리를 자동으로 rollback하기 위해
public class MemberServiceImpl implements MemberService{

	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(Map<String, String> loginMap) throws Exception {//로그인
		return memberDAO.login(loginMap);
	}
	
	@Override
	public int insertMember(MemberVO vo) { //회원가입
		return memberDAO.insertMember(vo);
	}

}
