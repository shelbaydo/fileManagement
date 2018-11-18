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
<title>xx的个人主页-我的笔记</title>
</head>
<body>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix">
				<h4 class="add-title">我的笔记</h4>
				<div class="col-sm-12 clearfix">
					<a href="add-note.jsp"><button type="button" class="btn btn-success" style="font-size:14px;float: right;">+写笔记</button></a>
				</div>
				<div class="note-list">
					<form action="" method="post" class="clearfix" style="margin-bottom:15px;">
						<select class="form-control note-search-select" id="sel_seen">
							<option value="0" selected="selected">所有文章</option>
							<option value="1">公开</option>
							<option value="2">不公开</option>
						</select>
						<select class="form-control note-search-select" id="sel_seen">
							<option value="0" selected="selected">所有课程</option>
							<option value="1">C语言</option>
							<option value="2">JAVA语言</option>
						</select>
						<input type="text" class="form-control note-search" placeholder="Search all notes"/>
						<input type="submit" class="btn btn-primary note-search-submit" value="搜索"/>
					</form>
					<ul class="rounded">
						<li class="clearfix">
							<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-exclamation-circle note-icon-seen"></span>c语言的语言特点</a>
							<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">C语言</span></div>
							<div class="note-time">#发表于1天前</div>
						</li>
						<li class="clearfix">
							<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-ban note-icon-ban"></span>c语言的语言特点</a>
							<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">C语言</span></div>
							<div class="note-time">#发表于2天前</div>
						</li>
						<li class="clearfix">
							<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-exclamation-circle note-icon-seen"></span>java语言的语言特点</a>
							<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">JAVA语言</span></div>
							<div class="note-time">#发表于3天前</div>
						</li>
						<li class="clearfix">
							<a class="note-title" href="../home/infoNote.jsp"><span class="fa fa-ban note-icon-ban"></span>java语言的语言特点</a>
							<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">JAVA语言</span></div>
							<div class="note-time">#发表于4天前</div>
						</li>
					</ul>
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