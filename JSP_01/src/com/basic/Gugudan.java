package com.basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class Gugudan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String input = request.getParameter("input");
		String res = "";
		int num = 0;
		boolean flag = true;
		
		
		try{
			num = Integer.parseInt(input); 
		}catch(Exception e){
			flag = false;
		}
		
		if(flag){
			for(int i = 1; i < 10; i++){
				res += i + " * " + num + " = " + i * num + "<br>";
			}
		}else{
			res = "올바르지 않은 값이 입력되었습니다.";
		}
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/gugudan.jsp").forward(request, response); 
		
		//Integer a = new Object(0);
		//Object a = new Integer(0);
		
	}

}
