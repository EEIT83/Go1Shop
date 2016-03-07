<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/jQuery-TWzipcode-master/jQuery-TWzipcode-master/jquery.twzipcode.js"></script>
<link href="<%=request.getContextPath()%>/_css/page.css" rel="stylesheet">
<script language="javascript">
		function reSize(){
		　　//parent.document.all.frameid.height=document.body.scrollHeight; 
		　　parent.document.getElementById("sendmailFrame").height=document.body.scrollHeight;
		} 
		window.onload=reSize;
</script>
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center; margin: 6% 0 0 3% ;">
		<div style="margin: 0 0 0 200px;width: 32%;background-color: rgba(0,0,0,0.1);width: 560px;">
			<form action='<c:url value='/ch07_mail/send.do'/>' style="margin: 0 0 0 5%;width: 600px;" >
				<table>
					<tr >
						<td align="right">寄信人：</td>
						<td align="left">${LoginOK.mail}</td>
					</tr>
					<tr style="height: 50px;">
						<td align="right">地址：</td>
						<td align="left"><input class="form-control" name="addressee" type="text"/></td>
					</tr>
					<tr style="height: 50px;">
						<td align="right">主旨：</td>
						<td align="left"><input class="form-control" name="title" type="text"/></td>
					</tr>
					<tr style="height: 50px;">
						<td align="right">內容：</td>
						<td align="left"><textarea class="form-control" name="content" style="resize: none;width:400px;height: 200px; "></textarea></td>
					</tr>
					<tr style="height: 50px">
						<td></td>
						<td style=""><input type="submit" value="送出" class="btn btn-primary"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>