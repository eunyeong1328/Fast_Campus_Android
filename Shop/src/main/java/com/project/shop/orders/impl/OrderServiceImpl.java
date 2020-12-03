package com.project.shop.orders.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.cart.CartVO;
import com.project.shop.orders.OrderService;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED) 
public class OrderServiceImpl  implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public void addOrder(OrderVO orderVO, Map<String, List> cartMap) throws Exception {		
		String order_status = orderVO.getOrder_status();
		if(order_status.equals("paid")) orderVO.setOrder_status("결제완료");
		//orders 테이블에 정보추가
		orderDAO.insertNewOrder(orderVO);
		
		//orders_detail 테이블에 정보 추가		
		List<ProductVO> myProductList= cartMap.get("myProductList");	
		String order_num = orderVO.getOrder_num();
		
		for(ProductVO vo : myProductList) {
			vo.setOrder_num(order_num);
		}

		orderDAO.insertOrderDetail(myProductList);
		
				
		
	}

}
