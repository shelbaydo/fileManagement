<%@ page language="java" import="java.util.*,entity.User" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'index.jsp' starting page</title>
    
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
		$("#quitLogin").bind("click",function(){		
			var param = {"type":"quitLogin"};
 			$.ajax(
 			{	
 				url:getBasePath()+"/ControlForAjax",
 				async:true,
 				cache:false,
 				type:"post",			
 				data:JSON.stringify(param),
 				success:function(msg){
 					window.location.reload(true); 
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
   ${currentUser.username}
   <%
   		User user = (User)session.getAttribute("currentUser");
   		if(user==null){
   			 %><a href="<%=path %>/login.jsp">登录</a>
   			<a href="<%=path %>/register.jsp">注册</a>
   			<% 
   		}else{
   		%>
   			 <input type="button" value="退出登录" id="quitLogin"/>
   			 <a href="<%=path %>/MyPage.jsp">我的主页</a>
   		<% 
   		}	
  %>
   </body>
</html>
