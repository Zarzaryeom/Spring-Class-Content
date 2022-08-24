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

@WebServlet("/board/boardRegistServlet")
public class BoardRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String resurl = request.getContextPath() + "/boardRegist.jsp";
		//String resurl = request.getContextPath() + "/WEB-INF/view/board/boardRegist.jsp";
		String requrl = "/WEB-INF/view/myboard/boardRegist.jsp";
		
		//response.sendRedirect(resurl);
		request.getRequestDispatcher(requrl).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력
		request.setCharacterEncoding("utf-8");
		
		String url = request.getContextPath() + "/boardListServlet";
		String title = request.getParameter("title");
		String writer = "작성자 미정";
		String content = request.getParameter("editordata");
		int board_no = BoardDataSource.getInstance().getBoard_no();
		
		// 처리
		Board bd = new Board(board_no, title, writer, content, new Date(), 0);
		Map<String, Board> map = BoardDataSource.getInstance().getBoardList();
		map.put(board_no+"", bd);
				
				
		// 출력		
		response.sendRedirect(url);
		
	}

}
