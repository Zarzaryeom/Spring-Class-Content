package com.jsp.board.vo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.datasource.BoardDataSource;

@WebServlet("/boardListServlet")
public class MyBoardListServlet extends HttpServlet {

	private BoardDataSource bds = BoardDataSource.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/view/myboard/boardListBoot.jsp";
		
		Map<String, Board> boardMap = bds.getBoardList();
		List<Board> boardList = new ArrayList<Board>(boardMap.values());
		
		request.setAttribute("boardList", boardList);		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
