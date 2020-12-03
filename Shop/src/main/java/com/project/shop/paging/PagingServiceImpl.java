package com.project.shop.paging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.member.MemberVO;

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
	public int getMemQCount(MemberVO memberVO) {
		return pagingDAO.getMemQCount(memberVO);
	}

	@Override
	public int getMemQCountAll() {
		return pagingDAO.getMemQCountAll();
	}

}
