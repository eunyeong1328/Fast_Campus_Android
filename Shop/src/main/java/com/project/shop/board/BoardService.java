package com.project.shop.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

//	공지사항 전체 불러오기
	List<BoardVO> getNoticeList(Map<String, Integer> map);
	
//	공지사항 상세페이지
	BoardVO getNotice(BoardVO vo);

//	FAQ 전체 불러오기
	List<BoardVO> getFAQList(Map<String, Integer> map);
	
//	FAQ 상세페이지
	BoardVO getFAQ(BoardVO vo);
	
//	상품문의 전체 불러오기
	List<BoardVO> getProQList(Map<String, Integer> map);

//	회원문의 전체 불러오기
	List<BoardVO> getMemQList(Map<String, Integer> map);
	
//	회원문의 작성
	void memQInsert(BoardVO vo);
	
}
