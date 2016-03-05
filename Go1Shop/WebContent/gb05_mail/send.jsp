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
<h2>Write Mail</h2>
<a href="../index.jsp">回首頁</a>
<form action="/GoEshop/send.do">

<table>

<tr>
	<td>sender</td>
	<td><input name="sender" type="text" value="${loginCheck.name}"/></td>
</tr>
<tr>
	<td>addressee</td>
	<td><input name="addressee" type="text"/></td>
</tr>
<tr>
	<td>title</td>
	<td><input name="title" type="text"/></td>
</tr>
<tr>
	<td>content</td>
	<td><textarea name="content"></textarea></td>
</tr>
<tr><td><input type="submit" /></td></tr>

</table>

</form>

</body>
</html>