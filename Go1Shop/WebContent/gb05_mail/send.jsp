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

<title>Insert title here</title>
</head>
<body>
<h2>Write Mail</h2>

<div style="width: 100%;height: 100%;">
<!-- 上邊	--------------------------------------------------------------------------------- -->
	<div style="margin-bottom:0.5%;">
		<jsp:include page="/tm/top.jsp" />
	</div>
<!-- 左邊	--------------------------------------------------------------------------------- -->
	<div id="left" style="float: left;margin-left:2%;width: 11%;">
		<jsp:include page="/tm/left.jsp" />
	</div>
<!-- 右邊	----------------------------------------------------------------------------------->
	<div id="right"style="float: left;margin-right:2%;margin-left:1%;margin-bottom:0.5%;width: 82%;">
<!----------------------------------------------------------------------------------------->
		
		
		
		
		
		
		<div style="text-align: center;margin: 7% 0 0 5%">
		<div style="margin: 0 auto;width: 40%;">
		<form action='<c:url value='/ch07_mail/send.do'/>' >
			<table>
			
				<tr>
					<td>寄信人：</td>
					<td>${LoginOK.mail}</td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input class="form-control" name="addressee" type="text"/></td>
				</tr>
				<tr>
					<td>主旨：</td>
					<td><input class="form-control" name="title" type="text"/></td>
				</tr>
				<tr>
					<td>內容：</td>
					<td><textarea class="form-control" name="content"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="送出" class="btn btn-primary"/></td>
				</tr>
			
			</table>
		</form>
		</div>
		</div>
<!-- 下邊	--------------------------------------------------------------------------------- -->	
	<div id="bottom" style="clear:left;width:100%;bottom:0;left:0;;position:fixed;">
		<jsp:include page="/tm/bottom.jsp" />	
	</div>
<!-------------------------------------------------------------------------------------- -->
</div>
</body>
</html>