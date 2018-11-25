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
<base href="<%=basePath%>">
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<script src="/fileManagement/js/height.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<script src="/fileManagement/js/editor.js"></script>
<title>${currentUser.username}的个人主页-写笔记</title>
<script type="text/javascript">
$(function(){
		
		var param = {"type":"findAllCourse"};
		$("#save").bind("click",function(){
			var text = $("#editor").txt.html();
			$("#noteContent").val(text);
			
		})
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
 					if(message.courseNum==0)
 					{
 						alert("您还未创建任何课程，请先创建课程，再创建笔记！");
 					}		
 				    else
 				    {
 				    	for (var i=0;i<message.courseNum;i++)
						{
							$("#sel_year").append("<option value="+message.courseList[i]+">"+message.courseList[i]+"</option>");
							
						}	
 				    }  
 				},
 				error:function(response,status){		
					console.log(status);					
 				}				
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
				<h4 class="add-title">写笔记<a href="/fileManagement/personalPage/add-course.jsp">创建课程</a></h4>
				<form action="<%=path %>/DistributionCenter" method="post" class="settings-form">
				<input type="hidden" value="Note" name="type"/>
					<table>
						<tr>
							<th>笔记标题:</th>
							<td><input type="text" class="form-control add-text" placeholder="输入笔记标题" name="title"/></td>
						</tr>
						<tr>
							<th>课程分类:</th>
							<td>
								<select class="form-control select" id="sel_year" name="courseName">
									<option value="0" selected="selected">选择课程</option>									
								</select>
							</td>
						</tr>
						<tr>
							<th style=" vertical-align: text-top;padding-top:30px;">笔记内容:</th>
							<input type="hidden" value="" name="content" id="noteContent"/>
							<td>
								<div id="editor" style="height:314.6px;width:690.7px;margin-bottom:10px;"></div>						
							</td>	
						</tr>
						<tr>
							<th>是否公开:</th>
							<td>
								<input type="radio" id="seen" name="isPublic" checked="checked"/>
								<label for="yes" style="margin-right:15px;">公开</label>
								<input type="radio" id="no-seen" name="isPublic"/>
								<label for="no">不公开</label>
							</td>
						</tr>
					</table>
					<input id="save" type="button" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
					<input type="submit" value="提交" class="btn btn-primary submit" style="font-size:13px;"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>