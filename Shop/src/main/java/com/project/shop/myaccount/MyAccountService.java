package com.project.shop.myaccount;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.shop.member.MemberVO;
import com.project.shop.orders.OrderVO;
import com.project.shop.product.ProductVO;

public interface MyAccountService{
	public MemberVO accountSettingsInfo(String member_id) throws Exception;
	public MemberVO modifyMemberInfo(HashMap memberMap) throws Exception;
	public MemberVO modifyAddressInfo(HashMap map) throws Exception;
	public HashMap<String, Object> selectFavList(String member_id) throws Exception;
	public void deleteFav(HashMap ids) throws Exception;
	public void addFav(HashMap ids) throws Exception;
	public List<OrderVO> listOrderList(String member_id) throws Exception;
	public Map<String,Object> listOrderDetail(String order_num) throws Exception;
	public void deleteAccount(String member_id) throws Exception;

}
