package com.project.shop.view.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
		
		return mav;
	}

	@RequestMapping(value="productBoardQnaForm.do")
	public ModelAndView boardQnaForm(@RequestParam(value="product_id") String product_id,
									@RequestParam(value="product_qna_num") String product_qna_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);

		//세션 멤버정보 가져오기
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		MemberVO memberInfo =(MemberVO)session.getAttribute("memberInfo");
		System.out.println("isLogOn : "+isLogOn);
	
		//수정하기 버튼 => 해당글에 대한 정보 가져오기
		
		
		if(isLogOn == null || isLogOn == false) {
			mav.setViewName("/member/loginForm");
		}else if(isLogOn == true) {
			mav.addObject("memberInfo", memberInfo);
			mav.addObject("product_id", product_id );
			mav.addObject("product_qna_num", product_qna_num);
		}
		return mav;
	}

	@RequestMapping(value="/addBoardQna.do", method= {RequestMethod.POST, RequestMethod.GET})
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
		System.out.println("엥1");
		List<String> fileList = fileProcess(multipartRequest);//이미지 이름 리스트
		System.out.println("엥2");
		
		int i=1;
		if(fileList !=null) {
			for(String image : fileList) {
				if(image != null) {
					map.put("image"+i, image);
					i++;
				}
			}
		}else {
			for(i=1 ; i <=3 ; i++) {
				System.out.println(i+"번째 등록된 파일이 없습니다.");
				//map.put("image"+i, "null");
				//i++;
			}
		}
		productBoardService.addBoardQna(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/product/productDetail.do?product_id="+product_id);
		return mav;
	}
	
	//파일타입 파라미터 얻어오기 
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> fileNameList = new ArrayList<String>();
	   
		List<MultipartFile> fileList = multipartRequest.getFiles("file");
		String path = "C:\\board\\";
		//String path = "/resources/images/productQna/";
		
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
				if(file.getParentFile().mkdirs()) {
					file.createNewFile();
				}
			}
			try {
				mfile.transferTo(new File(saveFile));
				System.out.println("저장...?");
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return fileNameList;
	}
	
} 