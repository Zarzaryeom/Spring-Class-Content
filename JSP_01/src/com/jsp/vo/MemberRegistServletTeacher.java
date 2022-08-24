package com.jsp.vo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberRegistServlet
 */
@WebServlet("/mymember/regist2")
public class MemberRegistServletTeacher extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="/WEB-INF/views/member/regist.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//입력
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String url = request.getContextPath() + "/member/regist/success?id="+id+"&pwd="+pwd;
		
		//처리
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPwd(pwd);
		System.out.println(member);
		
		//출력
		//request.setAttribute("member", member);
		//request.getRequestDispatcher(url).forward(request,response);
		response.sendRedirect(url);
	}

}








