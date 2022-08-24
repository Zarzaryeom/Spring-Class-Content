<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.jsp.board.vo.Board"%>
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
<title>게시판 목록</title>
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
</head>
<body>
	<header>
		<h2 style="margin-top:50px;">게시판 목록</h2>
	</header>
	<br><hr><br>
	<div class="container">
		<input type="button" value="새 글 등록" class="btn btn-secondary" onclick="location.href='board/boardRegistServlet'" style="float: right;margin-bottom: 10px;">
		<table border="1" class="table" style="text-align:center;">
			<thead class="thead-dark">
				<tr>
					<th>글 번호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>생성 날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
		<%
			List<Board> boardList = (List<Board>) request.getAttribute("boardList");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh시 mm분 ss초");
			if(boardList != null) for(Board board : boardList){
				pageContext.setAttribute("board", board);
		%>
				<tr class="clickLine" onclick="location.href='boardDetailServlet?bno=${board.bno}'">
					<td>${board.bno }</td>
					<td>${board.title }</td>
					<td>${board.writer }</td>
					<td><%=sdf.format(board.getRegDate()) %></td>
					<td>${board.viewCnt }</td>
				</tr>			
		<%
			}
		%>
		</table>
	</div>	
	<br><hr><br>
	<div style="margin-left: 50px;">
		<h2>총 게시글 갯수 : ${boardList.size() }</h2>
	</div>
		
</body>
</html>