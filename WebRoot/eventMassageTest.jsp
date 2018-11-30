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
<title>事件消息测试页面</title>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
    $(function(){
    	//alert('dd');
    
    	//当出现该页面的时候就出现提示信息
        var param = {"type":"eventMassage"};
        $.ajax({
            url:getBasePath()+"/EventServlet",
			async:true,
			cache:false,
			type:"post",
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(param),
			success:function(data){
				//alert("d");
				var message = $.parseJSON(data);
				var html = "";
				$.each(message, function(i, obj) {
    				 html += "<li>" + obj.content + "   "  + obj.endTime+ "</li>";
				});
				
				$("#showEvent").html(html);
			}
           
        })
        
    })
    function getBasePath(){
	    return '<%=basePath%>';
    }
    
</script>
</head>
<body>
   
    <ul id="showEvent">
    </ul> 
     
</body>
</html>