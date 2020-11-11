package com.project.shop.view.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberController extends BaseController{
//	@Autowired
//	private MemberService memberService;
//	@Autowired
//	private MemberVO memberVO;
	
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
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
//			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
//			mav.addObject("message", message);
//			mav.setViewName("/member/loginForm");
//		}
		return mav;
	}

	//그냥 해봄
//	@RequestMapping(value="/signup.do")
//	public ModelAndView signup(@RequestParam Map<String, String> loginMap,
//			HttpServletRequest request, HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/member/signupForm");
//		System.out.println("mav: " + mav);
//
//		return mav;
//	}
}