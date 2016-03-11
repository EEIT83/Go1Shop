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


<script type="text/javascript">
$(document).ready(function() {
	var url = '<%= request.getContextPath() %>/PicForProdimg.do?prodId=${productVO.prodId}';
	$('#infoPicResult').attr("src",url);
	$('#img').change(function(event){
    	var input = event.target;
    	var reader = new FileReader();
    	reader.onload = function(){
    		var dataURL = reader.result;
    		var infoPicResult =document.getElementById('infoPicResult');
    		infoPicResult.src = dataURL;
    	};
    	reader.readAsDataURL(input.files[0]);
    });//end of file change
})
</script>


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
					<form action="<%=request.getContextPath()%>/ProductServlet.do" method="post" class="form-horizontal" enctype="multipart/form-data">
						<div class="col-md-6">
						<div class="form-group">
								<label for="img">note</label> <input type="file" name="img"
									class="form-control" id="img" placeholder="img" />
							</div>
							<img id="infoPicResult"  class="img-responsive img-thumbnail" />
						</div>
						<div class="col-md-2">								
						</div>
						<div class="col-md-4">
						
						<div class="form-group">
							<label for="prodName">prodName</label> <input type="text" name="prodName"
								class="form-control" id="prodName" placeholder="prodName" value="${productVO.prodName}" />
						</div>

						<div class="form-group">
							<label for="size">size</label> <input type="text" name="size"
								class="form-control" id="size" placeholder="size" value="${productVO.size}" />
						</div>

						<div class="form-group">
							<label for="color">color</label> <input type="text" name="color"
								class="form-control" id="color" placeholder="color" value="${productVO.color}" />
						</div>

						<div class="form-group">
							<label for="Count">Count</label> <input type="text" name="count"
								class="form-control" id="Count" placeholder="Count" value="${productVO.count}" />
						</div>

						<div class="form-group">
							<label for="price">price</label> <input type="text" name="price"
								class="form-control" id="price" placeholder="price" value="${productVO.price}" />
						</div>

						<div class="form-group">
							<label for="brand">brand</label> <input type="text" name="brand"
								class="form-control" id="brand" placeholder="brand" value="${productVO.brand}" />
						</div>

						<div class="form-group">
							<label for="gender">gender</label> <input type="text" name="gender"
								class="form-control" id="gender" placeholder="gender" value="${productVO.gender}" />
						</div>

						<div class="form-group">
							<label for="part">part</label> <input type="text" name="part"
								class="form-control" id="part" placeholder="part" value="${productVO.part}" />
						</div>

						<div class="form-group">
							<label for="note">note</label> <input type="text" name="note"
								class="form-control" id="note" placeholder="note" value="${productVO.note}" />
						</div>
						<input type="hidden" name="memId" value="${productVO.memId}" />
						<input type="hidden" name="prodId" value="${productVO.prodId}" />
						<input type="hidden" name="action" value="updateProdByProdId" /><br />

						<button type="submit" class="btn btn-default">Submit</button>
						
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>