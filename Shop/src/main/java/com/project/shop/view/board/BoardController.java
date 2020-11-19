package com.project.shop.view.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.board.BoardService;
import com.project.shop.board.BoardVO;
import com.project.shop.board.paging.Paging;
import com.project.shop.board.paging.PagingService;

@Controller("boardController")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private PagingService pagingService;
	
	Paging paging = new Paging();
	Map<String, Integer> map = new HashMap<String, Integer>();

//	고객센터 notice-tab 페이지
	@RequestMapping("/notice-tab.do")
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		List<BoardVO> notice = boardService.getNoticeList(map);
		mav.addObject("NoticeList", notice);
		
		return mav;
	}
	
//	고객센터 faq-tab 페이지
	@RequestMapping("/faq-tab.do")
	public ModelAndView getFAQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		List<BoardVO> faq = boardService.getFAQList(map);
		mav.addObject("FAQList", faq);
		
		return mav;
	}

//	회원 1:1 문의 memberQ-tab 페이지
	@RequestMapping("/memberQ-tab.do")
	public ModelAndView getMemQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		List<BoardVO> MemQ = boardService.getMemQList(map);
		mav.addObject("MemQList", MemQ);
		
		return mav;
	}
	
//	1:1 문의 글 작성
	@RequestMapping(value="/memQ-insert.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memQInsert(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		
		if (viewName.equals("/board/memQ-insert")) {
			mav.setViewName(viewName);
		}
		
		String action = (String) request.getParameter("action");
		
		if (action != null && action.equals("memQ-insert")) {
			boardService.memQInsert(vo);
			mav.setViewName("redirect:memberQ-tab.do?nowTab=tab-3");
		} 
		
		return mav;
	}
	
//	1:1 문의 글 수정
	@RequestMapping(value="/memQ-update.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memQUpdate(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		BoardVO memQ = boardService.getMemQ(vo);
		mav.addObject("memQ", memQ);
		
		if (viewName.equals("/board/memQ-update")) {
			mav.setViewName(viewName);
		}
		
		String action = (String) request.getParameter("action");
		
		if (action != null && action.equals("memQ-update")) {
			boardService.memQUpdate(vo);
			mav.setViewName("redirect:memQ.do?nowTab=tab-3&member_qna_num=" + memQ.getMember_qna_num());
		} 
		
		return mav;
	}
	
//	글 상세 불러오기
	@RequestMapping("/notice.do")
	public ModelAndView getNotice(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		BoardVO notice = boardService.getNotice(vo);
		mav.addObject("notice", notice);
		
		return mav;
	}
	
	@RequestMapping("/faq.do")
	public ModelAndView getFAQ(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		BoardVO faq = boardService.getFAQ(vo);
		mav.addObject("faq", faq);
		
		return mav;
	}
	
	@RequestMapping("/memQ.do")
	public ModelAndView getMemQ(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		BoardVO memQ = boardService.getMemQ(vo);
		mav.addObject("memQ", memQ);
		
		return mav;
	}
	
//	Paging
	public void getPaging(HttpServletRequest request, HttpServletResponse response) {
		
		String nowTab = request.getParameter("nowTab");
		
		if (nowTab == null || nowTab == "tab-1") {
			paging.setNowTab("tab-1");
			paging.setTotalRecord(pagingService.getNoticeCount());
		} else if (nowTab.equals("tab-2")) {
			paging.setNowTab(nowTab);
			paging.setTotalRecord(pagingService.getFAQCount());
		} else if (nowTab.equals("tab-3")) {
			paging.setNowTab(nowTab);
			paging.setTotalRecord(pagingService.getMemQCount());
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
		
		map.put("begin", paging.getBegin());
		map.put("end", paging.getEnd());

	}
	
}
	
