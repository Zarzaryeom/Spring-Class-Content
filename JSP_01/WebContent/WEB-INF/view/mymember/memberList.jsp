<%@page import="com.jsp.vo.MemberVO"%>
<%@page import="java.util.List"%>
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
<title>회원정보 관리</title>
<style>
header{
	text-align: center;
}
.clickLine:hover{
	font-weight: bold;
	text-decoration: underline;
	cursor: pointer;
}
</style>
<script>
		<%if(session.getAttribute("check") != null){
			  if(session.getAttribute("check").equals("delete")){
		%>
				  alert("개인정보 삭제를 완료했습니다!")
		<%
			  }else if(session.getAttribute("check").equals("update")){
		%>
				  alert("개인정보 수정을 완료했습니다!")
		<%
			  }
		  }
		  session.removeAttribute("check");
		%>
</script>
</head>
<body>

	<header>
		<h2 style="margin-top:40px;">회원정보 관리</h2>
	</header>
	
	<br><hr><br>
	
	<div class="container">
	  <input type="button" value="새 회원추가" onclick="location.href='member/regist'" style="float: right; margin:10px;">
	  
	  <table border="1" class="table" style="text-align:center;">
	    <thead class="thead-dark">
		  <tr>
		    <th>번호 </th>
		    <th>아이디 </th>
		    <th>패스워드 </th>
		  </tr>
		</thead>
	<%
		List<MemberVO> memberList = (List<MemberVO>)request.getAttribute("memberList");
		int count = 0;
		if(memberList != null) for(MemberVO member : memberList){
			pageContext.setAttribute("member", member);
			pageContext.setAttribute("count", ++count);
	%>
	
		  <tr onclick="location.href='member/regist/success?id=${member.id }&pwd=${member.pwd }'" class="clickLine">
  		    <td>${count }</td>
		    <td>${member.id }</td>
		    <td>${member.pwd }</td>
		  </tr>
	<%	
		}
	 %>
	  </table>
	</div>
	<br><hr><br>
	<h4 style="float: right;margin-right: 30px;"> 총 회원 수 : ${memberList.size() }명</h4>
	
</body>
</html>