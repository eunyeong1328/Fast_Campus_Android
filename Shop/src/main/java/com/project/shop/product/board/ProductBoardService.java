package com.project.shop.product.board;

import java.util.List;
import java.util.Map;

import com.project.shop.product.Paging;

public interface ProductBoardService {
	//아진
	public int getTotalCount(String product_id) throws Exception;
	public List<ProductBoardQnaVO> getListQna(Map map) throws Exception;
	public Paging pagingInfo(String product_id, String cPage) throws Exception;
	public ProductBoardQnaVO getProductQna(int product_qna_num) throws Exception;
	public void addBoardQna(Map map) throws Exception;
	public void editBoaardQna(Map map) throws Exception;
	public void deleteBoardQna(int product_qna_num) throws Exception;
}
