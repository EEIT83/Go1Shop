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

<h3>~購衣蝦留言板管理~</h3>
<a href="../index.jsp">回首頁</a>

<table border=1>
	<tr>	
	   		<th>編號</th>
			<th>姓名</th>
			<th>留言</th>
			<th>時間</th>
			<th>狀態</th>
			<th>處理</th>
			
	</tr>
	<c:forEach var="comment" items="${comments}">
		<tr>
			<td>${comment.commentId}</td>
			<td>${comment.userName}</td>
			<td>${comment.comment}</td>
			<td>${comment.moment}</td>
			<td>${comment.report}</td>
			<td>
				<a href="/Go1Shop/g07_msgboard/comments.do?manage=1&hideId=${comment.commentId}">隱藏</a>
				<a href="/Go1Shop/g07_msgboard/comments.do?manage=1&recoverId=${comment.commentId}">復原</a>
			</td>
					
		</tr>
	</c:forEach>
</table>

</body>
</html>