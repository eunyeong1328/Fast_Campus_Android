package com.project.shop.view.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.board.BoardService;
import com.project.shop.board.BoardVO;
import com.project.shop.member.MemberVO;
import com.project.shop.paging.Paging;
import com.project.shop.paging.PagingService;

@Controller("boardController")
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private PagingService pagingService;
	
	FileController filecon = new FileController();

	Paging paging = new Paging();
	HashMap<String, Object> map = new HashMap<String, Object>();

//	고객센터 notice-tab 페이지
	@RequestMapping("/notice-tab.do")
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		getPaging(request, response);
		mav.addObject("paging", paging);

		List<BoardVO> noticeList = boardService.getNoticeList(map);
		mav.addObject("NoticeList", noticeList);

		return mav;
	}

//	고객센터 faq-tab 페이지
	@RequestMapping("/faq-tab.do")
	public ModelAndView getFAQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		getPaging(request, response);
		mav.addObject("paging", paging);

		List<BoardVO> faqList = boardService.getFAQList(map);
		mav.addObject("FAQList", faqList);

		return mav;
	}

//	회원 1:1 문의 memberQ-tab 페이지
	@RequestMapping("/memberQ-tab.do")
	public ModelAndView getMemQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		if (memberVO != null && memberVO.getMember_id() != null) {
			getPaging(request, response);
			mav.addObject("paging", paging);
			
			map.put("member_id", memberVO.getMember_id());
			List<BoardVO> memQList = boardService.getMemQList(map);
			
			mav.addObject("MemQList", memQList);
			mav.setViewName(viewName);
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}

//	1:1 문의 글 작성 setViewName
	@RequestMapping(value = "/memQ-insert.do")
	public ModelAndView memQInsertView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		if (memberVO != null && isLogOn == true) {
			mav.setViewName(viewName);
			mav.addObject("memberInfo", memberVO);
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}

//	1:1 문의 글 작성
	@RequestMapping(value = "/memqAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView memQInsert(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String action = (String) multipartRequest.getParameter("action");

		if (action != null && action.equals("memqAdd")) {
			map = filecon.fileUpload(multipartRequest, response);
			boardService.memQInsert(map);
			mav.setViewName("redirect:memberQ-tab.do");
		}

		return mav;
	}

//	1:1 문의 글 수정 setView
	@RequestMapping(value = "/memQ-update.do")
	public ModelAndView memQUpdateView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		if (memberVO != null && isLogOn == true) {
			mav.setViewName(viewName);
			vo.setMember_id(memberVO.getMember_id());
			BoardVO memQ = boardService.getMemQ(vo);
			mav.addObject("memberInfo", memberVO);
			mav.addObject("memQ", memQ);
			mav.setViewName(viewName);
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}

//	1:1 문의 글 수정
	@RequestMapping(value = "/memqUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView memQUpdate(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String action = (String) multipartRequest.getParameter("action");
		String member_qna_num = multipartRequest.getParameter("member_qna_num");
		if (action != null && action.equals("memqUpdate")) {
			map = filecon.fileUpload(multipartRequest, response);
			boardService.memQUpdate(map);
			mav.setViewName("redirect:memQ.do?member_qna_num=" + member_qna_num);
		}

		return mav;
	}
				
//	글 상세 불러오기
	@RequestMapping("/notice.do")
	public ModelAndView getNotice(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		getPaging(request, response);
		mav.addObject("paging", paging);
		
		List<BoardVO> noticeList = boardService.getNoticeList(map);
		
		int maxPre = 0;
		for (BoardVO noti : noticeList) {
			if (maxPre < noti.getPre_no()) {
				maxPre = noti.getPre_no();
				mav.addObject("maxPre", maxPre);
			}
			
			if (noti.getNotice_num() == vo.getNotice_num()) {
				BoardVO notice = noti;
				mav.addObject("notice", notice);
			}
		}
		return mav;
	}

	@RequestMapping("/faq.do")
	public ModelAndView getFAQ(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		getPaging(request, response);
		mav.addObject("paging", paging);

		List<BoardVO> faqList = boardService.getFAQList(map);
		
		int maxPre = 0;
		for (BoardVO fa : faqList) {
			if (maxPre < fa.getPre_no()) {
				maxPre = fa.getPre_no();
				mav.addObject("maxPre", maxPre);
			}
			
			if (fa.getFaq_num() == vo.getFaq_num()) {
				BoardVO faq = fa;
				mav.addObject("faq", faq);
			}
		}
		return mav;
	}

	@RequestMapping("/memQ.do")
	public ModelAndView getMemQ(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if (memberVO != null && memberVO.getMember_id() != null) {
			getPaging(request, response);
			mav.addObject("paging", paging);
			
			map.put("member_id", memberVO.getMember_id());
			List<BoardVO> memQList = boardService.getMemQList(map);
			
			int maxPre = 0;
			for (BoardVO mem : memQList) {
				if (maxPre < mem.getPre_no()) {
					maxPre = mem.getPre_no();
					mav.addObject("maxPre", maxPre);
				}
				if (mem.getMember_qna_num() == vo.getMember_qna_num()) {
					BoardVO memQ = mem;
					mav.addObject("memQ", memQ);
				}
			}
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}

//	Paging
	public void getPaging(HttpServletRequest request, HttpServletResponse response) {
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
	}

}
