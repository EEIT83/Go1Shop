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
<h3>留言板管理</h3>
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
	<c:forEach var="messageVO" items="${messageList}">
		<tr>
			<td>${messageVO.message_id}</td>
			<td>${messageVO.mem_id}</td>
			<td>${messageVO.message}</td>
			<td>${messageVO.message_date}</td>
			<td>${messageVO.message_state}</td>
			<td>
				<button onclick="recover()">復原</button>
				<button>封鎖</button>
			</td>
					
		</tr>
	</c:forEach>
</table>

<script type="text/javascript">
	function recover(){
		alert(111);
				
		
	}

</script>

</body>
</html>