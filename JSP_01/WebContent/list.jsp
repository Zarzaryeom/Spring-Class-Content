<%@page import="com.jsp.command.PageMaker"%>
<%@page import="java.util.Map"%>
<%@page import="com.jsp.dto.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="memberList" value="${dataMap.memberList }" />
    
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
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>

      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">1</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  	미구현 인물
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">추후 추가</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Month Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">전체 메세지 보기</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">3 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 1 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 1 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 1 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">전체 알람 보기</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">이병진</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
               	 미구현
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>미구현 v1</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>미구현 v2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>미구현 v3</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>회원 목록</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">MemberList</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="card">
        <div class="card-header">
          <h3 class="card-title" style="margin-top: 15px;">일반 회원 목록(Total : 미구현2 )</h3>
          
          <input type="button" value="새 회원 등록" class="btn btn-secondary" onclick="OpenWindow('regist.do','회원등록',800,800);" style="float: right;margin-bottom: 10px;">
        </div>
        <!-- /.card-header -->
        <div class="card-body">
        	<div class="row">
        		<div class="col-sm-6" >
       			</div>
        		<div class="col-sm-6" >
					<div class="input-group row">
						<!-- search bar -->
						<!-- sort num -->
						<select class="form-control col-md-3" name="perPageNum"
							id="perPageNum" onchange="list_go(1);">
							<option value="10"	${cri.perPageNum==10 ? "selected" : "" }>정렬개수</option>
							<option value="2"	${cri.perPageNum==2 ? "selected" : "" }>2개씩</option>
							<option value="3"	${cri.perPageNum==3 ? "selected" : "" }>3개씩</option>
							<option value="5"	${cri.perPageNum==5 ? "selected" : "" }>5개씩</option>
						</select>
						<!-- search bar -->
						<select class="form-control col-md-3" name="searchType"
							id="searchType">
							<option value="">검색구분</option>
							<option value="i" ${param.searchType=='i' ? "selected": "" }>아이디</option>
							<option value="n" ${param.searchType=='n' ? "selected": "" }>이름</option>
							<option value="p" ${param.searchType=='p' ? "selected": "" }>전화번호</option>
							<option value="e" ${param.searchType=='e' ? "selected": "" }>이메일</option>
						</select>
						<!-- keyword -->
						<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" /> 
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
						<!-- end : search bar -->
					</div>
				</div>
			</div>
			
		<!-- pagination -->
        <div class="jsgrid-pager-container">
            <div class="jsgrid-pager" style="float: right;">Pages: 
              <span class="jsgrid-pager-nav-button ">
                <a href="javascript:list_go(1);">First</a>
              </span> 
              <span class="jsgrid-pager-nav-button ">
                <a href="javascript:void(0);">Prev</a>
              </span>
                       
              <c:forEach var="i" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1" varStatus="status">
              	<c:choose>              	
               		<c:when test="${i == cri.page}">
               			<span class="jsgrid-pager-page jsgrid-pager-current-page">
              				${i }
              			</span>
               		</c:when>
               		<c:otherwise>
               			<span class="jsgrid-pager-page">
              				<a href="javascript:list_go(${i });">${i }</a>
              			</span>
               		</c:otherwise>
               	</c:choose>             
              </c:forEach> 
               
              <span class="jsgrid-pager-nav-button"><a href="javascript:void(0);">Next</a></span> 
              <span class="jsgrid-pager-nav-button"><a href="javascript:void(0);">Last</a></span>
               &nbsp;&nbsp; 1(미구현) of 5(미구현)
            </div>
          </div>
        
        
          <div id="jsGrid1" class="jsgrid" style="position: relative; height: 100%; width: 100%;">
            <div class="jsgrid-grid-header jsgrid-header-scrollbar">
              <table class="jsgrid-table">
                <tr class="jsgrid-header-row">
                  <th class="jsgrid-header-cell jsgrid-header-sortable" style="width: 50px;"> 사진</th>
                  <th class="jsgrid-header-cell jsgrid	-align-right jsgrid-header-sortable" style="width: 80px;">아이디</th>
                  <th class="jsgrid-header-cell jsgrid-header-sortable" style="width: 50px;">비밀번호</th>
                  <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 50px;">이름</th>
                  <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 100px;">이메일</th>
                  <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 50px;">전화번호</th>
                  <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 50px;">생성일자</th>
                  
                  
                </tr> 
                <!-- 
                <tr class="jsgrid-filter-row" style="display: none;">
                  <td class="jsgrid-cell" style="width: 50px;"><input type="number"></td>
                  <td class="jsgrid-cell jsgrid-align-right" style="width: 100px;"><input type="number"></td>
                  <td class="jsgrid-cell" style="width: 100px;"><input type="text"></td>
                  <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">
                    <select>
                      <option value="0"></option>
                      <option value="1">United States</option>
                      <option value="2">Canada</option>
                      <option value="3">United Kingdom</option>
                      <option value="4">France</option>
                      <option value="5">Brazil</option>
                      <option value="6">China</option>
                      <option value="7">Russia</option>
                    </select></td>
                  <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">
                    <input type="checkbox" readonly=""></td>
                  </tr>
                  <tr class="jsgrid-insert-row" style="display: none;">
                    <td class="jsgrid-cell" style="width: 50px;"><input type="text"></td>
                    <td class="jsgrid-cell jsgrid-align-right" style="width: 100px;"><input type="number"></td>
                    <td class="jsgrid-cell" style="width: 100px;"><input type="text"></td>
                    <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">
                      <select>
                        <option value="0"></option>
                        <option value="1">United States</option>
                        <option value="2">Canada</option>
                        <option value="3">United Kingdom</option>
                        <option value="4">France</option>
                        <option value="5">Brazil</option>
                        <option value="6">China</option>
                        <option value="7">Russia</option>
                      </select></td>
                    <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"><input type="checkbox"></td>
                  </tr> 
                   -->
                </table>
              </div>
          </div>
          
          <div class="jsgrid-grid-body" style="height: 870.972px;">
            <table class="jsgrid-table">
              <tbody>
              
              <c:choose>
		      	<c:when test="${memberList ne null }">
		      		<c:forEach items="${memberList }" var="member" varStatus="status">
		     			<tr onclick="" style="cursor:pointer;" class="jsgrid-row">
		     				<td class="jsgrid-cell" style="width: 50px;">${member.picture }</td>
		     	  			<td class="jsgrid-cell jsgrid-align-center" style="width: 80px;">${member.id }</td>
		     	  			<td class="jsgrid-cell" style="width: 50px;">${member.pwd }</td>
		     	  			<td class="jsgrid-cell jsgrid-align-center" style="width: 50px;">${member.name }</td>
		     	  			<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${member.email }</td>
		     	  			<td class="jsgrid-cell jsgrid-align-center" style="width: 50px;">${member.phone.replace('-','') }</td>
		     				<td class="jsgrid-cell jsgrid-align-center" style="width: 50px;"><fmt:formatDate value="${member.regdate }" pattern="yyyy-MM-dd"/></td>
		     			</tr>
					</c:forEach>
		     	</c:when>
			    <c:otherwise>
			    		<tr style="cursor:pointer;" class="jsgrid-row">
			     			<td class="jsgrid-cell">
		    	 				해당 내용이 없습니다.
		     				</td>
		     			</tr>
			    </c:otherwise>
			  </c:choose>
			  
              </tbody>
            </table>
          </div>
          
                   
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 1.0.1
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<form id="jobForm">
	<input type="hidden" name="page" value="" />
	<input type="hidden" name="perPageNum" value="" />
	<input type="hidden" name="searchType" value="" />
	<input type="hidden" name="keyword" value="" />
</form>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jsGrid -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jsgrid/demos/db.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jsgrid/jsgrid.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/demo.js"></script> -->
<!-- common -->
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<!-- Page specific script -->
<script>
function list_go(page,url){
	//alert(page);
	if(!url) url="list.do";
	
	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}

/*
$(function(){
		$("#jsGrid1").on('click', function(){
			sort();
		})
	})
*/
	
/*
  $(function () {
    $("#jsGrid1").jsGrid({
        height: "100%",
        width: "100%",

        sorting: true,
        paging: true,

        //data: db.clients,

        fields: [
            { name: "Name", type: "text", width: 150 },
            { name: "Age", type: "number", width: 50 },
            { name: "Address", type: "text", width: 200 },
            { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
            { name: "Married", type: "checkbox", title: "Is Married" }
        ]
    });
  })*/
</script>
</body>
</html>
