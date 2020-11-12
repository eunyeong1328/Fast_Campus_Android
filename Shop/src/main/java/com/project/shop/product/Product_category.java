package com.project.shop.product;

//상품 카테고리 
public class Product_category {

	// 상품 카테고리 번호
	private int productCategoryNum;

	// 상품 카테고리 이름
	private String productCategoryName;

	public Product_category() {
	}

	public Product_category(int productCategoryNum, String productCategoryName) {
		this.productCategoryNum = productCategoryNum;
		this.productCategoryName = productCategoryName;
	}

	public int getProductCategoryNum() {
		return productCategoryNum;
	}

	public void setProductCategoryNum(int productCategoryNum) {
		this.productCategoryNum = productCategoryNum;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}

	@Override
	public String toString() {
		return "Product_category [productCategoryNum=" + productCategoryNum + ", productCategoryName="
				+ productCategoryName + "]";
	}

}