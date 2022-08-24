<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>   
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 목록</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- jsGrid -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/jsgrid/jsgrid.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/jsgrid/jsgrid-theme.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">

<style>
.jsgrid-table{
	text-align: center;
}
.jsgrid-row:hover{
	font-weight: bold;
	text-decoration: underline;
	cursor: pointer;
}
</style>

</head>
<body class="hold-transition sidebar-mini">

<div class="wrapper">

<%@ include file="./main/header.jsp" %>
<%@ include file="./main/aside.jsp" %>

<decorator:body/>

<%@ include file="./main/footer.jsp" %>
	
</div>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jsGrid -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jsgrid/demos/db.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jsgrid/jsgrid.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- common -->
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<!-- Page specific script -->

<script>
	$('div.wrapper').css({
		"max-width":"1280px",
		"margin":"0 auto"		
	});
</script>  

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script  type="text/x-handlebars-template"  id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item subMenu" >
    		<a href="javascript:goPage('<%=request.getContextPath() %>{{murl }}','{{mcode }}');" class="nav-link">
        		<i class="{{micon}}"></i>
          		 <p>{{mname}}</p>
      		</a>
		</li>
	{{/each}}
</script>
<script>
	window.onload = function(){
		goPage('<%= request.getContextPath()%>${menu.murl}','${menu.mcode}');
		subMenu_go('${menu.mcode}'.substring(0,3) + "0000");
	}

</script>

<script>
function goPage(url, mCode){
	//alert(url);
	$('iframe[name="ifr"]').attr("src",url);
	
	// HTML5 지원브라우저에서 사용 가능
	if(typeof(history.pushState) == 'function'){
		// 현재 주소를 가져온다.
		var renewURL = location.href;
		// 현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
		renewURL = renewURL.substring(0, renewURL.indexOf(".do") + 3);
		
		if(mCode != 'M000000'){
			renewURL += '?mCode=' + mCode;
		}
		// 페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		// null이 위치한 곳은 제목을 주는 곳
		history.pushState(mCode, null, renewURL);
		
	} else{
		location.hash = "#" + mCode;
	}
}


function subMenu_go(mCode){
	//alert(mCode);
	if(mCode!="M000000"){
		$.getJSON("<%=request.getContextPath()%>/subMenu.do?mCode="+ mCode, 
			function(data){
				printData(data,$('.subMenuList'), $('#subMenu-list-template'), '.subMenu');
		});
	}else{
		$('.subMenuList').html("");
	}
}



function printData(dataArr, target, templateObject, removeClass){
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(dataArr);
	
	$(removeClass).remove();
	target.append(html);
}
	
</script>

</body>
</html>