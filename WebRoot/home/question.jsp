<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="../css/index.css" rel="stylesheet"/>
<link href="../css/home.css" rel="stylesheet"/>
<script src="../js/question.js"></script>
<script src="../js/editor.js"></script>
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
				<input type="submit" class="btn btn-success" value="发表问题"/>	
			</form>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>