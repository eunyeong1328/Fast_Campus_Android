package com.project.shop.view.board;

import java.util.Enumeration;
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
import com.project.shop.paging.PagingService;
import com.project.shop.product.ProductVO;

@Controller("adminBoardController")
@RequestMapping(value = "/adminboard")
public class AdminBoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PagingService pagingService;
	
	FileController filecon = new FileController();
	
	PagingController pagingCon = new PagingController();
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	
//	관리자 공지사항
	@RequestMapping(value="noticeList.do")
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		int count = pagingService.getNoticeCount(map);
		map = pagingCon.getPaging(count, request, response);
		mav.addObject("paging", map.get("paging"));
		
		List<BoardVO> noticeList = boardService.getNoticeList(map);
		mav.addObject("NoticeList", noticeList);

		return mav;
	}
	
//	공지사항 검색 List
	@RequestMapping(value="getSearchNoticeList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView getSearchNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()){
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			map.put(name, value);
			if (name.equals("search_daterange")) {
				value = value.replaceAll(" ", "");
				String[] dateArray = value.split("-");
				map.put("dateArray", dateArray);
			}
		}
		
		int count = pagingService.getSearchNoticeCount(map);

		map = pagingCon.getPaging(count, request, response);
		mav.addObject("paging", map.get("paging"));
		
		List<BoardVO> noticeList = boardService.getSearchNoticeList(map);
		mav.addObject("NoticeList", noticeList);
		
		return mav;
	}
	
//	관리자 FAQ
	@RequestMapping(value="/faqList.do")
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
	
//	관리자 1:1 문의
	@RequestMapping(value="/memberQnaList.do")
	public ModelAndView memQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		
		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
//			게시글 count
			int count = pagingService.getMemQCountAll();
			map = pagingCon.getPaging(count, request, response);
			mav.addObject("paging", map.get("paging"));
			
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

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		mav.addObject("member_id", memberVO.getMember_id());
		
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
//			게시글 count
			int count = pagingService.getMemQCountAll();
			map = pagingCon.getPaging(count, request, response);
			mav.addObject("paging", map.get("paging"));
			
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
		String cPage = request.getParameter("cPage");
		mav.setViewName("redirect:/adminboard/noticeList.do?cPage=" + cPage);
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
	
	/*냐아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ*/
	@RequestMapping(value="productCategoryList.do")
	public ModelAndView productCategoryList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<ProductVO> categoryList = boardService.getCategoryList();
		mav.addObject("categoryList", categoryList);
		return mav;
	}
	@RequestMapping(value="proCategoryInsert.do")
	public ModelAndView proCategoryInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String product_category_name = request.getParameter("product_category_name");
		boardService.categoryInsert(product_category_name);
		mav.setViewName("redirect:/adminboard/productCategoryList.do");
		return mav;
	}
	@RequestMapping(value="proCategoryUpdate.do")
	public ModelAndView proCategoryUpdate(ProductVO productVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.categoryUpdate(productVO);
		mav.setViewName("redirect:/adminboard/productCategoryList.do");
		return mav;
	}
	@RequestMapping(value="proCategoryDelete.do")
	public ModelAndView proCategoryDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		int product_category_num = Integer.parseInt(request.getParameter("product_category_num"));
		boardService.categoryDelete(product_category_num);
		mav.setViewName("redirect:/adminboard/productCategoryList.do");
		return mav;
	}

}
