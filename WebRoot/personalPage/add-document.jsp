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
<script src="/fileManagement/js/add-document.js"></script>
<script src="/fileManagement/js/getUrl.js"></script>
<title>xx的个人主页-上传文件</title>
</head>
<body>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				<h4 class="add-title">上传文件</h4>
				<form action="" method="post" class="settings-form">
					<table>
						<tr>
							<th>存放位置:</th>
							<td>
								<select class="form-control select" id="sel_folder">
									<option value="0">主页面</option>
									<option value="1">C语言</option>
									<option value="2">JAVA语言</option>
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