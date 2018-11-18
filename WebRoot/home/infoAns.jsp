<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="../css/index.css" rel="stylesheet"/>
<link href="../css/home.css" rel="stylesheet"/>
<link href="../bootstrap.min.css" rel="stylesheet"/>
<script src="../js/question.js"></script>
<script src="../js/infoAns.js"></script>
<title>智存网-回答问题</title>
</head>
<body>
	<%@include file="../basicpage/homehead.jsp" %>
	<div class="container" style="padding-top:100px;">
		<div class="row">
			<div class="col-sm-9" style="padding-right:40px;border-right:1px #EBF0F1 solid;padding-bottom:80px;">
				<div class="question-info">
					<h4>怎样学习效率高</h4>
					<div class="info">
						<ul class="clearfix">
							<li class="questioner">提问者:<a href="#">用户A</a></li>
							<li class="sign">
								<div style="right:0;">
									<span class="fa fa-bookmark"></span>
									<span>学习 思维</span>
								</div>
							</li>
							<li class="page-view">浏览量：100</li>
						</ul>
					</div>
					<div class="supplement"><span style="font-weight:bold;">问题补充：</span>学习效率不高怎么提高学习效率?</div>
					<div style="margin-top:1px;">
						<div id="editor" style="margin-bottom:30px;overflow:hidden;"></div>	
					</div>
					<a href="#"><button type="button" class="btn btn-success">提交回答</button></a>
				</div>
				<div class="question-divider">
					<span class="question-divider-text">1个回答</span>
					<span class="question-divider-line"></span>
				</div>
				<img src="../pic/bestAns.png" style="width:110px;margin-top:20px;"/>
				<div class="bestAns clearfix">
					<div class="best-content">
						<p>学着学着就提高了</p>
						<span class="best-time">2018/11/8</span>
						<div class="best-comment"><span class="fa fa-comments"></span>评论(1)</div>
					</div>
					<div class="comment-area rounded clearfix">
						<div class="comment-form clearfix">
							<input type="text" class="form-control col-sm-11" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
							<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
						</div>
						<div class="comment row" style="margin:0;">
							<div class="col-sm-3">
								<img src="../pic/1.jpg" class="rounded-circle" style="width:30px;"/>回复<span style="font-weight:bold;">超级玛丽:</span>
							</div>
							<div class="col-sm-9">
								<div class="comment-text text-justify">我认为你说的很正确我很赞同你</div>
								<span class="com-time">2018/11/8</span>
								<div class="com-comment"><span class="fa fa-comments"></span>回复</div>
							</div>
						</div>
						<div class="comment-area rounded clearfix">
							<div class="comment-form clearfix">
								<input type="text" class="form-control col-sm-11" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
								<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
							</div>
						</div>
					</div>
					<div class="best-info clearfix">
						<img src="../pic/1.jpg" class="rounded-circle best-pic">
						<div class="best-user">
							<p><span class="best-name">超级玛丽</span><span class="best-level rounded">LV2</span></p>
							<p><span class="best-sign">擅长:java c语言</span></p>
						</div>
					</div>
				</div>	
				<img src="../pic/otherAns.png" style="width:90px;margin-top:20px;"/>
				<div class="answer clearfix row">
					<div class="col-sm-3 clearfix">
						<img src="../pic/1.jpg" class="rounded-circle ans-pic">
						<div class="ans-name">超级玛丽</div>
					</div>
					<div class="col-sm-9 ans-content">
						<span class="ans-text">学着学着学着就提高了</span><br/>
						<span class="ans-time">2018/11/8</span>
						<div class="ans-comment"><span class="fa fa-comments"></span>评论(0)</div>
					</div>
					<div class="comment-area rounded clearfix">
						<div class="comment-form clearfix">
							<input type="text" class="form-control col-sm-11" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
							<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
						</div>
					</div>
				</div>		
			</div>
			<div class="col-sm-3 clearfix" style="padding:0px 30px;">
				<div style="position: fixed;">
					<div class="clearfix" style="margin-bottom:30px;">
						<span class="head">猜你想答</span>
						<a href="#" class="refresh"><span class="fa fa-refresh"></span>换一换</a>
					</div>
					<ul class="otherQues">
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>