package com.project.shop.myaccount.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.member.MemberVO;
import com.project.shop.product.ProductVO;

@Repository("myAccountDAO")
public class MyAccountDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{
		MemberVO memberVO = (MemberVO)sqlSession.selectOne("mappers.myaccount.selectMyDetailInfo",member_id);
		return memberVO;
	}
	
	public List<ProductVO> listFavList(String member_id) throws Exception {		
		ArrayList<ProductVO> favList = (ArrayList)sqlSession.selectList("mappers.myaccount.listFavList",member_id);
		return favList;
	}
	
}
