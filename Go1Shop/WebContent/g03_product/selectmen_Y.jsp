<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="<%=request.getContextPath()%>/_css/app.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/_css/business-casual1.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/_js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- yoga -->
<style type="text/css">
 input {padding:5px 15px; background:#ccc; border:0 none;
cursor:pointer;
-webkit-border-radius: 5px;
border-radius: 5px; }
 input[type="submit"]{padding:5px 15px; background:#ccc; border:0 none;
cursor:pointer;
-webkit-border-radius: 5px;
border-radius: 5px; }
input[type="text"]{padding:5px 15px; border:2px black solid;
cursor:pointer;
-webkit-border-radius: 5px;
border-radius: 5px; }
#B{
font-size:20px;
}
#B span{
/* margin-left:50px; */
 padding-left:70px;
}

#header5{
margin:0 21%;
}


#div{
width:100%;
overflow: auto;
}
#img1 {
 border: 2px solid #292929;
 padding: 1px;
}
#h3txt{
    color: #337ab7;
    text-align: center;
    }
#div_out {    
    padding:10px;
    border:2px;
    margin:15px;
    display:inline-block;
 	float:left;
    padding-right: 15px;
    padding-left: 15px; 
 } 
#div_out:nth-child(3n+1){
 clear: both;
 }
  
  
 #header {
	margin: 0 auto;
	padding: 44px 0 50px;
	text-align: center;
	width: 960px;
}
#header a.logo {
	display: block;
	margin: 0 auto;
	padding: 0;
	width: 340px;
}
#header a.logo img {
	border: 0;
	display: block;
	margin: 0;
	padding: 0;
}
#header ul {
	margin: 0;
	padding: 56px 0 0;
}
#header ul li {
	display: inline;
	list-style: none;
	margin: 0;
	padding: 0 19px;
}
#header ul li a {
	color: #252525;
	display: inline-block;
	font-family: "Arial Black", Gadget, sans-serif;
	font-size: 14px;
	font-weight: normal;
	margin: 0;
	padding: 0 0 3px;
	text-decoration: none;
	text-transform: uppercase;
}

#header ul li a:hover, #header ul li.selected a {
	color: #0ba39c;
}
</style> 
<!-- yoga -->
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
<div style="width: 100%;height: 100%;">
	<div style="margin-bottom:0.5%;"><nav class="navbar navbar-default" role="navigation">
		<div class="container"  style="width:100%;border-radius:0 0 20px 20px;background-color:#DDDDDD">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1" >
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
	</nav></div>
	<div style="float: left;margin-left:2%;width: 11%;"><div id="contentLeft">
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
		</div></div>
	<div style="float: left;margin-right:2%;margin-left:1%;margin-bottom:0.5%;width: 60%;">
	<div style="width:100%;margin-left:15%">
	<form action="<c:url value="/g03_product/ProductGenderServlet.controller?gender=M"/>" method="post">
		
		<div id="B">
<!-- 			<ul id="C"> -->
				<span>產品名稱</span> <input type="text" name="prod_name"	value="${param.prod_name}" style="width: 250px;">
				<span>價錢範圍從</span><input type="text" name="lowprice" value="${param.lowprice}" style="width:120px;">&nbsp;&nbsp;到&nbsp;&nbsp;<input type="text"
					name="highprice" value="${param.highprice}" style="width:120px;">
				<span><input type="submit" name="prodaction" value="Select" style="width:120px"></span>
<!-- 			</ul>			 -->
		
		
		<div id="header5">
<!-- 			<ul id="navigation"> -->
				<button type="submit" name="selectorder"
					value="OrderByPrice" class="btn btn-default btn-lg active">依金額低至高</button>
				<button type="submit" name="selectorder"
					value="OrderByPriceDesc" class="btn btn-default btn-lg active">依金額高至低</button>
				<button type="submit" name="selectorder" value="OrderByDate" class="btn btn-default btn-lg active">依刊登日期舊至新</button>
				<button type="submit" name="selectorder"
					value="OrderByDateDesc" class="btn btn-default btn-lg active">依刊登日期新至舊</button>
					</div>
<!-- 			</ul> -->
		</div>

<!-- 		<div>		 -->
<!-- </div>	 -->
</form>

<div id="div">
	<c:forEach var="bean" items="${select}">
<%-- 		<c:url value="/g03_product/selectmen.jsp" var="path"> --%>
<%-- 		    <c:param name="prod_id" value="${bean.prod_id}" />			 --%>
<%-- 			<c:param name="prod_name" value="${bean.prod_name}" /> --%>
<%-- 			<c:param name="size" value="${bean.size}" /> --%>
<%-- 			<c:param name="color" value="${bean.color}" /> --%>
<%-- 			<c:param name="price" value="${bean.price}" /> --%>
<%-- 			<c:param name="brand" value="${bean.brand}" /> --%>
<%-- 			<c:param name="gender" value="${bean.gender}" /> --%>
<%-- 			<c:param name="part" value="${bean.part}" /> --%>
<%-- 			<c:param name="launch_date" value="${bean.launch_date}" /> --%>
<%-- 			<c:param name="note" value="${bean.note}" />			 --%>
<%-- 		</c:url> --%>

		<div id="div_out">
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-4 portfolio-item"> -->
<a href="#"> <img id="img1" class="img-responsive" style="width:300px;height:300px"
						
						src='<c:url value="/pages/showImg.controller?prod_id="/>${bean.prod_id}'>
					</a>
					<h3 id="h3txt">						
						<a>${bean.prod_name}</a><br>
						<a>金額:${bean.price}</a>						
					</h3>
					
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</c:forEach>
	</div>

</div>
		
	</div></div>
	<div style="clear:left;"><div id="me">
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
</div></div>
</div>
<script src="<%=request.getContextPath()%>/_js/jquery.ssd-vertical-navigation.js"></script>
<script src="<%=request.getContextPath()%>/_js/app.js"></script>
</body>
</html>