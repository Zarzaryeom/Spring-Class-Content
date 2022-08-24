<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/summernote/js/summernote-lite.js"></script>
<script src="<%=request.getContextPath() %>/summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/summernote/css/summernote-lite.css">
<script>
$(document).ready(function() {
	$('#content').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '내용을 입력해 주세요!'
	});
});

</script>
<title>글 수정하기</title>
<style>
input{
	margin-right: 10px;
}

</style>
</head>
<body>
	
	<header>
		<h2 style="margin-top:50px; text-align: center;">${board.bno }번 글 수정하기</h2>
	</header>
	<br><hr><br>
	<div class="container">
		<form action="" method="post" class="was-validated">
			<div style="float: right;">
				<input type="submit" value="글 수정하기" class="btn btn-success">
				<input type="button" value="글 수정 취소" class="btn btn-secondary" onclick="location.href='boardDetailPassServlet?bno=${board.bno}'">
			</div>
			<br>
			<div class="form-group">
				<label for="title">제목 :</label>
				<input type="text" id="title" name="title" placeholder="내용을 입력하세요." value="${board.title }" class="form-control" required>
				<div class="invalid-feedback">제목이 입력되지 않았습니다.</div>
			</div>
			<br>
			<div class="form-group">
				<label for="content">내용 :</label>
				<textarea id="content" name="content" rows="10" cols="10" placeholder="내용을 입력하세요." required>${board.content }</textarea>
				<div class="invalid-feedback">내용이 입력되지 않았습니다.</div>
			</div>
		</form>
	</div>
	
</body>
</html>