<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/_css/app.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/_css/business-casual1.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/_js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/_css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/_js/jquery.leanModal.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
	<div class="container"  style="width:100%;background-color:#DDDDDD">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
			<div style="float:left;">
			<a href="<%=request.getContextPath()%>/index.jsp" style="text-decoration: none; color: black; text-shadow:5px 5px 5px #5B5B5B;font-size:45px" >Go.E-Shopping</a>
			<div class="address-bar" style="color:black;text-shadow:5px 5px 5px #5B5B5B;font-size:8px;">Enjoy Your Life&nbsp;●&nbsp;Chase Love．Brave Dream</div>
			</div>
			<ul class="nav navbar-nav"  >
				<li><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=F&change=true' />">WOMEN</a></li>
				<li><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&change=true' />">MEN</a></li>
				<li><a href="<%=request.getContextPath()%>/p_KIDS/K_index.jsp">KIDS</a></li>
				<li><a href="<%=request.getContextPath()%>/p_SOPRTS/S_index.jsp">SOPRTS</a></li>
				<li><a href="<%=request.getContextPath()%>/p_BABIES/B_index.jsp">BABIES</a></li>
			<c:if test="${empty LoginOK}">
				<li><a rel="leanModal" name="signup" href="#signup" id="login">			
				<i class="glyphicon glyphicon-user leftNavIcon"></i>會員登入</a></li>
			</c:if>
			<c:if test="${!empty LoginOK}">
			<li><a href='<c:url value="/Logout.do"></c:url>' id="logout">			
				<i class="glyphicon glyphicon-user leftNavIcon"></i>登出</a></li>
			</c:if>
			</ul>
		</div>
	</div>
</nav>
<!-- ---------------------彈跳視窗------------------------------- -->
<div id="signup">
	<div id="signup-ct">
<!-- 登入 -->
		<div id="loginForm" style="display: inline;">
				<div id="signup-header">
					<p>會員登入</p>
					<a class="modal_close" href="#"></a>
				</div>				
				<form action="<c:url value="/Account/Login.controller?accountStatus=login" />" method="post">
					  <div class="txt-fld">
					    <label for="mail" >帳號:</label> 
						<input type="text" name="mail" id="mail" class="input" >
						<span id="errorMail">${error.mail}</span>
					  </div>
					  <div class="txt-fld">
					    <label for="pwd">密碼:</label>
						<input type="text" name="pwd" id="pwd" class="input">
						<span id="errorPwd">${error.pwd }</span>
					  </div>
					  <h5>${error.loginError }</h5>
<!-- 					  <div class="btn-fld"> -->
					  <input type="submit" value="Sign In &raquo;"  class="loginbutton">
					    <input type="button" value="Sign Up &raquo;"  class="registerbutton" id="register">

<!-- 					</div> -->
			    </form>
		</div>
<!-- 註冊 -->
		<div id="registerForm" style="display: none;">
				<div id="signup-header">
					<p>會員註冊</p>
					<a class="modal_close" href="#"></a>
				</div>				
				<form action="<c:url value="/Account/Register.controller" />" method="post">
					  <div class="txt-fld">
					   <label>Mail</label>
					   <input type="text" name="mail" class="input"/>
					   <span id="errorMail">${error.mail }</span>
					  </div>
					  <div class="txt-fld">
					   <label>Password</label>
					   <input type="text" name="pwd" class="input"/>  
					   <span id="errorPwd">${error.pwd }</span> 
					  </div>
					  <div class="txt-fld">
					     <label>Name</label>
					   <input type="text" name="mem_name" id="mem_name" class="input"/>
					   <span id="errorMem_name">${error.mem_name }</span>
					  </div>
					  <div class="txt-fld">
					   <label>gender</label>
					   <input type="radio" name="gender" value="1" class="gender"> Male
					   <input type="radio" name="gender" value="2" class="gender"> Female					  
					  </div>
					  <div class="txt-fld">
					  <label>NickName</label>
					   <input type="text" name="nickName" id="nickName" class="input"/>
					   <span id="errorNickName">${error.nickName }</span>
					  </div>
					  <div class="txt-fld">
					   <label>Birthday</label>
					   <input type="text" name="bdate" id="bdate" class="input"/>
					   <span id="errorBdate">${error.bdate }</span>
					  </div>
					  <div class="btn-fld">
					  <input type="submit" name="pageStatus" value="save" class="registerbutton">
					</div>
			    </form>
		</div>		    		    
	</div>
</div>
<!-- 彈跳視窗 -->
<script type="text/javascript">
var registerForm = document.getElementById("registerForm");
var loginForm = document.getElementById("loginForm");
document.getElementById("register").addEventListener("click", function() {
	loginForm.style.display="none";
	registerForm.style.display="inline";
})
document.getElementById("login").addEventListener("click", function() {
	loginForm.style.display="inline";
	registerForm.style.display="none";
})
</script>
<!-- 驗證登入帳號 -->
<script type="text/javascript">
		var checkMail=document.getElementById("mail");
		var checkPwd=document.getElementById("pwd");
		checkMail.addEventListener("blur",function(){
			var regExp = /^[^@^\s]+@[^\.@^\s]+(\.[^\.@^\s]+)+$/;
			if(checkMail.value!=""){
				if (!regExp.test(checkMail.value)){
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