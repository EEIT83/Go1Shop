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
<table>
	<tr>
		
		<th>商品名稱</th>
		<th>數量</th>
		<th>價錢</th>
	</tr>
	<c:forEach items="${detail}" var="bean">
	<tr>
		
		<td>${bean.prod_name}</td>
		<td>${bean.count }</td>
		<td>${bean.price }</td>
		
	
	
	</tr>	
	</c:forEach>
</table>
</body>
</html>