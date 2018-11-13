<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addNote.jsp' starting page</title>
    
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
  		request.setCharacterEncoding("utf-8");
  		
  		String courseName = request.getParameter("courseName");
  		
  		
   %>
 
    <form action="<%=path %>/DistributionCenter" method="post">
     <input type="hidden" value="Note" name="type"/>
    <input type="hidden" value="<%=courseName %>" name="courseName">
    笔记标题：<input type="text" name="title"/>
    笔记内容：<input type="text" name="content"/>
    是否公开：
    <label><input name="isPublic" type="radio" value="yes" />是</label> 
	<label><input name="isPublic" type="radio" value="no" />否</label>
    <input type = "submit" value="提交"/>
    </form>
    ${request.addNoteMessage}
  </body>
</html>
