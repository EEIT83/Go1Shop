<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>\
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
function reSize(){
	parent.document.getElementById("historyFrame").height=document.body.scrollHeight;
} 
window.onload=reSize;
</script>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>


</script>
<table class="table table-condensed" style="margin: 5% 0 0 2%;">
	<tr>
		
		<th>商品名稱</th>
		<th>賣家</th>
		<th>數量</th>
		<th>價錢</th>
		<th>小計</th>
	</tr>
	<c:forEach  var="i" begin="0" end="${fn:length(detail)-1}">
	<tr>
		
		<td>${detail[i].prod_name}</td>
		<td>${listStor[i].storeName}</td>
		<td>${detail[i].count }</td>
		<td>${detail[i].price }</td>
		<td>${detail[i].subtotal }</td>
		
	</tr>	
	</c:forEach>
</table>
		<p style="margin: 1% 0 0 2%;"><span style="color:black;">總金額：${total}</span></p>
<hr>
<%-- 		<p>收件人：${addressee}</p> --%>
<%-- 		<p>寄件人：${sender}</p> --%>
</body>
</html>