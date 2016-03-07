<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul id="leftNavigation">
			<li><a href="<%=request.getContextPath()%>/g01_login/Login.jsp" style="text-decoration: none">
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
</body>
</html>