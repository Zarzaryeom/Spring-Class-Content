<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%pageContext.setAttribute("mag", "pageContext"); %>
<%request.setAttribute("mag", "request"); %>
<%session.setAttribute("mag", "session"); %>
<%application.setAttribute("mag", "application"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${mag }</h1>
</body>
</html>