<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'courseMainPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="<%=path%>/js/jquery-3.3.1.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="<%=path%>/js/json2.js"></script>
 <script>
	$(function(){
		var courseName = $("#courseName").html();
		var param = {"type":"findAllNote","courseName":courseName};
		$.ajax(
 			{	
 				url:getBasePath()+"/ANoteServlet",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象		
 				    for (var i=0;i<message.noteNum;i++)
					{
						$("p").append("<div class='noteDiv'>"+message.noteList[i]+"</div>"+"<br/>");
						
					}	
					$("div").css("color","red").css("cursor","pointer");
					
 					$(".noteDiv").bind("click",function(){
 						
 						window.location.href = 'http://localhost:8080/fileManagement/CourseUnit?courseName='+$(this).html();
 					});   
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
  </head>
  
  <body>
   <p id="courseName">${requestedCourse.name}</p>
   <a href = "<%=path %>/addNote.jsp?courseName=${requestedCourse.name}">增添笔记</a>
  </body>
</html>
