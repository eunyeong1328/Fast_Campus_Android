package com.project.shop.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED) 
//DAO���� ó���� �������� ���������� �Ϸᰡ �ǰ�,ó�� ���� ������ ���� �� DAO���� ó���� ������ �ڵ����� rollback�ϱ� ����
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO user) throws Exception {//�α���
		return memberDAO.login(user);
	}
	
	@Override
	public int insertMember(MemberVO vo) { //ȸ������
		return memberDAO.insertMember(vo);
	}

}
