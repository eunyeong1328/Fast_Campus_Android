package com.project.shop.product.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.product.board.ProductBoardService;
import com.project.shop.product.board.ProductBoardQnaVO;

@Service("productBoardService")
public class ProductBoardServiceImpl implements ProductBoardService{

	@Autowired
	private ProductBoardDAO productBoardDAO;
	
	@Override
	public int getTotalCount(String product_id) throws Exception {
		int totalCount = productBoardDAO.selectTotalCountProductQna(product_id);
		return totalCount;
	}

	@Override
	public List<ProductBoardQnaVO> getListQna(Map map) throws Exception {
		List<ProductBoardQnaVO> productQnaList = productBoardDAO.selectProductQnaList(map);
		return productQnaList;
	}
}
