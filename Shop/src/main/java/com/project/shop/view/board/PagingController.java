package com.project.shop.view.board;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.shop.member.MemberVO;
import com.project.shop.paging.Paging;
import com.project.shop.paging.PagingService;

public class PagingController {
	
	@Autowired
	private PagingService pagingService;
	
	Paging paging = new Paging();
	HashMap<String, Object> map = new HashMap<String, Object>();
	
//	Paging
	public HashMap<String, Object> getPaging(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		if (viewName.equals("/board/notice-tab") || viewName.equals("/board/notice")) {
			paging.setTotalRecord(pagingService.getNoticeCount());
		} else if (viewName.equals("/board/faq-tab") || viewName.equals("/board/faq")) {
			paging.setTotalRecord(pagingService.getFAQCount());
		} else if (viewName.equals("/board/memberQ-tab") || viewName.equals("/board/memberQ")) {
			paging.setTotalRecord(pagingService.getMemQCount(memberVO));
		}

//		전체 게시물의 수 구하기
		paging.setTotalPage();

//		현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			paging.setNowPage(Integer.parseInt(cPage));
		} else {
			paging.setNowPage(1);
		}
		
//		begin, end
		paging.setEnd(paging.getNowPage() * paging.getNumPerPage());
		paging.setBegin(paging.getEnd() - paging.getNumPerPage() + 1);

//		블록
		int nowPage = paging.getNowPage();
		int currentBlock = (nowPage - 1) / paging.getPagePerBlock() + 1;

		paging.setEndPage(currentBlock * paging.getPagePerBlock());
		paging.setBeginPage(paging.getEndPage() - paging.getPagePerBlock() + 1);

//		끝페이지가 전체페이지수보다 크면 끝페이지값 전체페이지수로 변경
		if (paging.getEndPage() > paging.getTotalPage()) {
			paging.setEndPage(paging.getTotalPage());
		}

		map.put("paging", paging);
		
		return map;
	}
	
}
