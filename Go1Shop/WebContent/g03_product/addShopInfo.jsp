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

<title>Add Store Info</title>
</head>
<body>

	<%@ include file="../_files/nav.file"%>

	<div class="container-fluid">
		
		<div class="row">
			<div class="col-md-offset-2">
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
				<main class="col-md-8">
					<form action="<c:url value='/StoreServlet.do'/>" method="post"
						class="form-horizontal" enctype="multipart/form-data">
						<div class="form-group">
							<label for="storeName">商店名稱</label> <input type="text"
								name="storeName" class="form-control" id="storeName"
								placeholder="商店名稱" />
						</div>
						<div class="form-group">
							<label for="storeAddress">商店地址</label> <input type="text"
								name="storeAddress" class="form-control" id="storeAddress"
								placeholder="商店地址" />
						</div>
						<div class="form-group">
							<label for="note">商店描述</label> 
							<textarea class="form-control" rows="3" name="note" placeholder="商店描述"></textarea>
						</div>
						<input type="hidden" name="action" value="${(empty StoreVO) ? "insert":"update"}" /><br />
						<input type="hidden" name="memId" value="${LoginOK.mem_id}" /><br />
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</main>
			</div>
		</div>
	</div>

</body>
</html>