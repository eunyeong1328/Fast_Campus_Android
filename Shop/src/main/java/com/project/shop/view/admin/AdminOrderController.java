package com.project.shop.view.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.orders.OrderService;
import com.project.shop.orders.OrderVO;

@Controller("adminOrderController")
@RequestMapping(value="/admin/order")
public class AdminOrderController extends BaseController {
	@Autowired
	private OrderService orderService;
	
	//정원: order
	@RequestMapping(value="orders.do")
	public ModelAndView selectOrders( HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav =  new ModelAndView(viewName);   	  
		
		//변경
		String order_status = request.getParameter("order_status");
		String order_num = request.getParameter("order_num");
		System.out.println("order_status: " + order_status);
		System.out.println("order_num: " + order_num);
		if(order_status!=null) {
			HashMap<String, String> statusHash = new HashMap<>();
			statusHash.put("order_status",order_status);
			statusHash.put("order_num",order_num);
			orderService.changeOrderStatus(statusHash);
			
		}
		
		//검색
		HashMap<String, String> orderHash = new HashMap<>();
		String period = request.getParameter("filter_order_period");
		String status = request.getParameter("filter_order_status");
		System.out.println("period: " + period);
		System.out.println("status: " + status);
	  
		orderHash.put("period",period);
		orderHash.put("status",status);
		List<OrderVO> orderList = orderService.selectAdminOrderList(orderHash);
		mav.addObject("orderList", orderList); 
		
		

		return mav;	

	}
	
}
