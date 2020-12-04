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
import com.project.shop.orders.OrderVO;
import com.project.shop.paging.PagingService;

@Controller("boardController")
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private PagingService pagingService;
	
	FileController filecon = new FileController();
	
	PagingController pagingCon = new PagingController();

	HashMap<String, Object> map = new HashMap<String, Object>();

//	고객센터 notice-tab 페이지
	@RequestMapping("/notice-tab.do")
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

//		게시글 count
		int count = pagingService.getNoticeCount(map);
		map = pagingCon.getPaging(count, request, response);
		mav.addObject("paging", map.get("paging"));

		List<BoardVO> noticeList = boardService.getNoticeList(map);
		mav.addObject("NoticeList", noticeList);

		return mav;
	}

//	고객센터 faq-tab 페이지
	@RequestMapping("/faq-tab.do")
	public ModelAndView getFAQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

//		게시글 count
		int count = pagingService.getFAQCount();
		map = pagingCon.getPaging(count, request, response);
		mav.addObject("paging", map.get("paging"));

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
//			게시글 count
			int count = pagingService.getMemQCount(memberVO);
			map = pagingCon.getPaging(count, request, response);
			mav.addObject("paging", map.get("paging"));
			
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
		String cPage = request.getParameter("cPage");
		
		if (memberVO != null && isLogOn == true) {
			mav.setViewName(viewName);
			vo.setMember_id(memberVO.getMember_id());
			BoardVO memQ = boardService.getMemQ(vo);
			mav.addObject("memQ", memQ);
			mav.addObject("cPage", cPage);
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
		String cPage = multipartRequest.getParameter("cPage");
		String member_qna_num = multipartRequest.getParameter("member_qna_num");
		
		if (action != null && action.equals("memqUpdate")) {
			map = filecon.fileUpload(multipartRequest, response);
			boardService.memQUpdate(map);
			mav.setViewName("redirect:memQ.do?member_qna_num=" + member_qna_num + "&cPage=" + cPage);
		}

		return mav;
	}
				
//	글 상세 불러오기
	@RequestMapping("/notice.do")
	public ModelAndView getNotice(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

//		게시글 count
		int count = pagingService.getNoticeCount(map);
		map = pagingCon.getPaging(count, request, response);
		mav.addObject("paging", map.get("paging"));
		
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

//		게시글 count
		int count = pagingService.getFAQCount();
		map = pagingCon.getPaging(count, request, response);
		mav.addObject("paging", map.get("paging"));

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
//			게시글 count
			int count = pagingService.getMemQCount(memberVO);
			map = pagingCon.getPaging(count, request, response);
			mav.addObject("paging", map.get("paging"));
			
			map.put("member_id", memberVO.getMember_id());
			System.out.println("ㅁㅁ???????" + memberVO.getMember_id());
			List<BoardVO> memQList = boardService.getMemQList(map);
			
			for (BoardVO mem : memQList) {
				if (mem.getR_num() == vo.getR_num() || mem.getMember_qna_num() == vo.getMember_qna_num()) {
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
	
	@RequestMapping("/member_order_list.do")
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String member_id = request.getParameter("member_id");
		List<OrderVO> orderList = boardService.getMemberOrderList(member_id);
		mav.addObject("orderList", orderList);
		return mav;
	}

}
