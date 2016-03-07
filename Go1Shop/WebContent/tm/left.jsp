<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Go1Shop Home</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/_css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/_js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/_js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
	$(function() {
  			$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
	});
</script>
</head>
<body>
<ul id="leftNavigation">
			<li><a rel="leanModal" name="signup" href="#signup">
			<i class="glyphicon glyphicon-user leftNavIcon"></i>會員登入</a></li>
<!-- 			<li><a href="login.html" style="text-decoration: none"> -->
<!-- 			<i class="glyphicon glyphicon-search leftNavIcon"></i>查詢</a></li> -->
			<c:if test="${!empty LoginOK}">
				<li class="active1"><a href="#" style="text-decoration: none" target="_blank">
				<i class="glyphicon glyphicon-comment leftNavIcon"></i>訊息</a>
			<ul>
					<li><a href='<c:url value='/mail.do'/>'>信箱</a></li>
					<li><a href="<%=request.getContextPath()%>/gb05_mail/send.jsp">寫信</a></li>
				</ul>
			</li>
			</c:if>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i class="glyphicon glyphicon-triangle-right leftNavIcon"></i>上衣專區</a>
				<ul>
					<li><a href="#">短袖</a></li>
					<li><a href="#">長袖</a></li>
					<li><a href="#">背心</a></li>
					<li><a href="#">襯衫</a></li>
					<li><a href="#">毛衣</a></li>
					<li><a href="#">外套</a></li>
				</ul>
			</li>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i 	class="glyphicon glyphicon-triangle-right leftNavIcon"></i>褲子專區</a>
				<ul>
					<li><a href="#">短褲</a></li>
					<li><a href="#">長褲</a></li>
					<li><a href="#">牛仔褲</a></li>
					<li><a href="#">休閒褲</a></li>
					<li><a href="#">工作褲</a></li>
					<li><a href="#">飛鼠褲</a></li>
					<li><a href="#">海灘褲</a></li>
					<li><a href="#">運動褲</a></li>
				</ul></li>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i 	class="glyphicon glyphicon-triangle-right leftNavIcon"></i>配件專區</a>
			<ul>
				<li><a href="#">圍巾</a></li>
				<li><a href="#">帽子</a></li>
				<li><a href="#">眼鏡</a></li>
				<li><a href="#">項鍊</a></li>
				<li><a href="#">髮圈</a></li>
				<li><a href="#">皮帶</a></li>
			</ul></li>
		</ul>
<div id="signup">
	<div id="signup-ct">
				<div id="signup-header">
					<p>會員登入</p>
					<a class="modal_close" href="#"></a>
				</div>				
				<form action="<c:url value="/Account/Login.controller?accountStatus=login" />" method="post">
					  <div class="txt-fld">
					    <label for="mail">帳號:</label> 
						<input type="text" name="mail" id="mail" >
						<span id="errorMail">${error.mail}</span>
					  </div>
					  <div class="txt-fld">
					    <label for="pwd">密碼:</label>
						<input type="text" name="pwd" id="pwd">
						<span id="errorPwd">${error.pwd }</span>
					  </div>
					  <h5>${error.loginError }</h5>
					  <div class="btn-fld">
					  <button type="submit">Sign Up &raquo;</button>
					</div>
			    </form>
	</div>
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