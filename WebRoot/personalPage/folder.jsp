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
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/bootstrap.min.css" rel="stylesheet"/>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<script src="/fileManagement/js/height.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<script src="/fileManagement/js/folder.js"></script>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<script src="<%=path%>/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<title>${currentUser.username}的个人主页-我的文件夹</title>
<script>
function check(){
	var name = $("input[name='name']").val();
	var param = {"name":name,"type":"checkE"};
	var ajaxFlag=true;
		$.ajax({
				url:getBasePath()+"/AFolderServlet",
				async:false,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(msg){
					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
					if(message.checkResult=="ok")
					{	
						ajaxFlag=true;
					}else if(message.checkResult=="no"){
						alert('此文件夹已存在');
						ajaxFlag = false;
					}
				}
			});
	return ajaxFlag;
}
function changePage(event){
		var pageNum = event.data.pageNum;
		if(pageNum==0){
			var num = $("#pageNum").html();
			pageNum = Number(num)-1;
		}else if(pageNum==-1){
			var num = $("#pageNum").html();
			pageNum = Number(num)+1;
		}
		$("#pageNum").html(pageNum);
		var ajaxParam = {"type":"findFolderInPage","pageNum":pageNum,"pageSize":3};
		$.ajax({
				url:getBasePath()+"/AFolderServlet",
 				async:false,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(ajaxParam),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
 					$("#cpUl").children("li").eq(0).addClass("disabled");
					$("#cpUl").children("li").eq(4).addClass("disabled");
					$("#cpUl").children("li").eq(2).css("display","none");
					$("#cpUl").children("li").eq(3).css("display","none");	
 					$(".folders-a").css("display","none");
					for(i = 0;i<message.folderNum;i++)
					{
						$("#folderV").after("<a class='folders-a'> <div class='folder'> <span class='fa fa-folder-open folder-icon'></span> <div class='folder-name'>"+message.folderList[i]+"</div></div></a>");
					}
					if(message.pageTotal==2){
						$("#cpUl").children("li").eq(2).css("display","block");
					}
					if(message.pageTotal>=3){
						$("#cpUl").children("li").eq(2).css("display","block");
						$("#cpUl").children("li").eq(3).css("display","block");
					}
 					if((pageNum==1)&&(pageNum!=message.pageTotal))
					{
						
						$(".cangle").eq(1).removeClass("disabled");
					}
					if(pageNum==message.pageTotal)
					{
						$(".cangle").eq(0).removeClass("disabled");
						
					}
					if((pageNum>1)&&(pageNum<message.pageTotal))
					{
						$(".cangle").eq(0).removeClass("disabled");
						$(".cangle").eq(1).removeClass("disabled");	
					}    
 					 
 				},
 				error:function(response,status){		
					console.log(status);					
 				}				
		});	
		$(".folders-a").bind("click",function(){
 
			var folderName = $(this).children("div").eq(0).children("div").eq(0).html();
			 
			var url = getBasePath()+"personalPage/folder-content.jsp?folderName="+folderName;
			 
			window.location.href=url;

		})
	}
