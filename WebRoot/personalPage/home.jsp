<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/bootstrap.min.css" rel="stylesheet"/>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<script src="/fileManagement/js/height.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<script>
	$(function(){
		var height1=$(".home-main").outerHeight();
		var height2=$(".home-info").outerHeight();
		if(height1>height2)
		{
			$(".home-info").css("height",height1);
		}
		else
		{
			$(".home-main").css("height",height2);
		}
		$(".home-main").bind('resize',function(){
			var height1=$(".home-main").outerHeight();
			var height2=$(".home-info").outerHeight();
			if(height1>height2)
			{
				$(".home-info").css("height",height1);
			}
			else
			{
				$(".home-main").css("height",height2);
			}
		});
		var param = {"type":"find2LatestCourse"};
		var param1 = {"type":"find4LatestNote"};
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
 					if(message.courseNum==0)
 					{
 						
 						$("#latestCourse").append("<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无课程&nbsp;&nbsp;您可以选择<a href='/fileManagement/personalPage/add-course.jsp'>创建课程</a>哦</h5>");
 						
 					}else if(message.courseNum==1)
 					{
 						$("#latestCourse").children("h5").eq(1).css("display","none");
 						$("#latestCourse").children(".course").eq(0).css("display","block");
 						$("#latestCourse").children(".course").eq(0).children("div").eq(0).find("a").html(message.courseList[0]);
 						$("#latestCourse").children(".course").eq(0).children("div").eq(1).children("div").eq(1).html("笔记："+message.noteNumList[0]);
 						  
 					}else if(message.courseNum==2)
 					{
 						$("#latestCourse").children("h5").eq(1).css("display","none");
 						$(".course").css("display","block");
 						for(i=0;i<message.courseNum;i++)
 						{
 							$("#latestCourse").children(".course").eq(i).children("div").eq(0).find("a").html(message.courseList[i]);
	 						$("#latestCourse").children(".course").eq(i).children("div").eq(1).children("div").eq(1).html("笔记："+message.noteNumList[i]);
	 						
 						}						
 					}		    
 				},
 				error:function(response,status){		
					console.log(status);					
 				}				
 			});
 			$.ajax({	
 				url:getBasePath()+"/ANoteServlet",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param1),
 				success:function(msg){
 					
 					$("#noteUl li").css("display","none");
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象				
 					if(message.noteNum==0)
 					{	
 						$("#4notes").css("display","none");				
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
<title>${currentUser.username}的个人主页</title>
</head>
<body>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="home-body row">
				<div class="col-sm-8">
					<div class="home-main rounded">
						<div class="home-main-course clearfix" id="latestCourse">
							<h5>最新课程</h5>
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
						<div class="home-main-note" id="latestNote">
							<h5>最新笔记</h5>
							<div class="note-list" style="padding-top:0;" id="4notes">
								<ul class="rounded" id="noteUl">
									<li class="clearfix">
										<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-exclamation-circle note-icon-seen"></span></a>
										<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list"></span></div>
										<div class="note-time"></div>
									</li>
									<li class="clearfix">
										<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-ban note-icon-ban"></span></a>
										<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list"></span></div>
										<div class="note-time"></div>
									</li>
									<li class="clearfix">
										<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-exclamation-circle note-icon-seen"></span></a>
										<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list"></span></div>
										<div class="note-time"></div>
									</li>
									<li class="clearfix">
										<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-ban note-icon-ban"></span></a>
										<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list"></span></div>
										<div class="note-time"></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="home-info rounded">
						<div class="about-me">
							<h5>About Me</h5>
							<div class="me-pic"><img src="/fileManagement/profiles/${currentUser.userId}/profile.jpg" class="rounded-circle" style="width:100px;height:100px"/></div>
							<div class="clearfix me-info"><div class="me-name">${currentUser.username}</div><span class="best-level rounded">LV2</span></div>
							<div class="me-sign">${currentUser.signature}</div>
						</div>
						<div class="other-me">
							<h5>Other Me</h5>
							<table class="me-table">
								<tr>
									<td>签名：</td>
									<td>${currentUser.signature}</td>
								</tr>
								<tr>
									<td>笔记：</td>
									<td>${currentUser.noteNum}</td>
								</tr>
								<tr>
									<td>年龄：</td>
									<td>${currentUser.age}</td>
								</tr>
								<tr>
									<td>学历：</td>
									<td>${currentUser.ed}</td>
								</tr>
								<tr>
									<td>学校：</td>
									<td>${currentUser.school}</td>
								</tr>
								<tr>
									<td>著作：</td>
									<td>
										<ul>
											<li><a href="../home/infoNote.jsp">C语言的语言特征</a></li>
											<li><a href="../home/infoNote.jsp">C语言的语言特征</a></li>
											<li><a href="../home/infoNote.jsp">C语言的语言特征</a></li>
										</ul>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>