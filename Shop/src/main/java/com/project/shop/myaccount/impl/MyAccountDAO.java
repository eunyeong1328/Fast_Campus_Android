package com.project.shop.myaccount.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.member.MemberVO;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

@Repository("myAccountDAO")
public class MyAccountDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{
		MemberVO memberVO = (MemberVO)sqlSession.selectOne("mappers.myaccount.selectMyDetailInfo",member_id);
		return memberVO;
	}
	
	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException{
		System.out.println("MyAccountDAO = " + memberMap.get("member_id"));
		sqlSession.update("mappers.myaccount.modifyMemberInfo",memberMap);
	}
	
	public void modifyAddressInfo(HashMap map) throws DataAccessException{
		sqlSession.update("mappers.myaccount.modifyAddressInfo",map);
	}
	
	public List<ProductVO> listFavList(String member_id) throws Exception {      
	      ArrayList<ProductVO> favList = (ArrayList)sqlSession.selectList("mappers.myaccount.listFavList",member_id);
	      return favList;
	   }
	public String listFavItem(HashMap ids) throws Exception{
		String product_id = (String)sqlSession.selectOne("mappers.myaccount.listFavitem", ids);
		return product_id;
	}
	
	public void deleteFav(HashMap ids) throws Exception{
		sqlSession.delete("mappers.myaccount.deleteFavList",ids);
	}
	
	public void addFav(HashMap ids) throws Exception{
		sqlSession.insert("mappers.myaccount.addFavList",ids);
	}
	
	public List<OrderVO> listOrderList(String member_id) throws Exception {      
	      ArrayList<OrderVO> orderList = (ArrayList)sqlSession.selectList("mappers.order.listOrderList",member_id);
	      return orderList;
	   }
	public OrderVO selectOrderDetail(String order_num) throws Exception{
		OrderVO orderVO = (OrderVO)sqlSession.selectOne("mappers.order.selectOrderDetail",order_num);
		return orderVO;
	}
	
	public List<ProductVO> selectOrderDetailProduct(String order_num) throws Exception{
		List<ProductVO> productList = (List)sqlSession.selectList("mappers.order.selectOrderDetailProduct", order_num);
		return productList;
		
	}
	
	public void deleteAccount(String member_id) throws Exception{
		sqlSession.delete("mappers.myaccount.deleteAccount",member_id);
	}
}
