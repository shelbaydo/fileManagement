<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	int pageNum = 1;
	int pageSize = 3;
	
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<script src="/fileManagement/js/height.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<title>${currentUser.username}的个人主页-我的笔记</title>
<script>
function onPageChange(event) {
  	var pageNum = event.data.pageNum;
  	var lino = event.data.lino;
  	if(lino== undefined)
  	{
  		
  	}
  	$("#pageIndex").children("li").removeClass("active");
  	$("#pageIndex").children("li").eq(Number(lino)).addClass("active");
  	if(pageNum==0)
  	{
  		var i = $("#pageNum").html();
  		pageNum=Number(i)-1;
  	}
  	else if(pageNum==-1)
  	{
  		var i = $("#pageNum").html();
  		pageNum=Number(i)+1;
  	}else
  	{
  		
  	}
  	$("#pageNum").html(pageNum);	
  	var isPublic = $("select[name='isPublic']").val();	
	var courseScope = $("select[name='courseScope']").val();
	var noteT = $("input[name='noteTitle']").val();
	if(noteT.length>0)
	{
		noteTitle= $("input[name='noteTitle']").val();
	}else
	{
		noteTitle="";
	}
	var paramNote = {"type":"limitedSearchForNotes","isPublic":isPublic,"courseScope":courseScope,"noteTitle":noteTitle,"pageNum":pageNum,"pageSize":4};
	
	$.ajax(
		{	
			url:getBasePath()+"/ANoteServlet",
			async:true,
			cache:false,
			type:"post",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(paramNote),
			success:function(msg){					
				$("#noteUl li").css("display","none");
				$("#pageIndex").children("li").eq(0).addClass("disabled");
				$("#pageIndex").children("li").eq(4).addClass("disabled");
				var message = $.parseJSON(msg);//将json类型字符串转换为json对象		
				$("#pageIndex").children("li").eq(2).css("display","none");
				$("#pageIndex").children("li").eq(3).css("display","none");	
				if(message.noteNum==0)
				{	
					 $("#noteUl").css("display","none");
					 $("#theForm").after("<div><p>没有您要查找的内容</p></div>");
				}else 
				{
					for(i=0;i<message.noteNum;i++)
					{	
						$("#noteUl").children("li").eq(i).css("display","block");
						$("#noteUl").children("li").eq(i).find("a").html(message.noteList[i]);
						$("#noteUl").children("li").eq(i).children("div").eq(0).children("span").eq(1).html(message.courseNameOfNoteList[i]);
						$("#noteUl").children("li").eq(i).children("div").eq(1).html(message.createTimeOfNoteList[i]);  								
					}					
				}
				if(message.pageTotal==2){
					$("#pageIndex").children("li").eq(2).css("display","block");
				}
				if(message.pageTotal>=3){
					$("#pageIndex").children("li").eq(2).css("display","block");
					$("#pageIndex").children("li").eq(3).css("display","block");
				}
				if((pageNum==1)&&(pageNum!=message.pageTotal))
				{
					$("#pageIndex").children("li").eq(4).removeClass("disabled");
				}
				if(pageNum==message.pageTotal)
				{
					$("#pageIndex").children("li").eq(0).removeClass("disabled");
				}
				if((pageNum>1)&&(pageNum<message.pageTotal))
				{
					$("#pageIndex").children("li").eq(0).removeClass("disabled");
					$("#pageIndex").children("li").eq(4).removeClass("disabled");	
				}    
			},
			error:function(response,status){		
				console.log(status);					
			}				
		});
	}
	$(function(){	
		var pageNum = $("#pageNum").html();
		var param1 = {"type":"findAllCourse"};
		var param = {"type":"findNotesInPage","pageNum":pageNum,"pageSize":4};
		$(".changePage").eq(0).bind("click", {pageNum:0},onPageChange);
		$(".changePage").eq(1).bind("click", {pageNum:1,lino:1},onPageChange);
		$(".changePage").eq(2).bind("click", {pageNum:2,lino:2},onPageChange);
		$(".changePage").eq(3).bind("click", {pageNum:3,lino:3},onPageChange);
		$(".changePage").eq(4).bind("click", {pageNum:-1},onPageChange);
		$("#searchSpecifics").bind("click",{pageNum:1},onPageChange);
		$.ajax(
 			{	
 				url:getBasePath()+"/CourseServlet",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param1),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
				    for (var i=0;i<message.courseNum;i++)
					{
						$("#theForm").children("select").eq(1).append("<option value="+message.courseList[i]+">"+message.courseList[i]+"</option>");
					}	
 				     
 				},
 				error:function(response,status){		
					console.log(status);					
 				}				
 			});
		$.ajax(
 			{	
 				url:getBasePath()+"/ANoteServlet",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType:"application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){					
 					$("#noteUl li").css("display","none");
					$("#pageIndex").children("li").eq(0).addClass("disabled");
					$("#pageIndex").children("li").eq(4).addClass("disabled");
					var message = $.parseJSON(msg);//将json类型字符串转换为json对象		
					$("#pageIndex").children("li").eq(2).css("display","none");
					$("#pageIndex").children("li").eq(3).css("display","none");	
					if(message.noteNum==0)
					{	
						$(".fornone").css("display","none");				
						$("#latestNote").append("<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无笔记&nbsp;&nbsp;您可以选择<a href='/fileManagement/personalPage/add-note.jsp'>创建笔记</a></h5>");
					}else 
					{
						for(i=0;i<message.noteNum;i++)
						{	
							$("#noteUl").children("li").eq(i).css("display","block");
							$("#noteUl").children("li").eq(i).find("a").html(message.noteList[i]);
							$("#noteUl").children("li").eq(i).children("div").eq(0).children("span").eq(1).html(message.courseNameOfNoteList[i]);
							$("#noteUl").children("li").eq(i).children("div").eq(1).html(message.createTimeOfNoteList[i]);  								
						}					
					}
					if(message.pageTotal==2){
						$("#pageIndex").children("li").eq(2).css("display","block");
					}
					if(message.pageTotal>=3){
						$("#pageIndex").children("li").eq(2).css("display","block");
						$("#pageIndex").children("li").eq(3).css("display","block");
					}
					if((pageNum==1)&&(pageNum!=message.pageTotal))
					{
						$("#pageIndex").children("li").eq(4).removeClass("disabled");
					}
					if(pageNum==message.pageTotal)
					{
						$("#pageIndex").children("li").eq(0).removeClass("disabled");
					}
					if((pageNum>1)&&(pageNum<message.pageTotal))
					{
						$("#pageIndex").children("li").eq(0).removeClass("disabled");
						$("#pageIndex").children("li").eq(4).removeClass("disabled");	
					}    
 					    
 				},
 				error:function(response,status){		
					console.log(status);					
 				}				
 			});
 			 
	})
	function getBasePath(){
	    return '<%=basePath%>';
    }
