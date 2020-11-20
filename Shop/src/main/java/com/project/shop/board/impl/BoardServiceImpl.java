package com.project.shop.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.board.BoardService;
import com.project.shop.board.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getNoticeList(Map<String, Integer> map) {
		return boardDAO.getNoticeList(map);
	}
	
	@Override
	public BoardVO getNotice(BoardVO vo) {
		return boardDAO.getNotice(vo);
	}

	@Override
	public List<BoardVO> getFAQList(Map<String, Integer> map) {
		return boardDAO.getFAQList(map);
	}

	@Override
	public BoardVO getFAQ(BoardVO vo) {
		return boardDAO.getFAQ(vo);
	}

	@Override
	public List<BoardVO> getMemQList(Map<String, Integer> map) {
		return boardDAO.getMemQList(map);
	}

	@Override
	public void memQInsert(BoardVO vo) {
		boardDAO.memQInsert(vo);
	}

	@Override
	public BoardVO getMemQ(BoardVO vo) {
		return boardDAO.getMemQ(vo);
	}

	@Override
	public void memQUpdate(BoardVO vo) {
		boardDAO.memQUpdate(vo);
	}

}
