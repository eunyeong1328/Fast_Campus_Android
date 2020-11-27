package com.project.shop.view.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.product.Paging;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;

@Controller("adminController")
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {
	@Autowired
	ProductService service;
	
	@Autowired
	private Paging p;
	
	@RequestMapping(value="noticeList.do")
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
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
		mav.setViewName((String) request.getAttribute("viewName"));
		//페이징 처리
		p = service.pageList(request.getParameter("cPage"));
		mav.addObject("pvo", p);
		//상품리스트 가져오기
		mav.addObject("list", service.listProduct(p.getBegin(),p.getEnd()));		
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
			mav.addObject("id",request.getParameter("product_id"));
			mav.setViewName((String) request.getAttribute("viewName"));
			return mav;
		}
		
	}
	
	@RequestMapping(value = "/productOptionDelete.do",method=RequestMethod.GET)
	public String productOptionDelete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = request.getParameter("product_id");
		if(id != null) {
			service.deleteOption(request.getParameter("option_name"));
		}
		return "redirect:productOption.do?product_id="+id;
	}
	
	@RequestMapping(value = "/productOptionAdd.do",method=RequestMethod.GET)
	public String productOptionAdd(ProductVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = request.getParameter("product_id");
		if(vo != null) {
			service.insertOption(vo);
		}
		return "redirect:productOption.do?product_id="+id;
	}
	
	@RequestMapping(value = "/checkProduct.do",method=RequestMethod.POST)
	public ResponseEntity checkProduct(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		  ResponseEntity resEntity = null;
	      String result = service.checkProduct(id);
	      resEntity =new ResponseEntity(result, HttpStatus.OK);
	      return resEntity;
	}
	
	@RequestMapping(value = "/checkItem.do",method=RequestMethod.POST)
	public ResponseEntity checkItem(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		  ResponseEntity resEntity = null;
	      String result = service.checkItem(id);
	      resEntity =new ResponseEntity(result, HttpStatus.OK);
	      return resEntity;
	}
	
}
