<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/bootstrap.min.css" rel="stylesheet"/>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<script src="/fileManagement/js/height.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<script src="/fileManagement/js/folder.js"></script>
<title>xx的个人主页-我的文件夹</title>
</head>
<body>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix">
				<h4 class="add-title">我的文件夹</h4>
				<div class="col-sm-12 clearfix" style="margin-bottom:30px;">
					<button type="button" id="add" class="btn btn-success" style="font-size:14px;float: right;">+创建文件夹</button>
				</div>
				<div class="col-sm-12 clearfix">
					<div class="add-folder rounded">
						<form action="" method="post">
							<label for="course" style="font-size: 16px;font-weight:550;">文件夹名称：</label>
							<input type="text" placeholder="输入文件夹名称"  id="course" class="form-control" style="font-size:13px;margin-bottom:8px;"/>
							<input type="submit" class="btn btn-primary btn-sm" value="添加" style="font-size: 13px"/>
							<button type="button" id="cancel" class="btn btn-secondary btn-sm" style="font-size: 13px">取消</button>
						</form>
					</div>
					<div class="folders clearfix">
						<nav class="breadcrumb">
						  <span class="breadcrumb-item active">主页面</span>
						</nav>
						<div class="col-sm-12 clearfix" style="padding:0;"><a href="add-document.jsp?folder='主页面'"><button type="button" class="btn btn-info add-document">+上传文件</button></a></div>
						<a href="folder-content.jsp" class="folders-a">
							<div class="folder">
								<span class="fa fa-folder-open folder-icon"></span>
								<div class="folder-name">C语言</div>
							</div>
						</a>
						<a href="folder-content.jsp" class="folders-a">
							<div class="folder">
								<span class="fa fa-folder-open folder-icon"></span>
								<div class="folder-name">JAVA语言</div>
							</div>
						</a>
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