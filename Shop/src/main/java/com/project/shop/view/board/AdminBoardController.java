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

@Controller
@RequestMapping(value = "/admin")
public class AdminBoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private PagingService pagingService;
	
	FileController filecon = new FileController();
	PagingController pagecon = new PagingController();
	
	Paging paging = new Paging();
	HashMap<String, Object> map = new HashMap<String, Object>();
	
//	관리자 공지사항
	@RequestMapping(value="noticeList.do")
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		map = pagecon.getPaging(request, response);
		paging = (Paging) map.get("paging");
		mav.addObject("paging", paging);

		List<BoardVO> noticeList = boardService.getNoticeList(map);
		mav.addObject("NoticeList", noticeList);

		return mav;
	}
	
//	관리자 FAQ
	@RequestMapping(value="faqList.do")
	public ModelAndView getFAQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		map = pagecon.getPaging(request, response);
		paging = (Paging) map.get("paging");
		mav.addObject("paging", paging);
		
		List<BoardVO> faqList = boardService.getFAQList(map);
		mav.addObject("FAQList", faqList);
		
		return mav;
	}
	
//	관리자 1:1 문의
	@RequestMapping(value="memberQnaList.do")
	public ModelAndView memQList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		
		if (isLogOn == true && memberVO.getMember_id().equals("admin")) {
			map = pagecon.getPaging(request, response);
			paging = (Paging) map.get("paging");
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
	
//	관리자 공지사항 등록 setViewName
	@RequestMapping(value="/noticeInsert.do")
	public ModelAndView noticeInsertView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

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
	@RequestMapping(value="/noticeAdd.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView noticeInsert(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String action = (String) request.getParameter("action");
		
		if (action != null && action.equals("noticeAdd")) {
			map = filecon.fileUpload(multipartRequest, response);
			boardService.noticeInsert(map);
			mav.setViewName("/admin/noticeList");
		}
		
		return mav;
	}
	
}
