<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Login</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../_css/bootstrap.min.css">
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css"></style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/_js/jquery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath}/_js/jPages.min.js"></script>
<!-- -------------bootstrap彈跳視窗所需樣式、js END--------------- -->

<!--     -------------分頁效果所需樣式------------- -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/_css/jPages.css" />
</head>
<body>
	<div>
		<h4>登入</h4>
		<form action="<c:url value="/Account/Login.controller?accountStatus=login" />" method="post" class="form-inline" style="width: 803px; height: 142px">
			<div>
				<label for="mail">帳號:</label> 
				<input type="text" name="mail" id="mail" >
				<span id="errorMail">${error.mail}</span>
			</div>
			<br>
			<div>
				<label for="pwd">密碼:</label>
				<input type="text" name="pwd" id="pwd">
				<span id="errorPwd">${error.pwd }</span>
			</div>
			<h5>${error.loginError }</h5>
			<br>
			<div>
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
</script>
</body>
</html>
