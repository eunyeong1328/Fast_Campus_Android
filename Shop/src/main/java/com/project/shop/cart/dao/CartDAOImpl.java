package com.project.shop.cart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.cart.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//이미 바구니에 추가된 상품인지 조회
	@Override 
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String result = sqlSession.selectOne("mappers.cart.selectCountInCart", cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void insertProductInCart(CartVO cartVO) throws DataAccessException {
		int cart_id=selectMaxCartId();
		cartVO.setCart_id(cart_id);
		sqlSession.insert("mappers.cart.insertProductInCart", cartVO);
		
	}
	private int selectMaxCartId() throws DataAccessException{
		int cart_id =sqlSession.selectOne("mappers.cart.selectMaxCartId");
		return cart_id;
	}
	
}
