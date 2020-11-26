package com.project.shop.myaccount.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberVO;
import com.project.shop.myaccount.MyAccountService;


@Service("myAccountService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyAccountServiceImpl implements MyAccountService{

	@Autowired
	private MyAccountDAO myAccountDAO;
	
	@Override
	public MemberVO accountSettingsInfo(String member_id) throws Exception {
		return myAccountDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public MemberVO modifyMemberInfo(HashMap memberMap) throws Exception {
		System.out.println("MyAccountSercieImpl = " + memberMap.get("member_id"));
		myAccountDAO.modifyMemberInfo(memberMap);
		String member_id=(String)memberMap.get("member_id");
		return myAccountDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public MemberVO modifyAddressInfo(HashMap map) throws Exception {
		System.out.println("요건 배송지 수정 요청 아이디이다. " + map.get("member_id"));
		myAccountDAO.modifyAddressInfo(map);
		String member_id=(String)map.get("member_id");
		return myAccountDAO.selectMyDetailInfo(member_id);
	}

}
