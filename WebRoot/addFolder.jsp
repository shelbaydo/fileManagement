<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addFolder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
   <% 
   		int courseId = Integer.parseInt(request.getParameter("courseId"));
   %>
   <form action="<%=path %>/DistributionCenter" method="post">
    <input type="hidden" value="Folder" name="type"/>
   文件夹名：<input type="text" name="name">
   <input type="hidden" value="<%=courseId%>" name="courseId"/>
   <input type="submit" value="确定"/>
   </form>
  </body>
</html>
