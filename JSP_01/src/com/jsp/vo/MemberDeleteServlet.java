package com.jsp.vo;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.datasource.DataSource;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/mymember/memberDeleteServlet")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력
		String key = request.getParameter("id");
		
		//처리
		Map<String, MemberVO> memberMap = DataSource.getInstance().getMemberList();
		memberMap.remove(key);
		
		HttpSession session = request.getSession();
		session.setAttribute("check", "delete");
		
		//출력
		response.sendRedirect("../memberList");
		
	}

}
