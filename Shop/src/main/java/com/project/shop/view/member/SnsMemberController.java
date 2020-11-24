package com.project.shop.view.member;

import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
@RequestMapping(value="/snsMember")
public class SnsMemberController extends BaseController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberController memberController;
	private String CLIENT_ID = "1090287714877-qd2ikq55m2grble3eltcrr4h9s1dpu6b.apps.googleusercontent.com";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

	
	@RequestMapping(value="/googleLogin.do",method = RequestMethod.POST)
	public ModelAndView googleLogin(@RequestBody String param, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		try {
			NetHttpTransport transport = GoogleNetHttpTransport.newTrustedTransport();
			String idTokenString = param.split("=")[1];

			GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, JSON_FACTORY)
					.setAudience(Collections.singletonList(CLIENT_ID))
					.build();

			GoogleIdToken idToken = verifier.verify(idTokenString);
			if (idToken != null) {
				Payload payload = idToken.getPayload();

				String member_id = payload.getSubject();
				System.out.println("구글로그인의 User ID: " + member_id);

				String email = payload.getEmail();
				String member_name = (String) payload.get("name");
				System.out.println(email);
				
				MemberVO vo = new MemberVO();
				vo.setMember_id(member_id);
				vo.setMember_name(member_name);
				vo.setEmail(email);				

				System.out.println("가기전 memberVO"+vo);
				
				//DB에서 로그인 값이 있는지 확인
				vo = memberService.SnsLogin(vo);
				
				//값이 있으면 바로 로그인
				if(vo!= null && vo.getMember_name()!=null) {
					System.out.println(vo);
					System.out.println("로그인을 진행하니다.");
					mav.addObject(vo);
					return memberController.login(vo, request, response);
					
				} else {
					System.out.println(vo);
					System.out.println("회원가입을 진행합니다.");
					mav.setViewName("/main/main.do");
				}				
				
				

			}

		}catch(Exception e) {
			System.out.println(e);
		}

		return mav;
	}
}
