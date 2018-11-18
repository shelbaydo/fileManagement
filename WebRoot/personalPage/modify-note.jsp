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
<script>
	$(function(){
		var E = window.wangEditor;
	    var editor = new E('#editor');
	    editor.create();
		editor.txt.html('<p>我们先看第一个优点，C语言的代码量很小，这是什么意思呢？也就是说如果你要完成同样一个功能，用C语言编写出来的程序的容量是很小的，而用其他语言编写容量就会比较大。</p><p>C语言的第二和第三个优点是它的运行速度比较快和功能强大，我们可以通过一个例子来解释。世界上总共有三大操作系统：UNIX 操作系统是用纯C语言编写的；Windows 操作系统的内核也是用C语言编写的；Linux 操作系统仍是用纯C语言编写的。</p><p>这三大操作系统的内核全部都是用C语言编写的。为什么用C编写，因为C语言的速度最快。计算机中所有的软件都是在操作系统上运行的，如果操作系统的速度很慢，那么在它基础上运行的软件的速度就更慢了。而且计算机中的所有硬件都是由操作系统控制的。</p><p>我们先看第一点。假如你写同样一个程序，在 Java 里面会报错，而在C语言里面是不会报错的。为什么？因为C语言设计的思想是：你想怎么写程序就怎么写，只要你的这种写法错得不是很离谱，就认为你这么写有特殊的含义，可以通过。但 Java 不行：只要你这么写有歧义，或者说这样写不太好，那么它都会报错。</p><p>比如C语言中你可以将一个浮点型数据赋给一个整型变量，编译时只会警告，因为会丢失精度，但是在 Java 中这样写就会报错，它在语法上就禁止你这样写。所以不同的语言对同样一个问题有不同的处理方式。</p><p>大家想想这样导致的结果是什么？因为有歧义的程序也可以通过，这样就会有很多漏洞，黑客往往会抓住这些漏洞进行攻击。所以说C语言比较危险。这也是为什么C语言比较难学的原因，因为你学完之后编写一个程序很可能就是错的，但又很难发现。所以前面说 C++ 从安全性上对C语言进行了升级。</p><p>第二个是它的开发周期比较长。因为C语言是面向过程的语言，面向过程语言的一个特点就是写大项目的时候很容易“崩溃”。当代码上到 10 万行的时候很容易崩溃，会出现各种各样莫名其妙的错误。这时候就需要用另外一种思想将整个程序的框架重新设计一下，即用面向对象的思想设计。这也是C语言现在没有 Java 流行的原因。</p>');
	})
</script>
<title>xx的个人主页-修改笔记</title>
</head>
<body>
	<%@include file="../basicpage/personalPage-head.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPage-left.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				<h4 class="add-title">修改笔记</h4>
				<form action="" method="post" class="settings-form">
					<table>
						<tr>
							<th>笔记标题:</th>
							<td><input type="text" class="form-control add-text" placeholder="输入笔记标题" value="C语言的语言特征"/></td>
						</tr>
						<tr>
							<th>课程分类:</th>
							<td>
								<select class="form-control select" id="sel_year">
									<option value="0">--</option>
									<option value="1" selected="selected">C语言</option>
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