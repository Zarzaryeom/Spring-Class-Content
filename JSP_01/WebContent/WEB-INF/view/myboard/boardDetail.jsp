<%@page import="com.jsp.board.vo.Board"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<title>글 상세보기</title>
<style>
input{
	margin-right: 10px;
}
.template{
	margin-left: 50px;
}
</style>
</head>
<body>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh시 mm분 ss초");
		Board board = (Board)request.getAttribute("board");
	%>
	<div class="template">
		<h5 style="margin-top: 50px;">${board.bno }번 글 상세보기</h5>
		
		<h2 style="margin: 40px 0px;">제목 : ${board.title }</h2>
		<h6>작성자 : ${board.writer }</h6>
		<h6>생성 일자 : <%= sdf.format(board.getRegDate()) %></h6>
		<h6>조회수 : ${board.viewCnt }</h6>
	</div>
	<div style="float: right; margin-right: 80px;" >
		<input type="button" class="btn btn-primary" value="수정" onclick="location.href='boardUpdateServlet?bno=${board.bno}'">
		<input type="button" class="btn btn-danger" value="삭제" data-toggle="modal" data-target="#myModal">
		<input type="button" class="btn btn-secondary" value="메인으로" onclick="location.href='boardListServlet'">
	</div>
	<br><hr><br>
	<div class="template">
		${board.content }
	</div>
	<br><hr><br>
	
	<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">삭제 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          ${board.bno }번 글을 정말 삭제하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.href='boardDeleteServlet?bno=${board.bno}'">삭제</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" >취소</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>