</script>
</head>
<body>
	<span style="display:none" id="pageNum"><%=pageNum%></span>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix" id="latestNote">
				<h4 class="add-title">我的笔记</h4>
				<div class="col-sm-12 clearfix">
					<a href="/fileManagement/personalPage/add-note.jsp"><button type="button" class="btn btn-success" style="font-size:14px;float: right;">+写笔记</button></a>
				</div>
				<div class="note-list fornone">
					<form action="" method="post" class="clearfix" style="margin-bottom:15px;" id="theForm">
						<select class="form-control note-search-select" id="sel_seen" name="isPublic">
							<option value="0" selected="selected">所有文章</option>
							<option value="1">公开</option>
							<option value="-1">不公开</option>
						</select>
						<select class="form-control note-search-select" id="sel_seen" name="courseScope">
							<option value="所有课程" selected="selected">所有课程</option>
							
						</select>
						<input type="text" class="form-control note-search" placeholder="Search all notes" name="noteTitle" />
						<input type="button" class="btn btn-primary note-search-submit" value="搜索" id="searchSpecifics"/>
					</form>
					<ul class="rounded" id="noteUl">
						<li class="clearfix">
							<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-exclamation-circle note-icon-seen"></span>c语言的语言特点</a>
							<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">C语言</span></div>
							<div class="note-time">#发表于1天前</div>
						</li>
						<li class="clearfix">
							<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-ban note-icon-ban"></span>c语言的语言特点</a>
							<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">C语言</span></div>
							<div class="note-time">#发表于2天前</div>
						</li>
						<li class="clearfix">
							<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-exclamation-circle note-icon-seen"></span>java语言的语言特点</a>
							<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">JAVA语言</span></div>
							<div class="note-time">#发表于3天前</div>
						</li>
						<li class="clearfix">
							<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-ban note-icon-ban"></span>java语言的语言特点</a>
							<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">JAVA语言</span></div>
							<div class="note-time">#发表于4天前</div>
						</li>
					</ul>
				</div>
				<ul class="pagination fornone" style="float:right;margin-right:50px;margin-top:20px;" id="pageIndex">
					<li class="page-item disabled"><a class="page-link changePage" ><span class="fa fa-angle-double-left"></span></a></li>
					<li class="page-item active"><a class="page-link changePage">1</a></li>
					<li class="page-item"><a id="a-page" class="page-link changePage" >2</a></li>
					<li class="page-item"><a id="a-page" class="page-link changePage" >3</a></li>
					<li class="page-item disabled"><a id="a-page" class="page-link changePage" ><span class="fa fa-angle-double-right"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>