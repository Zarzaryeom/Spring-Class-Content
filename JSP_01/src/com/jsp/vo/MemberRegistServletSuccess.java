package com.jsp.vo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mymember/regist/success")
public class MemberRegistServletSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String url = "/el_02.jsp";
		
		//처리
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPwd(pwd);
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("member", member);
		request.getRequestDispatcher(url).forward(request,response);
		
	}


}
