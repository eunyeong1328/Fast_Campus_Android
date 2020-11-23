package com.project.shop.view.myaccount;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;
import com.project.shop.myaccount.MyAccountService;

@Controller
@RequestMapping(value="/myaccount")
public class MyAccountController extends BaseController{
	@Autowired
	private MyAccountService myAccountService;
	@Autowired
	private MemberVO memberVO;
	
	
	@RequestMapping(value ="/account-settings.do" ) //회원정보 뛰우기
	   public ModelAndView accountSettingsInfo(@RequestParam("member_id") String member_id,
			   HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String viewName=(String)request.getAttribute("viewName");
		 ModelAndView mav = new ModelAndView(viewName);
		 System.out.println(member_id);
//		 String member_id = request.getParameter("member_id");
		 MemberVO member_Info = myAccountService.accountSettingsInfo(member_id);
		 System.out.println(member_Info);
		 mav.addObject("member_info", member_Info);
		 return mav;
	   }
	 
	@RequestMapping(value="/modifyMemberInfo.do")
	public ModelAndView modifyMemberInfo(
			@RequestParam HashMap<String, String> memberMap,
		HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("member_Info");
		
		System.out.println("HashMap memberid = " + memberMap.get("member_id"));		
		System.out.println("password = " + memberMap.get("password"));
		memberVO = (MemberVO)myAccountService.modifyMemberInfo(memberMap);
		System.out.println("수정 처리 완료!!");
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		session.removeAttribute("member_Info");
		session.setAttribute("member_Info", memberVO);
		System.out.println("후 요청 : " + memberVO);
		
		String message="변경되었습니다."; 
        mav.addObject("message", message);
        mav.setViewName("redirect:/myaccount/account-settings.do?member_id=" + memberVO.getMember_id());
		return mav;

	}
}
