package com.project.shop.view.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;
import com.project.shop.product.Paging;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;
import com.project.shop.product.board.ProductBoardQnaVO;
import com.project.shop.product.board.ProductBoardService;

@Controller
@RequestMapping(value="/product")
public class ProductController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductBoardService productBoardService;
	
	@Autowired
	private Paging p;
	
	@RequestMapping(value="/productList.do")
	public ModelAndView productList(@RequestParam(value="listKey", defaultValue="reg_date") String listKey,
									@RequestParam(value="orderKey", defaultValue="desc") String orderKey,
									@RequestParam Map<String, String> info,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		//뷰정보
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		//카테고리이름
		int product_category_num = Integer.parseInt(info.get("product_category_num"));
		String product_category_name = productService.productCategoryName(product_category_num);
		
		mav.addObject("product_category_num", product_category_num);
		mav.addObject("product_category_name", product_category_name);
		
		//정렬
		if(listKey.equals("reg_date")){
			mav.addObject("sortby", "신상품순");
		}else if(listKey.equals("price") && orderKey.equals("asc")) {
			mav.addObject("sortby", "낮은가격순");
		}else if(listKey.equals("price") && orderKey.equals("desc")) {
			mav.addObject("sortby", "높은가격순");
		}
		
		//페이징 처리
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			cPage="1";
		}
		p = productService.pagingInfo(product_category_num, cPage);
		mav.addObject("pvo", p);
		
		
		//상품리스트 가져오기
		Map map = new HashMap();
		map.put("product_category_num", product_category_num );
		map.put("listKey", listKey);
		map.put("orderKey", orderKey);
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		List<ProductVO> productList = productService.listProduct(product_category_num, map);
		mav.addObject("productList", productList);
		
		return mav;
	}
	
	
	@RequestMapping(value="/productDetail.do")
	public ModelAndView productDetail(@RequestParam(value="product_id") String product_id,
								
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		//뷰정보
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);
		
		//상품정보
		ProductVO productVO =productService.productDetail(product_id);
		mav.addObject("vo", productVO);
		
		//옵션정보
		List<ProductVO> optionList = productService.productOption(product_id);
		mav.addObject("optionList", optionList);
		
		//페이징 처리
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			cPage="1";
		}
		p = productBoardService.pagingInfo(product_id, cPage);
		mav.addObject("pvo", p);
		
		
		//Q&A 글 가져오기
		Map map = new HashMap();
		map.put("product_id", product_id);
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		List<ProductBoardQnaVO> productBoardQnaList = productBoardService.getListQna(map);
		mav.addObject("qnaList", productBoardQnaList);
		
		//관리자 로그인
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		MemberVO vo = (MemberVO)session.getAttribute("memberInfo");

		if(isLogOn !=null && isLogOn.equals(true) && vo !=null) {
			if(vo.getMember_id().equals("admin")) {
				mav.addObject("member_id", vo.getMember_id());
			}
		}
		
		if(request.getParameter("msg") !=null) {
			mav.addObject("msg", request.getParameter("msg"));
		}
		return mav;
	}
	
	// ==========================  게시판 ==============================
	// 상품QNA 글쓰기 폼 요청
	@RequestMapping(value="/insertQnaForm.do", method=RequestMethod.GET)
	public ModelAndView boardQnaForm(@RequestParam(value="product_id") String product_id,
			@RequestParam(value="product_qna_num", required=false ) String product_qna_num,
						HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		System.out.println("isLogOn 확인 : "+isLogOn);
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		mav.addObject("product_id", product_id);

		if(isLogOn == null || isLogOn.equals(false) || memberInfo == null) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn.equals(true)) {
			if(memberInfo.getMember_id().equals("admin")) {
				//부모글번호 전송
				mav.addObject("parent_num", product_qna_num);
				System.out.println("부모글번호 : "+product_qna_num);
			}else {
				mav.addObject("parent_num", 0);
			}
			mav.addObject("memberInfo", memberInfo);
		}
		return mav;
	}
	// 상품QNA 글쓰기
	@RequestMapping(value="/insertQna.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addBoardQna(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map map = new HashMap();
		
		String product_id = null;
		
		//일반타입 파라미터 얻어오기
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
			System.out.println("name :" + name +"//value : "+value);
			if(name.equals("product_id")) {
				product_id = multipartRequest.getParameter("product_id");
			}
		}
		//파일타입 파라미터 얻어오기 
		List<String> fileList = fileProcess(multipartRequest, product_id);//이미지 이름 리스트
		
		int i=1;
		if(fileList !=null) {
			for(String image : fileList) {
				if(image != null) {
					map.put("image"+i, image);
					i++;
				}
			}
		}
		productBoardService.addBoardQna(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/product/productDetail.do?product_id="+product_id);
		return mav;
	}
	//상품QNA 글 수정폼 요청
	@RequestMapping(value="/updateQnaForm.do", method=RequestMethod.POST)
	public ModelAndView updateQnaForm(@RequestParam(value="product_id") String product_id,
			@RequestParam(value="product_qna_num") String product_qna_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("글수정폼 컨트롤러...");
		//뷰정보 가져오기
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);

		//세션 멤버정보 가져오기
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		mav.addObject("memberInfo", memberInfo);
		mav.addObject("product_id", product_id );
		
		if(isLogOn == null || isLogOn == false || memberInfo ==null) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn == true && memberInfo !=null && product_qna_num !=null && product_qna_num !="") {
			//수정하기 버튼 => 해당글에 대한 정보 가졍
			ProductBoardQnaVO qna =productBoardService.getProductQna(Integer.parseInt(product_qna_num));
			if(qna.getmember_id().equals(memberInfo.getMember_id())) {
				mav.addObject("qna", qna);
			}else { //게시글작성자와 현재유저와 다를 경우
				mav.setViewName("redirect:/product/productDetail.do?");
				mav.addObject("msg", "게시글 작성자가 아닙니다.");
			}
		}
		return mav;
	}
	//게시글 수정하기
	@RequestMapping(value="/updateQna.do")
	public ModelAndView updateQna(@RequestParam Map<String, String> map,
									@RequestParam("product_id") String product_id,
								MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		List<String> imageList = fileProcess(multipartRequest, product_id);
		int i=1;
		for(String image : imageList) {
			System.out.println("image : "+image);
			map.put("image"+i, image);
			i++;
		}
		productBoardService.editBoaardQna(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/product/productDetail.do");
		mav.addObject("product_id", product_id);
		return mav;
	}
	
	
	@RequestMapping(value="/deleteBoardQna.do")
	public ModelAndView deleteBoardQna(@RequestParam("product_qna_num") String product_qna_num,
										@RequestParam("product_id") String product_id,
						HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//세션 멤버정보 가져오기
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		System.out.println("isLogOn: "+isLogOn);
		System.out.println("memberInfo: "+memberInfo);
		mav.addObject("memberInfo", memberInfo);
		mav.addObject("product_id", product_id );
				
		if(isLogOn == null || isLogOn == false || memberInfo == null ) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn == true && product_qna_num !=null && product_qna_num !="") {
			mav.setViewName( "redirect:/product/productDetail.do");
			//삭제하기 버튼 => 해당글에 대한 정보 가졍
			int qna_num = Integer.parseInt(product_qna_num);
			ProductBoardQnaVO qna =productBoardService.getProductQna(qna_num);
			if(qna.getmember_id().equals(memberInfo.getMember_id())) {
				productBoardService.deleteBoardQna(qna_num);	
			}else { //게시글작성자와 현재유저와 다를 경우
				mav.addObject("msg", "게시글 작성자가 아닙니다.");
			}
		}
		return mav;
	}
	
	
	
	//파일타입 파라미터 얻어오기 
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest, String product_id) throws Exception{
		List<String> fileNameList = new ArrayList<String>();
	   
		List<MultipartFile> fileList = multipartRequest.getFiles("file");
		//String path = "C:\\board\\";
		HttpSession session = multipartRequest.getSession();
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		int qnaNO = productBoardService.getTotalCount(product_id);
		String path = "C:\\users\\bitcamp\\git\\web-project\\Shop\\src\\main\\webapp\\resources\\images\\product_qna\\"+qnaNO+"\\";
		
		if(fileList.isEmpty()) {
			return null;
		}
	
		for(MultipartFile mfile : fileList) {
			String originalFileName = mfile.getOriginalFilename();
			fileNameList.add(originalFileName);
			System.out.println("이미지 파일 이름 : "+originalFileName);
			
			String saveFile = path + originalFileName;
			File file = new File(saveFile);
			if(!file.exists()) {
				file.mkdirs();
			}
			try {
				mfile.transferTo(new File(saveFile));
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return fileNameList;
	}
	
} 