package com.project.shop.view.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController extends BaseController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, //id,password를 Map에 담아 전달
			                  HttpServletRequest request, 
			                  HttpServletResponse response) throws Exception {
		System.out.println("로그인 요청 후 sql 문 전달");
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);//sql문으로 전달
		System.out.println("로그인 페이지");
		if(memberVO!= null && memberVO.getMember_name()!=null){
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
			
			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")){//비로그인 상태에서 주문하기를 클릭하면
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");//로그인 성공하면 main화면으로
			}				
		}else{
			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm.jsp");
		}
		return mav;
	}

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
//		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
//		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
//		    message += " </script>";
//		    
//		}catch(Exception e) {
//			message  = "<script>";
//		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
//		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
//		    message += " </script>";
//			e.printStackTrace();
//		}
//		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
//		return resEntity;
//	}
//	
//	@Override
//	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)//id 중복검사
//	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ResponseEntity resEntity = null;
//		String result = memberService.overlapped(id);
//		resEntity =new ResponseEntity(result, HttpStatus.OK);
//		return resEntity;
//	}

	
}