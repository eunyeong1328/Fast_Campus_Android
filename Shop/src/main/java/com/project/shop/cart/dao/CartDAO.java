package com.project.shop.cart.dao;

import org.springframework.dao.DataAccessException;

import com.project.shop.cart.CartVO;

public interface CartDAO {
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException;
	public void insertProductInCart(CartVO cartVO) throws DataAccessException;
}
