<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
 		var alterMessage=$("#alterMessage").val();
 		if(alterMessage == "修改成功"){
 			alert(alterMessage);
 		}
 	})
 </script>
  </head>
  
  <body>
  <p style="display:none" id="alterMessage">${request.alterMessage }</p>
  <form action="<%=path %>/LoginServlet" method = "post">
   <input type="hidden" value="alter" name="type"/>
  	
   	用户名：<input name = "username" type = "text" value = "${currentUser.username }">
   	性别：<input name="sex" type = "text" value = "${currentUser.sex }">
   	年龄：<input name="age" type = "text" value = "${currentUser.age }">
   	学校：<input name="school" type = "text" value = "${currentUser.school }">
   	学历：<input name = "ed" type = "text" value = "${currentUser.ed }">
   	专业：<input name = "major" type = "text" value = "${currentUser.major }">
   	 学期：<input name = "semester" type = "text" value = "${currentUser.semester }">
   	 个性签名：<input name = "signature" type = "text" value = "${currentUser.signature }">
   	 生日：<input name = "birthday"  type="text" value="${currentUser.birthday }">
   	 <input type = "submit" value = "提交修改">
   	 </form>
  </body>
</html>
