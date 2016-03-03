<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物車</title>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


</head>

<body>
<h3>商品頁</h3>
<table class="table table-condensed">
	<tr>
		<th>商品名稱</th>
		<th>價錢</th>
		<th>數量</th>
		<th>小計</th>
		<th>刪除</th>
	</tr>
<!-- 	<tr> -->
<%-- 	<td>${shopcar.car.value.id}</td> --%>
<%-- 	<td>${shopcar.car.value.product}</td> --%>
<%-- 	<td>${shopcar.car.value.price}</td> --%>
<%-- 	<td>${shopcar.car.value.count}</td> --%>

	<c:forEach var="cars" items="${shopcar.car}" >
	
	<tr>
	<td>${cars.value.prod_Name}</td>
	<td>${cars.value.price}</td>
	<td>
		<form action="<c:url value='/g05_customer/shoppingCar/controller/carEdit/UpdateCarServlet.do'/>" method="get">
			<input type="submit" name="status" value="-" class="btn btn-primary" style="text-align: center;">
			<input type="text" name="count" value="${cars.value.count}" style="width:30px; text-align: center;">
			<input type="hidden" name="id" value="${cars.value.prod_Id}">
			<input type="submit" name="status" value="+" class="btn btn-primary" style="text-align: center;">
		</form>
	</td>
	<td>${cars.value.subtotal}</td>
	
	
	
	<td
	>
		<form>
		<input type="hidden" name="id" value="${cars.value.prod_Id}">
		<input type="hidden" name="status" value="刪除">
		<li class="glyphicon glyphicon-trash" id="delete"></li>
		</form>
	 </td>

	</tr>
	</c:forEach>
	
	
</table>
${countError.count}
<a href="<c:url value="/index.jsp" />">回首頁</a>
<a href="<c:url value="/g05_customer/checkout/checkDetail.jsp" />">結帳</a>
<script>
	window.onload = function () {
		document.getElementById("delete").onclick=dsubmit;
	}

	function dsubmit(){
		document.forms[1].action="<c:url value='/g05_customer/shoppingCar/controller/carEdit/UpdateCarServlet.do'/>";
		document.forms[1].method="get";
		document.forms[1].submit();		
	}
	

</script>
</body>
</html>