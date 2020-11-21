package com.project.shop.view.admin;

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
import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;
import com.project.shop.paging.Paging;
import com.project.shop.paging.PagingService;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;

@Controller("adminController")
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {
	@Autowired
	ProductService service;
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private PagingService pagingService;
	
	Paging paging = new Paging();
	HashMap<String, Object> map = new HashMap<String, Object>();
	
//	관리자 공지사항
	@RequestMapping(value="noticeList.do")
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		List<BoardVO> notice = boardService.getNoticeList(map);
		mav.addObject("NoticeList", notice);
		
		return mav;
	}
	
//	관리자 FAQ
	@RequestMapping(value="faqList.do")
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		getPaging(request, response);
		mav.addObject("paging", paging);
		
		List<BoardVO> faq = boardService.getFAQList(map);
		mav.addObject("FAQList", faq);
		
		return mav;
	}

	@RequestMapping(value = "/productAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productAdd(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		mav.setViewName((String) request.getAttribute("viewName"));
		return mav;
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public ModelAndView add(ModelAndView mav,ProductVO vo ,MultipartHttpServletRequest request) {
		if(vo != null && request != null) {
			service.insertProduct(vo,request);
		}
		mav.addObject("list",service.allList());
		mav.setViewName("/admin/productList");
		return mav;
				
	}
	
	@RequestMapping(value = "/productList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productList(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		mav.addObject("list",service.allList());
		mav.setViewName((String) request.getAttribute("viewName"));
		return mav;
		
	}
	
	@RequestMapping(value = "/productDelete.do",method=RequestMethod.GET)
	public ModelAndView productDelete(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(request.getParameter("product_id") != null) {
			service.deleteProduct(request.getParameter("product_id"));
		}
		mav.addObject("list",service.allList());
		mav.setViewName("/admin/productList");
		return mav;
		
	}
	
	@RequestMapping(value = "/productUpdate.do",method=RequestMethod.GET)
	public ModelAndView productUpdate(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(request.getParameter("product_id") == null) {
			System.out.println("회원 정보 불러오기 실패");
			mav.addObject("list",service.allList());
			mav.setViewName("/admin/productList");
			return mav;
		}else {
			List<ProductVO> vo = service.loadOne(request.getParameter("product_id"));
			mav.addObject("one", vo );
			mav.setViewName((String) request.getAttribute("viewName"));
			return mav;
		}
		
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public ModelAndView update(ModelAndView mav,ProductVO vo ,MultipartHttpServletRequest request) {
		
		if(vo != null && request != null) {
			service.updateProduct(vo,request);
		}
		mav.addObject("list",service.allList());
		mav.setViewName("/admin/productList");
		return mav;
				
	}
	
	@RequestMapping(value = "/productOption.do",method=RequestMethod.GET)
	public ModelAndView productOption(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(request.getParameter("product_id") == null) {
			System.out.println("옵션 정보 불러오기 실패");
			mav.setViewName("/admin/productList");
			return mav;
		}else {
			mav.addObject("list",service.loadOption(request.getParameter("product_id")));
			mav.setViewName((String) request.getAttribute("viewName"));
			return mav;
		}
		
		
		
	}
	
	@RequestMapping(value = "/productOptionDelete.do",method=RequestMethod.GET)
	public ModelAndView productOptionDelete(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = request.getParameter("product_id");
		if(id != null) {
			service.deleteOption(request.getParameter("option_name"));
		}
		mav.addObject("list",service.loadOption(id));
		mav.setViewName("/admin/productOption");
		return mav;
		
	}
	
	@RequestMapping(value = "/productOptionAdd.do",method=RequestMethod.GET)
	public ModelAndView productOptionAdd(ProductVO vo,ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(vo);
		if(vo != null) {
			service.insertOption(vo);
		}
		mav.addObject("list",service.loadOption(request.getParameter("product_id")));
		mav.setViewName("/admin/productOption");
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
