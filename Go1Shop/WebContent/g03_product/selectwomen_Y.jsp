<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../css/main.css" />

<title>women</title>

</head>
<body>



<h3>Women</h3>


<table>
<tr>
<td><h3><a href="<c:url value="/g03_product/productproject_Y.jsp" />">Product Table</a></h3></td>
<td><h3><a href="<c:url value="/g03_product/ProductGenderServlet.controller?gender=M&change=true" />">Men</a></h3></td>
</tr>
</table>

<table>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=F&part=T-Shirt'/>">T-Shirt</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=F&part=毛衣'/>">毛衣</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=F&part=帽T'/>">帽T</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=F&part=Polo衫'/>">Polo衫</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=F&part=背心'/>">背心</a></td></tr>
<tr><td><a href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=F&part=長袖上衣'/>">長袖上衣</a></td></tr>
</table>

<input id="submit" type="submit" value="add" name="submit" onclick="goto()">


<form action="<c:url value="/g03_product/ProductGenderServlet.controller?gender=F"/>" method="post">
		
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
					<c:url value="/g03_product/selectwomen.jsp" var="path">
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