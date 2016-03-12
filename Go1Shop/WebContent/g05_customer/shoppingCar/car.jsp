<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物車</title>
<script src="<%=request.getContextPath()%>/_js/jquery-1.12.0.min.js"></script>
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/_css/page.css" rel="stylesheet">
<style type="text/css">

</style>
</head>
<body>
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
	<div id="rigth"style="float: left;margin-right:2%;margin-left:1%;margin-bottom:0.5%;width: 82%;">
<!----------------------------------------------------------------------------------------->	
		<div style="width:95%;height:100%;margin:5% 0 0 5%;" class="model-content">
			<table class="table table-condensed">
				<tr>
					<th style="width: 25%;">商品名稱</th>
					<th style="width: 5%;">價錢</th>
					<th style="width: 10%;">數量</th>
					<th style="width: 15%;">小計</th>
					<th style="width: 15%;">刪除</th>
				</tr>
			<!-- 	<tr> -->
			<%-- 	<td>${shopcar.car.value.id}</td> --%>
			<%-- 	<td>${shopcar.car.value.product}</td> --%>
			<%-- 	<td>${shopcar.car.value.price}</td> --%>
			<%-- 	<td>${shopcar.car.value.count}</td> --%>
				<c:forEach var="cars" items="${shopcar.car}" >
				<tr>
				<td style="width: 25%;">${cars.value.prod_Name}</td>
				<td style="width: 5%;">${cars.value.price}</td>
				<td style="width: 10%;">
					<form action="<c:url value='/g05_customer/shoppingCar/controller/carEdit/UpdateCarServlet.do'/>" method="get">
						<input type="submit" name="status" value="-" class="btn btn-primary" style=";width: 20%;height: 5%;">
						<input type="text" name="count" value="${cars.value.count}" style="width:30px; text-align: center;">
						<input type="hidden" name="id" value="${cars.value.prod_Id}">
						<input type="submit" name="status" value="+" class="btn btn-primary" style="text-align: center;">
					</form>
				</td>
				<td style="width: 15%;">${cars.value.subtotal}</td>
				<td style="width: 15%;">
					<c:choose>
			            <c:when test="${countError.count != null}">
				            <form name="del">
								<input type="hidden" name="id" value="${cars.value.prod_Id}">
								<input type="hidden" name="status" value="刪除">
								<span style="color:red;">
								<li class="glyphicon glyphicon-trash"  ></li>
								${countError.count}</span>
							</form>
			            </c:when>
			            <c:otherwise>
			                 <form action="<c:url value='/g05_customer/shoppingCar/controller/carEdit/UpdateCarServlet.do'/>" method="get">
								<input type="hidden" name="id" value="${cars.value.prod_Id}">
								<input type="hidden" name="status" value="刪除">
								<span style="color:black;">
									<button type="submit" style="text-align: center;" class="btn btn-primary	 glyphicon glyphicon-trash"></button>
								</span>
							</form>
			            </c:otherwise>
        			</c:choose>
				
				 </td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div style="text-align: right;width: 100%;height: 100%;bottom:0;left:0;">
			<a class="btn btn-primary" href="<c:url value="/index.jsp" />">回首頁</a>
			<a style="margin-left: 20px; " class="btn btn-primary" href="<c:url value="/g05_customer/checkout/checkDetail.jsp" />">結帳</a>
		</div>
	</div>
<!-- 下邊	--------------------------------------------------------------------------------- -->	
	<div id="bottom" style="clear:left;width:100%;position:fixed;bottom:0;left:0;">
		<jsp:include page="/tm/bottom.jsp" />	
	</div>
<!-------------------------------------------------------------------------------------- -->






<script>
//	window.onload = function () {

// 		document.getElementById("delete").onclick=dsubmit;
//	}

// 	function dsubmit(){
		
// 		document.forms[2].action="<c:url value='/g05_customer/shoppingCar/controller/carEdit/UpdateCarServlet.do'/>";
// 		document.forms[2].method="get";
// 		document.forms[2].submit();		
// 	}
	

</script>
</div>
</body>
</html>