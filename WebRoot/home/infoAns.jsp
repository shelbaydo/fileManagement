<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
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
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/json2.js"></script>
<!-- <script src="../js/editor.js"></script> -->

<script>
    
    $(function(){
	//创建富文本域
	
	var E = window.wangEditor;
    var editor = new E('#editor');
    editor.create();
    //每进入一次这个页面，获取进入该页面的链接所传过来的questionId值，并且给该问题的浏览量加一,并且查找该问题的具体信息，并且查找该问题的答案的所有答案
    var questionId = $("input[name='hiddenQuestionId']").val();
    var page = $("input[name='hiddenPage']").val();
    if(page == "answerMessageTest"){
        var answerId = $("input[name='hiddenAnswerId']").val();
    }else{
        var answerId = "";
    }
     
    var param = {"type":"addBrowseNum","questionId":questionId,"answerId":answerId};
    $.ajax({
	            url:getBasePath()+"/QuestionServlet",
				async:true,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(data){
				var message = $.parseJSON(data);//将json类型字符串转换为json对象
				var askerName = message.askerName;
				var tag = message.tag;
				var browseNum = message.browseNum;
				var title = message.title;
				var content = message.content;
				var bestAnswer = message.bestAnswer;
				var otherAnswer = message.otherAnswer;
				var randomQuestion = message.randomQuestion;
				var answerNum = 0;
				var bestAnswerNum = 0;
				var liHtml = "";
				$("#askerName").html(askerName);
				$("#questionTag").html(tag);	
				$("#questionTitle").html(title);
				$("#browseNum").html("浏览量： " + browseNum);  
				$("#questionContent").html(content); 
				//在猜你想答中放入随机的6条问题
				$.each(randomQuestion , function(i,obj){
				    liHtml += " <li><a href='infoAns.jsp?questionId=" +
				              obj.questionId +
				              "&page='infoAns''>" +
				              obj.questionTitle +
				              "</a></li>";
				});
				$("ul[class='otherQues']").html(liHtml);
				//如果没有最佳答案，则隐藏最佳答案
				if(bestAnswer   ==   "")   
				{
				    $("#bestAnswerPic").hide();
				    $("#bestAnsId").hide();
				}else{//如果有，则显示最佳答案
				    bestAnswerNum = 1;
				    $.each(bestAnswer , function(i,obj){
					    $("#bestAnswerContent").html(obj.answerContent);
				        $("#bestAnswerTime").html(obj.answerTime);
				        $("#bestAnswerName").html(obj.userName);
				        $("#bestAnswerTag").html(obj.userTag);
				        $("#bestAnswerPhoto").attr("src",obj.userPhoto);
				    });
				}
			    var anotherAnswerImg = document.getElementById("anotherAnswerImg");
			    
			    $.each(otherAnswer, function(i, obj) {
		         //其余的设置为其他答案
		         var vtop = "<div class='col-sm-3 clearfix id='otherAnsId''><img src=" +
		                    obj.userPhoto +
		                    " class='rounded-circle ans-pic'><div class='ans-name'>" +
		                    obj.userName +
		                    "</div></div><div class='col-sm-9 ans-content'><span class='ans-text'>" +
		                    obj.answerContent +
		                    "</span><br/><span class='ans-time'>" +
		                    obj.answerTime +
		                    "</span><span class='adoptButton'><input type='button' onclick='a(this)' value='采纳为最佳答案'  name='adoptButton' id=" +
		                    obj.answerId +
		                    " /></span><div class='ans-comment' id='comment><span class='fa fa-comments'></span></div></div>";
		
		         var newNodeTop = document.createElement("div");   //新建div
		         newNodeTop.innerHTML = vtop;   //给div里面填充内容
		         anotherAnswerImg.parentNode.insertBefore(newNodeTop, anotherAnswerImg.nextSibling);//在img后面添加div
		         
				 answerNum = i + 1; 
			    });
			    if(otherAnswer == ""){
			        answerNum = 0;
			    }
				//如果是从question页面跳转过来的,则除问题隐藏以外所有的元素
			    if(page == "question"){
			        $("#bestAnsId").hide();
			        $("#otherAnsId").hide();
			        $("#editor").hide();
			        //$("#answerNum").html("0");
			        $("button[class='btn btn-success']").hide();
			        $("#bestAnswerPic").hide();
			        $("#anotherAnswerImg").hide();
			    }  
			    //如果页面是从  answerMessageTest跳转过来的，则设置采纳按钮
			    if(page == "answerMessageTest"){
			        //如果有最佳答案，则设置采纳按钮为不可点
			        if(bestAnswer   !=   ""){
			            $("input[name='adoptButton']").attr("disabled","disabled");
			        }
			    }
			    else{
			        $("span[class='adoptButton']").hide();
			    }
				answerNum = answerNum + bestAnswerNum ;
				$("#answerNum").html(answerNum);
				},
				error:function(response,status){	
				console.log(status);					
				}
					
	        })
	  //点击换一换字样时，换问题内容
	 $("a[class='refresh']").bind("click",function(){
	     
	     var param = {"type":"changeQuestion"};
	     $.ajax({
	            url:getBasePath()+"/QuestionServlet",
				async:true,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(data){
				var message = $.parseJSON(data);//将json类型字符串转换为json对象
				var randomQuestion = message.randomQuestion;	
				var liHtml = "";
				//在猜你想答中放入随机的6条问题
				$.each(randomQuestion , function(i,obj){
				    liHtml += " <li><a href='infoAns.jsp?questionId=" +
				              obj.questionId +
				              "&page='infoAns''>" +
				              obj.questionTitle +
				              "</a></li>";
				});
				$("ul[class='otherQues']").html(liHtml);			     
				},
				error:function(response,status){	
				console.log(status);					
				}
					
	        })
	 })    
    //当按下提交回答按钮时，将数据提交到后台
    $("button[class='btn btn-success']").bind("click",function(){
        var content = editor.txt.text();
        var questionId = $("input[name='hiddenQuestionId']").val();
        var param = {"content":content,"questionId":questionId,"type":"addAnswer"};
        $.ajax({
	            url:getBasePath()+"/QuestionServlet",
				async:true,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(data){
				var message = $.parseJSON(data);//将json类型字符串转换为json对象
				alert(message.msg);					     
				},
				error:function(response,status){	
				console.log(status);					
				}
					
	        })
    })
    
    //当点击评论时，将评论添加到数据库
   /* $("#comment").bind("click",function(){
   
        var content = editor.txt.text();
        var questionId = 1;
        var param = {"content":content,"questionId":questionId,"type":"addAnswer"};
        $.ajax({
	            url:getBasePath()+"/QuestionServlet",
				async:true,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(data){
				var message = $.parseJSON(data);//将json类型字符串转换为json对象
				 
				},
				error:function(response,status){	
				console.log(status);					
				}
					
	        })
    })*/
    
   
})

