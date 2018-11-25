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
 <script>
	function getBasePath(){
	    return '<%=basePath%>';
    }
</script>
<meta charset="UTF-8">
<%@include file="../../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/person-page.css" rel="stylesheet"/>
<link href="/fileManagement/css/school.css" rel="stylesheet"/>
<script src="/fileManagement/js/Area.js"></script>
<script src="/fileManagement/js/AreaData_min.js"></script>
<script src="/fileManagement/js/basic-info.js"></script>
<script src="/fileManagement/js/birthday.js"></script>
<script src="/fileManagement/js/school.js"></script>
<script src="/fileManagement/js/height.js"></script>
<title>${currentUser.username}的个人主页-信息完善</title>
</head>
<body>
	<%@include file="../../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body clearfix">
		<%@include file="../../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="info-table rounded">
				<div class="info-table-head">信息完善</div>
				<div class="info-content clearfix">
					<div class="info-menu">
						<div class="info-menu-title info-menu-title-active"><span style="margin-right:10px;font-size:16px;" class="fa fa-user"></span><span style="font-weight:550;font-size:16px;color:#666!important;">个人资料</span></div>
						<ul style="margin:0;padding:0;">
							<a href="basic-info.jsp"><li class="info-item info-item-active">资料完善</li></a>
							<a href="pic-info.jsp"><li class="info-item">头像更换</li></a>
						</ul>
						<div class="info-menu-title"><span style="margin-right:10px;font-size:16px;" class="fa fa-unlock-alt"></span><span style="font-weight:550;font-size:16px;color:#666!important;">隐私设置</span></div>
						<ul style="margin:0;padding:0;">
							<a href="pwd-info.jsp"><li class="info-item">密码修改</li></a>
						</ul>
					</div>
					<div class="info-form">
						<div class="info-form-title"><h5>基本资料</h5></div>
						<form action="<%=path %>/LoginServlet" method="post" class="settings-form" >
						<input type="hidden" value="alter" name="type"/>		
							<table>
								<tr>
									<th>用户名:</th>
									<td>
										<input type="text" id="username" name="username" value = "${currentUser.username}"/>										
									</td>
								</tr>
								<tr>
									<th>专业:</th>
									<td>
										<input type="text" id="major" name="major" value = "${currentUser.major}"/>
										
									</td>
								</tr>
								<tr>
									<th>学期:</th>
									<td>
										<input type="text" id="semester" name="semester" value = "${currentUser.semester}"/>
										
									</td>
								</tr>
								<tr>
									<th>年龄:</th>
									<td>
										<input type="text" id="age" name="age" value = "${currentUser.age}"/>
									</td>
								</tr>
								<tr>
									<th>性别:</th>
									<td>
										<input type="radio" id="man" name="sex"/>
										<label for="man" style="margin-right:15px;">男</label>
										<input type="radio" id="woman" name="sex"/>
										<label for="woman">女</label>
									</td>
								</tr>
								<tr>
									<th>生日:</th>
									<td>
										<select class="form-control select" id="sel_year" name="year"></select>
										<select class="form-control select" id="sel_month" name="month"></select>
	        							<select class="form-control select" id="sel_day" name="day"></select>
									</td>
								</tr>
								<tr>
									<th>学历:</th>
									<td>
										<select class="form-control select" id="sel_year" name="ed">
											<option value="0" selected="selected">--</option>
											<option value="1">小学</option>
											<option value="2">初中</option>
											<option value="3">高中</option>
											<option value="4">专科</option>
											<option value="5">本科</option>
											<option value="6">硕士</option>
											<option value="7">博士</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>在读学校:</th>
									<td>
										<input type="text" class="form-control text" id="school" placeholder="请点击选择学校" readonly />
										<div id="proSchool" class="provinceSchool" style="z-index: 100000;">
										    <div class="title"><span>请选择学校</span></div>
										    <div class="proSelect">
										        <select ></select>
										        <span>如没找到选择项，请选择其他手动填写</span>
										        <input name = "school" type="text" />
										    </div>
										    <div class="schoolList">
										        <ul></ul>
										    </div>
										    <div class="button">
										        <button id='0'>取消</button>
										        <button id='1'>确定</button>
										    </div>
										</div>	
									</td>
								</tr>
								<tr>
									<th>个性签名:</th>
									<td>			
										<textarea rows="5" cols="80" name="signature" id="signature"></textarea>
									</td>
								</tr>
							</table>
							<input type="submit" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>