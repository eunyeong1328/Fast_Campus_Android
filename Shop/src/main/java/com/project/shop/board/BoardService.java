package com.project.shop.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

//	Notice List
	List<BoardVO> getNoticeList(Map<String, Integer> map);
//	FAQ List	
	List<BoardVO> getFAQList(Map<String, Integer> map);
//	1:1 List
	List<BoardVO> getMemQList(Map<String, Integer> map);
	
//	Notice detail
	BoardVO getNotice(BoardVO vo);
//	FAQ detail
	BoardVO getFAQ(BoardVO vo);
//	1:1 detail
	BoardVO getMemQ(BoardVO vo);
	
//	회원문의 작성
	void memQInsert(BoardVO vo);
//	회원문의 수정
	void memQUpdate(BoardVO vo);
	
}