$(function(){

	var pageNum = $("#pageNum").html();
	var param = {"type":"findFolderInPage","pageNum":pageNum,"pageSize":3};
	$.ajax({
				url:getBasePath()+"/AFolderServlet",
 				async:false,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
 					$("#cpUl").children("li").eq(0).addClass("disabled");
					$("#cpUl").children("li").eq(4).addClass("disabled");
					$("#cpUl").children("li").eq(2).css("display","none");
					$("#cpUl").children("li").eq(3).css("display","none");	
 					$("#pageNum").html(message.pageNum);
 					if(message.folderNum==0)
 					{
 						$("#folderV").after("<h4>您还没有创建任何文件夹，请先创建文件夹</h4>");
 						$("#cpUl").css("display","none");
 					}
 					else
 					{
 						$("#folderV ~ h4").css("display","none");
 						
 						for(i = 0;i<message.folderNum;i++)
 						{
 							$("#folderV").after("<a class='folders-a'> <div class='folder'> <span class='fa fa-folder-open folder-icon'></span> <div class='folder-name'>"+message.folderList[i]+"</div></div></a>");
 						}
 					}
 					if(message.pageTotal==2){
						$("#cpUl").children("li").eq(2).css("display","block");
					}
					if(message.pageTotal>=3){
						$("#cpUl").children("li").eq(2).css("display","block");
						$("#cpUl").children("li").eq(3).css("display","block");
					}
					if((pageNum==1)&&(pageNum!=message.pageTotal))
					{
						$(".cangle").eq(0).removeClass("disabled");
						$(".cangle").eq(1).removeClass("disabled");
					}
					if(pageNum==message.pageTotal)
					{
						$(".cangle").eq(0).removeClass("disabled");
					}
					if((pageNum>1)&&(pageNum<message.pageTotal))
					{
						$(".cangle").eq(0).removeClass("disabled");
						$(".cangle").eq(1).removeClass("disabled");	
					}    
 					
 				},
 				error:function(response,status){		
					console.log(status);					
 				}				
 			});
		$(".changePage").eq(0).bind("click", {pageNum:0},changePage);
		$(".changePage").eq(1).bind("click", {pageNum:1},changePage);
		$(".changePage").eq(2).bind("click", {pageNum:2},changePage);
		$(".changePage").eq(3).bind("click", {pageNum:3},changePage);
		$(".changePage").eq(4).bind("click", {pageNum:-1},changePage);
		$(".folders-a").bind("click",function(){
			 
			var folderName = $(this).children("div").eq(0).children("div").eq(0).html();
			 
			var url = getBasePath()+"personalPage/folder-content.jsp?folderName="+folderName;
			 
			window.location.href=url;
			
		})
})
function getBasePath(){
	    return '<%=basePath%>';
    }
</script>
</head>
<body>
	<span style="display:none" id="tag"></span>
	<span style="display:none" id="pageNum"><%=pageNum%></span>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix">
				<h4 class="add-title">我的文件夹</h4>
				<div class="col-sm-12 clearfix" style="margin-bottom:30px;">
					<button type="button" id="add" class="btn btn-success" style="font-size:14px;float: right;">+创建文件夹</button>
				</div>
				<div class="col-sm-12 clearfix">
					<div class="add-folder rounded">
						<form action="<%=path %>/DistributionCenter" method="post" onsubmit="return check()">
							<input type="hidden" value="Folder" name="type"/>
							<label for="course" style="font-size: 16px;font-weight:550;">文件夹名称：</label>
							<input name = "name" type="text" placeholder="输入文件夹名称"  id="course" class="form-control" style="font-size:13px;margin-bottom:8px;"/>
							<input type="submit" class="btn btn-primary btn-sm" value="添加" style="font-size: 13px"/>
							<button type="button" id="cancel" class="btn btn-secondary btn-sm" style="font-size: 13px">取消</button>
						</form>
					</div>
					<div class="folders clearfix">
						<nav class="breadcrumb">
						  <span class="breadcrumb-item active">主页面</span>
						</nav>
						<div id="folderV" class="col-sm-12 clearfix" style="padding:0;"><a href="add-document.jsp?folder='主页面'"><button type="button" class="btn btn-info add-document">+上传文件</button></a></div>				
					</div>
				</div>
				<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;" id="cpUl">
					<li class="page-item disabled cangle" id="firstLi"><a class="page-link changePage" ><span class="fa fa-angle-double-left"></span></a></li>
					<li class="page-item active"><a class="page-link changePage">1</a></li>
					<li class="page-item"><a id="a-page" class="page-link changePage" >2</a></li>
					<li class="page-item"><a id="a-page" class="page-link changePage" >3</a></li>
					<li class="page-item cangle"><a id="a-page" class="page-link changePage"><span class="fa fa-angle-double-right"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>