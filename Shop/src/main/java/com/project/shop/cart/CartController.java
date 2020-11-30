package com.project.shop.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String addProductInCart(@RequestParam("product_id") String product_id,
												 @RequestParam("quantity") int quantity,
												 HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody String modifyCartQty(@RequestParam("product_id") String product_id,
											   @RequestParam("quantity") int quantity,
											     HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String plusQuantity(@RequestParam("product_id") String product_id,
		                                         HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String minusQuantity(@RequestParam("product_id") String product_id,
            									 HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String removeCartProduct(@RequestParam("cart_id") int cart_id,
										   @RequestParam("product_id") String product_id,
												 HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView deleteAllProduct(HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
