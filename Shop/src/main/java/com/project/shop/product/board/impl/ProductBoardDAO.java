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
	
	public void insertBoardQna(Map map) {
		int boardQnaNo = selectQnaNo()+1;
		System.out.println("borardQnaNo: " + boardQnaNo);
		map.put("product_qna_num", boardQnaNo);
		sqlSession.insert("mappers.product_qna.insertBoardQna", map);
	}
	public ProductBoardQnaVO selectProductQna(int product_qna_num) {
		System.out.println("DAO에서 PRODUCT_QNA_NUM : "+product_qna_num);
		ProductBoardQnaVO productQna = sqlSession.selectOne("mappers.product_qna.selectQna", product_qna_num);
		return productQna;
	}
	private int selectQnaNo() {
		System.out.println("글번호 가져오기 전 ");
		int qnaNo =sqlSession.selectOne("mappers.product_qna.selectQnaNo");
		System.out.println("글번호 가져옴");
		return qnaNo;
	}
	public void updateBoardQna(Map map) {
		sqlSession.update("mappers.product_qna.updateBoardQna", map);
	}
	public void deleteBoardQna(int product_qna_num) {
		sqlSession.delete("mappers.product_qna.deleteBoardQna", product_qna_num);
	}
}
