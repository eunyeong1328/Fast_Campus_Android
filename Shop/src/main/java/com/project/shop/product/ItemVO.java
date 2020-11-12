package com.project.shop.product;

import java.sql.Date;

//제품 
public class ItemVO {

	// 제품 번호
	private int itemNum;

	// 가격
	private int price;

	// 재고
	private int stock;

	// 판매
	private int sales;

	// 할인률
	private int discount;

	// 등록 날짜 제품 등록일자
	private Date regDate;

	// 단위 가격
	private int unitPrice;

	// 상품 아이디
	private String productId;

	public ItemVO() {
		super();
	}

	public ItemVO(int itemNum, int price, int stock, int sales, int discount, Date regDate, int unitPrice,
			String productId) {
		super();
		this.itemNum = itemNum;
		this.price = price;
		this.stock = stock;
		this.sales = sales;
		this.discount = discount;
		this.regDate = regDate;
		this.unitPrice = unitPrice;
		this.productId = productId;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@Override
	public String toString() {
		return "ItemVO [itemNum=" + itemNum + ", price=" + price + ", stock=" + stock + ", sales=" + sales
				+ ", discount=" + discount + ", regDate=" + regDate + ", unitPrice=" + unitPrice + ", productId="
				+ productId + "]";
	}

}