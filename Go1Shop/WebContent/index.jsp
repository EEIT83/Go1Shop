<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="g03_product.*"%>
<%@ page import="g03_product.model.*"%>
<%@ page import="g03_product.controller.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
		ProductService_Y service = new ProductService_Y();
		ProductBean_Y bean = new ProductBean_Y();
		List<ProductBean_Y> result = null;
		String SQLorder = "";
		String SQLprice = "";
		String SQLgender ="";
		String SQLpart = "";
		List<ProductBean_Y> temp =service.productDao.select(bean.getProd_name(), SQLprice, SQLorder, SQLgender, SQLpart);
		result = new ArrayList<ProductBean_Y>();
		result.addAll(temp);
		request.setAttribute("select", result);

%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="<%=request.getContextPath()%>/_css/page.css" rel="stylesheet">
<title>Go1Shop Home</title>
<style>

/* ------------------------------------------------ */
</style>
</head>
<body>
<%request.getSession().removeAttribute("index"); %>
<div style="width: 100%;height: 100%;">
<!-- 上邊	--------------------------------------------------------------------------------- -->
	<div style="margin-bottom:0;">
	<jsp:include page="/tm/top.jsp" />
	</div>
<!-- 	<div style="width:100%;height:50%;margin:5% 5% 5% 5%;border:1px solid red; " > -->
	<div style="width:100%;height:100%;" >
		<iframe src="<%=request.getContextPath()%>/gb04_marketing/ad.jsp" scrolling="no" frameborder="0" height="100%" id="mainFrame" width="100%" onload='IFrameReSize("mainFrame");IFrameReSizeWidth("mainFrame");' style="display:inline;"></iframe>
	</div>
	<script type="text/javascript">

		//iframe高度自适应
		function IFrameReSize(iframename) {
			var pTar = document.getElementByIdx_x_x(iframename);
			if (pTar) { //ff
				if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
					pTar.height = pTar.contentDocument.body.offsetHeight;
				} //ie
				else if (pTar.Document && pTar.Document.body.scrollHeight) {
				pTar.height = pTar.Document.body.scrollHeight;
				}
			}
		}
		//iframe宽度自适应
		function IFrameReSizeWidth(iframename) {
			var pTar = document.getElementByIdx_x_x(iframename);
			if (pTar) { //ff
				if (pTar.contentDocument && pTar.contentDocument.body.offsetWidth) {
					pTar.width = pTar.contentDocument.body.offsetWidth;
				} //ie
				else if (pTar.Document && pTar.Document.body.scrollWidth) {
			pTar.width = pTar.Document.body.scrollWidth;
				}
			}
		}
	</script>
<!-- 左邊	--------------------------------------------------------------------------------- -->
	<div id="left" style="float: left;margin-left:2%;width: 15%;">
		<jsp:include page="/tm/left.jsp" />
	</div>
<!-- 右邊	----------------------------------------------------------------------------------->
	<div id="right"style="float: left;margin-right:2%;margin-left:1%;margin-bottom:0.5%;width: 80%;">
<!-- 	<div style="width:100%;height:100%;" > -->
<%-- 		<iframe src="<%=request.getContextPath()%>/g03_product/selectmen_Y.jsp" scrolling="no" frameborder="0" height="100%" id="selectFrame" width="100%" onload='IFrameReSize("selectFrame");IFrameReSizeWidth("selectFrame");' style="display:inline;"></iframe> --%>
<!-- 	</div> -->
<!-- 		<div style="float: left;margin:5% 0 0 5%;width: 80%; ">			 -->
<!-- 			<div style="width:100%;margin-left:5%"> -->
<%-- 				<form action="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M'/>" method="post"> --%>
<!-- 					<div id="B"> -->
<%-- 						<span>產品名稱：</span> <input type="text" name="prod_name"	value="${param.prod_name}" style="width: 70%;"><br> --%>
<!-- 						<br> -->
<%-- 						<span>價錢範圍從：</span><input type="text" name="lowprice" value="${param.lowprice}" style="width:10%;"> --%>
<!-- 						&nbsp;到&nbsp; -->
<%-- 						<input type="text" name="highprice" value="${param.highprice}" style="width:10%;" > --%>
<!-- 						<span><input type="submit" name="prodaction" value="Select" style="width:10%"class="btn btn-primary"></span> -->
<!-- 						<button type="submit" name="selectorder" value="OrderByPrice" class="btn btn-primary">依金額低至高</button> -->
<!-- 						<button type="submit" name="selectorder" value="OrderByPriceDesc" class="btn btn-primary">依金額高至低</button> -->
<!-- 						<button type="submit" name="selectorder" value="OrderByDate" class="btn btn-primary">依刊登日期舊至新</button> -->
<!-- 						<button type="submit" name="selectorder" value="OrderByDateDesc" class="btn btn-primary">依刊登日期新至舊</button> -->
<!-- 						<br> -->
<!-- 						<br> -->
					
<!-- 					</div> -->
<!-- 				</form> -->
				<div id="div">
					<c:forEach var="bean" items="${select}">
						<div id="div_out">
							<a href="#">
							<img id="img1" class="img-responsive" style="width:300px;height:300px" src='<c:url value="/pages/showImg.controller?prod_id="/>${bean.prod_id}'>
							</a>
							<h3 id="h3txt">						
								<a>${bean.prod_name}</a><br>
								<a>金額:${bean.price}</a>						
							</h3>
						</div>
					</c:forEach>
				</div>
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	
<!-- 下邊	--------------------------------------------------------------------------------- -->	
	<div id="bottom" style="clear:left;width:100%;bottom:0;left:0;position:fixed;">
		<jsp:include page="/tm/bottom.jsp" />	
	</div>
<!-------------------------------------------------------------------------------------- -->
</div>




</body>
</html>
