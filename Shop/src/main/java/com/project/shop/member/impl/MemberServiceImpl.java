package com.project.shop.member.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;

@Service("memberService")
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
