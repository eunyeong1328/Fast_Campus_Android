package com.project.shop.board.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.board.BoardService;
import com.project.shop.board.BoardVO;
import com.project.shop.member.MemberVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getNoticeList(HashMap<String, Object> map) {
		return boardDAO.getNoticeList(map);
	}
	
	@Override
	public BoardVO getNotice(BoardVO vo) {
		return boardDAO.getNotice(vo);
	}

	@Override
	public List<BoardVO> getFAQList(HashMap<String, Object> map) {
		return boardDAO.getFAQList(map);
	}

	@Override
	public BoardVO getFAQ(BoardVO vo) {
		return boardDAO.getFAQ(vo);
	}

	@Override
	public List<BoardVO> getMemQList(HashMap<String, Object> map) {
		return boardDAO.getMemQList(map);
	}

	@Override
	public void memQInsert(HashMap<String, Object> map) {
		boardDAO.memQInsert(map);
	}

	@Override
	public BoardVO getMemQ(BoardVO vo) {
		return boardDAO.getMemQ(vo);
	}

	@Override
	public void memQUpdate(HashMap<String, Object> map) {
		boardDAO.memQUpdate(map);
	}

	@Override
	public List<BoardVO> getMemQListAll(HashMap<String, Object> map) {
		return boardDAO.getMemQListAll(map);
	}

	@Override
	public void noticeInsert(HashMap<String, Object> map) {
		boardDAO.noticeInsert(map);
	}

}
