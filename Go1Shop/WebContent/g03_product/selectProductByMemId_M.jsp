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
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
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
	    <th>���~�s��</th>
	    <th>�|���s��</th>
	    <th>���~�W��</th>
		<th>SIZE</th>
		<th>�C��</th>
		<th>�ƶq</th>
		<th>����</th>
		<th>�~�P</th>
		<th>�ʧO</th>
		<th>����</th>
		<th>���~�W�[�ɶ�</th>
		<th>���O</th>
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
			<td><a href="<%=request.getContextPath()%>/ProductServlet.do?action=deleteByProdId&prodId=${productVO.prodId}&memId=${productVO.memId}">�R��</a></td>
			<td><a href="<%=request.getContextPath()%>/ProductServlet.do?action=goToUpdatePage&prodId=${productVO.prodId}&memId=${productVO.memId}">�ק�</a></td>                  
		</tr>
	</c:forEach>
</table>
</c:if>
<form action="<c:url value='/ProductServlet.do'/>" method="get" >
	memId:<input type="text" name="memId"/> <br/>
	<input type="hidden" name="action" value="getOneByMemId" /><br/>
	<button type="submit">�e�X</button>
</form>

</body>
</html>