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
		$('#img').change(function(event) {
			var input = event.target;
			var reader = new FileReader();
			reader.onload = function() {
				var dataURL = reader.result;
				var infoPicResult = document.getElementById('infoPicResult');
				infoPicResult.src = dataURL;
			};
			reader.readAsDataURL(input.files[0]);
		});//end of file change
	})
</script>

<title>Insert title here</title>
</head>
<body>


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
				<div class="col-md-8">
					<form action="<c:url value='/g03_product/ProductServlet.con'/>"
						method="post" class="form-horizontal"
						enctype="multipart/form-data">
						<div class="col-md-6">
							<div class="form-group">
								<label for="img">商品圖片</label> <input type="file" name="img"
									class="form-control" id="img" placeholder="img" />
							</div>
							<img id="infoPicResult" class="img-responsive img-thumbnail" />
						</div>
						<div class="col-md-2"></div>
						<div class="col-md-4">

							<div class="form-group">
								<label for="prodName">商品名稱</label> <input type="text"
									name="prodName" class="form-control" id="商品名稱"
									placeholder="商品名稱" />
							</div>

							<div class="form-group">
								<label for="size">大小</label> <input type="text" name="size"
									class="form-control" id="size" placeholder="大小" />
							</div>

							<div class="form-group">
								<label for="color">顏色</label> <input type="text" name="color"
									class="form-control" id="color" placeholder="顏色" />
							</div>

							<div class="form-group">
								<label for="Count">件數</label> <input type="number"
									name="count" class="form-control" id="Count"
									placeholder="件數" min="0" value="0" />
							</div>

							<div class="form-group">
								<label for="price">價錢</label> <input type="text" name="price"
									class="form-control" id="price" placeholder="價錢" />
							</div>

							<div class="form-group">
								<label for="brand">品牌</label> <input type="text" name="brand"
									class="form-control" id="brand" placeholder="品牌" />
							</div>

							<div class="form-group">
								<label for="gender">性別</label> <input type="text"
									list="genderlist" name="gender" class="form-control"
									id="gender" placeholder="性別" autocomplete="off" pattern="[MF]{1}"/>
							</div>

							<div class="form-group">
								<label for="part">部位</label> <input type="text" name="part"
									class="form-control" id="part" placeholder="部位" />
							</div>

							<div class="form-group">
								<label for="note">註記</label> <input type="text" name="note"
									class="form-control" id="note" placeholder="註記" />
							</div>
							<input type="hidden" name="action" value="insert" /><br /> <input
								type="hidden" name="memId" value="${LoginOK.mem_id}" /><br />
							<button type="submit" class="btn btn-default">Submit</button>

						</div>
					</form>
					<datalist id="genderlist">
						<option label="Male" value="M"></option>
						<option label="Female" value="F"></option>
					</datalist>
				</div>

			</div>
		</div>
	</div>

</body>
</html>