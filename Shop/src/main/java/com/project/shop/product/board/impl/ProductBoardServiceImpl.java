package com.project.shop.product.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.product.board.ProductBoardService;
import com.project.shop.product.Paging;
import com.project.shop.product.board.ProductBoardQnaVO;

@Service("productBoardService")
public class ProductBoardServiceImpl implements ProductBoardService{
	@Autowired
	private Paging p;
	
	@Autowired
	private ProductBoardDAO productBoardDAO;
	
	@Override
	public int getTotalCount(String product_id) throws Exception {
		int totalCount = productBoardDAO.selectTotalCountProductQna(product_id);
		return totalCount;
	}

	@Override
	public List<ProductBoardQnaVO> getListQna(Map map) throws Exception {
		List<ProductBoardQnaVO> productQnaList = productBoardDAO.selectProductQnaList(map);
		return productQnaList;
	}

	@Override
	public Paging pagingInfo(String product_id, String cPage) throws Exception {
		int totalCount = getTotalCount(product_id);
	
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

	@Override
	public void addBoardQna(Map map) throws Exception {
		System.out.println("여기는 보드 서비드다 오버");
		productBoardDAO.insertBoardQna(map);
	}
}
