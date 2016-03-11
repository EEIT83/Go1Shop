<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>訂單編號</th>
		<th>訂單日期</th>
		<th>訂單金額</th>
	</tr>
	<c:forEach items="${order}" var="bean">
	<tr>
		
<%-- 		<c:url var="path" value="/g03_product/showHisOrdDte.jsp"> --%>
<%-- 			<c:param name="ord_id">${bean.ord_id}</c:param> --%>
<%-- 			<c:param name="ord_date">${bean.ord_date}</c:param> --%>
<%-- 			<c:param name="total">${bean.total}</c:param> --%>
<%-- 			<c:param name=""></c:param> --%>
<%-- 			<c:param name=""></c:param> --%>
<%-- 		</c:url> --%>
		
		<td><a href="<c:url value='/OrdDetail.do?memId=${LoginOK.mem_id}&ordId=${bean.ord_id}' />">${bean.ord_id}</a></td>
		<td>${bean.ord_date}</td>
		<td>${bean.total}</td>
		
	</tr>
	</c:forEach>

</table>



</body>
</html>