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
    $('#myModal').on('shown.bs.modal', function() {
        $('#myInput').focus();
    })

    $('.btImg').click(function() {
        var prodId = $(this).attr('id').split('-')[1];
        var url = '<%=request.getContextPath()%>/PicForProdimg.do?prodId=' + prodId;
        $('#imgContainer').attr('src', url);
    });

});
</script>
<title>商品專區</title>
</head>
<body>
	<div class="modal fade" tabindex="-1" role="dialog" id="imgModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<img id="imgContainer" style="width: 100%;" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->


	<%@ include file="../_files/nav.file"%>

	<div class="container-fluid">
		<%@ include file="../_files/sideBar.file"%>
		<div class="row">
			<div class="col-md-offset-2">
				<div class="col-md-8">
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
						<table class="table table-hover">
							<thead>
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
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="productVO" items="${productVOList}">
									<tr>
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
										<td><a class="btn btn-default"
											href="<%=request.getContextPath()%>/ProductServlet.do?action=deleteByProdId&prodId=${productVO.prodId}&memId=${productVO.memId}">刪除</a></td>
										<td><a class="btn btn-default"
											href="<%=request.getContextPath()%>/ProductServlet.do?action=goToUpdatePage&prodId=${productVO.prodId}&memId=${productVO.memId}">修改</a></td>
										<td><a href="#" data-toggle="modal"
											data-target="#imgModal" id="img-${productVO.prodId}"
											class="btn btn-default btImg">觀看圖片</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>

</body>
</html>