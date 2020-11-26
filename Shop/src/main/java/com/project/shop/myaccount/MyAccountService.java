package com.project.shop.myaccount;

import java.util.HashMap;

import com.project.shop.member.MemberVO;
import com.project.shop.product.ProductVO;

public interface MyAccountService{
	public MemberVO accountSettingsInfo(String member_id) throws Exception;
	public MemberVO modifyMemberInfo(HashMap memberMap) throws Exception;
	public MemberVO modifyAddressInfo(HashMap map) throws Exception;

}
