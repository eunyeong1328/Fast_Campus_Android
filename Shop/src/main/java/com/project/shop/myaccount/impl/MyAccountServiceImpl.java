package com.project.shop.myaccount.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberVO;
import com.project.shop.myaccount.MyAccountService;
import com.project.shop.product.ProductVO;


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
	public List<ProductVO> listFavList(String member_id) throws Exception {		
		return myAccountDAO.listFavList(member_id);
	}

}
