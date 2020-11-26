package com.project.shop.view.myaccount;

import java.util.List;

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
import com.project.shop.member.MemberVO;
import com.project.shop.myaccount.MyAccountService;
import com.project.shop.product.ProductVO;

@Controller
@RequestMapping(value="/myaccount")
public class MyAccountController extends BaseController{
	@Autowired
	private MyAccountService myAccountService;
//	@Autowired
//	private MemberVO memberVO;
	
//	 @RequestMapping(value="/orders.do" ,method = RequestMethod.GET)
//	 public ModelAndView orders(@RequestParam(required = false,value="message")  String message,
//			   HttpServletRequest request, HttpServletResponse response)  throws Exception {
//		HttpSession session=request.getSession();
//		session=request.getSession();
//		session.setAttribute("side_menu", "my_page"); //마이페이지 사이드 메뉴로 설정한다.
//		
//		String viewName=(String)request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView(viewName);
//		
//
//		return mav;
//	}
//	   
//	 @RequestMapping(value="/favorites.do" ,method = RequestMethod.GET)
//	   public ModelAndView favorites(HttpServletRequest request, HttpServletResponse response) throws Exception {
//	      ModelAndView mav = new ModelAndView();
//	      HttpSession session=request.getSession();
//	      
//	      return mav;
//	   }
	 
	@RequestMapping(value ="/account-settings.do",method = RequestMethod.GET) //회원정보 뛰우기
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
	 
//	 @RequestMapping(value="/modifyMyInfo.do", method = RequestMethod.POST)
//	public ResponseEntity modifyInfo(@RequestParam("attribute") String attribute, // 수정할 회원 정보 속성을 저장한다.
//								@RequestParam("value") String value, //회원 정보의 속성 값을 저장한다.
//								HttpServletRequest request, HttpServletResponse response
//			) throws Exception{
//		return null;
//		 
//	 }
	
		
	//정원
	
	  @RequestMapping(value="/account-favourites.do")
	  public ModelAndView accountFavourites( HttpServletRequest request, HttpServletResponse response)
			  throws Exception {
		  HttpSession session=request.getSession(); 
	      MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
	      String member_id = memberVO.getMember_id();

	  String viewName=(String)request.getAttribute("viewName");
	  ModelAndView mav =  new ModelAndView(viewName);
	  List<ProductVO> favList = myAccountService.listFavList(member_id);
	  System.out.println(favList.get(0));
	  mav.addObject("favList", favList);
	  return mav;
	 }
		 

}
