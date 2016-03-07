<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../_css/main.css" />

<title>Product project</title>
<script type="text/javascript">
function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}
</script>
</head>
<body>

<h3>Welcome ${user.custid}</h3>

<h3>產品列表</h3>

<table>
<tr>
<td>

<h3><a href="<c:url value="/g03_product/productproject_Y.jsp" />">Product Table</a></h3>
<h3><a href="<c:url value="/g03_product/selectmen_Y.jsp" />">Men</a></h3>
<h3><a href="<c:url value="/g03_product/selectwomen_Y.jsp" />">Women</a></h3>
</td>
</tr>
</table>

<form action="<c:url value="/pages/productproject.controller" />" method="post">

<table>
	
	<tr>
		<td>
		product name :<input type="text" name="prod_name" value="${param.prod_name}"><br>		
		</td>		
	</tr>
	<tr>
		<td>
		    價錢範圍從
			<input type="text" name="lowprice" value="${param.lowprice}">
			到<input type="text" name="highprice" value="${param.highprice}">		
		</td>
	</tr>
	
	<tr>		
		<td>			
			<input type="submit" name="prodaction" value="Select">
			<input type="submit" name="prodaction" value="SelectAll">		
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>	
	<tr>
		<td>
			<input type="radio" name="selectorder" value="OrderByPrice"> 價錢低到高<br>
			<input type="radio" name="selectorder" value="OrderByPriceDesc"> 價錢高到低<br>
			<input type="radio" name="selectorder" value="OrderByDate"> 日期舊到新<br>
			<input type="radio" name="selectorder" value="OrderByDateDesc"> 日期新到舊<br>
		</td>				
	</tr>
	<tr>
		<td>
			<a href="<c:url value='/pages/productproject.controller?gender=M'/>">男裝</a>
			<a href="<c:url value='/pages/productproject.controller?gender=F'/>">女裝</a>
			<a href="<c:url value='/pages/productproject.controller?gender=F'/>">女裝</a>
<!-- 
			<a href="#" onclick="clickselect()"/>女裝</a>

		<script>
 		function clickselect(){
  			document.forms[0].action="<c:url value='/pages/productproject.controller?gender=F'/>";
  			document.forms[0].method="GET";
  			document.forms[0].submit();
  		}
 		</script>		
 -->
		</td>				
	</tr>
	
</table>

</form>

<h3><span class="error">${error.action}</span></h3>


<script type="text/javascript">clearForm();</script>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<h3>Select Product Table Result : ${fn:length(select)} row(s) selected</h3>
<c:if test="${not empty select}">
<table>
	<thead>
	<tr>
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
	</tr>
	</thead>
	<tbody>
	<c:forEach var="bean" items="${select}">
		<c:url value="/g03_product/productproject_Y.jsp" var="path">			
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
<%-- 		<td><fmt:formatDate value="${bean.make}" pattern="yyyy-MM-dd EEEE"/></td> --%>
<%-- 		<td>${bean.expire}</td> --%>
	</tr>
	</c:forEach>	
	</tbody>
</table>
</c:if>

</body>
</html>