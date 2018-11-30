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
<%@include file="../basicpage/extendfile.jsp" %>
<link href="../css/index.css" rel="stylesheet"/>
<link href="../css/home.css" rel="stylesheet"/>
<script src="../js/question.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/json2.js"></script>
<!--  <script src="../js/editor.js"></script>-->

<script>
    $(function(){
        
		//创建富文本域
		var E = window.wangEditor;
	    var editor = new E('#editor');
	    editor.create();
	    
        //点击发表问题按钮，将数据传送到后端
		$("#submit").bind("click",function(){
			
		    var name = $("input[name='title']").val();
		    var tag = "";
		    
		    $("span[class='tag-name']").each(function(index) {
		        tag += $(this).text() + "&";
            
            });
            
			var content = editor.txt.text();
	        var param = {"name":name,"tag":tag,"content":content,"type":"addQuestion"};
	        
	        $.ajax({
	            url:getBasePath()+"/QuestionServlet",
				async:true,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(msg){
					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
					//alert(message.msg);	
					//跳转到其他页面
					window.location.href= getBasePath() + "home/infoAns.jsp?questionId=" + message.questionId + "&page='question'" ;								     
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
<title>智存网-提个问题</title>
</head>
<body>
	<%@include file="../basicpage/homehead.jsp" %>
	<div class="container" style="padding:100px 0;">
		<div id="question-form">
			<div class="question-title"><h4>提个问题</h4></div>
			<form class="form-group" action="" method="post" onkeydown="if(event.keyCode==13){return false;}">
				<label for="title" style="font-size:20px;">标题</label>
				<input type="text" name="title" class="form-control" style="margin-bottom:10px;" placeholder="输入问题标题"/>
				<label for="tag" style="font-size:20px;">标签</label>
				<input id="tag" type="text" name="tag" class="form-control" placeholder="输入关键词，单击回车添加标签"/>
				<div class="col-sm-12 question-tag" style="min-height:60px;">
					<ul id="tag-ul" class="clearfix" style="margin:0;padding-left:5px;">
					</ul>
				</div>	
				<label style="font-size:20px;">问题描述</label>
				<div id="editor" style="margin-bottom:30px;"></div>	
				<input type="submit" class="btn btn-success" id="submit" value="发表问题"/>	
			</form>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>