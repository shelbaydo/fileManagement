<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script src="<%=path%>/js/jquery-3.3.1.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="<%=path%>/js/json2.js"></script>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addCourse.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
	$(function(){
		
		$("#addCourse").bind("click",function(){
			
 		var courseName = $("#cN").val();
 		var param = {"courseName":courseName,"type":"addCourse"};
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
 					alert(message.msg);
 					window.location.href = 'http://localhost:8080/fileManagement/MyPage.jsp';										     
 				},
 				error:function(response,status){	
					console.log(status);					
 				}				
 			})	
 		})	
	})	
		function getBasePath(){
	    return '<%=basePath%>';
    }
	</script>
  </head>
  
  <body>
    	课程名：<input type="text" name="courseName" id="cN">
    	<input type="button" value="添加" id="addCourse">
  </body>
</html>
