<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<script src="/fileManagement/js/height.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<title>xx的个人主页-我的课程</title>
</head>
<body>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix">
				<h4 class="add-title">我的课程</h4>
				<div class="col-sm-12 clearfix" style="margin-bottom:30px;">
					<a href="add-course.jsp"><button type="button" class="btn btn-success" style="font-size:14px;float: right;">+添加课程</button></a>
				</div>
				<div class="col-sm-12 clearfix">
					<div class="course">
						<div class="course-title">
							<a href="note.jsp">C语言</a>
						</div>
						<div class="clearfix course-body">
							<div class="red rounded-circle"></div>
							<div class="course-content">笔记：2</div>
						</div>
						<div class="clearfix course-body">
							<div class="yellow rounded-circle"></div>
							<div class="course-content">文件：2</div>
						</div>
					</div>
					<div class="course">
						<div class="course-title">
							<a href="note.jsp">JAVA语言</a>
						</div>
						<div class="clearfix course-body">
							<div class="red rounded-circle"></div>
							<div class="course-content">笔记：2</div>
						</div>
						<div class="clearfix course-body">
							<div class="yellow rounded-circle"></div>
							<div class="course-content">文件：2</div>
						</div>
					</div>
				</div>
				<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;">
					<li class="page-item disabled"><a class="page-link" href="#"><span class="fa fa-angle-double-left"></span></a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a id="a-page" class="page-link" href="#">2</a></li>
					<li class="page-item"><a id="a-page" class="page-link" href="#">3</a></li>
					<li class="page-item"><a id="a-page" class="page-link" href="#"><span class="fa fa-angle-double-right"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>