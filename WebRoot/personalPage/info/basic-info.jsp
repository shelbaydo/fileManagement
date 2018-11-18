<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../../basicpage/extendfile.jsp" %>
<link href="../../css/person-page.css" rel="stylesheet"/>
<link href="../../css/school.css" rel="stylesheet"/>
<script src="../../js/Area.js"></script>
<script src="../../js/AreaData_min.js"></script>
<script src="../../js/basic-info.js"></script>
<script src="../../js/birthday.js"></script>
<script src="../../js/school.js"></script>
<script src="../../js/height.js"></script>
<title>xx的个人主页-信息完善</title>
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
						<form action="" method="post" class="settings-form">
							<table>
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
										<select class="form-control select" id="sel_year"></select>
										<select class="form-control select" id="sel_month"></select>
	        							<select class="form-control select" id="sel_day"></select>
									</td>
								</tr>
								<tr>
									<th>学历:</th>
									<td>
										<select class="form-control select" id="sel_year">
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
									<th>所在城市:</th>
									<td>
										<select class="form-control select" id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>
										<select class="form-control select" id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>
										<span id="seachdistrict_div"><select class="form-control select" id="seachdistrict" name="seachdistrict"></select></span>
									</td>
								</tr>
								<tr>
									<th>在读学校:</th>
									<td>
										<input type="text" class="form-control text" id="school" placeholder="请点击选择学校" readonly />
										<div id="proSchool" class="provinceSchool" style="z-index: 100000;">
										    <div class="title"><span>请选择学校</span></div>
										    <div class="proSelect">
										        <select></select>
										        <span>如没找到选择项，请选择其他手动填写</span>
										        <input type="text" />
										    </div>
										    <div class="schoolList">
										        <ul></ul>
										    </div>
										    <div class="button">
										        <button flag='0'>取消</button>
										        <button flag='1'>确定</button>
										    </div>
										</div>	
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