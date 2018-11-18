<%@ page language="java" import="java.util.*,entity.User" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=path%>/js/jquery-3.3.1.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/index.css" rel="stylesheet"/>
<link href="/fileManagement/css/home.css" rel="stylesheet"/>
<script src="/fileManagement/js/login.js"></script>
<title>智存网-登录</title>
<script>
	$(function(){
		$("#phoneid").blur(function(){
		
 		var phone = $(this).val();
 		var param = {"phone":phone,"type":"verifyingphoneForLogin"};
 		$.ajax(
 			{	
 				url:getBasePath()+"/SMS",.
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
 					$("#noteLabel").html(message.msg);			
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
	<%@include file="../basicpage/homehead.jsp" %>
	<div class="container-fluid" id="wall">
		<div class="container clearfix" style="padding-top:200px;">
			<div id="login-form">
				<div class="clearfix" style="margin-bottom:30px;">
					<a id="aID1" class="a1" href="#" >密码登录</a>
					<a id="aID2" class="a2" href="#" style="float:right;">验证登录</a>
				</div>
				<form id="form1" action="<%=path %>/DistributionCenter" method="post" style="margin:auto;">
					<input id="phoneid" type="text" name="phone" placeholder="注册手机号" style="font-size:13px;"/>
					<input type="password" name="password"  placeholder="密码" style="font-size:13px;"/>			
					<input placeholder="验证码" type="text" name="checkcode" id="checkcode"/>
					<img border="0" src="/fileManagement/CheckCode" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/fileManagement/ChangeCheckCode">换一张</a>
						${message}
						${loginResult}
   					<input type="hidden" value="login" name="type"/>
					<div class="clearfix" style="margin:10px 0;font-size:12px;">
						<a href="/fileManagement/home/register.jsp" style="color:white;">免费注册</a>
						<a href="#" style="float:right;color:white;">忘记登录密码？</a>
					</div>
					<input type="submit" class="btn btn-primary rounded" value="登录"/>
				</form>
				<form id="form2" class="none-form" action="../personalPage/home.jsp" method="post" style="margin:auto;">
					<input type="text" name="id" placeholder="注册手机号" style="font-size:13px;"/>
					<input type="text" name="pwd" placeholder="短信验证码" style="font-size:13px;width:105px;"/>
					<a href="#"><button type="button" class="btn btn-info" style="font-size:12px;height:40px;">获取验证码</button></a>
					<div class="clearfix" style="margin:10px 0;font-size:12px;">
						<a href="register.jsp" style="color:white;">免费注册</a>
						<a href="#" style="float:right;color:white;">忘记登录密码？</a>
					</div>
					<input type="submit" class="btn btn-primary rounded" value="登录"/>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>