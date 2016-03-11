<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-condensed">
	<tr>
		
		<th>商品名稱</th>
		<th>數量</th>
		<th>價錢</th>
		<th>小計</th>
	</tr>
	<c:forEach items="${detail}" var="bean">
	<tr>
		
		<td>${bean.prod_name}</td>
		<td>${bean.count }</td>
		<td>${bean.price }</td>
		<td>${bean.subtotal }</td>
		
	</tr>	
	</c:forEach>
</table>
<hr>
<%-- 		<p>收件人：${addressee}</p> --%>
<%-- 		<p>寄件人：${sender}</p> --%>
		<P>總計：${total}</P>
</body>
</html>