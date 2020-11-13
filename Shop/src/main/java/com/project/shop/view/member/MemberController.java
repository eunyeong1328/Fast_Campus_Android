package com.project.shop.view.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
=======
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> refs/remotes/origin/wendy
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

<<<<<<< HEAD
=======
import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberService;
>>>>>>> refs/remotes/origin/wendy
import com.project.shop.member.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController extends BaseController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
<<<<<<< HEAD
	@RequestMapping(value="/signupForm.do")
	public ModelAndView signupForm() {
		System.out.println(" ã… ã… ã…‡ ã…£");
		ModelAndView mav = new ModelAndView("signupForm.html");
		return mav;
	}
	
//	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	@RequestMapping(value="/login.do")
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
=======
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, //id,password¸¦ Map¿¡ ´ã¾Æ Àü´Ş
			                  HttpServletRequest request, 
			                  HttpServletResponse response) throws Exception {
		System.out.println("·Î±×ÀÎ ¿äÃ» ÈÄ sql ¹® Àü´Ş");
>>>>>>> refs/remotes/origin/wendy
		ModelAndView mav = new ModelAndView();
<<<<<<< HEAD
		System.out.println("ë¡œê·¸ì¸ í•˜ì´ ");
//		 memberVO=memberService.login(loginMap);
//		if(memberVO!= null && memberVO.getMember_id()!=null){
//			HttpSession session=request.getSession();
//			session=request.getSession();
//			session.setAttribute("isLogOn", true);
//			session.setAttribute("memberInfo",memberVO);
//			
//			String action=(String)session.getAttribute("action");
//			if(action!=null && action.equals("/order/orderEachGoods.do")){
//				mav.setViewName("forward:"+action);
//			}else{
//				mav.setViewName("redirect:/main/main.do");	
//			}
=======
		memberVO = memberService.login(loginMap);//sql¹®À¸·Î Àü´Ş
		System.out.println("·Î±×ÀÎ ÆäÀÌÁö");
		if(memberVO!= null && memberVO.getMember_name()!=null){
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
>>>>>>> refs/remotes/origin/wendy
			
<<<<<<< HEAD
//			
//			
//		}else{
//			String message="ï¿½ë¸˜ï¿½ì” ï¿½ëµ’ï¿½êµ¹  é®ê¾¨ï¿½è¸°ëŠìƒ‡åª›ï¿½ ï¿½ï¿½ç”±ìˆë•²ï¿½ë–. ï¿½ë–ï¿½ë–† æ¿¡ì’“ë ‡ï¿½ì”¤ï¿½ë¹äºŒì‡±ê½­ï¿½ìŠ‚";
//			mav.addObject("message", message);
//			mav.setViewName("/member/loginForm");
//		}
		mav.setViewName("/member/loginForm");
=======
			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")){//ºñ·Î±×ÀÎ »óÅÂ¿¡¼­ ÁÖ¹®ÇÏ±â¸¦ Å¬¸¯ÇÏ¸é
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");//·Î±×ÀÎ ¼º°øÇÏ¸é mainÈ­¸éÀ¸·Î
			}				
		}else{
			String message="¾ÆÀÌµğ³ª  ºñ¹Ğ¹øÈ£°¡ Æ²¸³´Ï´Ù. ´Ù½Ã ·Î±×ÀÎÇØÁÖ¼¼¿ä";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm.jsp");
		}
>>>>>>> refs/remotes/origin/wendy
		return mav;
	}
<<<<<<< HEAD
	

	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		/*try {
		    memberService.addMember(_memberVO);
		    message  = "<script>";
		    message +=" alert('ï¿½ì‰¶ï¿½ì åª›ï¿½ï¿½ì—¯ï¿½ì“£ ï§ë‰ë‚€ï¿½ë’¿ï¿½ë•²ï¿½ë–.æ¿¡ì’“ë ‡ï¿½ì”¤ï§¡ìŒì‘æ¿¡ï¿½ ï¿½ì” ï¿½ë£ï¿½ë¹€ï¿½ë•²ï¿½ë–.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('ï¿½ì˜‰ï¿½ë¾½ ä»¥ï¿½ ï¿½ì‚¤ç‘œì„ï¿½ è«›ì’–ê¹®ï¿½ë»½ï¿½ë’¿ï¿½ë•²ï¿½ë–. ï¿½ë–ï¿½ë–† ï¿½ë–†ï¿½ë£„ï¿½ë¹ äºŒì‡±ê½­ï¿½ìŠ‚');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}*/
		message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
=======

//	@Override
//	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
//	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
//			                HttpServletRequest request, HttpServletResponse response) throws Exception {
//		response.setContentType("text/html; charset=UTF-8");
//		request.setCharacterEncoding("utf-8");
//		String message = null;
//		ResponseEntity resEntity = null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		try {
//		    memberService.addMember(_memberVO);
//		    message  = "<script>";
//		    message +=" alert('È¸¿ø °¡ÀÔÀ» ¸¶ÃÆ½À´Ï´Ù.·Î±×ÀÎÃ¢À¸·Î ÀÌµ¿ÇÕ´Ï´Ù.');";
//		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
//		    message += " </script>";
//		    
//		}catch(Exception e) {
//			message  = "<script>";
//		    message +=" alert('ÀÛ¾÷ Áß ¿À·ù°¡ ¹ß»ıÇß½À´Ï´Ù. ´Ù½Ã ½ÃµµÇØ ÁÖ¼¼¿ä');";
//		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
//		    message += " </script>";
//			e.printStackTrace();
//		}
//		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
//		return resEntity;
//	}
//	
//	@Override
//	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)//id Áßº¹°Ë»ç
//	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ResponseEntity resEntity = null;
//		String result = memberService.overlapped(id);
//		resEntity =new ResponseEntity(result, HttpStatus.OK);
//		return resEntity;
//	}

>>>>>>> refs/remotes/origin/wendy
	
}