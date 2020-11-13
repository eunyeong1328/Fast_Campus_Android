package com.project.shop.view.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView login(MemberVO user , //id,password�� Map�� ��� ����
			                  HttpServletRequest request, 
			                  HttpServletResponse response) throws Exception {
		System.out.println(user.getMember_id());
		System.out.println(user.getPassword());
		
		
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(user);//sql������ ����
		System.out.println("sql 실행 후");
		if(memberVO!= null && memberVO.getMember_name()!=null){
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
			
			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")){//��α��� ���¿��� �ֹ��ϱ⸦ Ŭ���ϸ�
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");//�α��� �����ϸ� mainȭ������
			}				
		}else{
			String message="���̵�  ��й�ȣ�� Ʋ���ϴ�. �ٽ� �α������ּ���";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm.jsp");
		}
		return mav;
	}


	
}