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
	
	//계정 정보 확인
	@RequestMapping(value ="/account-settings.do") 
	   public ModelAndView accountSettingsInfo(
			   HttpServletRequest request, HttpServletResponse response) throws Exception {
		//session에서 획득한  memberInfo 정보
		HttpSession session=request.getSession(); 
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(member_id);
		MemberVO memberInfo = myAccountService.accountSettingsInfo(member_id);
		mav.addObject("memberinfo", memberInfo);
		return mav;
	   }

	//계정 수정
	@RequestMapping(value="/modifyMemberInfo.do")
	public ModelAndView modifyMemberInfo(
			@RequestParam HashMap<String, String> memberMap,
		HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		
		memberVO = (MemberVO)myAccountService.modifyMemberInfo(memberMap);
		System.out.println("수정 처리 완료!!");
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
//		System.out.println("후 요청 : " + memberVO);
		
        mav.setViewName("redirect:/myaccount/account-settings.do");
		return mav;
	}
	
	
	//새 배송지 추가
	
	//배송지 수정
	@RequestMapping(value="/modifyAddressInfo.do")
	public ModelAndView modifyMemberAddressInfo(
			@RequestParam HashMap<String, String> memberMap,
		HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		String zipNo = memberMap.get("zipNo");
		String load_address = memberMap.get("load_address");
		String jibun_address = memberMap.get("jibun_address");
		String rest_address = memberMap.get("rest_address");
		
		System.out.println("아이디: " + member_id + " 우편번호  :" + zipNo + 
				" 도로명 주소 : " + load_address + " 지번 주소: "+ jibun_address + " 나머지 주소 : "+rest_address);

		HashMap<String,String> map = new HashMap<String, String>();
		map.put("zipNo",zipNo);
		map.put("load_address",load_address);
		map.put("jibun_address",jibun_address);
		map.put("rest_address",rest_address);
		map.put("member_id",member_id);
		
		memberVO = (MemberVO)myAccountService.modifyAddressInfo(map);
		System.out.println("수정 처리 완료!!");
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		session.removeAttribute("member_Info");
		session.setAttribute("member_Info", memberVO);
		System.out.println("후 요청 : " + memberVO);
		
		String message="변경되었습니다."; 
        mav.addObject("message", message);
        mav.setViewName("redirect:/myaccount/account-settings.do");
		return mav;
	}
	
	//새 배송지 삭제
}
