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
<script src="/fileManagement/js/editor.js"></script>
<script src="/fileManagement/js/add-document.js"></script>
<script src="/fileManagement/js/getUrl.js"></script>
<title>${currentUser.username}的个人主页-上传文件</title>
<script type="text/javascript">
$(function(){
		var param = {"type":"findAllFolder"};
		$.ajax(
 			{	
 				url:getBasePath()+"/AFolderServlet",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
				    for (var i=0;i<message.folderNum;i++)
					{
						$("#sel_folder").append("<option value="+message.folderList[i]+">"+message.folderList[i]+"</option>");
						
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
    function check()
    {
    	var file = $("#file").val();
    	if(file=="")
    	{
    		alert('请选择文件路径');
    		return false;
    	}else
    	{
    		return true;
    	}
    }
 </script>
</head>
<body>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				<h4 class="add-title">上传文件</h4>
				<form action="${pageContext.request.contextPath}/UpLoad" method="post" class="settings-form" enctype="multipart/form-data" onsubmit="return check()">
					<table>
						<tr>
							<th>存放位置:</th>
							<td>
								<select class="form-control select" id="sel_folder" name="name">
								
								</select>
							</td>
						</tr>
						<tr>
							<th>上传文件:</th>
							<td>
								<input type="file" name ="file" class="file" id="file" style="display: none;">
								<input type="button" class="btn btn-secondary" value="上传" onclick="document.getElementById('file').click()" style="font-size:13px;"/>
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
					<input type="submit" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>