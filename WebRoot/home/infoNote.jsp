<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="../css/index.css" rel="stylesheet"/>
<link href="../css/infoNote.css" rel="stylesheet"/>
<link href="../bootstrap.min.css" rel="stylesheet"/>
<script src="../js/index.js"></script>
<script src="../js/infoNote.js"></script>
<script src="../js/height.js"></script>
<title>智存网-C语言的语言特征</title>
</head>
<body>
	<%@include file="../basicpage/homehead.jsp" %>
	<div class="container-fluid">
		<div class="container row">
			<div class="body-left col-sm-8">
				<div class="col-sm-8">
					<nav class="breadcrumb" style="color:#8B8B8B;font-size:15px;">
						<a href="noteRecommend.jsp" class="breadcrumb-item">全部笔记</a>
						<a href="signNote.jsp" class="breadcrumb-item">课程一</a>
						<span class="breadcrumb-item">C语言的语言特征</span>
					</nav>
				</div>
				<div class="body-left-content clearfix">
					<div class="col-sm-12 clearfix" style="margin-bottom:20px;">
						<div style="float:right;">
							<a href="../personalPage/modify-note.jsp"><button type="button" class="btn btn-warning btn-sm" style="color:white;">编辑</button></a>
							<button type="button" class="btn btn-danger btn-sm">删除</button>
							<button type="button" class="btn btn-info btn-sm">收藏</button>
						</div>
					</div>
					<h4 class="title">C语言的语言特征</h4>
					<span class="author"><a href="../personalPage/home.jsp">超级玛丽</a></span><br/>
					<span class="time">2018/11/15 10:01</span>
					<div class="main">
						<p>我们先看第一个优点，C语言的代码量很小，这是什么意思呢？也就是说如果你要完成同样一个功能，用C语言编写出来的程序的容量是很小的，而用其他语言编写容量就会比较大。</p>
						<p>C语言的第二和第三个优点是它的运行速度比较快和功能强大，我们可以通过一个例子来解释。世界上总共有三大操作系统：UNIX 操作系统是用纯C语言编写的；Windows 操作系统的内核也是用C语言编写的；Linux 操作系统仍是用纯C语言编写的。</p>
						<p>这三大操作系统的内核全部都是用C语言编写的。为什么用C编写，因为C语言的速度最快。计算机中所有的软件都是在操作系统上运行的，如果操作系统的速度很慢，那么在它基础上运行的软件的速度就更慢了。而且计算机中的所有硬件都是由操作系统控制的。</p>
						<p>我们先看第一点。假如你写同样一个程序，在 Java 里面会报错，而在C语言里面是不会报错的。为什么？因为C语言设计的思想是：你想怎么写程序就怎么写，只要你的这种写法错得不是很离谱，就认为你这么写有特殊的含义，可以通过。但 Java 不行：只要你这么写有歧义，或者说这样写不太好，那么它都会报错。</p>
						<p>比如C语言中你可以将一个浮点型数据赋给一个整型变量，编译时只会警告，因为会丢失精度，但是在 Java 中这样写就会报错，它在语法上就禁止你这样写。所以不同的语言对同样一个问题有不同的处理方式。</p>
						<p>大家想想这样导致的结果是什么？因为有歧义的程序也可以通过，这样就会有很多漏洞，黑客往往会抓住这些漏洞进行攻击。所以说C语言比较危险。这也是为什么C语言比较难学的原因，因为你学完之后编写一个程序很可能就是错的，但又很难发现。所以前面说 C++ 从安全性上对C语言进行了升级。</p>
						<p>第二个是它的开发周期比较长。因为C语言是面向过程的语言，面向过程语言的一个特点就是写大项目的时候很容易“崩溃”。当代码上到 10 万行的时候很容易崩溃，会出现各种各样莫名其妙的错误。这时候就需要用另外一种思想将整个程序的框架重新设计一下，即用面向对象的思想设计。这也是C语言现在没有 Java 流行的原因。</p>
					</div>
					<div class="info">
						<div class="comments">
							<span class="fa fa-comments"></span>10
						</div>
						<div class="browse">
							<span class="fa fa-eye"></span>342
						</div>
					</div>
				</div>
				<div class="comment">
					<h5>评论</h5>
					<div class="comment-area rounded clearfix">
						<div class="comment-form clearfix">
							<input type="text" class="form-control col-sm-10" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
							<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
						</div>
						<div>
							<div class="comment row" style="margin:0;">
								<div class="col-sm-3">
									<img src="../pic/1.jpg" class="rounded-circle" style="width:30px;"/><span>超级玛丽</span>:
								</div>
								<div class="col-sm-9">
									<div class="comment-text text-justify">我认为你说的很正确我很赞同你</div>
									<span class="com-time">2018/11/8</span>
									<div class="com-comment"><span class="fa fa-comments"></span>回复</div>
								</div>
							</div>
							<div class="comment-area-none rounded clearfix">
								<div class="comment-form clearfix">
									<input type="text" class="form-control col-sm-10" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
									<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
								</div>
							</div>
						</div>
						<div>
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
							<div class="comment-area-none rounded clearfix">
								<div class="comment-form clearfix">
									<input type="text" class="form-control col-sm-10" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
									<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="body-right">
				<div class="clearfix" style="margin-bottom:30px;">
					<span class="head">猜你喜欢</span>
					<a href="#" class="refresh"><span class="fa fa-refresh"></span>换一换</a>
				</div>
				<ul class="otherQues">
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
					<li><a href="infoNote.jsp">C语言的语言特征</a></li>
				</ul>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>