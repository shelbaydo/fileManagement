<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>智存网-用户注册</title>
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/index.css" rel="stylesheet"/>
<link href="/fileManagement/css/home.css" rel="stylesheet"/>
<script src="<%=path%>/js/jquery-3.3.1.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="<%=path%>/js/json2.js"></script>
 <script>
 $(function(){
    $("#codeBtn").bind("click",function(){	
 		var phone = $("input[name='phone']").val();
 		var param = {"phone":phone,"type":"askingcode"};
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
</head>
<body>
	<%@include file="../basicpage/homehead.jsp" %>
	<div class="container-fluid" id="wall" style="padding:160px;">
		<div id="register-form">
			<h4 style="padding-bottom:30px;">新用户注册</h4>
			<form action="<%=path %>/DistributionCenter" method="post">
			<input type="hidden" name="type" value="register">
				<table class="register-table">
					<tr>
						<td><label for="username">用户名:</label></td>
						<td><input class="form-control" name="username" type="text" placeholder="输入用户名"/></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="password">密码:</label></td>
						<td><input class="form-control" name="password" type="text" placeholder="输入密码"/></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="okpwd">确认密码:</label></td>
						<td><input class="form-control" name="okpwd" type="text" placeholder="确认密码" /></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="phone">手机号:</label></td>
						<td><input class="form-control" name="phone" type="text" placeholder="输入手机号" id="phoneid"/></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="verifycode">手机验证码:</label></td>
						<td>
							<input class="form-control" name="verifyCode" type="text" placeholder="输入验证码" style="width:100px;float:left;margin-right:5px;"/>
							<button id="codeBtn" type="button" class="btn btn-info" style="font-size:13px;float:left;">获取验证码</button>${RegisterResult}
						</td>
						<td></td>
					</tr>
				</table>
				<input type="submit" value="注册" class="btn btn-primary btn-lg"/>
				 
			</form>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>