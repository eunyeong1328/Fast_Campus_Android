package com.project.shop.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED) 
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO user) throws Exception {
		return memberDAO.login(user);
	}
	
	@Override
	public MemberVO SnsLogin(MemberVO user) throws Exception {
		return memberDAO.SnsLogin(user);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
	
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	
	@Override
	public MemberVO SnsLogin(MemberVO user) throws Exception {
		return memberDAO.SnsLogin(user);
	}


}
