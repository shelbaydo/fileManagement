<%@ page language="java" import="java.util.*,entity.User" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<div class="container-fluid navbar navbar-expand-sm bg-dark navbar-dark fixed-top" style="height:80px;">
	<a href="/fileManagement/index.jsp" class="navbar-brand col-sm-4" style="padding-left:80px;">
		<img src="/fileManagement/pic/head.png" style="width:110px;"/>
	</a>
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target=".collapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse col-sm-8 row">
		<ul class="navbar-nav col-sm-9">
			<li class="nav-item"><a href="/fileManagement/index.jsp" class="nav-link">首页</a></li>
			<li class="nav-item"><a class="nav-link">最新课程</a></li>
			<li class="nav-item"><a href="/fileManagement/home/noteRecommend.jsp" class="nav-link">笔记推荐</a></li>
			<li class="nav-item"><a href="/fileManagement/home/question.jsp" class="nav-link">提个问题</a></li>
			<li class="nav-item"><a href="/fileManagement/home/answer.jsp" class="nav-link">回答问题</a></li>
			<li class="form-inline">
				<input type="text" class="form-control form-control-sm" placeholder="search something .." style="margin:0px 5px;font-size:13px;"/>
				<button type="button" class="btn btn-primary btn-sm" style="font-size:13px;">搜索</button>
			</li>
		</ul>
		<ul class="navbar-nav col-sm-3">
		
		 <%
   		User user = (User)session.getAttribute("currentUser");
   		if(user==null){
   			 %><li class="nav-item"><a href="/fileManagement/home/register.jsp" class="nav-link">注册</a></li>
			<li class="nav-item"><a href="/fileManagement/home/login.jsp" class="nav-link">登录</a></li>
   			<% 
   		}else{
   		
   		%>
   			<li id="menu" class="nav-item dropdown" >
				<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${currentUser.username}</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/fileManagement/personalPage/home.jsp">我的主页</a>
					<a class="dropdown-item">我的消息<span class="badge badge-info">50</span></a>
					<a class="dropdown-item">我的关注</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/fileManagement/LoginServlet?type=quitLogin">退出登录</a>
				</div>
			</li>
   		<% 
   		}	
  %>
					
		</ul>
	</div>
</div>