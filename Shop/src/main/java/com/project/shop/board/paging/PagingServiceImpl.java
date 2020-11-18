package com.project.shop.board.paging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("pagingService")
public class PagingServiceImpl implements PagingService {

	@Autowired
	private PagingDAO pagingDAO;
	
	@Override
	public int getNoticeCount() {
		return pagingDAO.getNoticeCount();
	}

	@Override
	public int getFAQCount() {
		return pagingDAO.getFAQCount();
	}

	@Override
	public int getProQCount() {
		return pagingDAO.getProQCount();
	}

	@Override
	public int getMemQCount() {
		return pagingDAO.getMemQCount();
	}

}
