<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=request.getContextPath()%>/_js/jquery-1.12.0.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/car/jquery.fly.min.js"></script>
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/_css/app.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/_css/business-casual1.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/_js/bootstrap.min.js"></script>

<style>
#p1 a {
	font-size: 20px;
	text-decoration: none;
	color: #5B5B5B;
	
}
#me {
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
		<div id="contentLeft">
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
		
	<div style="width:70%;margin-left:26%;" >
	<div id = "title" style="height:100%">
		<div id="PtitleImg" style="width:60%;float: left;" class="container"></div>
		<div id="Pname" style="width:100%;height:50px;font-size:60px;border: 1px solid red;" class="container"></div><br><br><br>
		<div id="Pbrand" style="width:100%;height:30px;text-align:right;border: 1px solid green;" class="container"></div><br>
		<div id="Pcount" style="width:100%;height:50px;text-align:right;font-size:40px;" class="container"></div><br>
		<div id="Psize" style="width:100%;height:50px;text-align:right;font-size:30px; " class="container" ></div><br>
		<div style="height:50px;text-align:center"><button type="submit" style=";width:150px;height:50px;font-size:20px">加入購物車</button></div>
		<div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>
		
		
		
		
	</div>
	<div id = "content">
		
	</div>
	<div id = "bottom">
		
	</div>
	<script>
	$(function(){
		$.ajax({
			'type':'POST',
			'url':"<c:url value='/showProdImg.con'/>",
			'dataType':'json',
			'data':{prodId:'2'},
			'success':function(data){								
				content(data);
				console.log(data.imgid[0]);
			}
		});
	});
	
	
	function content(data){
		$.ajax({
			'type':'GET',
			'url':"<c:url value='/g05_customer/ShowProServlet.con'/>",
			'dataType':'json',
			'data':{prod_id:'10'},
			'success':function(Prod){								
			console.log(Prod);
				
		$('#PtitleImg').append("<img id='img1' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[0]+"'/>'  style='width: 90%' />");
		$('#Pname').append("<p>"+Prod.productName+"</p>");
		$('#Pcount').append("<p style='color:red'>＄"+Prod.count+"元</p>");
		$('#Pbrand').append("<p>"+Prod.brand+"</p>");
		$('#Psize').append("<p>"+Prod.size+"</p>");
		$('#content').append("<img id='img2' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[1]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img3' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[2]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img4' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[3]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img5' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[4]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		
			}
		});
		
	}
	
	</script>
<%-- 	<c:forEach var="imgid" begin="1" end="${fn:length(imgId)}" varStatus="r"> --%>
<%-- 		<c:set var='x' value="${imgid}" /> --%>
<%-- 		<img  src="<c:url value='/g05_customer/ShowProdImg.con?imgId=${x}'/>" style="width: 40%"> --%>
<%-- 	</c:forEach> --%>
	
	</div>

<div id="me">
<footer>
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
</footer>
</div>
<script src="<%=request.getContextPath()%>/_js/jquery.ssd-vertical-navigation.js"></script>
<script src="<%=request.getContextPath()%>/_js/app.js"></script>



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
		<form action='<c:url value="/g05_customer/shoppingCar/controller/BuyProServlet.con"/>' method="post" >
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