<%@ page language="java" contentType="text/html; charset=UTF-8" import="net.sf.json.*"  
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendfile.jsp" %>
<link href="/fileManagement/css/index.css" rel="stylesheet"/>
<link href="/fileManagement/css/home.css" rel="stylesheet"/>
<script src="/fileManagement/js/answer.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/json2.js"></script>
<script>
    $(function(){
	        
            //当页面加载时就开始查找最火的标签
	        var param = {"type":"findTop"};
	        $.ajax({
	            url:getBasePath()+"/QuestionServlet",
				async:true,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(data){
				    var tagHtml = "";
					var message = $.parseJSON(data);//将json类型字符串转换为json对象
					var tagArray = message.tagArray;
					
					$.each(tagArray, function(i, obj) {
					    tagHtml += "<li class='col-sm-3'><div class='ans-sign'><a href='javascript:void(0)'>"+obj.tag+"</a></div></li>";
				    });	
				    $("#tag").html(tagHtml);
				},
				complete:function(){
				    getData(1);   //加载问题
				},
				error:function(response,status){	
				console.log(status);					
				}
	        })
	        //点击最新提问这给li时，从后台请求得到最新问题相关数据
	        $("#li1").bind("click",function(){
	            $("input[class='form-control']").val("");
	            getData(1);
	        })
	        //点击热门问题这个li时，从后台请求得到热门问题的相关数据
	        $("#li2").bind("click",function(){
	            $("input[class='form-control']").val("");
	            getData(1);
	        })
	        
	        //点击筛选时，根据输入的关键词进行筛选
	        $("a[class='go-search rounded']").bind("click",function(){
	             $("#table3").css("display","table");	
	             $("#table2").css("display","none");	
	             $("#table1").css("display","none");
	             getData(1);
	        })
	
      
    })
  //页码点击事件   
  function pageClick(rel){
      if(rel){
            getData(rel);
        }
  }  
  function getData(page){
        var total,pageSize,totalPage,curPage; //总记录数，每页显示数，总页数
        var table = "";
        var word = "";
        if($("#table1").css("display") == "table"){
            table = "table1";
        }else if($("#table2").css("display") == "table"){
            table = "table2";
        }else if($("#table3").css("display") == "table"){
            table = "table3";
            word = $("input[class='form-control']").val();
        }
        var param = {"pageNum":page-1,"table":table,"type":"page","word":word};
        $.ajax({
            url:getBasePath()+"/QuestionServlet",
			async:true,
			cache:false,
			type:"post",
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(param),
			
            success:function(data){
                var tagHtml = "";
			    var questionHtml = "";
				var message = $.parseJSON(data);//将json类型字符串转换为json对象
				var questionArray = message.questionArray;
				total = message.total;
				curPage = page;
				pageSize = 10;
				totalPage = message.totalPage;
				pageHtml = "<span>共"+total+"条&nbsp;&nbsp;</span><span>"+"<span class='currentPage'></span>"+"/"+totalPage+"</span>";
		        $.each(questionArray,function(i,obj){
		             //将每一个标签的值赋值给tagContent数组
		             var tagContent = new Array(" "," "," "," "," ");
		             $.each(obj.tagArray,function(j,t){
		                 tagContent[j] = t.tag;
		             });
		             questionHtml += "<tr><td class='answer-title'><a href='infoAns.jsp?questionId=" + 
		                            obj.questionId + 
		                            "'>" +
		                            obj.title +
		                            "</a></td><td class='answer-sign'>" +
								    "<span class='fa fa-bookmark' style='float:left;margin-top:5px;'></span>" +
								    "<ul class='clearfix' style='margin:0;padding:0;'>" +
									"<li>" + tagContent[0] + "</li>" +
									"<li>" + tagContent[1] + "</li>" +
									"<li>" + tagContent[2] + "</li>" +
									"<li>" + tagContent[3] + "</li>" +
									"<li>" + tagContent[4] + "</li>" +
								    "</ul></td><td class='answer-info'><span style='margin-right: 10px;'>" +
								    obj.answerNum +
								    "回答</span>|<span style='margin-left: 10px;'>" + 
								    obj.createTime +
								    "</span></td></tr>";
		            
		        });
		        if($("#table1").css("display") == "table"){
	                $("#table1").html(questionHtml);
		        }else if($("#table2").css("display") == "table"){
		            $("#table2").html(questionHtml);
		        }else if($("#table3").css("display") == "table"){
		            $("#table3").html(questionHtml);
		        }
			    $("#page").html(pageHtml);
			    $("span[class='currentPage']").html(page);
            },
            complete:function(){ //生成分页条
                getPageBar(total,totalPage,curPage);
            },
            error:function(){
                alert("数据加载失败");
            }
        });
    }    
    //获取分页条
