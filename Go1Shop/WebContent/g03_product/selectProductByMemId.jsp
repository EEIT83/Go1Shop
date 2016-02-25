<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<c:if test="${not empty productVOList}">
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>	
	    <th>產品編號</th>
	    <th>會員編號</th>
	    <th>產品名稱</th>
		<th>SIZE</th>
		<th>顏色</th>
		<th>數量</th>
		<th>價錢</th>
		<th>品牌</th>
		<th>性別</th>
		<th>部位</th>
		<th>產品上架時間</th>
		<th>註記</th>
		<th></th>
	</tr>
	<c:forEach var="productVO" items="${productVOList}">
		<tr align='center' valign='middle'>
			<td>${productVO.prodId}</td>
			<td>${productVO.memId}</td>
			<td>${productVO.prodName}</td>
			<td>${productVO.size}</td>
			<td>${productVO.color}</td>
			<td>${productVO.count}</td>
			<td>${productVO.price}</td>
			<td>${productVO.brand}</td>
			<td>${productVO.gender}</td>
			<td>${productVO.part}</td>
			<td>${productVO.launchDate}</td>
			<td>${productVO.note}</td>
			<td><a href="<%=request.getContextPath()%>/ProductServlet?action=deleteByProdId&prodId=${productVO.prodId}&memId=${productVO.memId}">刪除</a></td>
			<td><a href="<%=request.getContextPath()%>/ProductServlet?action=goToUpdatePage&prodId=${productVO.prodId}&memId=${productVO.memId}">修改</a></td>                  
		</tr>
	</c:forEach>
</table>
</c:if>
<form action="ProductServlet" method="get" >
	memId:<input type="text" name="memId"/> <br/>
	<input type="hidden" name="action" value="getOneByMemId" /><br/>
	<button type="submit">送出</button>
</form>

</body>
</html>