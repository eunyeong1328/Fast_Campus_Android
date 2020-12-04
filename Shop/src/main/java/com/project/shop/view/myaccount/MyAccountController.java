package com.project.shop.view.myaccount;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;
import com.project.shop.myaccount.MyAccountService;
import com.project.shop.myaccount.MyAccountShippingVO;
import com.project.shop.orders.OrderService;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

@Controller
@RequestMapping(value="/myaccount")
public class MyAccountController extends BaseController{
	@Autowired
	private MyAccountService myAccountService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private MyAccountShippingVO myAcccountShipping;

	//계정 정보 삭제
	@RequestMapping(value ="/deleteAccount.do") 
	public ModelAndView deleteAccount(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		//session�뿉�꽌 �쉷�뱷�븳  memberInfo �젙蹂�
		ModelAndView mav = new ModelAndView();
		
		HttpSession session=request.getSession(); 
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String sessionMember_id = memberVO.getMember_id();
		String sessionPass = memberVO.getPassword();
		String voPassword = request.getParameter("current_password");
		
		System.out.println("�꽭�뀡 �븘�씠�뵒" + sessionMember_id);
		System.out.println("�꽭�뀡 鍮꾨쾲" + sessionPass);
		System.out.println("�궡媛� �엯�젰�븳 鍮꾨쾲" + voPassword);

		
		if(!(sessionPass.equals(voPassword))){
			String message="鍮꾨�踰덊샇瑜� �옒 紐� �엯�젰�븯���뒿�땲�떎."; 
	        mav.addObject("message", message);
			mav.setViewName("/myaccount/account-settings");
			return mav;
		}else {
			myAccountService.deleteAccount(sessionMember_id);
			session.invalidate();
			String message="�젙�긽�쟻�쑝濡� �쉶�썝�깉�눜泥섎━媛� �듅�씤�릺�뿀�뒿�땲�떎. \\n 洹몃룞�븞 �씠�슜�빐 二쇱뀛�꽌 吏꾩떖�쑝濡� 媛먯궗�빀�땲�떎."; 
	        mav.addObject("message", message);
			mav.setViewName("/main/main");
			return mav;
		}
	}

//李� 由ъ뒪�듃
	@RequestMapping(value="/account-favourites.do")
	public ModelAndView accountFavourites( HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav =  new ModelAndView(viewName);

		HttpSession session=request.getSession(); 
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		if(isLogOn == null || isLogOn == false || memberVO ==null) {
			mav.addObject("message", "�꽭�뀡�씠 留뚮즺�릺�뿀�뒿�땲�떎. �떎�떆 濡쒓렇�씤�빐二쇱꽭�슂");
			mav.setViewName("/member/loginForm");
		} else {
			String member_id = memberVO.getMember_id();	    	  
			HashMap<String, Object> favMap = myAccountService.selectFavList(member_id);			
			List<ProductVO> favList = (List)favMap.get("favList");
			HashMap<String, List<ProductVO>> optionMap = (HashMap)favMap.get("optionMap");
			mav.addObject("favList", favList);    	  
			mav.addObject("optionMap", optionMap);
			
		}
		return mav;
	}

	@RequestMapping(value="/deleteFav.do")
	public ModelAndView deleteFav( @RequestParam("product_id") String product_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav =  new ModelAndView(viewName);

		HttpSession session=request.getSession(); 
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		if(isLogOn == null || isLogOn == false || memberVO ==null) {
			mav.addObject("message", "�꽭�뀡�씠 留뚮즺�릺�뿀�뒿�땲�떎. �떎�떆 濡쒓렇�씤�빐二쇱꽭�슂");
			mav.setViewName("/member/loginForm");
		} else {
			String member_id = memberVO.getMember_id();
			System.out.println("member_id: "+member_id +", product_id: " + product_id );
			HashMap<String, String> ids = new HashMap<String, String>();
			ids.put("product_id", product_id);
			ids.put("member_id", member_id);
			myAccountService.deleteFav(ids);
			mav.setViewName("redirect:/myaccount/account-favourites.do");
		}
		return mav;
	}

