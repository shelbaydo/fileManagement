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
<script src="/fileManagement/js/editor.js"></script>
<title>xx的个人主页-写笔记</title>
</head>
<body>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				<h4 class="add-title">写笔记</h4>
				<form action="" method="post" class="settings-form">
					<table>
						<tr>
							<th>笔记标题:</th>
							<td><input type="text" class="form-control add-text" placeholder="输入笔记标题"/></td>
						</tr>
						<tr>
							<th>课程分类:</th>
							<td>
								<select class="form-control select" id="sel_year">
									<option value="0" selected="selected">--</option>
									<option value="1">C语言</option>
									<option value="2">java</option>
									<option value="3">python</option>
								</select>
							</td>
						</tr>
						<tr>
							<th style=" vertical-align: text-top;padding-top:30px;">笔记内容:</th>
							<td>
								<div id="editor" style="height:314.6px;width:690.7px;margin-bottom:10px;"></div>	
							</td>
						</tr>
						<tr>
							<th>是否公开:</th>
							<td>
								<input type="radio" id="seen" name="visibility" checked="checked"/>
								<label for="man" style="margin-right:15px;">公开</label>
								<input type="radio" id="no-seen" name="visibility"/>
								<label for="woman">不公开</label>
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