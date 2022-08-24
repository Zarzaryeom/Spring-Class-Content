<%@page import="com.jsp.command.PageMaker"%>
<%@page import="java.util.Map"%>
<%@page import="com.jsp.dto.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.jsp.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="memberList" value="${dataMap.memberList }" />

    
  <!-- Content Wrapper. Contains page content -->
  <div class="wrapper">
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
          <h3 class="card-title" style="margin-top: 15px;">일반 회원 목록(Total : ${pageMaker.totalCount } )</h3>
          <input type="button" value="새 회원 등록" class="btn btn-secondary" onclick="OpenWindow('registForm.do','회원등록',800,800);" style="float: right;margin-bottom: 10px;">
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
        <div class="jsgrid-pager-container row">
        	<div class="col-sm-6" >
       		</div>
       		<div class="col-sm-6" >       			
	            <div class="jsgrid-pager" style="float: right;padding: 0.5em 0;">Pages: 
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
          </div>
        
        
          <div id="jsGrid1" class="jsgrid" style="position: relative; height: 100%; width: 100%;">
            <div class="jsgrid-grid-header jsgrid-header-scrollbar">
              <table class="jsgrid-table" style="width: 100%; text-align:center;">
                <tr class="jsgrid-header-row">
                  <th class="jsgrid-header-cell jsgrid-header-sortable" style="width: 50px;"> 사진</th>
                  <th class="jsgrid-header-cell jsgrid	-align-right jsgrid-header-sortable" style="width: 80px;">아이디</th>
                  <th class="jsgrid-header-cell jsgrid-header-sortable" style="width: 50px;">비밀번호</th>
                  <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 50px;">이름</th>
                  <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 100px;">이메일</th>
                  <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 50px;">전화번호</th>
                  <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 50px;">생성일자</th>
                </tr> 
              </table>
            </div>
          </div>
          
          
          <div class="jsgrid-grid-body" style="height: 870.972px;">
            <table class="jsgrid-table" style="width: 100%; text-align:center;">
              <c:choose>
		      	<c:when test="${memberList ne null }">
		      		<c:forEach items="${memberList }" var="member" varStatus="status">
		     			<tr onclick="OpenWindow('detail.do?id=${member.id}','회원상세',700,800);" style="cursor:pointer;" class="jsgrid-row">
		     				<td class="jsgrid-cell" style="width: 50px;">
		     					<span class="manPicture" data-id="${member.id }" style="display:block;width:40px;height:40px;margin:0 auto;"></span>
		     				</td>
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


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<script>
window.onload=function(){
	MemberPictureThumb('<%=request.getContextPath()%>');
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
