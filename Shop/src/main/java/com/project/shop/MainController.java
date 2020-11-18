package com.project.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;



/**
 * Handles requests for the application home page.
 */
@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController extends BaseController {
		@Autowired
		ProductService service;
	
		@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView main(ModelAndView mav,HttpServletRequest request, HttpServletResponse response) throws Exception{
			List<ProductVO> bestlist = null,newlist = null;
			
			if(bestlist == null && newlist == null ) {
				bestlist = service.bestList();
				mav.addObject("bestlist",bestlist);
				newlist = service.newList();
				mav.addObject("newlist",newlist);
			}
			//HttpSession session;
			
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			System.out.println("mav: " + mav);
			System.out.println("as");
			return mav;
	}
	
}
