package com.project.shop.view.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.cart.CartController;
import com.project.shop.cart.CartVO;
import com.project.shop.cart.service.CartService;
import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartVO cartVO;
	
	@Autowired
	private MemberVO memberVO;

	@Override
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value="/addProductInCart.do", method= RequestMethod.POST, produces="application/text; charset=utf8")
	public String addProductInCart(@RequestParam("product_id") String product_id,
								   @RequestParam("quantity") int quantity,
															   HttpServletRequest request, 
															   HttpServletResponse response) throws Exception {
		System.out.println("================================================================================");
		System.out.println("quantity"+quantity);
		System.out.println("product_id"+product_id);
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		cartVO.setProduct_id(product_id);
		cartVO.setQuantity(quantity);
		boolean isAreadyExisted = cartService.findCartProduct(cartVO);
		if(isAreadyExisted==true) {
			return "already_existed";
		}else {
			cartService.addProductInCart(cartVO);
			return "add_success";
	 }
	}

	@Override
	public String modifyCartQty(String product_id, int quantity, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView removeCartProduct(int cart_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	


	
}
