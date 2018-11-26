<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");
	String noteTitle = request.getParameter("noteTitle");
	String courseName = request.getParameter("courseName");
%>   
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<script src="<%=path%>/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<script src="/fileManagement/js/height.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<script>
$(function(){
	var noteTitle = $("#noteTitle").html();	
	var courseName = $("#courseName").html();
	var param = {"type":"findNote","noteTitle":noteTitle,"courseName":courseName};
	var content = "";
	$.ajax({
			url:getBasePath()+"/ANoteServlet",
			async:false,
			cache:false,
			type:"post",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(param),
			success:function(msg){
				var message = $.parseJSON(msg);//将json类型字符串转换为json对象
				
				content = message.content;	
			}
	});
	var E = window.wangEditor;
    var editor = new E('#editor');
    editor.create();
	editor.txt.html(content);
})
function getBasePath(){
    	return '<%=basePath%>';
   }
</script>
<title>${currentUser.username}的个人主页-修改笔记</title>
</head>
<body>
<span style="display:none" id="noteTitle"><%=noteTitle%></span>
<span style="display:none" id="courseName"><%=courseName%></span>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				 
				<form action="" method="post" class="settings-form">
					<table>
						 
						 
						<tr>
							<th style=" vertical-align: text-top;padding-top:30px;">笔记内容:</th>
							<td>	
								<div id="editor" style="height:314.6px;width:690.7px;margin-bottom:10px;"></div>
							</td>
						</tr>
						 
					</table>
					 
				</form>
			</div>
		</div>
	</div>
</body>
</html>