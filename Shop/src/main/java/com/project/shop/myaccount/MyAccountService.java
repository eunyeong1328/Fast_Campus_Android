package com.project.shop.myaccount;

import java.util.HashMap;

import com.project.shop.member.MemberVO;

public interface MyAccountService{
	public MemberVO accountSettingsInfo(String member_id) throws Exception;
	public MemberVO modifyMemberInfo(HashMap memberMap) throws Exception;

}
