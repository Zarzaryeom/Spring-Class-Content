package com.jsp.board.vo;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.datasource.BoardDataSource;

@WebServlet("/boardDeleteServlet")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardDataSource bds = BoardDataSource.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getContextPath() + "/boardListServlet";
		String bno = request.getParameter("bno");
		
		Map<String, Board> boardMap = bds.getBoardList();
		boardMap.remove(bno);
		
		response.sendRedirect(url);				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
