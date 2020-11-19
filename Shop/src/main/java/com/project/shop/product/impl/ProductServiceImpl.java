package com.project.shop.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.product.Paging;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;

@Service("productService")
@Transactional(propagation=Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Paging p;
	
	//아진
	@Override
	public List<ProductVO> listProduct(int productCategoryNum, Map map) throws Exception {
		List<ProductVO> productList = productDAO.selectProductList(productCategoryNum, map);
		return productList;
	}

	@Override
	public ProductVO productDetail(String productId) throws Exception {
		ProductVO productVO = productDAO.selectProductDetail(productId);
		return productVO;
	}

	@Override
	public String productCategoryName(int productCategoryNum) throws Exception {
		String  productCategoryName = productDAO.selectProductCategoryName(productCategoryNum);
		return productCategoryName;
	}

	@Override
	public int getTotalCount(int productCategoryNum) throws Exception {
		int totalCount = productDAO.getTotalCount(productCategoryNum);
		return totalCount;
	}

	@Override
	public List<ProductVO> productOption(String product_id) throws Exception {
		List<ProductVO> optionList = productDAO.selectOption(product_id);
		return optionList;
	}
	
	@Override
	public Paging pagingInfo(int productCategoryNum, String cPage) throws Exception {
		int totalCount = getTotalCount(productCategoryNum);
		
		// 1. 전체 게시물의 수를 구하기
		p.setTotalRecord(totalCount); // 전체 product 수 설정
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		// 2. 현재 페이지 구하기
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		// 4. 블록(block) 계산하기(블록의 시작, 끝페이지 구하기)
		int nowPage = p.getNowPage();
		int currentBlock = (nowPage - 1) / p.getPagePerBlock() + 1;
		p.setEndPage(currentBlock * p.getPagePerBlock());
		p.setBeginPage(p.getEndPage() - p.getPagePerBlock() + 1);

		// 5. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지 값을 전체페이지수로 변경처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		return p;
	}
	//상연
	@Override
	public List<ProductVO> bestList() {
		return productDAO.bestList();
	}

	@Override
	public List<ProductVO> newList() {
		return productDAO.bestList();
	}

	@Override
	public int insertProduct(ProductVO vo) {
		return productDAO.insertProduct(vo);
	}
}
