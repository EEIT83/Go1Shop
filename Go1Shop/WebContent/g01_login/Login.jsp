<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Login</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

</head>
<body>
	<div class="col-sm-10">
		<h4>登入</h4>
		<form action="<c:url value="/Account/Login.controller?accountStatus=login" />" method="post" class="form-inline" style="width: 803px; height: 142px">
			<div class="form-group">
				<label for="mail">帳號:</label> 
				<input type="text" name="mail" id="mail" class="form-control">
				<span id="errorMail">${error.mail}</span>
			</div>
			<br>
			<div class="form-group">
				<label for="pwd">密碼:</label>
				<input type="text" name="pwd" id="pwd" class="form-control">
				<span id="errorPwd">${error.pwd }</span>
			</div>
			<h5>${error.loginError }</h5>
			<br>
			<div class="form-group">
			<input class="btn btn-default" type="submit" name="check" value="Login">
			<input class="btn btn-default" type="submit" name="check" value="Forget">
			<a class="btn btn-primary" href="<c:url value="/Account/Register.controller" />?pageStatus=register">註冊</a>
			</div>
			
		</form>
	</div>
	<script type="text/javascript">
		var checkMail=document.getElementById("mail");
		var checkPwd=document.getElementById("pwd");
		checkMail.addEventListener("blur",function(){
			var regExp = /^[^@^\s]+@[^\.@^\s]+(\.[^\.@^\s]+)+$/;
			if(checkMail.value!=""){
				if (regExp.test(checkMail.value)){
					document.getElementById("errorMail").innerHTML="電子郵件正確";
				}else{
					document.getElementById("errorMail").innerHTML="電子郵件不正確";
				}
			}else{
					document.getElementById("errorMail").innerHTML="不可以空白";
			}
		});
		checkPwd.addEventListener("blur",function(){
			if((this.value)==""){
				document.getElementById("errorPwd").innerHTML="不可以空白";
			}else{
				document.getElementById("errorPwd").innerHTML=" ";
			}
		});
/*
		function load(){
			var xmlHttp = new XMLHttpRequest();
			if (xmlHttp != null) {
				xmlHttp.addEventListener("readyStatechange",returnData,false);
				xmlHttp.open("post", "", true);
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlHttp.send(checkMail.value,checkMail.value);
			}
		}
		function returnData(){
			if(xmlHttp.readyState==4){
				if(xmlHttp.status==200){
					
				}
			}
		}
*/
</script>
</body>
</html>
