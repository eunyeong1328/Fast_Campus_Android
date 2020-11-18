package com.project.shop.product.board;

import java.util.List;
import java.util.Map;

public interface ProductBoardService {
	//아진
	public int getTotalCount(String product_id) throws Exception;
	public List<ProductBoardQnaVO> getListQna(Map map) throws Exception;
	
	//public ProductVO productDetail(String product_id) throws Exception;	
	//public List<ProductVO> productOption(String product_id) throws Exception;
	//public String productCategoryName(int productCategoryNum) throws Exception;

}
