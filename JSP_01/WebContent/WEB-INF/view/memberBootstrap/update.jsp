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
<style>
form{
	margin: 50px;
}
label{
	font-size: 1.3em;
	font-weight: bold;
}
</style>
<title>회원 정보 수정</title>
</head>
<body>
	<form action="memberUpdateServlet" method="post" class="was-validated" style="width: 400px;">
	  <h3 style="text-align:center;">회원정보 수정하기</h3><br>
	  <div class="form-group">
	    <label for="id">Id :</label>
		<input type="text" name="id" id="id" class="form-control" value="${id }" readonly/><br/>
	  </div>
	  <div class="form-group">
        <label for="pwd">Password :</label>
        <input type="password" class="form-control" id="pwd" name="pwd" required>
      </div>
	  <input type="submit" value="수정 완료" class="btn btn-primary" />
	  <input type="reset" value="reset" class="btn btn-primary"/>
	  <input type="button" value="메인으로 돌아가기" onclick="location.href='<%=request.getContextPath() %>/memberList'" class="btn btn-primary"/>
	</form>
			
</body>
</html>