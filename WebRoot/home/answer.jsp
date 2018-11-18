<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/index.css" rel="stylesheet"/>
<link href="/fileManagement/css/home.css" rel="stylesheet"/>
<script src="/fileManagement/js/answer.js"></script>
<title>智存网-回答问题</title>
</head>
<body>
	<%@include file="../basicpage/homehead.jsp" %>
	<div class="container-fluid" style="padding:100px 0;background-color: #F3F3F3;">
		<div id="answer-page" class="container">
			<div class="allAns col-sm-12">
				<div class="clearfix" style="margin-bottom:20px;"><span class="title">热门标签</span></div>
				<div class="hotSign">
					<ul class="list-inline row">
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签1</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签2</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签3</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签4</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签5</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签6</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签7</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签8</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签9</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签10</a></div></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="col-sm-4" style="padding:0;">
					<ul class="supplyAns-title row clearfix">
						<li id="li1" class="col-sm-6" style="background-color:white;"><a href="#" style="color:#4ACA6D;">最新提问</a></li>
						<li id="li2" class="col-sm-6"><a href="#">热门提问</a></li>
					</ul>
				</div>
				<div class="supplyAns-body col-sm-12" style="padding:0px 40px;padding-bottom:40px;">
					<div class="chooseAns clearfix">
						<input class="form-control" type="text" name="choice" placeholder="按关键词筛选" style="width:200px;font-size:14px;float:left;"/>
						<a class="go-search rounded" href="#" style="color: #35b558;text-decoration: none;">筛选</a>
						<a href="#" class="refresh"><span class="fa fa-refresh"></span>刷新</a>
					</div>
					<div class="answer-body clearfix">
						<table id="table1" class="table table-hover" style="font-size:15px;">
							<tr>
								<td class="answer-title"><a href="infoAns.jsp">怎样学习效率高</a></td>
								<td class="answer-sign">
									<span class="fa fa-bookmark" style="float:left;margin-top:5px;"></span>
									<ul class="clearfix" style="margin:0;padding:0;">
										<li>学习</li>
										<li>思维</li>
									</ul>
								</td>
								<td class="answer-info"><span style="margin-right: 10px;">2 回答</span>|<span style="margin-left: 10px;">2018/11/5</span></td>
							</tr>
							<tr>
								<td class="answer-title"><a href="infoAns.jsp">怎样学习效率高</a></td>
								<td class="answer-sign">
									<span class="fa fa-bookmark" style="float:left;margin-top:5px;"></span>
									<ul class="clearfix" style="margin:0;padding:0;">
										<li>学习</li>
										<li>思维</li>
									</ul>
								</td>
								<td class="answer-info"><span style="margin-right: 10px;">2 回答</span>|<span style="margin-left: 10px;">2018/11/5</span></td>
							</tr>
							<tr>
								<td class="answer-title"><a href="infoAns.jsp">怎样学习效率高</a></td>
								<td class="answer-sign">
									<span class="fa fa-bookmark" style="float:left;margin-top:5px;"></span>
									<ul class="clearfix" style="margin:0;padding:0;">
										<li>学习</li>
										<li>思维</li>
									</ul>
								</td>
								<td class="answer-info"><span style="margin-right: 10px;">2 回答</span>|<span style="margin-left: 10px;">2018/11/5</span></td>
							</tr>
						</table>
						<table id="table2" class="table table-hover" style="font-size:15px;display:none;">
							<tr>
								<td class="answer-title"><a href="infoAns.jsp">怎样学习效率不高</a></td>
								<td class="answer-sign">
									<span class="fa fa-bookmark" style="float:left;margin-top:5px;"></span>
									<ul class="clearfix" style="margin:0;padding:0;">
										<li>学习</li>
										<li>思维</li>
									</ul>
								</td>
								<td class="answer-info"><span style="margin-right: 10px;">2 回答</span>|<span style="margin-left: 10px;">2018/11/5</span></td>
							</tr>
							<tr>
								<td class="answer-title"><a href="infoAns.jsp">怎样学习效率不高</a></td>
								<td class="answer-sign">
									<span class="fa fa-bookmark" style="float:left;margin-top:5px;"></span>
									<ul class="clearfix" style="margin:0;padding:0;">
										<li>学习</li>
										<li>思维</li>
									</ul>
								</td>
								<td class="answer-info"><span style="margin-right: 10px;">2 回答</span>|<span style="margin-left: 10px;">2018/11/5</span></td>
							</tr>
							<tr>
								<td class="answer-title"><a href="infoAns.jsp">怎样学习效率不高</a></td>
								<td class="answer-sign">
									<span class="fa fa-bookmark" style="float:left;margin-top:5px;"></span>
									<ul class="clearfix" style="margin:0;padding:0;">
										<li>学习</li>
										<li>思维</li>
									</ul>
								</td>
								<td class="answer-info"><span style="margin-right: 10px;">2 回答</span>|<span style="margin-left: 10px;">2018/11/5</span></td>
							</tr>
						</table>
						<ul class="pagination" style="float:right;">
							<li class="page-item disabled"><a class="page-link" href="#"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a id="a-page" class="page-link" href="#">2</a></li>
							<li class="page-item"><a id="a-page" class="page-link" href="#">3</a></li>
							<li class="page-item"><a id="a-page" class="page-link" href="#"><span class="fa fa-angle-double-right"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>