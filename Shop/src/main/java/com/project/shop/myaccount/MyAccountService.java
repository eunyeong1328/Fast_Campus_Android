package com.project.shop.myaccount;

import com.project.shop.member.MemberVO;

public interface MyAccountService{
	public MemberVO accountSettingsInfo(String member_id) throws Exception;

}
