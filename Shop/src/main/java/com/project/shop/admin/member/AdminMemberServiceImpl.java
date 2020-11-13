package com.project.shop.admin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberVO;


@Service("adminMemberService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override
	public ArrayList<MemberVO> listMember(Map<String, Object> condMap) throws Exception {
		return adminMemberDAO.listMember(condMap);
	}

	@Override
	public MemberVO memberDetail(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyMemberInfo(HashMap memberMap) throws Exception {
		// TODO Auto-generated method stub

	}

}
