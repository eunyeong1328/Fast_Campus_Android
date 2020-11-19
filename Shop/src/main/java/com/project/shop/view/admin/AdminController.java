package com.project.shop.view.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;

@Controller("adminController")
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {
	@Autowired
	ProductService service;

	@RequestMapping(value = "/productAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productAdd(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		mav.setViewName((String) request.getAttribute("viewName"));
		return mav;
		
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public void add(ProductVO vo ,MultipartHttpServletRequest request) {
		
		if(vo != null && request != null) {
			service.insertProduct(vo,request);
		}
				
	}
}
