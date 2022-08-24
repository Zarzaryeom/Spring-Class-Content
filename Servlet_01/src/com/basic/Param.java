package com.basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/param")
public class Param extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String color = request.getParameter("color");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String str = "";
		
		//str += "<script>";
		//str += "window.onload = function() {";
		//str += "document.getElementsByTagName('body')[0].style.backgroundColor='green';}";
		//str += "setInterval(function(){"
		//		+ "})";
		//str += "</script>";
		
		str += "<style>";
		str += "body{background-color:" + color;
		str += "}";
		str += "</style>";
		
		out.print(color);
		out.print(str);
	}


}
