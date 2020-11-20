package com.project.shop.board.paging;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PagingDAO {

	@Autowired
	private SqlSessionTemplate board;
	
//	공지사항 전체 건수 조회
	public int getNoticeCount() {
		return board.selectOne("mapper.board.getNoticeCount");
	}
	
//	FAQ 전체 건수 조회
	public int getFAQCount() {
		return board.selectOne("mapper.board.getFAQCount");
	}

	public int getMemQCount() {
		return board.selectOne("mapper.board.getMemQCount");
	}
	
}
