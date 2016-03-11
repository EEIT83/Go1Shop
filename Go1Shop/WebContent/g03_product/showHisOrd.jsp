<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
function reSize(){
	parent.document.getElementById("historyFrame").height=document.body.scrollHeight;
} 
window.onload=reSize;
</script>
<head>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<table class="table table-condensed">
	<tr>
		<th>訂單編號</th>
		<th>訂單日期</th>
		<th>金額</th>
		<th>訂單狀態</th>
		<th>付款方式</th>
	</tr>
	<c:forEach  var="i" begin="0" end="${fn:length(order)-1 }">
	<tr>
		
		<c:url var="path" value="/g03_product/showHisOrdDte.jsp">
			<c:param name="addressee">${order[i].addressee}</c:param>
			<c:param name="sender">${order[i].sender}</c:param>
			<c:param name="total">${order[i].total}</c:param>
			<c:param name=""></c:param>
			<c:param name=""></c:param>
		</c:url>
		
		<td><a href="<c:url value='/OrdDetail.do?memId=${LoginOK.mem_id}&ordId=${order[i].ord_id}&addressee=${order[i].addressee}&sender=${order[i].sender}&total=${order[i].total}' />"><fmt:formatDate value="${order[i].ord_date}" pattern="yyyyMMdd"/>0000${order[i].ord_id}</a></td>
		<td><fmt:formatDate value="${order[i].ord_date}" pattern="yyyyMMdd"/></td>
		<td>${order[i].total}</td>
		<td>${order[i].payment}</td>
		<td>${order[i].payment_status}</td>
	</c:forEach>
		
	</tr>

</table>



</body>
</html>