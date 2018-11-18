<%@ page language="java" import="java.util.*,entity.Folder" pageEncoding="utf-8"%>
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
		var foldId = $("#foldId").html();
		var param = {"type":"findAllFiles","foldId":foldId};	
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
						
						$("#courseName").append("<div class='folderDiv'> 文件夹有：<br/>"+message.folderList[i]+"<span >"+message.folderIdList[i]+"</span>"+"</div>"+"<br/>");
						
					}	
					$("div").css("color","red").css("cursor","pointer");
					
 					$(".folderDiv").bind("click",function(){
 						var id = $(this).children("span").eq(0).html();
 						window.location.href = 'http://localhost:8080/fileManagement/FolderUnit?folderId='+id;
 					});    
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
    <base href="<%=basePath%>">   
    <title>My JSP 'folderMainPage.jsp' starting page</title>  
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
    <%session.setAttribute("folderId",((Folder)request.getAttribute("requestedFolder")).getFoldId()); %>
   <p >${requestedFolder.name}</p>
   <p style="display:none" id="foldId">${requestedFolder.foldId}</p>
                   这个文件夹是空的     
       <form action="${pageContext.request.contextPath}/UpLoad" enctype="multipart/form-data" method="post">
                           上传文件：<input type="file" name="file"><br/>   
           是否公开：
    <label><input name="isPublic" type="radio" value="yes" />是</label> 
	<label><input name="isPublic" type="radio" value="no" />否</label>
           <input type="submit" value="提交">
    </form>            
  </body>
</html>
