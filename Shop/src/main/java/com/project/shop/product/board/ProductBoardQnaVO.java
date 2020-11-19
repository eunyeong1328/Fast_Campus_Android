package com.project.shop.product.board;

import java.sql.Date;

import org.springframework.stereotype.Component;

//상품문의 
@Component
public class ProductBoardQnaVO {

	private int product_qna_num;// 상품 질문 번호
	private String product_id;// 상품 아이디
	private String member_id;// 회원 아이디
	private String title;// 제목
	private String contents; // 내용
	private String image; // 이미지
	private int qna_category_num; // 질문 카테고리 번호
	private Date reg_date;// 등록 날짜
	private int views; // 조회수
	private int parent_num; // 부모글 번호
	private int rowNum;
	
	public ProductBoardQnaVO() {

	}

	
	
	
	public ProductBoardQnaVO(int product_qna_num, String product_id, String member_id, String title, String contents,
			String image, int qna_category_num, Date reg_date, int views, int parent_num, int rowNum) {
		super();
		this.product_qna_num = product_qna_num;
		this.product_id = product_id;
		this.member_id = member_id;
		this.title = title;
		this.contents = contents;
		this.image = image;
		this.qna_category_num = qna_category_num;
		this.reg_date = reg_date;
		this.views = views;
		this.parent_num = parent_num;
		this.rowNum = rowNum;
	}




	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getproduct_qna_num() {
		return product_qna_num;
	}

	public void setproduct_qna_num(int product_qna_num) {
		this.product_qna_num = product_qna_num;
	}

	public String getproduct_id() {
		return product_id;
	}

	public void setproduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getmember_id() {
		return member_id;
	}

	public void setmember_id(String member_id) {
		this.member_id = member_id;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getqna_category_num() {
		return qna_category_num;
	}

	public void setqna_category_num(int qna_category_num) {
		this.qna_category_num = qna_category_num;
	}

	public Date getreg_date() {
		return reg_date;
	}

	public void setreg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getparent_num() {
		return parent_num;
	}

	public void setparent_num(int parent_num) {
		this.parent_num = parent_num;
	}
}