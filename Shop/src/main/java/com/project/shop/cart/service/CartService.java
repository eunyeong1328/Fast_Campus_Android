package com.project.shop.cart.service;

import com.project.shop.cart.CartVO;

public interface CartService {
 public boolean findCartProduct(CartVO cartVO) throws Exception;
 public void addProductInCart(CartVO cartVO) throws Exception;
}
