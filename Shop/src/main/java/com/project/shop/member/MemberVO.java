package com.project.shop.member;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberVO {
	private String member_id;
	private String password;
	private String member_name;
	private String email;
	private String phone;
	private String load_address;
	private String rest_address;
	private int zipNo;
	private Date member_date;
	private String birthday;
	private int pre_score;
	private int this_score;
	private int point;
	private String member_status;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
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
	public String getRest_address() {
		return rest_address;
	}
	public void setRest_address(String rest_address) {
		this.rest_address = rest_address;
	}
	public int getZipNo() {
		return zipNo;
	}
	public void setZipNo(int zipNo) {
		this.zipNo = zipNo;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getPre_score() {
		return pre_score;
	}
	public void setPre_score(int pre_score) {
		this.pre_score = pre_score;
	}
	public int getThis_score() {
		return this_score;
	}
	public void setThis_score(int this_score) {
		this.this_score = this_score;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getMember_status() {
		return member_status;
	}
	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	
	
	

}
