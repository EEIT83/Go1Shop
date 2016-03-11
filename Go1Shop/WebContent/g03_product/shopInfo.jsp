<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width initial-scale =1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/_css/normalize.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/_css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/_js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>	
	<div class="container-fluid">		
		<div class="row">
			<div class="col-md-offset-2">	
				<c:if test="${not empty StoreVO}">
					<main class="col-md-8">
					<div class="panel panel-default">						
						<div class="panel-heading">
							<h3 class="panel-title">${StoreVO.storeName}</h3>
						</div>
						<div class="panel-body">
							<p>商店地址:${StoreVO.storeAddress}</p>
							<p>商店描述:${StoreVO.note}</p>
						</div>
					</div>
					</main>
				</c:if>
			</div>
		</div>
	</div>

</body>
</html>