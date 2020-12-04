ackage com.project.shop.view.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberService;
import com.project.shop.member.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MembertController extends BaseController{
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
//		    message +=" alert('ȸ�� ������ ���ƽ��ϴ�.�α���â���� �̵��մϴ�.');";
//		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
//		    message += " </script>";
//		    
//		}catch(Exception e) {
//			message  = "<script>";
//		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
//		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
//		    message += " </script>";
//			e.printStackTrace();
//		}
//		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
//		return resEntity;
//	}
//	
//	@Override
//	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)//id �ߺ��˻�
//	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ResponseEntity resEntity = null;
//		String result = memberService.overlapped(id);
//		resEntity =new ResponseEntity(result, HttpStatus.OK);
//		return resEntity;
//	}

	
}