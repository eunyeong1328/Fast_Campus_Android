package com.project.shop.orders;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	 String order_num; //아임포트 거래 고유번호
	 int totalPrice; //결제금액
	 String apply_num; //카드사 승인번호
	 String order_status; //결제상태
	 String pg; //결제한 PG사 -html5_inicis(웹표준방식의 KG이니시스),kakaopay(카카오페이)
	 int paid_at; //결제승인시각
	 String name;
	 String email;
	 String phone;
	 String load_address;
	 String rest_address;
	 String address;
	 String zipNo;
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getApply_num() {
		return apply_num;
	}
	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getPg() {
		return pg;
	}
	public void setPg(String pg) {
		this.pg = pg;
	}
	public int getPaid_at() {
		return paid_at;
	}
	public void setPaid_at(int paid_at) {
		this.paid_at = paid_at;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLoad_address() {
		return load_address;
	}
	public void setLoad_address(String load_address) {
		this.load_address = load_address;
	}
	public String getZipNo() {
		return zipNo;
	}
	public void setZipNo(String zipNo) {
		this.zipNo = zipNo;
	}
	
	
	public String getRest_address() {
		return rest_address;
	}
	public void setRest_address(String rest_address) {
		this.rest_address = rest_address;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "OrderVO [order_num=" + order_num + ", totalPrice=" + totalPrice + ", apply_num=" + apply_num
				+ ", order_status=" + order_status + ", pg=" + pg + ", paid_at=" + paid_at + ", name=" + name
				+ ", email=" + email + ", phone=" + phone + ", load_address=" + load_address + ", zipNo=" + zipNo + "]";
	}
	
	

}
