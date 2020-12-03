package com.project.shop.myaccount.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.member.MemberVO;
import com.project.shop.myaccount.MyAccountService;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;
import com.project.shop.product.impl.ProductDAO;


@Service("myAccountService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyAccountServiceImpl implements MyAccountService{

	@Autowired
	private MyAccountDAO myAccountDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public MemberVO accountSettingsInfo(String member_id) throws Exception {
		return myAccountDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public MemberVO modifyMemberInfo(HashMap memberMap) throws Exception {
		System.out.println("MyAccountSercieImpl = " + memberMap.get("member_id"));
		myAccountDAO.modifyMemberInfo(memberMap);
		String member_id=(String)memberMap.get("member_id");
		return myAccountDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public MemberVO modifyAddressInfo(HashMap map) throws Exception {
		System.out.println("요건 배송지 수정 요청 아이디이다. " + map.get("member_id"));
		myAccountDAO.modifyAddressInfo(map);
		String member_id=(String)map.get("member_id");
		return myAccountDAO.selectMyDetailInfo(member_id);
	}
	
	@Override
	   public HashMap<String, Object> selectFavList(String member_id) throws Exception {
		List<ProductVO> favList = myAccountDAO.selectFavList(member_id);
		HashMap<String, List<ProductVO>> optionMap = new HashMap<>();
		
		
		for(ProductVO vo : favList) {
			System.out.println(vo);
			optionMap.put(vo.getProduct_id(), productDAO.selectOption(vo.getProduct_id()));			
		}
		
		HashMap<String, Object> favMap = new HashMap<>();
		favMap.put("favList", favList);
		favMap.put("optionMap", optionMap);	
		 
		
	      return favMap;
	   }

	@Override
	public void deleteFav(HashMap ids) throws Exception {
		myAccountDAO.deleteFav(ids);
		
	}

	@Override
	public void addFav(HashMap ids) throws Exception {
		String product_id = (String)ids.get("product_id");
		String _product_id = (String)myAccountDAO.selectFavItem(ids);
		if(!(product_id.equals(_product_id))) {			
			myAccountDAO.addFav(ids);
		} else {
			myAccountDAO.deleteFav(ids);
			myAccountDAO.addFav(ids);
		}
	}

	@Override
	public List<OrderVO> listOrderList(String member_id) throws Exception {
		return myAccountDAO.listOrderList(member_id);
		
	}

	@Override
	public Map<String, Object> listOrderDetail(String order_num) throws Exception {
		Map<String, Object> orderMap = new HashMap<String,Object>();
		OrderVO orderDetail = myAccountDAO.selectOrderDetail(order_num);
		List<ProductVO> productList = myAccountDAO.selectOrderDetailProduct(order_num);
		orderMap.put("order", orderDetail);
		orderMap.put("product", productList);
		return orderMap;
		
		
	}

	@Override
	public void deleteAccount(String member_id) throws Exception {
		myAccountDAO.deleteAccount(member_id);
	}

}
