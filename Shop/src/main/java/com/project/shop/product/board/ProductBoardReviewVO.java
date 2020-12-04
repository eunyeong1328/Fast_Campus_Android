package com.project.shop.product.board;

import java.sql.Date;


public class ReviewVO {//상품 후기 

	private int reviewNum; // 후기 번호
	private String productId; // 상품 아이디
	private String memberId; // 회원 아이디
	private String title; // 제목
	private String contents; // 내용
	private String image1; // 이미지1
	private int views; // 조회수
	private int rated; // 별점
	private Date regDate; // 등록 날짜
	private String image2; // 이미지2
	private String image3; // 이미지3

	public ReviewVO() {

	}

	public ReviewVO(int reviewNum, String productId, String memberId, String title, String contents,
			String image1, int views, int rated, Date regDate, String image2, String image3) {
		this.reviewNum = reviewNum;
		this.productId = productId;
		this.memberId = memberId;
		this.title = title;
		this.contents = contents;
		this.image1 = image1;
		this.views = views;
		this.rated = rated;
		this.regDate = regDate;
		this.image2 = image2;
		this.image3 = image3;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getRated() {
		return rated;
	}

	public void setRated(int rated) {
		this.rated = rated;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	@Override
	public String toString() {
		return "ProductBoardReviewVO [reviewNum=" + reviewNum + ", productId=" + productId + ", memberId=" + memberId
				+ ", title=" + title + ", contents=" + contents + ", image1=" + image1 + ", views=" + views + ", rated="
				+ rated + ", regDate=" + regDate + ", image2=" + image2 + ", image3=" + image3 + "]";
	}

}