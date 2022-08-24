package com.jsp.vo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.datasource.DataSource;

@WebServlet("/mymember/memberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/WEB-INF/view/member/update.jsp";
		String id = request.getParameter("id");
				
		request.setAttribute("id", id);
		request.getRequestDispatcher(url).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String url = request.getContextPath() + "/memberList";
		
		
		Map<String, MemberVO> memberMap = DataSource.getInstance().getMemberList();
		memberMap.put(id, new MemberVO(id, pwd));
		
		HttpSession session = request.getSession();
		session.setAttribute("check", "update");
		
		response.sendRedirect(url);
	}

}