//点击采纳按钮时
function a(a){
    var answerId = a.id;
    var param = {"type":"addBestAnswer","answerId":answerId};
        $.ajax({
	            url:getBasePath()+"/QuestionServlet",
				async:true,
				cache:false,
				type:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				success:function(data){
				var message = $.parseJSON(data);//将json类型字符串转换为json对象
				alert(message.msg);					     
				},
				error:function(response,status){	
				console.log(status);					
				}
	        })
    location.reload();	        
}
function getBasePath(){
        return '<%=basePath%>';
    }
</script>

<title>智存网-回答问题</title>
</head>
<body>
    
	<%@include file="../basicpage/homehead.jsp" %>
	<div class="container" style="padding-top:100px;">
		<div class="row">
			<div class="col-sm-9" style="padding-right:40px;border-right:1px #EBF0F1 solid;padding-bottom:80px;">
				<div class="question-info">
					<h4 id="questionTitle"></h4>
					<div class="info">
					<!--隐藏域传值，接收上一个页面传过来的值  -->
				    <input type="hidden" value=${param.questionId }  name="hiddenQuestionId" />
				    <input type="hidden" value=${param.page }   name="hiddenPage" />
				    <input type="hidden" value=${param.answerId }    name="hiddenAnswerId" />
						<ul class="clearfix">
							<li class="questioner">提问者:<a href="#" ><span  id="askerName"></span></a></li>
							<li class="sign">
								<div style="right:0;">
									<span class="fa fa-bookmark"></span>
									<span id="questionTag"></span>
								</div>
							</li>
							<li class="page-view" id="browseNum"></li>
						</ul>
					</div>
					<div class="supplement"><span style="font-weight:bold;">问题补充：</span><span id="questionContent"></span></div>
					<div style="margin-top:1px;">
						<div id="editor" style="margin-bottom:30px;overflow:hidden;"></div>	
					</div>
					<a href="#"><button type="button" class="btn btn-success">提交回答</button></a>
				</div>
				<div class="question-divider">
					<span class="question-divider-text"><span id="answerNum"></span>个回答</span>
					<span class="question-divider-line"></span>
				</div>
				<img src="../pic/bestAns.png" style="width:110px;margin-top:20px;" id="bestAnswerPic"/>
				<div class="bestAns clearfix"  id="bestAnsId">
					<div class="best-content">
						<p id="bestAnswerContent"></p>
						<span class="best-time" id="bestAnswerTime">2018/11/8</span>
						<div class="best-comment" id="comment"><span class="fa fa-comments"></span></div>
						
					</div>
					<!--  <div class="comment-area rounded clearfix">
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
						
					</div> -->
					
					
					<div class="best-info clearfix">
						<img src="" class="rounded-circle best-pic" id="bestAnswerPhoto">
						<div class="best-user">
							<p><span class="best-name" id="bestAnswerName"></span><span class="best-level rounded">LV2</span></p>
							<p><span class="best-sign" id="bestAnswerTag"></span></p>
						</div>
					</div>
				</div>	
				<img src="../pic/otherAns.png" style="width:90px;margin-top:20px;"/ id="anotherAnswerImg">
				
				
				<!--<div class="answer clearfix row" >
					<div class="col-sm-3 clearfix">
						<img src="../pic/1.jpg" class="rounded-circle ans-pic">
						<div class="ans-name">超级玛丽</div>
					</div>
					<div class="col-sm-9 ans-content">
						<span class="ans-text">学着学着学着就提高了</span><br/>
						<span class="ans-time">2018/11/8</span>
						<div class="ans-comment" id="comment"><span class="fa fa-comments"></span>评论(0)</div>
					</div>
					 <div class="comment-area rounded clearfix">
						<div class="comment-form clearfix">
							<input type="text" class="form-control col-sm-11" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
							<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
						</div>
					</div> 
					
				</div>	-->
				
				
					
			</div>
			<div class="col-sm-3 clearfix" style="padding:0px 30px;">
				<div style="position: fixed;">
					<div class="clearfix" style="margin-bottom:30px;">
						<span class="head">猜你想答</span>
						<a href="#" class="refresh"><span class="fa fa-refresh"></span>换一换</a>
					</div>
					<ul class="otherQues">
					    <!-- <li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li>
						<li><a href="infoAns.jsp">怎样学习效率不高?</a></li> -->
						
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homecopy.jsp" %>
</body>
</html>