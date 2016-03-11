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
				<li><a href="<c:url value="/g03_product/ProductGenderServlet.controller?gender=F&change=true"/>">WOMEN</a></li>
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
				<li><a href='<c:url value="/g05_customer/shoppingCar/car.jsp" />'>			
					<i class="glyphicon glyphicon-shopping-cart leftNavIcon"></i>購物車</a></li>
			</c:if>
			</ul>
		</div>
	</div>
</nav>
</body>
</html>