package com.project.shop.member;

import java.util.Map;

public interface MemberService {
	public MemberVO login(MemberVO user) throws Exception;
	int insertMember(MemberVO vo);
	
}
