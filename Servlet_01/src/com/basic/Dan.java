package com.basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dan")
public class Dan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력
		String para = request.getParameter("num");
		String str = "";
		int num = -1;
		boolean flag = true;

		// 처리
		/*
		try {
			int num = Integer.parseInt(para);
			str = num + "단 입니다! <br><br>";
			for(int i = 1; i < 10; i++) {
				str += num + " * " + i + " = " + i*num + "<br>";
			}
		} catch (Exception e) {
			str = "숫자를 입력해 주세요!";
		}
		*/
		
		try {
			num = Integer.parseInt(para);
		} catch (Exception e) {
			flag = false;
		}		
		
		if(flag) {
			str = num + "단 입니다! <br><br>";
			for(int i = 1; i < 10; i++) {
				str += num + " * " + i + " = " + i*num + "<br>";
			}
		}else {
			str = "<script>alert('올바른 입력값이 아닙니다.\\n정수를 입력하세요.')</script>";
		}
		
		
		// 출력
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<h3>" + str + "</h3>");
		
		/*
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		*/
		
	}

}
