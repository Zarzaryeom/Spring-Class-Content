<%@page import="com.jsp.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>회원정보 상세보기</title>
<style>
.main{
	margin: 50px;
	width: 400px;
}
label{
	font-size: 1.3em;
	font-weight: bold;
}
</style>
</head>
<body>
  <div class="main">
    <h3 style="text-align:center;">회원정보 상세보기</h3><br>
	<div class="form-group">
	  <label for="id">아이디 : ${member.id }</label>
	</div>
	<div class="form-group">
      <label for="pwd">비밀번호 : ${member.pwd }</label>
    </div>
	<div>
	  <input type="button" value="수정" onclick="location.href='../memberUpdateServlet?id=${member.id}'" class="btn btn-primary">
	  <input type="button" value="삭제" onclick="location.href='../memberDeleteServlet?id=${member.id}'" class="btn btn-primary">
	  <input type="button" value="메인으로 돌아가기" onclick="location.href='<%=request.getContextPath() %>/memberList'" class="btn btn-primary">
	</div>
  </div>
	
</body>
</html>