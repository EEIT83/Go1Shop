<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/_css/jquery-ui.min.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/_css/lobipanel.min.css"/>
<script src="<%=request.getContextPath()%>/_js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/lobipanel.min.js"></script>
</head>
<script language="javascript">
		function reSize(){
// 		　　parent.document.all.frameid.height=document.body.scrollHeight; 
		　　parent.document.getElementById("mailFrame").height=document.body.scrollHeight;
		} 
		window.onload=reSize;
</script>
<body>
<div style="margin: 5% 0 0 5%; width: 80%;height: 100%;">

	<div name="mailId">信件編號：${param.mailId}</div>
	<br>
	<div name="sender">寄信人：${param.sender}</div>
	<br>
	
	<div class="panel panel-default">
	    <div class="panel-heading">
	        <div class="panel-title">
	            <h4>${param.title}</h4>
	        </div>
	    </div>
	    <div class="panel-body">
	        ${param.content}
	    </div>
	</div>    
</div>
<script type="text/javascript">
$(function() {
	
	$.ajax({
		'type':'GET',
		'url':"<c:url value='/ch07_mail/Mailcheck.do' />",
		'dataType':'json',
		'data':{mailId:'${param.mailId}'},
		'success':function(shop){								
		console.log(shop);		
		}
	});
	
	
})
</script>
</body>
</html>