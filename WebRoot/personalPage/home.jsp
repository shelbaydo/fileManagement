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
		var param1 = {"type":"find4LastestNote"};
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
 					if(message.courseNum==0)
 					{
 						$(".course").css("display","none");
 						$("#latestCourse").append("<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无课程&nbsp;&nbsp;您可以选择<a href='/fileManagement/personalPage/add-course.jsp'>创建课程</a>哦</h5>");
 						
 					}else if(message.courseNum==1)
 					{
 						$("#latestCourse").children("h5").eq(1).css("display","none");
 						$("#latestCourse").children("div").eq(0).css("display","block");
 						$("#latestCourse").children("div").eq(0).children("div").eq(0).find("a").html(message.courseList[0]);
 						$("#latestCourse").children("div").eq(0).children("div").eq(1).childern.eq(1).html("笔记："+message.noteNumList[0]);
 						$("#latestCourse").children("div").eq(0).children("div").eq(2).childern.eq(1).html("文件夹："+message.folderNumList[0]);
 							
 						$(".courseDiv").bind("click",function(){
 							window.location.href = 'http://localhost:8080/fileManagement/CourseUnit?courseName='+$(this).html();
 						});  
 					}else if(message.courseNum==2)
 					{
 						$("#latestCourse").children("h5").eq(1).css("display","none");
 						$(".course").css("display","block");
 						for(i=0;i<message.courseNum;i++)
 						{
 							$("#latestCourse").children("div").eq(i).children("div").eq(0).find("a").html(message.courseList[i]);
	 						$("#latestCourse").children("div").eq(i).children("div").eq(1).childern.eq(1).html("笔记："+message.noteNumList[i]);
	 						$("#latestCourse").children("div").eq(i).children("div").eq(2).childern.eq(1).html("文件夹："+message.folderNumList[i]);
 						}
 						
 					}		
 				     
 				},
 				error:function(response,status){		
					console.log(status);					
 				}				
 			})	
 			
			
	
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
									<div class="yellow rounded-circle"></div>
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
									<div class="yellow rounded-circle"></div>
									<div class="course-content"></div>
								</div>
							</div>
						</div>
						<div class="home-main-note" id="latestNote">
							<h5>最新笔记</h5>
							<div class="note-list" style="padding-top:0;">
								<ul class="rounded">
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
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="home-info rounded">
						<div class="about-me">
							<h5>About Me</h5>
							<div class="me-pic"><img src="/fileManagement/pic/1.jpg" class="rounded-circle" style="width:100px"/></div>
							<div class="clearfix me-info"><div class="me-name">超级玛丽</div><span class="best-level rounded">LV2</span></div>
							<div class="me-sign">路漫漫其修远兮，吾将上下而求索。</div>
						</div>
						<div class="other-me">
							<h5>Other Me</h5>
							<table class="me-table">
								<tr>
									<td>签名：</td>
									<td>路漫漫其修远兮，吾将上下而求索。</td>
								</tr>
								<tr>
									<td>笔记：</td>
									<td>242</td>
								</tr>
								<tr>
									<td>生日：</td>
									<td>2018/11/16</td>
								</tr>
								<tr>
									<td>学历：</td>
									<td>本科</td>
								</tr>
								<tr>
									<td>学校：</td>
									<td>南昌大学</td>
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