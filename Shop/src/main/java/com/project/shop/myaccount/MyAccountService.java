package com.project.shop.myaccount;

import java.util.List;

import com.project.shop.member.MemberVO;
import com.project.shop.product.ProductVO;

public interface MyAccountService{
	public MemberVO accountSettingsInfo(String member_id) throws Exception;
	public List<ProductVO> listFavList(String member_id) throws Exception;

}
