<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<script src="<%=path%>/js/jquery-3.3.1.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="<%=path%>/js/json2.js"></script>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事件测试页面</title>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
    $(function(){
        $("#submit").bind("click",function(){
    
            var content = $("textarea[name='content']").val();
            var date = $("input[name='date']").val();
            var time = $("select[name='time']").val();
            var hour = $("select[name='hour']").val();
            var minute = $("select[name='minute']").val();
            var param = {"content":content,"date":date,"time":time,"hour":hour,"minute":minute,"type":"addEvent"};
            $.ajax({
                //alert("fad");
                url:getBasePath()+"/EventServlet",
 				async:true,
 				cache:false,
 				type:"post",
 				contentType: "application/json; charset=utf-8",
 				data:JSON.stringify(param),
 				success:function(msg){
 					var message = $.parseJSON(msg);//将json类型字符串转换为json对象
 					alert(message.msg);										     
 				},
 				error:function(response,status){	
					console.log(status);					
 				}	
            })
        })
    })
    function getBasePath(){
	    return '<%=basePath%>';
    }
    
</script>
</head>
<body>
   
         事件内容：<textarea rows="3" cols="30" name="content"></textarea><br/>
         事件时间：<input class="Wdate" type="text"  onClick="WdatePicker()" name="date"/>
         <select name="time">
             <option >上午</option>
             <option>下午</option>
         </select>
         <select name="hour">
             <option >01</option>
             <option >02</option>
             <option >03</option>
             <option >04</option>
             <option >05</option>
             <option >06</option>
             <option >07</option>
             <option >08</option>
             <option >09</option>
             <option >10</option>
             <option >11</option>
             <option >12</option>
         </select>&nbsp;:&nbsp;
         <select name="minute">
             <option >00</option>
             <option >05</option>
             <option >10</option>
             <option >15</option>
             <option >20</option>
             <option >25</option>
             <option >30</option>
             <option >35</option>
             <option >40</option>
             <option >45</option>
             <option >50</option>
             <option >55</option>
         </select>
         <br/><input type="button"  value="确定" id="submit"/>
     
     
</body>
</html>