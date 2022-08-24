package com.jsp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 화면 전송
		String url ="/WEB-INF/view/common/login.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 입력
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String message = ""; 
		
		// 로그인 처리
		if(id != null && id.equals("mimi")) {
			if(pwd != null && pwd.equals("mimi")) {
				message = "로그인에 성공하였습니다.";
			}else {
				message = "비밀번호가 일치하지 않습니다."; 
			}
		}else {
			message = "입력한 아이디가 존재하지 않습니다.";
		}
		
		// 출력
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('" + message +"')");
		out.print("</script>");
	}

}
