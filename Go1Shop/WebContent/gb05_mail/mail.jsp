<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
</style>

<title>Insert title here</title>
</head>
<body>
<h2>Mail</h2>

<a href="/GoEshop/gb05_mail/mail.do?addressee=${loginCheck.name}">我的信箱</a>
<a href="../index.jsp">回首頁</a>

<c:if test="${not empty validate}">
<table>
	<tr>	
	   		<th>編號</th>
			<th>寄件者</th>
			<th>主旨</th>
			<th>內容</th>
	</tr>
	<c:forEach var="mail" items="${mails}">
		<tr>
			<td>${mail.mailId}</td>
			<td>${mail.sender}</td>
			<td>${mail.title}</td>
			<td>${mail.content}</td>
			               
		</tr>
	</c:forEach>
</table>
</c:if>


</body>
</html>