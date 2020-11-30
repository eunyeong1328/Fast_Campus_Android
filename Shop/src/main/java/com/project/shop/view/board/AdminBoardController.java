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

@Controller("adminBoardController")
@RequestMapping(value = "/adminboard")
public class AdminBoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private PagingService pagingService;
	
	FileController filecon = new FileController();
	
	Paging paging = new Paging();
	HashMap<String, Object> map = new HashMap<String, Object>();
	
//	관리자 공지사항
	@RequestMapping(value="noticeList.do")
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println("admin noticeList: " + viewName);
		getPaging(request, response);
		mav.addObject("paging", paging);

		List<BoardVO> noticeList = boardService.getNoticeList(map);
		mav.addObject("NoticeList", noticeList);

		return mav;
	}
	
//	관리자 FAQ
	@RequestMapping(value="/faqList.do")
	public ModelAndView getFAQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		List<BoardVO> faqList = boardService.getFAQList(map);
		mav.addObject("FAQList", faqList);
		
		return mav;
	}
	
//	관리자 1:1 문의
	@RequestMapping(value="/memberQnaList.do")
	public ModelAndView memQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		
		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
			getPaging(request, response);
			mav.addObject("paging", paging);
			
			List<BoardVO> memQList = boardService.getMemQListAll(map);
			mav.addObject("MemQList", memQList);
			mav.setViewName(viewName);
		} else {
			String message = "관리자만 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
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

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		mav.addObject("member_id", memberVO.getMember_id());
		
		List<BoardVO> noticeList = boardService.getNoticeList(map);

		for (BoardVO noti : noticeList) {
			if (noti.getR_num() == vo.getR_num() || noti.getNotice_num() == vo.getNotice_num()) {
				boardService.noticeViewUpdate(vo.getNotice_num());
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

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		mav.addObject("member_id", memberVO.getMember_id());
		
		List<BoardVO> faqList = boardService.getFAQList(map);

		for (BoardVO fa : faqList) {
			if (fa.getR_num() == vo.getR_num() || fa.getFaq_num() == vo.getFaq_num()) {
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
			
			List<BoardVO> memQList = boardService.getMemQListAll(map);
			
			for (BoardVO mem : memQList) {
				if (mem.getR_num() == vo.getR_num() || mem.getMember_qna_num() == vo.getMember_qna_num()) {
					System.out.println("??????" + vo.getMember_qna_num());
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
	
//	관리자 공지사항 등록 setViewName
	@RequestMapping(value="/noticeInsert.do")
	public ModelAndView noticeInsertView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		System.out.println("/admin/board VIEWNAME: " + viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
			mav.setViewName(viewName);
		} else {
			String message = "관리자만 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	
//	관리자 공지사항 등록
	@RequestMapping(value = "/noticeAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeInsert(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("/admin/board VIEWNAME: " + viewName);
		String action = (String) request.getParameter("action");
		
		if (action != null && action.equals("noticeAdd")) {
			map = filecon.fileUpload(multipartRequest, response);
			boardService.noticeInsert(map);
			mav.setViewName("redirect:/adminboard/noticeList.do");
		}
		
		return mav;
	}

//	관리자 FAQ 등록
	@RequestMapping(value="/faqInsert.do")
	public ModelAndView FAQInsert(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		System.out.println("/admin/board VIEWNAME: " + viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
			mav.setViewName(viewName);
			String action = (String) request.getParameter("action");
			
			if (action != null && action.equals("faqAdd")) {
				boardService.faqInsert(vo);
				mav.setViewName("redirect:/adminboard/faqList.do");
			}
		} else {
			String message = "관리자만 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	
//	공지사항 글 수정 setView
	@RequestMapping(value = "/noticeUpdate.do")
	public ModelAndView noticeUpdateView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
			mav.setViewName(viewName);
			BoardVO notice = boardService.getNotice(vo);
			mav.addObject("notice", notice);
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}

//	공지사항 글 수정
	@RequestMapping(value = "/noticeUpdating.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeUpdate(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String action = (String) multipartRequest.getParameter("action");
		String notice_num = multipartRequest.getParameter("notice_num");
		if (action != null && action.equals("noticeUpdating")) {
			map = filecon.fileUpload(multipartRequest, response);
			boardService.noticeUpdate(map);
			mav.setViewName("redirect:/adminboard/notice.do?notice_num=" + notice_num);
		}

		return mav;
	}
	
//	관리자 FAQ 수정
	@RequestMapping(value="/faqUpdate.do")
	public ModelAndView FAQUpdate(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
			mav.setViewName(viewName);
			BoardVO faq = boardService.getFAQ(vo);
			mav.addObject("faq", faq);
			
			String action = (String) request.getParameter("action");
			
			if (action != null && action.equals("faqUpdate")) {
				boardService.faqUpdate(vo);
				mav.setViewName("redirect:/adminboard/faq.do?faq_num=" + vo.getFaq_num());
			}
		} else {
			String message = "관리자만 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	
//	관리자 공지사항 삭제
	@RequestMapping(value = "/noticeDelete.do")
	public ModelAndView noticeDelete(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.noticeDelete(vo);
		mav.setViewName("redirect:/adminboard/noticeList.do");
		return mav;
	}
	
//	관리자 FAQ 삭제
	@RequestMapping(value = "/faqDelete.do")
	public ModelAndView faqDelete(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.faqDelete(vo);
		mav.setViewName("redirect:/adminboard/faqList.do");
		return mav;
	}
	
//	관리자 1:1 문의/답변 삭제
	@RequestMapping(value = "/memqDelete.do")
	public ModelAndView memqDelete(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.memqDelete(vo);
		mav.setViewName("redirect:/adminboard/memberQnaList.do");
		return mav;
	}

//	관리자 1:1 답변 등록 setViewName
	@RequestMapping(value="/memqAdminInsert.do")
	public ModelAndView FAQInsertView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
			BoardVO memQ = boardService.getMemQ(vo);
			mav.addObject("memQ", memQ);
			mav.addObject("memberInfo", memberVO);
			mav.setViewName(viewName);
		} else {
			String message = "관리자만 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	
//	관리자 1:1 답변 등록
	@RequestMapping(value="/memqAdminAdd.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView FAQInsert(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String action = (String) request.getParameter("action");
		
		if (action != null && action.equals("memqAdminAdd")) {
			map = filecon.fileUpload(multipartRequest, response);
			boardService.memqAdminInsert(map);
			mav.setViewName("redirect:/adminboard/memberQnaList.do");
		}
		
		return mav;
	}
	
//	관리자 답변 글 수정 setView
	@RequestMapping(value = "/memqAdminUpdate.do")
	public ModelAndView memQAdminUpdateView(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
			BoardVO memQ = boardService.getMemQ(vo);
			mav.addObject("memQ", memQ);
			mav.setViewName(viewName);
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}

//	관리자 답변 수정
	@RequestMapping(value = "/memqAdminUpdating.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView memQUpdate(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String action = (String) multipartRequest.getParameter("action");
		String member_qna_num = multipartRequest.getParameter("member_qna_num");
		if (action != null && action.equals("memqAdminUpdating")) {
			map = filecon.fileUpload(multipartRequest, response);
			boardService.memqAdminUpdate(map);
			mav.setViewName("redirect:/adminboard/memQ.do?member_qna_num=" + member_qna_num);
		}

		return mav;
	}

//	Paging
	public void getPaging(HttpServletRequest request, HttpServletResponse response) {
		
		String viewName = (String) request.getAttribute("viewName");

		if (viewName.equals("/adminboard/noticeList") || viewName.equals("/adminboard/notice")) {
			paging.setTotalRecord(pagingService.getNoticeCount());
			System.out.println("paging notice insert 후 list notice count " + paging.getTotalRecord());
		} else if (viewName.equals("/adminboard/faqList") || viewName.equals("/adminboard/faq")) {
			paging.setTotalRecord(pagingService.getFAQCount());
		} else if (viewName.equals("/adminboard/memberQnaList") || viewName.equals("/adminboard/memQ")) {
			paging.setTotalRecord(pagingService.getMemQCountAll());
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
