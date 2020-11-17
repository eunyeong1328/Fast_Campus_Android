package com.project.shop.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	
	public List<ProductVO> listProduct(int productCategoryNum, Map map) throws Exception;
	public ProductVO productDetail(String product_id) throws Exception;	
	public List<ProductVO> productOption(String product_id) throws Exception;
	public String productCategoryName(int productCategoryNum) throws Exception;
	public int getTotalCount(int productCategoryNum) throws Exception;
}
