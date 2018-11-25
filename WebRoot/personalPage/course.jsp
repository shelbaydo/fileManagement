<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	int pageNum = 1;
	int pageSize = 3;
	String pageIndex = request.getParameter("pageNum");
	if(pageIndex !=null)//如果访问的页面不为空则转换int类型
	{
		pageNum = Integer.parseInt(pageIndex);
	}
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
<title>${currentUser.username}的个人主页-我的课程</title>
<script>
	$(function(){
		var pageNum = $("#pageNum").html();
		var param = {"type":"findCourseInpage","pageNum":pageNum,"pageSize":2};
		$.ajax(
 			{	
 				url:getBasePath()+"/CourseServlet",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
 					$(".course").css("display","none");
 					$("#pageIndex").children("li").eq(2).css("display","none");
 					$("#pageIndex").children("li").eq(3).css("display","none");
 				 
 					if(message.courseNum==0)
 					{					
 						$("#latestCourse").append("<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无课程&nbsp;&nbsp;您可以选择<a href='/fileManagement/personalPage/add-course.jsp'>创建课程</a>哦</h5>");
 						
 					}else if(message.courseNum==1)
 					{
 						$("#latestCourse").children("h5").eq(0).css("display","none");
 						$("#courseList").children(".course").eq(0).css("display","block");
 						$("#courseList").children(".course").eq(0).children("div").eq(0).find("a").html(message.courseList[0]);
 						$("#courseList").children(".course").eq(0).children("div").eq(1).children("div").eq(1).html("笔记："+message.noteNumList[0]);
 										  
 					}else if(message.courseNum==2)
 					{	
 						
 						$("#latestCourse").children("h5").eq(0).css("display","none");
 						$(".course").css("display","block");
 						for(i=0;i<message.courseNum;i++)
 						{
 							$("#courseList").children(".course").eq(i).children("div").eq(0).find("a").html(message.courseList[i]);
	 						$("#courseList").children(".course").eq(i).children("div").eq(1).children("div").eq(1).html("笔记："+message.noteNumList[i]);
	 						
 						}						
 					}	
 					if(message.pageTotal==2){
 						$("#pageIndex").children("li").eq(2).css("display","block");
 						if(pageNum==1)
 						{
 							$("#pageIndex").children("li").eq(4).removeClass("page-item disabled");
 							$("#pageIndex").children("li").eq(4).addClass("page-item");
 							
 						}
 						if(pageNum==2)
 						{
 							$("#pageIndex").children("li").eq(0).removeClass("page-item disabled");
 							$("#pageIndex").children("li").eq(0).addClass("page-item");
 						}
 					}
 					if(message.pageTotal==3){
 						$("#pageIndex").children("li").eq(2).css("display","block");
 						$("#pageIndex").children("li").eq(3).css("display","block");
 						if(pageNum==1||pageNum==2)
 						{
 							$("#pageIndex").children("li").eq(4).removeClass("page-item disabled");
 							$("#pageIndex").children("li").eq(4).addClass("page-item");
 							
 						}
 						if(pageNum==2||pageNum==3)
 						{
 							$("#pageIndex").children("li").eq(0).removeClass("page-item disabled");
 							$("#pageIndex").children("li").eq(0).addClass("page-item");
 						}
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
			<div class="add-content rounded clearfix" id="latestCourse">
				<h4 class="add-title">我的课程</h4>
				<div class="col-sm-12 clearfix" style="margin-bottom:30px;">
					<a href="/fileManagement/personalPage/add-course.jsp"><button type="button" class="btn btn-success" style="font-size:14px;float: right;">+添加课程</button></a>
				</div>
				<div class="col-sm-12 clearfix" id="courseList">
					<div class="course">
						<div class="course-title">
							<a href="note.jsp"></a>
						</div>
						<div class="clearfix course-body">
							<div class="red rounded-circle"></div>
							<div class="course-content"></div>
						</div>
						<div class="clearfix course-body">
							
							<div class="course-content"></div>
						</div>
					</div>
					<div class="course">
						<div class="course-title">
							<a href="note.jsp"></a>
						</div>
						<div class="clearfix course-body">
							<div class="red rounded-circle"></div>
							<div class="course-content"></div>
						</div>
						<div class="clearfix course-body">
							
							<div class="course-content"></div>
						</div>
					</div>
				</div>
				<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;" id="pageIndex">
					<li class="page-item disabled"><a class="page-link" href="/fileManagement/personalPage/course.jsp?pageNum=<%=(pageNum-1) %>"><span class="fa fa-angle-double-left"></span></a></li>
					<li class="page-item active"><a class="page-link" href="/fileManagement/personalPage/course.jsp?pageNum=1">1</a></li>
					<li class="page-item"><a id="a-page" class="page-link" href="/fileManagement/personalPage/course.jsp?pageNum=2">2</a></li>
					<li class="page-item"><a id="a-page" class="page-link" href="/fileManagement/personalPage/course.jsp?pageNum=3">3</a></li>
					<li class="page-item disabled"><a id="a-page" class="page-link" href="/fileManagement/personalPage/course.jsp?pageNum=<%=(pageNum+1) %>"><span class="fa fa-angle-double-right"></span></a><br></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>