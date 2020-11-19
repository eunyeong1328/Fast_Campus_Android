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
	public ModelAndView boardQnaForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView (viewName);
		return mav;
	}
}