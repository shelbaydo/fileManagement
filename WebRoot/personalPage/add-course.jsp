<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=path%>/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<script src="/fileManagement/js/height.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<base href="<%=basePath%>">
<title>${currentUser.username}的个人主页-添加课程</title>
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
 					window.location.href = 'http://localhost:8080/fileManagement/personalPage/home.jsp';										     
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
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				<h4 class="add-title">添加课程</h4>
				<form action="" method="post" class="settings-form">
					<table>
						<tr>
							<th>课程名称:</th>
							<td><input name="courseName" id="cN" type="text" class="form-control add-text" placeholder="输入课程名称"/></td>
						</tr>
					</table>
					<input type="button" id="addCourse" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>