package com.project.shop.view.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.board.BoardService;
import com.project.shop.board.BoardVO;
import com.project.shop.board.paging.Paging;
import com.project.shop.board.paging.PagingService;
import com.project.shop.member.MemberVO;

@Controller("boardController")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private PagingService pagingService;
	
	Paging paging = new Paging();
	HashMap<String, Object> map = new HashMap<String, Object>();

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
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if (memberVO != null && memberVO.getMember_id() != null) {
			getPaging(request, response);
			mav.addObject("paging", paging);
			map.put("member_id", memberVO.getMember_id());
			List<BoardVO> MemQ = boardService.getMemQList(map);
			mav.addObject("MemQList", MemQ);
			mav.setViewName(viewName);
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}
	
//	1:1 문의 글 작성
	@RequestMapping(value="/memQ-insert.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memQInsert(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if (memberVO != null && memberVO.getMember_id() != null) {
			
			mav.setViewName(viewName);
			String action = (String) request.getParameter("action");
			
			if (action != null && action.equals("memQ-insert")) {
				MultipartFile file = vo.getFile();
				String image = file.getOriginalFilename();
				String fileSavePath = "C:\\MyStudy\\Bit_WebProject\\web-project\\Shop\\src\\main\\webapp\\resources\\memQ-file\\";
				System.out.println(fileSavePath);
				file.transferTo(new File(fileSavePath + image));
				
				vo.setImage(image);
				vo.setMember_id(memberVO.getMember_id());
				boardService.memQInsert(vo);
				mav.setViewName("redirect:memberQ-tab.do?nowTab=tab-3");
			}
			
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}
	
//	1:1 문의 글 수정
	@RequestMapping(value="/memQ-update.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memQUpdate(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if (memberVO != null && memberVO.getMember_id() != null) {
			vo.setMember_id(memberVO.getMember_id());
			BoardVO memQ = boardService.getMemQ(vo);
			mav.addObject("memQ", memQ);
			mav.setViewName(viewName);
			
			String action = (String) request.getParameter("action");
			if (action != null && action.equals("memQ-update")) {
				vo.setMember_id(memberVO.getMember_id());
				boardService.memQUpdate(vo);
				mav.setViewName("redirect:memQ.do?member_qna_num=" + vo.getMember_qna_num());
			}
		} else {
			String message = "로그인하셔야 본 서비스를 이용하실 수 있습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
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
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if (memberVO != null && memberVO.getMember_id() != null) {
			getPaging(request, response);
			mav.addObject("paging", paging);
			
			vo.setMember_id(memberVO.getMember_id());
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
	
//	Paging
	public void getPaging(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String nowTab = request.getParameter("nowTab");
		
		if (nowTab == null || nowTab == "tab-1") {
			paging.setNowTab("tab-1");
			paging.setTotalRecord(pagingService.getNoticeCount());
		} else if (nowTab.equals("tab-2")) {
			paging.setNowTab(nowTab);
			paging.setTotalRecord(pagingService.getFAQCount());
		} else if (nowTab.equals("tab-3")) {
			paging.setNowTab(nowTab);
			paging.setTotalRecord(pagingService.getMemQCount(memberVO));
		}
		
//		전체 게시물 끝글번호 setter (미완성)
//		paging.setListEndNum(listEndNum);
		
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
	
