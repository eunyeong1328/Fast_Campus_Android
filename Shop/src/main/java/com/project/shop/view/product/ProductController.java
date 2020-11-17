package com.project.shop.view.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.product.Paging;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;

@Controller
@RequestMapping(value="/product")
public class ProductController extends BaseController{
	@Autowired
	private ProductService productService;
	@Autowired
	private Paging p;
	
	@RequestMapping(value="/productList.do")
	public ModelAndView productList(@RequestParam(value="listKey", defaultValue="reg_date") String listKey,
									@RequestParam(value="orderKey", defaultValue="desc") String orderKey,
									@RequestParam Map<String, String> info,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		System.out.println("viewName : "+viewName);
		int product_category_num = Integer.parseInt(info.get("product_category_num"));
		System.out.println(product_category_num);
		String product_category_name = productService.productCategoryName(product_category_num);
		
		mav.addObject("product_category_num", product_category_num);
		mav.addObject("product_category_name", product_category_name);
		
		if(listKey.equals("reg_date")){
			mav.addObject("sortby", "신상품순");
		}else if(listKey.equals("price") && orderKey.equals("asc")) {
			mav.addObject("sortby", "낮은가격순");
		}else if(listKey.equals("price") && orderKey.equals("desc")) {
			mav.addObject("sortby", "높은가격순");
		}
		Map map = new HashMap();
		
		map.put("product_category_num", product_category_num );
		map.put("listKey", listKey);
		map.put("orderKey", orderKey);
		
		
		// ===========================페이징 처리 ===========================
		int totalCount = productService.getTotalCount(product_category_num);//전체 product 수
		//1. 전체 게시물의 수를 구하기
		p.setTotalRecord(totalCount); // 전체 product 수 설정
		p.setTotalPage(); //전체 페이지 갯수 구하기
		System.out.println("전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		System.out.println("---------");
		System.out.println("현재페이지 : " + p.getNowPage());
		System.out.println("시작글번호 : " + p.getBegin());
		System.out.println("끝글번호 : " + p.getEnd());
		
		//4. 블록(block) 계산하기(블록의 시작, 끝페이지 구하기)
		int nowPage = p.getNowPage();
		int currentBlock = (nowPage - 1) / p.getPagePerBlock() + 1;
		p.setEndPage(currentBlock * p.getPagePerBlock());
		p.setBeginPage(p.getEndPage() - p.getPagePerBlock() + 1);
		
		System.out.println("---- 블럭의 시작, 끝 페이지 ----");
		System.out.println("현재페이지 : " + p.getNowPage());
		System.out.println("시작페이지 : " + p.getBeginPage());
		System.out.println("끝페이지 : " + p.getEndPage());
		
		//5. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지 값을 전체페이지수로 변경처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("---- 블럭의 시작, 끝 페이지(정정후) ----");
		System.out.println(">> 시작페이지 : " + p.getBeginPage());
		System.out.println(">> 끝페이지 : " + p.getEndPage());
		
		//========================================================
		//현재 페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝글번호로 Map 데이터 만들어서 파라미터 전달
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		List<ProductVO> productList = productService.listProduct(product_category_num, map);
		mav.addObject("productList", productList);
		mav.addObject("pvo", p);
		return mav;
	}
	@RequestMapping(value="/productDetail.do")
	public ModelAndView productList(@RequestParam(value="product_id") String product_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);
		
		System.out.println("viewName :"+viewName);
		System.out.println("product_id :"+product_id);
		ProductVO productVO =productService.productDetail(product_id);
		mav.addObject("vo", productVO);
		System.out.println("컨트롤러에서 productVO.get카테고리네임:"+productVO.getProduct_category_name());
		
		List<ProductVO> optionList = productService.productOption(product_id);
		mav.addObject("optionList", optionList);
		
		
		
		
		return mav;
	}
	
}