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
	<h3>廣告管理</h3>
	<a href="../index.jsp">回首頁</a>

<%-- 	<form action='<c:url value="/gb04_marketing/insertImg.do" />' method="post" enctype="multipart/form-data"> --%>
	
	<form action="/Go1Shop/xxx.do" method="post" enctype="multipart/form-data">
	
		<table border="1">
			<thead>
				<tr>
					<td>編號</td>
					<td>圖片</td>
					<td>變更</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><img height='280' width='700'
						src='${pageContext.servletContext.contextPath}/gb04_marketing/showImg.do?id=1'>
					</td>
<!-- 					<td><input style="background: #FFFFFF" class='InputClass' -->
<!-- 						type="file" name="1" size="40" /></td> -->
					
					<td><input onchange="changePic()" style="background: #FFFFFF" class='InputClass'
						type="file" name="1" size="40" /></td>
					
						
						
				</tr>
				<tr>
					<td>2</td>
					<td><img height='280' width='700'
						src='${pageContext.servletContext.contextPath}/gb04_marketing/showImg.do?id=2'>
					</td>
					<td><input onchange="changePic()" style="background: #FFFFFF" class='InputClass'
						type="file" name="2" size="40" /></td>
				</tr>
				<tr>
					<td>3</td>
					<td><img height='280' width='700'
						src='${pageContext.servletContext.contextPath}/gb04_marketing/showImg.do?id=3'>
					</td>
					<td><input onchange="changePic()" style='background: #FFFFFF' class='InputClass'
						type="file" name="3" size="40" /></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" name="Submit" value="確認變更" />
	</form>
	
	<script type="text/javascript">
	
		function changePic(){
			document.forms[0].action="/Go1Shop/xxx.do";
			document.forms[0].method="POST";
			document.forms[0].submit();
		}
	
	</script>
	
	
</body>
</html>