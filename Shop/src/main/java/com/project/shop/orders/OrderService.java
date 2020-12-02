package com.project.shop.orders;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public void addOrder(OrderVO orderVO, Map<String,List> cartMap) throws Exception;

}
