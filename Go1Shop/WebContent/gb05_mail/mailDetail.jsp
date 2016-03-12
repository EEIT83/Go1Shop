<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>ID</th>
		<th>寄件人：</th>
		<th>日期：</th>
		<th>主旨：</th>
		<th>內容：</th>
	</tr>
	<tr>
		<td name="mailId">${param.mailId}</td>
		<td name="sender">${param.sender}</td>
		<td name="title">${param.title}</td>
		<td name="content">${param.content}</td>
		<td name="date">${param.date}</td>
	</tr>


</table>
</body>
</html>