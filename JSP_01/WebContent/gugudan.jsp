<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/*
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
		*/
		String res = (String) request.getAttribute("res");
		out.print(res);
	%>
</body>
</html>