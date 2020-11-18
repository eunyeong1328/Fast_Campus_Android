package com.project.shop.board.paging;

public interface PagingService {
	
//	공지사항 글 개수 구하기
	int getNoticeCount();
	
//	FAQ 글 개수 구하기
	int getFAQCount();
	
//	ProQ 글 개수 구하기
	int getProQCount();

//	MemQ 글 개수 구하기
	int getMemQCount();
	
}
