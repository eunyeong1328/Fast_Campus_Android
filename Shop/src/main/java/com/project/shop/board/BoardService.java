package com.project.shop.board;

import java.util.HashMap;
import java.util.List;

public interface BoardService {

//	Notice List
	List<BoardVO> getNoticeList(HashMap<String, Object> map);
//	FAQ List	
	List<BoardVO> getFAQList(HashMap<String, Object> map);
//	1:1 List
	List<BoardVO> getMemQList(HashMap<String, Object> map);

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
