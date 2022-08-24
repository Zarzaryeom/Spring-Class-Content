package com.jsp.board.vo;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.datasource.BoardDataSource;

@WebServlet("/boardDetailServlet")
public class BoardDetailServlet extends HttpServlet {

	private BoardDataSource bds = BoardDataSource.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bno = request.getParameter("bno");
		String url = "boardDetailPassServlet?bno=" + bno;
		
		
		Map<String, Board> boardMap = bds.getBoardList();
		int count = boardMap.get(bno).getViewCnt();
		count++;
		
		Board bd = new Board();
		bd.setBno(Integer.parseInt(bno));
		bd.setTitle(boardMap.get(bno).getTitle());
		bd.setWriter(boardMap.get(bno).getWriter());
		bd.setContent(boardMap.get(bno).getContent());
		bd.setRegDate(boardMap.get(bno).getRegDate());
		bd.setViewCnt(count);
		
		boardMap.put(bno, bd);
			
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
