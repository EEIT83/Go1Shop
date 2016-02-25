<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>ChangePwd</title>
<script type="text/javascript">

<%  
	int status = Integer.parseInt(request.getAttribute("status").toString());
	String message = request.getAttribute("message").toString();
	if(status == -1){
%>
		alert(message);
<%		
	}
%>
</script>
</head>
<body>
	<form action="<c:url value="/Account/ChangePwd.controller"/>?pageStatus=available" method="post">
		<label>OldPwd</label> 
		<input type="text" name="oldPwd" id="oldPwd" />
		<span id="errorOldPwd"></span>
		<br> 
		<label>NewPwd</label> 
		<input type="text" name="newPwd" id="newPwd" />
		<span id="errorNewPwd"></span>
		<br> 
		<label>CheckNewPwd</label> 
		<input type="text" name="checkNewPwd" id="checkNewPwd" />
		<span id="errorCheckNewPwd"></span>
		<br>
		<input type="submit" value="Submit" id="submit">
		<br><br>
		<span>${status == 0 ? message : ""}</span>
	</form>
<script src="../js/ChangPwd.js"></script>
</body>
</html>
