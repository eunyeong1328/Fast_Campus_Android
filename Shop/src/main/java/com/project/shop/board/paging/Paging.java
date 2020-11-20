package com.project.shop.board.paging;

public class Paging {

	private String nowTab;
	
	public String getNowTab() {
		return nowTab;
	}

	public void setNowTab(String nowTab) {
		this.nowTab = nowTab;
	}

	private int nowPage = 1; // 현재페이지
	private int nowBlock = 1; // 현재 블록(페이지 담는 단위)

	private int numPerPage = 3; // 하나의 페이지에 표시할 게시글 수
	private int pagePerBlock = 3; // 블록당 표시하는 페이지 갯수

	private int totalRecord = 0; // 총 게시물 갯수(원본 게시글 수)
	private int totalPage = 0; // 전체 페이지 갯수
	private int totalBlock = 0; // 전체 블록 갯수

	private int begin = 0; // 현재 페이지상의 시작 글번호
	private int end = 0; // 현재 페이지상의 마지막 글번호

	private int beginPage = 0; // 현재 블록의 시작 페이지 번호
	private int endPage = 0; // 현재 블록의 끝 페이지 번호

//	게시글 시작 글번호와 끝 글번호 (시작글번호 default 1)
	private int listBeginNum = 1;
	private int listEndNum = 0;
	
	public int getListBeginNum() {
		return listBeginNum;
	}

	public void setListBeginNum(int listBeginNum) {
		this.listBeginNum = listBeginNum;
	}

	public int getListEndNum() {
		return listEndNum;
	}

	public void setListEndNum(int listEndNum) {
		this.listEndNum = listEndNum;
	}

//	전체 페이지 갯수 구하기
//	totalRecord 값을 페이지당 표시할 글의 개수로 나누고
//	나머지가 있으면 페이지 하나 더 추가
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage > 0)
			totalPage++;
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

}
