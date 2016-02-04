<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">

table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>留言板</h4>	


<table>
	<tr>	
	   		<th>編號</th>
			<th>姓名</th>
			<th>留言</th>
			<th>時間</th>
	</tr>
	<c:forEach var="messageVO" items="${messageList}">
		<tr>
			<td>${messageVO.message_id}</td>
			<td>${messageVO.mem_id}</td>
			<td>${messageVO.message}</td>
			<td>${messageVO.message_date}</td>
			               
		</tr>
	</c:forEach>
</table>


<form action="/Go1Shop/g07_msgboard/message.do" method="get">
	<textarea name="textarea" rows="10" cols="30" ></textarea><br>
	<input type="submit" value="送出">
	<a href='../index.jsp'>回首頁</a>
</form>

</body>
</html>