package com.project.shop.product.board.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.product.board.ProductBoardQnaVO;

@Repository("productBoardDAO")
public class ProductBoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectTotalCountProductQna(String product_id) {
		int totalCount = sqlSession.selectOne("mappers.product_qna.totalCount", product_id);
		return totalCount;
	}
	public List<ProductBoardQnaVO> selectProductQnaList(Map map){
		List<ProductBoardQnaVO> productQnaList =
				sqlSession.selectList("mappers.product_qna.selectProductQna", map);
		return productQnaList;
	}
}
