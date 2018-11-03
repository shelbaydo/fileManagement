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
 <script>
 $(function(){
    $("#codeBtn").bind("click",function(){	
 		var phone = $("input[name='phone']").val();
 		var param = {"phone":phone,"type":"askingcode"}
 			$.ajax(
 			{	
 				url:getBasePath()+"/SMS",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
 					alert('验证码为：'+message.code);										     
 				},
 				error:function(response,status){	
					console.log(status);					
 				}				
 			})	
 		})	
 	$("#phoneid").blur(function(){
 		
 		var phone = $(this).val();
 		var param = {"phone":phone,"type":"verifyingphone"};
 		$.ajax(
 			{	
 				url:getBasePath()+"/SMS",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
 					$("#noteLabel").html(message.msg);			
 				}				
 			})	
 	})
})
function getBasePath(){
	    return '<%=basePath%>';
    }
 </script>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
    欢迎来到注册页面 
    <form action="<%=path %>/DistributionCenter" method="post">
    	<input type="hidden" name="type" value="register">
    	用户名：<input type="text" name="username" /><br/>
    	手机号：<input type="text" name="phone" id="phoneid"/>
    	<label  id="noteLabel"></label><br/>
    	密码：<input type = "text" name="password"/><br/>
    	<input type="button" value="发送验证码" id="codeBtn" /><br/>
    	 验证码：<input type="text" name="verifyCode"/><br/>  	 
    	 <input type="submit" value="注册" > 
    	 ${RegisterResult}
    </form>
  </body>
</html>
