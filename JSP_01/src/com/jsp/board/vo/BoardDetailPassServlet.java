package com.jsp.board.vo;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.datasource.BoardDataSource;

@WebServlet("/boardDetailPassServlet")
public class BoardDetailPassServlet extends HttpServlet {

	private BoardDataSource bds = BoardDataSource.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/view/myboard/boardDetail.jsp";
		String bno = request.getParameter("bno");
		
		
		Map<String, Board> boardMap = bds.getBoardList();
		
		request.setAttribute("board", boardMap.get(bno));
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
