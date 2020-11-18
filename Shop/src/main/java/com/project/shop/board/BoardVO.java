package com.project.shop.board;

import java.sql.Date;

public class BoardVO {

//	공지사항
	private int notice_num;
	private String title;
	private String contents;
	private Date reg_date;
	private int views;
	private String image;

//	FAQ
	private int faq_num;
	private int qna_category_num;
	private String qna_category_name;

	// 상품문의
	private int product_qna_num;
	private String product_id;
	private String member_id;
	private int parent_num;

//	1:1 문의
	private int member_qna_num;
	private int order_num;
	private String email;
	private String phone;

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public int getQna_category_num() {
		return qna_category_num;
	}

	public void setQna_category_num(int qna_category_num) {
		this.qna_category_num = qna_category_num;
	}

	public int getProduct_qna_num() {
		return product_qna_num;
	}

	public void setProduct_qna_num(int product_qna_num) {
		this.product_qna_num = product_qna_num;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getParent_num() {
		return parent_num;
	}

	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}

	public int getMember_qna_num() {
		return member_qna_num;
	}

	public void setMember_qna_num(int member_qna_num) {
		this.member_qna_num = member_qna_num;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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

	public String getQna_category_name() {
		return qna_category_name;
	}

	public void setQna_category_name(String qna_category_name) {
		this.qna_category_name = qna_category_name;
	}
	
}
