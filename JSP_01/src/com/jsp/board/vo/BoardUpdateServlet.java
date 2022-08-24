package com.jsp.board.vo;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.datasource.BoardDataSource;

@WebServlet("/boardUpdateServlet")
public class BoardUpdateServlet extends HttpServlet {
    
	private BoardDataSource bds = BoardDataSource.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/view/myboard/boardUpdate.jsp";
		String bno = request.getParameter("bno");
		
		Map<String, Board> board = bds.getBoardList();
		
		request.setAttribute("board", board.get(bno));
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력
		request.setCharacterEncoding("utf-8");

		Map<String, Board> boardMap = bds.getBoardList();
		
		String bno = request.getParameter("bno");
		String title = request.getParameter("title");
		String writer = boardMap.get(bno).getWriter();
		String content = request.getParameter("content");
		int board_no = Integer.parseInt(bno);
		int viewCnt = boardMap.get(bno).getViewCnt();

		String url = request.getContextPath() + "/boardDetailPassServlet?bno=" + bno;
		
		
		// 처리
		Board bd = new Board(board_no, title, writer, content, new Date(), viewCnt);
		Map<String, Board> map = BoardDataSource.getInstance().getBoardList();
		map.put(bno + "", bd);

		// 출력
		response.sendRedirect(url);
		
	}

}
