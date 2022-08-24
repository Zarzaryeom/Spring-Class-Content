<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="replyLi" >
	<div class="user-block">
		
    </div>	
	<div class="timeline-item" >
  		<span class="time">
    		<i class="fa fa-clock"></i>{{prettifyDate fb_rdate}}
	 		<a class="btn btn-primary btn-xs {{fb_rno}}-a" id="modifyReplyBtn" data-rno={{fb_rno}}
				onclick="replyModifyModal_go('{{fb_rno}}');"				
				style="display:{{VisibleByLoginCheck fb_replyer}};"
	    		data-replyer={{fb_replyer}} data-toggle="modal" data-target="#modifyModal">Modify</a>
  		</span>
	
  		<h3 class="timeline-header"><strong style="display:none;">{{fb_rno}}</strong>{{fb_replyer}}</h3>
  		<div class="timeline-body" id="{{fb_rno}}-replytext">{{fb_rtext}} </div>
	</div>
</div>

{{/each}}
</script>
<!-- style="display:{{VisibleByLoginCheck fb_replyer}};" -->

<script type="text/x-handlebars-template"  id="reply-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
	<a href="javascript:getPage('<%=request.getContextPath()%>/reply/file/list.do?fb_no=${fileBoard.f_no}&page={{this}}',{{this}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>


<script>
var replyPage=1;

window.onload=function(){
	getPage("<%=request.getContextPath()%>/reply/file/list.do?fb_no=${fileBoard.f_no}&page="+replyPage);
}
function getPage(pageInfo,page){
	if(page) replyPage = page;
	$.getJSON(pageInfo,function(data){	
		printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}

function printData(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);	
	$('.replyLi').remove();
	target.after(html);
}

Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"VisibleByLoginCheck":function(replyer){
		var result="none";		
		if(replyer == "${loginUser.id}") result="visible";		
		return result;						  
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	}
});


/* pagination */
function printPagination(pageMaker,target,templateObject){
	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNumArray[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNumArray;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}

function replyRegist_go(){
	var replytext=$('#newReplyText').val();
	
	
	var data={
			"fb_no":"${fileBoard.f_no}",
			//"replyer":"${loginUser.id}",
			"fb_replyer":"clover1",
			"fb_rtext":replytext	
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/reply/file/regist.do",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
			//console.log(data);
			alert('댓글이 등록되었습니다.\n마지막페이지로 이동합니다.');
			replyPage=data; //페이지이동
			getPage("<%=request.getContextPath()%>/reply/file/list.do?fb_no="+${fileBoard.f_no}+"&page="+data); //리스트 출력
			$('#newReplyText').val("");	
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		}
	});
	
}

//댓글 수정 modal
function replyModifyModal_go(rno){
	//alert(rno);
	//alert($('div#'+rno+'-replytext').text());
	$('div#modifyModal div.modal-body #fb_rtext').val($('div#'+rno+'-fb_rtext').text());
	$('div#modifyModal div.modal-header h4.modal-title').text(rno);
}

//댓글 수정.
function replyModify_go(){
	//alert("modify btn");
	var rno=$('div#modifyModal h4.modal-title').text();
	var replytext=$('div#modifyModal #fb_rtext').val();
	
	var sendData={
			"fb_rno":rno,
			"fb_rtext":replytext
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/reply/file/modify.do",
		type:"post",
		data:JSON.stringify(sendData),
		contentType:"application/json",
		success:function(result){
			alert("수정되었습니다.");			
			getPage("<%=request.getContextPath()%>/reply/file/list.do?fb_no=${fileBoard.f_no}&page="+replyPage);
		},
		error:function(error){
			//alert('수정 실패했습니다.');
			AjaxErrorSecurityRedirectHandler(error.status);	
		},
		complete:function(){
			$('#close').trigger('click');
		}
	});
}

function replyRemove_go(){
	//alert("delete btn");
	
	var rno=$('.modal-title').text();
	
	$.ajax({
		url:"<%=request.getContextPath()%>/reply/file/remove.do?fb_rno="+rno+"&page="+replyPage+"&fb_no=${fileBoard.f_no}",
		type:"get",
		success:function(page){
			alert("삭제되었습니다." + page + "/" + rno);
			getPage("<%=request.getContextPath()%>/reply/file/list.do?fb_no=${fileBoard.f_no}&page="+page);
			replyPage=page;
		},
		error:function(error){
			//alert('삭제 실패했습니다.');
			AjaxErrorSecurityRedirectHandler(error.status);	
		},
		complete:function(){
			//$('#modifyModal').modal('hide');
			$('#close').trigger('click');
		}
	});
}
</script> 

















