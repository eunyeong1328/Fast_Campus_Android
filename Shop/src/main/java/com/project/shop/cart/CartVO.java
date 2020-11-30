package com.project.shop.cart;

import org.springframework.stereotype.Component;

@Component
public class CartVO {
 private int cart_id;
 private String member_id;
 private String product_id;
 private int quantity;
@Override
public String toString() {
	return "CartVO [cart_id=" + cart_id + ", member_id=" + member_id + ", product_id=" + product_id + ", quantity="
			+ quantity + "]";
}
public String getMember_id() {
	return member_id;
}
public void setMember_id(String member_id) {
	this.member_id = member_id;
}
public String getProduct_id() {
	return product_id;
}
public void setProduct_id(String product_id) {
	this.product_id = product_id;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getCart_id() {
	return cart_id;
}
public void setCart_id(int cart_id) {
	this.cart_id = cart_id;
}
 
}
