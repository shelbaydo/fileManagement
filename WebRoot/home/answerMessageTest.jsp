<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
    <title>answerMessageTest.jsp</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/json2.js"></script>
<script>
    $(function(){
            //当页面加载时就开始查找还未查阅的答案
	        var param = {"type":"newestAnswer"};
	        $.ajax({
	            url:getBasePath()+"/QuestionServlet",
				async:true,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(data){
				    var questionHtml = "";
					var message = $.parseJSON(data);//将json类型字符串转换为json对象
					var questionArray = message.questionArray;
					var answerMessageTest = "answerMessageTest";
					$.each(questionArray, function(i, obj) {
					    questionHtml += "<li><a href='infoAns.jsp?page=" +
					                    answerMessageTest +
					                    "&questionId=" +
					                    obj.questionId +
					                    "&answerId=" +
					                    obj.answerId +
					                    "'>" +
					                    obj.questionTitle +
					                    "</a>" +
					                    "有了最新的回答~~</li>";
				    });	
				    $("#unbrowseQuestion").html(questionHtml);
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
  
  <ul id="unbrowseQuestion">
  </ul>
  
  <body>
      
  </body>
</html:html>
