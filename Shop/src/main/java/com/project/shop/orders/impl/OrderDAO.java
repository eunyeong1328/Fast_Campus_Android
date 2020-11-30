package com.project.shop.orders.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.orders.OrderVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertNewOrder(OrderVO orderVO) throws DataAccessException{
		sqlSession.insert("mappers.order.insertNewOrder", orderVO);
	}
}
