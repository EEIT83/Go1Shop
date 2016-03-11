<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>ChangePwd</title>
<script language="javascript">
function reSize(){
	parent.document.getElementById("changePwdFrame").height=document.body.scrollHeight;
} 
window.onload=reSize;
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
#submit{
width:100%;
font-size:20px;
}
label{
  font-size:25px;
  }
</style>
</head>
<body>
	<div style="width:500px;margin:5% auto;">
	<form action="<c:url value="/Account/ChangePwd.controller"/>?pageStatus=available" method="post" class="w3-container" >
		<label for="oldPwd">OldPwd</label> 
		<input type="text" name="oldPwd" class="w3-input" id="oldPwd" />
		<span id="errorOldPwd"></span>
		<br> 
		<label for="newPwd">NewPwd</label> 
		<input type="text" name="newPwd" class="w3-input" id="newPwd" />
		<span id="errorNewPwd"></span>
		<br> 
		<label for="checkNewPwd">CheckNewPwd</label> 
		<input type="text" name="checkNewPwd" class="w3-input" id="checkNewPwd" />
		<span id="errorCheckNewPwd"></span>
		<br>
		<input type="submit" value="Save" id="submit" class="btn btn-primary btn-lg">
		
		<span>${message }</span>
	</form>
	</div>
<script src="<%=request.getContextPath() %>/_js/ChangPwd.js"></script>
</body>
</html>
