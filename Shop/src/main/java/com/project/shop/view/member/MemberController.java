package com.project.shop.view.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.member.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberController {
//	@Autowired
//	private MemberService memberService;
//	@Autowired
//	private MemberVO memberVO;
	
	@RequestMapping(value="/signupForm.do")
	public ModelAndView signupForm() {
		System.out.println(" ㅎ ㅏ ㅇ ㅣ");
		ModelAndView mav = new ModelAndView("signupForm.html");
		return mav;
	}
	
//	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	@RequestMapping(value="/login.do")
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("로그인 하이 ");
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
			
//			
//			
//		}else{
//			String message="�븘�씠�뵒�굹  鍮꾨�踰덊샇媛� ��由쎈땲�떎. �떎�떆 濡쒓렇�씤�빐二쇱꽭�슂";
//			mav.addObject("message", message);
//			mav.setViewName("/member/loginForm");
//		}
		mav.setViewName("/member/loginForm");
		return mav;
	}
	

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
		    message +=" alert('�쉶�썝 媛��엯�쓣 留덉낀�뒿�땲�떎.濡쒓렇�씤李쎌쑝濡� �씠�룞�빀�땲�떎.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('�옉�뾽 以� �삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎. �떎�떆 �떆�룄�빐 二쇱꽭�슂');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}*/
		message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
}