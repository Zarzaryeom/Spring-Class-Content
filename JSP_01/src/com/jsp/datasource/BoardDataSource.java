package com.jsp.datasource;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jsp.board.vo.Board;
import com.jsp.vo.MemberVO;

public class BoardDataSource {

	private Map<String, Board> boardList = new HashMap<String, Board>();
	private static int board_no = 20;
	
	private static BoardDataSource instance = new BoardDataSource();
	private BoardDataSource() {
		for(int i=1;i<=20;i++) {
			String temp = i+"";
			String title = "title"+i;
			String writer = "writerName" + i;
			String content = "content" + i;
			
			boardList.put(temp, new Board(i, title, writer, content, new Date(), 0));
		} 
	}
	
	public static BoardDataSource getInstance(){
		return instance;
	}
	public Map<String, Board> getBoardList() {
		return boardList;
	}
	public int getBoard_no() {
		return ++board_no;
	}
	public void setBoardList(Map<String, Board> boardList) {
		this.boardList = boardList;
	}
	public static void setInstance(BoardDataSource instance) {
		BoardDataSource.instance = instance;
	}
}
