package com.project.shop.orders.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertNewOrder(OrderVO orderVO) throws DataAccessException{
		sqlSession.insert("mappers.order.insertNewOrder", orderVO);
	}
	
	public void insertOrderDetail(List<ProductVO> item) throws DataAccessException{
		sqlSession.insert("mappers.order.insertOrderDetail", item);
		
	}
}
