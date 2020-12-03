package com.project.shop.paging;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.member.MemberVO;

@Service("pagingService")
public class PagingServiceImpl implements PagingService {

	@Autowired
	private PagingDAO pagingDAO;
	
	@Override
	public int getNoticeCount(HashMap<String, Object> map) {
		return pagingDAO.getNoticeCount(map);
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

	@Override
	public int getSearchNoticeCount(HashMap<String, Object> map) {
		return pagingDAO.getSearchNoticeCount(map);
	}

}
