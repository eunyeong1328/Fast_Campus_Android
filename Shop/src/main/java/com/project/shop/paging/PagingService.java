package com.project.shop.paging;

import com.project.shop.member.MemberVO;

public interface PagingService {
	
//	공지사항 글 개수 구하기
	int getNoticeCount();
	
//	FAQ 글 개수 구하기
	int getFAQCount();

//	MemQ 로그인회원 글 개수 구하기
	int getMemQCount(MemberVO memverVO);
	
//	MemQ 전체 글 개수 구하기
	int getMemQCountAll();
	
}
