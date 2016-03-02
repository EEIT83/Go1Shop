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
	
	<%@ include file="../_files/nav.file" %>

	<div class="container-fluid">		
		<%@ include file="../_files/sideBar.file" %>
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
				<div class="col-md-8">
					<form action="<%=request.getContextPath()%>/ProdimgServlet.do" method="post" class="form-horizontal" enctype="multipart/form-data">
						<div class="form-group">
							<label for="prodId">prodId</label> <input type="text" name="prodId"
								class="form-control" id="prodId" placeholder="prodId" />
						</div>										
						<div class="form-group">
							<label for="img">note</label> <input type="file" name="img"
								class="form-control" id="img" placeholder="img" />
						</div>
						<input type="hidden" name="action" value="addImg" /><br />

						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>