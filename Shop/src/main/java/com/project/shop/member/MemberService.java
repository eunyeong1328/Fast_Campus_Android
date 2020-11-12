package com.project.shop.member;

import java.util.Map;

public interface MemberService {
	public MemberVO login(Map<String, String> loginMap) throws Exception;
	int insertMember(MemberVO vo);
	
}
