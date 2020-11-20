package com.project.shop.board.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.board.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate board;
	
	public List<BoardVO> getNoticeList(Map<String, Integer> map) {
		return board.selectList("mapper.board.getNoticeList", map);
	}
	
	public BoardVO getNotice(BoardVO vo) {
		return board.selectOne("mapper.board.getNotice", vo);
	}

	public List<BoardVO> getFAQList(Map<String, Integer> map) {
		return board.selectList("mapper.board.getFAQList", map);
	}
	
	public BoardVO getFAQ(BoardVO vo) {
		return board.selectOne("mapper.board.getFAQ", vo);
	}

	public List<BoardVO> getProQList(Map<String, Integer> map) {
		return board.selectList("mapper.board.getProQList", map);
	}

	public List<BoardVO> getMemQList(Map<String, Integer> map) {
		return board.selectList("mapper.board.getMemQList", map);
	}

	public void memQInsert(BoardVO vo) {
		board.insert("mapper.board.memqInsert", vo);
	}

	public BoardVO getMemQ(BoardVO vo) {
		return board.selectOne("mapper.board.getMemQ", vo);
	}

	public void memQUpdate(BoardVO vo) {
		board.update("mapper.board.memqUpdate", vo);
	}
	
}
