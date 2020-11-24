package com.project.shop.view.member;


import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
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
	private String CLIENT_ID = "1090287714877-qd2ikq55m2grble3eltcrr4h9s1dpu6b.apps.googleusercontent.com";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

	//   @RequestMapping(value = "/signin-password.do")
	//   public String signuppassword() throws Exception{
	//      return "/member/signup-Password";
	//   }

	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(MemberVO user ,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println(user.getMember_id());
		System.out.println(user.getPassword());
		System.out.println(memberVO);
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(user);
		System.out.println("sql 실행");
		if(memberVO!= null && memberVO.getMember_name()!=null){
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
			System.out.println("##session: " + session.getAttribute("isLogOn") + ", " + session.getAttribute("memberInfo"));

			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")){
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");
			}            
		}else{
			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요"; 
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	
//	@RequestMapping(value="/googleLogin.do",method = RequestMethod.POST)
//	public ModelAndView googleLogin(@RequestBody String param, HttpServletRequest request, HttpServletResponse response) {
//		ModelAndView mav = new ModelAndView();
//		
//		try {
//			NetHttpTransport transport = GoogleNetHttpTransport.newTrustedTransport();
//			String idTokenString = param.split("=")[1];
//
//
//			GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, JSON_FACTORY)
//					// Specify the CLIENT_ID of the app that accesses the backend:
//					.setAudience(Collections.singletonList(CLIENT_ID))
//					// Or, if multiple clients access the backend:
//					//.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
//					.build();
//
//			// (Receive idTokenString by HTTPS POST)
//
//			GoogleIdToken idToken = verifier.verify(idTokenString);
//			if (idToken != null) {
//				Payload payload = idToken.getPayload();
//
//				// Print user identifier
//				String member_id = payload.getSubject();
//				System.out.println("구글로그인의 User ID: " + member_id);
//
//				// Get profile information from payload
//				String email = payload.getEmail();
//				String member_name = (String) payload.get("name");
//				System.out.println(email);
//				
//				MemberVO vo = new MemberVO();
//				vo.setMember_id(member_id);
//				vo.setMember_name(member_name);
//				vo.setEmail(email);
//				
//
//				System.out.println("가기전 memberVO"+vo);
//				//DB에서 로그인 값이 있는지 확인
////				vo = memberService.SnsLogin(vo);
//				
//				//값이 있으면 바로 로그인
//				if(vo!= null && vo.getMember_name()!=null) {
//					System.out.println(vo);
//					System.out.println("로그인을 진행하니다.");
//					mav.addObject(vo);
//					mav.setViewName("/member/login.do");
//					
//				} else {
//					System.out.println(vo);
//					System.out.println("회원가입을 진행합니다.");
//					mav.setViewName("/main/main.do");
//				}				
//				
//				
//
//			}
//
//		}catch(Exception e) {
//			System.out.println(e);
//		}
//
//		return mav;
//	}


	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		response.setHeader("Context-Type", "text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			memberService.addMember(_memberVO);
			message  = "<script>";
			message +=" alert('회원 가입을 마쳤습니다. 로그인창으로 이동합니다.');";
			message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
			message += " </script>";       
		}catch(Exception e) {
			message  = "<script>";
			message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='"+request.getContextPath()+"/member/signupForm.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)//id 以묐났泥댄겕
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}


}
	