	@RequestMapping(value="/addFav.do")
	public void addFav(@RequestParam("product_id") String product_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{

		HttpSession session=request.getSession(); 
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");		      
		String member_id = memberVO.getMember_id();
		System.out.println("member_id: "+member_id +", product_id: " + product_id );
		HashMap<String, String> ids = new HashMap<String, String>();
		ids.put("product_id", product_id);
		ids.put("member_id", member_id);
		myAccountService.addFav(ids);		    	  

	}
// �궡 二쇰Ц
	@RequestMapping(value="/account-orders.do")
	public ModelAndView selectOrders( HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav =  new ModelAndView(viewName);
		HashMap<String, String> orderHash = new HashMap<>();
		String period = request.getParameter("filter_order_period");
		String status = request.getParameter("filter_order_status");
		System.out.println("period: " + period);
		System.out.println("status: " + status);

		HttpSession session=request.getSession(); 
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		if(isLogOn == null || isLogOn == false || memberVO ==null) {
			mav.addObject("message", "�꽭�뀡�씠 留뚮즺�릺�뿀�뒿�땲�떎. �떎�떆 濡쒓렇�씤�빐二쇱꽭�슂");
			mav.setViewName("/member/loginForm");
		} else {
			String member_id = memberVO.getMember_id();	    	  
			orderHash.put("period",period);
			orderHash.put("status",status);
			orderHash.put("member_id",member_id);
			List<OrderVO> orderList = myAccountService.selectOrderList(orderHash);
			mav.addObject("orderList", orderList);    	  
		}
		return mav;
	}
	
	@RequestMapping(value="/account-order-detail.do")
	public ModelAndView selectOrderDetail( @RequestParam("order_num") String order_num,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav =  new ModelAndView(viewName);

			
			  Map<String, Object> orderMap =myAccountService.selectOrderDetail(order_num);
			  mav.addObject("orderMap", orderMap);
			  
				//蹂�寃�
				String order_status = request.getParameter("order_status");
				System.out.println("order_status: " + order_status);
				System.out.println("order_num: " + order_num);
				if(order_status!=null) {
					HashMap<String, String> statusHash = new HashMap<>();
					statusHash.put("order_status",order_status);
					statusHash.put("order_num",order_num);
					orderService.changeOrderStatus(statusHash);

				}
				return mav;
	}
	

	//怨꾩젙 �닔�젙
	@RequestMapping(value="/modifyMemberInfo.do")
	public ModelAndView modifyMemberInfo(
			@RequestParam HashMap<String, String> memberMap,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");

		memberVO = (MemberVO)myAccountService.modifyMemberInfo(memberMap);
		System.out.println("�닔�젙 泥섎━ �셿猷�!!");

		//�닔�젙�맂 �쉶�썝 �젙蹂대�� �떎�떆 �꽭�뀡�뿉 ���옣�븳�떎.
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
		//		System.out.println("�썑 �슂泥� : " + memberVO);

		mav.setViewName("redirect:/myaccount/account-settings.do");
		return mav;
	}


	//�깉 諛곗넚吏� 異붽�
	@RequestMapping(value="/insertAddressInfo.do")
	public ModelAndView addShipping(@RequestParam HashMap<String, String> memberMap,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession(); 
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");		      
		String member_id = memberVO.getMember_id();
		
		String zipNo = memberMap.get("zipNo");
		String load_address = memberMap.get("load_address");
		String jibun_address = memberMap.get("jibun_address");
		String rest_address = memberMap.get("rest_address");
				
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("member_id",member_id);
		map.put("zipNo",zipNo);
		map.put("load_address",load_address);
		map.put("jibun_address",jibun_address);
		map.put("rest_address",rest_address);
		myAccountService.addAddress(map);
		System.out.println("諛곗넚吏� 異붽� �셿猷�!!");
		
//		List<MyAccountShippingVO> shippList = myAccountService.listshippList(member_id);
//		System.out.println(shippList);
//		mav.addObject("shippList",shippList);
		mav.setViewName("redirect:/myaccount/account-settings.do");
		return mav;
	}
	
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
			List<MyAccountShippingVO> shippList = myAccountService.listshippList(member_id);
			System.out.println(shippList);
			mav.addObject("shippList",shippList);
			return mav;
		}

	//諛곗넚吏� �닔�젙
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

		System.out.println("�븘�씠�뵒: " + member_id + " �슦�렪踰덊샇  :" + zipNo + 
				" �룄濡쒕챸 二쇱냼 : " + load_address + " 吏�踰� 二쇱냼: "+ jibun_address + " �굹癒몄� 二쇱냼 : "+rest_address);

		HashMap<String,String> map = new HashMap<String, String>();
		map.put("zipNo",zipNo);
		map.put("load_address",load_address);
		map.put("jibun_address",jibun_address);
		map.put("rest_address",rest_address);
		map.put("member_id",member_id);

		memberVO = (MemberVO)myAccountService.modifyAddressInfo(map);
		System.out.println("�닔�젙 泥섎━ �셿猷�!!");

		//�닔�젙�맂 �쉶�썝 �젙蹂대�� �떎�떆 �꽭�뀡�뿉 ���옣�븳�떎.
		session.removeAttribute("member_Info");
		session.setAttribute("member_Info", memberVO);
		System.out.println("�썑 �슂泥� : " + memberVO);

		String message="蹂�寃쎈릺�뿀�뒿�땲�떎."; 
		mav.addObject("message", message);
		mav.setViewName("redirect:/myaccount/account-settings.do");
		return mav;
	}

	//�깉 諛곗넚吏� �궘�젣
}
