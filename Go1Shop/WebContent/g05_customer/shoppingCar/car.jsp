<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物車</title>
<script src="<%=request.getContextPath()%>/_js/jquery-1.12.0.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/car/jquery.fly.min.js"></script>
<link href="<%=request.getContextPath()%>/_css/app.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/_css/business-casual1.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/_css/bootstrap.min.css" rel="stylesheet">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
#p1 a {
	font-size: 20px;
	text-decoration: none;
	color: #5B5B5B;
	
}
#bottom {
background-color:#DDDDDD;
border-radius:20px 20px 0 0;

}
.active{ 
border-radius:10px 10px 10px 10px;
}
.active ul li{
border-radius:10px 10px 10px 10px;
}
body{ 
font-family:微軟正黑體;
} 

</style>
</head>
<body>
<div style="width: 100%;height: 100%;">
<!-- 上邊	--------------------------------------------------------------------------------- -->
	<div style="margin-bottom:0.5%;">
<!-------------------------------------------------------------------------------------- -->
		<nav class="navbar navbar-default" role="navigation">
			<div class="container"  style="width:100%;border-radius:0 0 20px 20px;background-color:#DDDDDD">
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
					<div style="float:left;">
					<a href="women.html" style="text-decoration: none; color: black; text-shadow:5px 5px 5px #5B5B5B;font-size:45px" >Go.E-Shopping</a>
					<div class="address-bar" style="color:black;text-shadow:5px 5px 5px #5B5B5B;font-size:8px;">Enjoy Your Life&nbsp;●&nbsp;Chase Love．Brave Dream</div>
					</div>
					<ul class="nav navbar-nav"  >
						<li><a href="women.html">WOMEN</a></li>
						<li><a href="men.html">MEN</a></li>
						<li><a href="kids.html">KIDS</a></li>
						<li><a href="soprts.html">SOPRTS</a></li>
						<li><a href="babies.html">BABIES</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
<!-- 左邊	--------------------------------------------------------------------------------- -->
	<div id="left" style="float: left;margin-left:2%;width: 11%;">
<!-------------------------------------------------------------------------------------- -->
		<ul id="leftNavigation">
			<li><a href="login.html" style="text-decoration: none">
			<i class="glyphicon glyphicon-user leftNavIcon"></i>會員登入</a></li>
			
			<li><a href="login.html" style="text-decoration: none">
			<i class="glyphicon glyphicon-search leftNavIcon"></i>查詢</a></li>
		
			<li class="active1"><a href="#" style="text-decoration: none">
			<i class="glyphicon glyphicon-triangle-right leftNavIcon"></i>上衣專區</a>
				<ul>
					<li><a href="#">短袖</a></li>
					<li><a href="#">長袖</a></li>
					<li><a href="#">背心</a></li>
					<li><a href="#">襯衫</a></li>
					<li><a href="#">毛衣</a></li>
					<li><a href="#">外套</a></li>
				</ul></li>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i 	class="glyphicon glyphicon-triangle-right leftNavIcon"></i>褲子專區</a>
				<ul>
					<li><a href="#">短褲</a></li>
					<li><a href="#">長褲</a></li>
					<li><a href="#">牛仔褲</a></li>
					<li><a href="#">休閒褲</a></li>
					<li><a href="#">工作褲</a></li>
					<li><a href="#">飛鼠褲</a></li>
					<li><a href="#">海灘褲</a></li>
					<li><a href="#">運動褲</a></li>
				</ul></li>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i 	class="glyphicon glyphicon-triangle-right leftNavIcon"></i>配件專區</a>
			<ul>
				<li><a href="#">圍巾</a></li>
				<li><a href="#">帽子</a></li>
				<li><a href="#">眼鏡</a></li>
				<li><a href="#">項鍊</a></li>
				<li><a href="#">髮圈</a></li>
				<li><a href="#">皮帶</a></li>
			</ul></li>
		</ul>
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
				            <form>
								<input type="hidden" name="id" value="${cars.value.prod_Id}">
								<input type="hidden" name="status" value="刪除">
								<span style="color:red;">
								<li class="glyphicon glyphicon-trash" id="delete"></li>
								${countError.count}</span>
							</form>
			            </c:when>
			            <c:otherwise>
			                 <form>
								<input type="hidden" name="id" value="${cars.value.prod_Id}">
								<input type="hidden" name="status" value="刪除">
								<span style="color:black;">
									<li class="glyphicon glyphicon-trash" id="delete"></li>
								</span>
							</form>
			            </c:otherwise>
        			</c:choose>
				
				
					
<%-- 					<c:if test="${countError.count != null}"> --%>
<!-- 						<form> -->
<%-- 						<input type="hidden" name="id" value="${cars.value.prod_Id}"> --%>
<!-- 						<input type="hidden" name="status" value="刪除"> -->
<!-- 						<span style="color:red;"> -->
<!-- 						<li class="glyphicon glyphicon-trash" id="delete"></li> -->
<%-- 						${countError.count}</span> --%>
<!-- 						</form> -->
<%-- 					</c:if> --%>
<!-- 						<form> -->
<%-- 						<input type="hidden" name="id" value="${cars.value.prod_Id}"> --%>
<!-- 						<input type="hidden" name="status" value="刪除"> -->
<!-- 						<span style="color:black;"> -->
<!-- 						<li class="glyphicon glyphicon-trash" id="delete"></li> -->
<!-- 						</span> -->
<!-- 					</form> -->
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
<!-------------------------------------------------------------------------------------- -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<p id="p1">
						<a href=""><i class="glyphicon glyphicon-envelope leftNavIcon"></i>聯絡
							Go.E</a>&nbsp;●&nbsp;<a href="">購物指南</a>&nbsp;●&nbsp;<a
							href="">品牌日誌</a>&nbsp;●&nbsp;<a href="">最新消息</a>&nbsp;●&nbsp;<a
							href="">使用條款</a>&nbsp;●&nbsp;<a href="">隱私政策</a>&nbsp;●&nbsp;<a href="index.html">Go.E-Shopping<i
							class="glyphicon glyphicon-home leftNavIcon"></i>
						</a>
					</p>
				</div>
			</div>
		</div>
	<script src="<%=request.getContextPath()%>/_js/jquery.ssd-vertical-navigation.js"></script>
	<script src="<%=request.getContextPath()%>/_js/app.js"></script>
</div>






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
</div>
</body>
</html>