function getPageBar(total,totalPage,curPage){
    //$("#page").find('*').remove();
    //页码大于最大页数
    if(curPage>totalPage) curPage=totalPage;
    //页码小于1
    if(curPage<1) curPage=1;
    pageStr = "";
    
    pageStr += "<ul class='pagination' style='float:right;'>";
						   
    //如果是第一页
    if(curPage==1){
        pageStr += "<li class='page-item'>首页</li><li class='page-item'>上一页</li>";
        //pageStr += "<span>首页</span><span>上一页</span>";
    }else{
        pageStr += "<li class='page-item'><a id='a-page' class='page-link' href='javascript:void(0)' onclick='pageClick(rel)' rel='1'>首页</a></li>" +
                   "<li class='page-item'><a id='a-page' class='page-link' href='javascript:void(0)' onclick='pageClick(rel)' rel='" + 
                   (curPage-1) + 
                   "'>上一页</a></li>";
        //pageStr += "<span><a href='javascript:void(0)' rel='1'>首页</a></span><span><a href='javascript:void(0)' rel='"+(curPage-1)+"'>上一页</a></span>";
    }
     
    //如果是最后页
    if(curPage>=totalPage){
        pageStr += "<li class='page-item'>下一页</li><li class='page-item'>尾页</li>";
    }else{
        pageStr += "<li class='page-item'><a id='a-page' class='page-link' href='javascript:void(0)' onclick='pageClick(rel)' rel='" + 
                   (parseInt(curPage)+1) +
                    "'>下一页</a></li>" +
                   "<li class='page-item'><a id='a-page' class='page-link' onclick='pageClick(rel)' href='javascript:void(0)' rel='" + 
                   totalPage + 
                   "'>尾页</a></li>";
        //pageStr += "<span><a href='javascript:void(0)' rel='"+(parseInt(curPage)+1)+"'>下一页</a></span><span><a href='javascript:void(0)' rel='"+totalPage+"'>尾页</a></span>";
    }  
    $("ul[class='pagination']").html(pageStr);
}
    function getBasePath(){
        return '<%=basePath%>';
    }
</script>
<title>智存网-回答问题</title>
</head>
<body>
	<%@include file="../basicpage/homehead.jsp" %>
	<div class="container-fluid" style="padding:100px 0;background-color: #F3F3F3;">
		<div id="answer-page" class="container">
			<div class="allAns col-sm-12">
				<div class="clearfix" style="margin-bottom:20px;"><span class="title">热门标签</span></div>
				<div class="hotSign">
					<ul class="list-inline row" id="tag">
						 <!--<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签1</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签2</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签3</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签4</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签5</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签6</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签7</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签8</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签9</a></div></li>
						<li class="col-sm-3"><div class="ans-sign"><a href="signAns.jsp">标签10</a></div></li>-->
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
						
					</div>
					<div class="answer-body clearfix" >
					   
						<table id="table1" class="table table-hover" style="font-size:15px;">
						<%//String questionArray = request.getParameter("questionArray");
						//System.out.print(questionArray);
						  
						   %> 
						 
						   <!-- <tr>
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
							</tr> -->
						
							
							
						</table>
						<table id="table2" class="table table-hover" style="font-size:15px;display:none;">
						    <!-- <tr>
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
							</tr> -->
							
						</table>
						<table id="table3" class="table table-hover" style="font-size:15px;display:none;"></table>
						
						<span id="page"></span>
						<ul class="pagination" style="float:right;">
						    <!--<li class="page-item disabled"><a class="page-link" href="#"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a id="a-page" class="page-link" href="#">2</a></li>
							<li class="page-item"><a id="a-page" class="page-link" href="#">3</a></li>
							<li class="page-item"><a id="a-page" class="page-link" href="#"><span class="fa fa-angle-double-right"></span></a></li>  -->
							
						</ul>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>