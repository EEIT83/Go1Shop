<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <!--yoga -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- 	<title>Gallery - Mustache Enthusiast</title> -->
<%-- 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"> --%>
<%-- 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mobile.css" media="screen and (max-width : 568px)"> --%>
<!-- 	<script type="text/javascript" src="js/mobile.js"></script> -->
<!-- <!--yoga -->

<!-- <!-- 版本2 --> 
<!--     <meta charset="utf-8"> -->
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--     <meta name="description" content=""> -->
<!--     <meta name="author" content=""> -->
<!--      Bootstrap Core CSS -->
<%--     <link href="<%=request.getContextPath()%>/startbootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!--     Custom CSS -->
<%--     <link href="<%=request.getContextPath()%>/startbootstrap/css/3-col-portfolio.css" rel="stylesheet"> --%>
<!-- 版本2 --> 

<!-- jquery -->
<!-- 		<link rel="stylesheet" type="text/css" href="../inputstyle/css/normalize.css" /> -->
<!-- 		<link rel="stylesheet" type="text/css" href="../inputstyle/fonts/font-awesome-4.2.0/css/font-awesome.min.css" /> -->
<!-- 		<link rel="stylesheet" type="text/css" href="../inputstyle/css/demo.css" /> -->
<!-- 		<link rel="stylesheet" type="text/css" href="../inputstyle/css/component.css" /> -->
<!-- jquery -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" language="javascript">
google.load("jquery", "1.3");
// $('div:nth-of-type(4n)').append('<div style="clear:both;"></div>');
</script>

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
#B ul li  {
　display:inline;
}


#div{
background-color:#d4d4d4;
width: 800px;
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
    background-color:#e9e9e9;
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


<title>Product project</title>
</head>
<body>
	<div id="header">
		<ul id="navigation">
			<li><a href="<c:url value="/g03_product/productproject.jsp" />">Product
					Table</a></li>
			<li><a
				href="<c:url value="/g03_product/ProductGenderServlet.controller?gender=F&change=true" />">Women</a>
			</li>
			<li class="selected"><a
				href="<c:url value="/g03_product/ProductGenderServlet.controller?gender=M&change=true" />">Men</a>
			</li>
		</ul>
	</div>



<table>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=T-Shirt'/>">T-Shirt</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=毛衣'/>">毛衣</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=帽T'/>">帽T</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=Polo衫'/>">Polo衫</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=背心'/>">背心</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=長袖上衣'/>">長袖上衣</a></td></tr>
</table>

<div style="margin:0px auto;">

<form action="<c:url value="/g03_product/ProductGenderServlet.controller?gender=M"/>" method="post">
		
		<div id="B">
			<ul>
				<li ><a>產品名稱</a> <input type="text" name="prod_name"	value="${param.prod_name}" style="width: 120px;"></li>
				<li ><a>價錢範圍從</a><input type="text" name="lowprice" value="${param.lowprice}" style="width:50px;"><a>到</a><input type="text"
					name="highprice" value="${param.highprice}" style="width:50px;"></li>
				<li><input type="submit" name="prodaction" value="Select"></li>
			</ul>			
		</div>
		
		<div id="header">
			<ul id="navigation">
				<li><input type="submit" name="selectorder"
					value="OrderByPrice"></li>
				<li><input type="submit" name="selectorder"
					value="OrderByPriceDesc"></li>
				<li><input type="submit" name="selectorder" value="OrderByDate"></li>
				<li><input type="submit" name="selectorder"
					value="OrderByDateDesc"></li>
			</ul>
		</div>

		<div>		
</div>	
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
			<div class="row">
				<div class="col-md-4 portfolio-item">
					<h3 id="h3txt">
						<a>${bean.prod_id}</a><br>
						<a>${bean.prod_name}</a>						
					</h3>
					<a href="#"> <img id="img1" class="img-responsive" width="200px"
						height="200px"
						src='<c:url value="/pages/showImg.controller?prod_id="/>${bean.prod_id}'>
					</a>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>

</div>

------------------------------------------------------------------------------------------


	<h3>Select Product Table Result : ${fn:length(select)} row(s)
		selected</h3>
	<c:if test="${not empty select}">

		<table>
			<thead>
				<tr>
					<th>prod_id</th>
					<th>product name</th>
					<th>size</th>
					<th>color</th>
					<th>count</th>
					<th>price</th>
					<th>brand</th>
					<th>gender</th>
					<th>part</th>
					<th>launch_date</th>
					<th>note</th>
					<th>pic</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${select}">
					<c:url value="/g03_product/selectmen.jsp" var="path">
						<c:param name="prod_id" value="${bean.prod_id}" />
						<c:param name="prod_name" value="${bean.prod_name}" />
						<c:param name="size" value="${bean.size}" />
						<c:param name="color" value="${bean.color}" />
						<c:param name="price" value="${bean.price}" />
						<c:param name="brand" value="${bean.brand}" />
						<c:param name="gender" value="${bean.gender}" />
						<c:param name="part" value="${bean.part}" />
						<c:param name="launch_date" value="${bean.launch_date}" />
						<c:param name="note" value="${bean.note}" />
					</c:url>
					<tr>
						<%-- 		<td><a href="${path}">${bean.id}</a></td> --%>
						<td>${bean.prod_id}</td>
						<td>${bean.prod_name}</td>
						<td>${bean.size}</td>
						<td>${bean.color}</td>
						<td>${bean.count}</td>
						<td>${bean.price}</td>
						<td>${bean.brand}</td>
						<td>${bean.gender}</td>
						<td>${bean.part}</td>
						<td>${bean.launch_date}</td>
						<td>${bean.note}</td>
						<td><img id="img" width='20%'
							src='<c:url value="/pages/showImg.controller?prod_id="/>${bean.prod_id}'></td>

						<%-- 		<td><fmt:formatDate value="${bean.make}" pattern="yyyy-MM-dd EEEE"/></td> --%>
						<%-- 		<td>${bean.expire}</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	

	
	
	
</body>
</html>