package com.project.shop.orders.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.orders.OrderService;
import com.project.shop.orders.OrderVO;

@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED) 
public class OrderServiceImpl  implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public void addOrder(OrderVO orderVO) throws Exception {
		orderDAO.insertNewOrder(orderVO);
		
	}

}
