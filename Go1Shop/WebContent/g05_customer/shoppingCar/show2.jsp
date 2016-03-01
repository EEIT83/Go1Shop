<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/car/jquery.fly.min.js"></script>
<title>Insert title here</title>


<style type="text/css">

.box{float:left; width:198px; height:320px; margin-left:5px; border:1px solid #e0e0e0; text-align:center} 
.box p{line-height:20px; padding:4px 4px 10px 4px; text-align:left} 
.box:hover{border:1px solid #f90} 
.box h4{line-height:32px; font-size:14px; color:#f30;font-weight:500} 
.box h4 span{font-size:20px}
.u-flyer{display: block;width: 50px;height: 50px;border-radius: 50px;position: fixed;z-index: 9999;} 

.m-sidebar{position: fixed;top: 0;right: 0;background: #000;z-index: 2000;width: 35px;height: 100%;font-size: 12px;color: #fff;} 
.cart{color: #fff;text-align:center;line-height: 20px;padding: 200px 0 0 0px;} 
.cart span{display:block;width:20px;margin:0 auto;} 
.cart i{width:35px;height:35px;display:block; background:url(car.png) no-repeat;} 
#msg{position:fixed; top:300px; right:35px; z-index:10000; width:1px; height:52px; line-height:52px; font-size:20px; text-align:center; color:#fff; background:#360; display:none}  
</style>

</head>
<body>
<h3>商品頁</h3>
<table>
	<tr>
		<th>price</th>
		<th>product</th>		
		<th>count</th>
		<th>subtotal</th>
	</tr>
	<c:forEach var="result" items="${result}">
		<tr>
			<td>${result.productName}</td>
			<td>${result.brand}</td>
			<td>${result.price}</td>		
			<td>${result.note}</td>
		<td>						
		<form action='<c:url value="/g05_customer/shoppingCar/controller/BuyProServlet.con"/>' method="post">
			<input type="hidden" name="id" value="${result.prodId}">
			<input type="hidden" name="product" value="${result.productName}">
			<input type="hidden" name="brand" value="${result.brand}">
			<input type="hidden" name="price" value="${result.price}">
			<input type="hidden" name="count" value="1">
			<input type="submit" name="car" class="button orange addcar" value="加入購物車">
			${error.exist}
		</form>
		</td>
		</tr>
	</c:forEach>
</table>
<a href="<c:url value="/g05_customer/shoppingCar/car.jsp" />">購物車</a><br>
<a href="<c:url value="/index.jsp" />">回首頁</a>

</body>



</html>