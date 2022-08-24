<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%pageContext.setAttribute("message", "안녕하세요"); %>
<%pageContext.setAttribute("today", new Date()); %>
<%pageContext.setAttribute("num", 1123123); %>
<%pageContext.setAttribute("ex", null); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% out.print(pageContext.getAttribute("message")); %><br>
	<%=pageContext.getAttribute("message") %> <br><!-- =이 있기에 ;을 붙이지 않아도 된다. -->
	${message }<br>
	
	<hr>
	
	<% out.print(pageContext.getAttribute("today")); %><br>
	<%=pageContext.getAttribute("today") %> <br><!-- =이 있기에 ;을 붙이지 않아도 된다. -->
	${today }<br>
	
	<hr>
	
	<% out.print(pageContext.getAttribute("num")); %><br>
	<%=pageContext.getAttribute("num") %> <br><!-- =이 있기에 ;을 붙이지 않아도 된다. -->
	${num}<br>
	
	<hr>
	
	<% out.print(pageContext.getAttribute("ex")); %><br>
	<%=pageContext.getAttribute("ex") %> <br><!-- =이 있기에 ;을 붙이지 않아도 된다. -->
	${ex}<br>
	
	
	
	
	
</body>
</html>