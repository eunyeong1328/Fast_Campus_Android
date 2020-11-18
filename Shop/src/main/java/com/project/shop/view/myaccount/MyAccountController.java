package com.project.shop.view.myaccount;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;

@Controller
@RequestMapping(value="/myaccount")
public class MyAccountController extends BaseController{
	
	 @RequestMapping(value="/orders.do" ,method = RequestMethod.GET)
	 public ModelAndView orders(@RequestParam(required = false,value="message")  String message,
			   HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "my_page"); //마이페이지 사이드 메뉴로 설정한다.
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		

		return mav;
	}
	   
	 @RequestMapping(value="/favorites.do" ,method = RequestMethod.GET)
	   public ModelAndView favorites(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      HttpSession session=request.getSession();
	      
	      return mav;
	   }
	 
	 @RequestMapping(value="/settings.do" ,method = RequestMethod.GET)
	   public ModelAndView settings(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      HttpSession session=request.getSession();
	      
	      return mav;
	   }
}
