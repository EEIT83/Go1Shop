<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="<%=request.getContextPath()%>/_css/page.css" rel="stylesheet">
<title>Insert title here</title>
<style>
#div_out {    
  
    display:inline-block;
 	float:left;
    margin-left: 3%;
    margin-top: 10px; 
 } 
#div_out:nth-child(4n+1){
 clear: both;
 }
 
 
</style>


</head>
<body>
<div style="width: 100%;height: 100%;">
<!-- 上邊	--------------------------------------------------------------------------------- -->
	<div style="margin-bottom:0;">
	<jsp:include page="/tm/top.jsp" />
	</div>
<!-- 	<div style="width:100%;height:50%;margin:5% 5% 5% 5%;border:1px solid red; " > -->
	
<!-- 左邊	--------------------------------------------------------------------------------- -->

	<div id="left" style="float: left;margin-left:2%;width: 15%;">
		<jsp:include page="/tm/left.jsp" />
	</div>
<!-- 右邊	----------------------------------------------------------------------------------->

	<div id="right"style="float: left;margin-right:2%;margin-left:1%;margin-bottom:0.5%;width: 80%;">
<!-- 	<div style="width:100%;height:100%;" > -->
<%-- 		<iframe src="<%=request.getContextPath()%>/g03_product/selectmen_Y.jsp" scrolling="no" frameborder="0" height="100%" id="selectFrame" width="100%" onload='IFrameReSize("selectFrame");IFrameReSizeWidth("selectFrame");' style="display:inline;"></iframe> --%>
<!-- 	</div> -->
			<div style="width:95%;margin-left:3%">
				<form style="" action="<c:url value="/g03_product/ProductGenderServlet.controller?gender=M"/>" method="post">				
					<div id="B">
						<span>產品名稱：</span> <input type="text" name="prod_name"	value="${param.prod_name}" style="width: 70%;"><br>
						<br>
						<span>價錢範圍從：</span><input type="text" name="lowprice" value="${param.lowprice}" style="width:10%;">
						&nbsp;到&nbsp;
						<input type="text" name="highprice" value="${param.highprice}" style="width:10%;" >
						<span><input type="submit" name="prodaction" value="Select" style="" class="btn btn-primary"></span>
						<button type="submit" name="selectorder" value="OrderByPrice" class="btn btn-primary">金額低至高</button>
						<button type="submit" name="selectorder" value="OrderByPriceDesc" class="btn btn-primary">金額高至低</button>
						<button type="submit" name="selectorder" value="OrderByDate" class="btn btn-primary">日期舊至新</button>
						<button type="submit" name="selectorder" value="OrderByDateDesc" class="btn btn-primary">日期新至舊</button>
						<br>
						<br>
					</div>
				</form>
				<div id="div">
					<c:forEach var="bean" items="${select}">
						<div id="div_out" >
							<c:url value="/g05_customer/shoppingCar/show.jsp" var="path">
								<c:param name="id" value="${bean.prod_id}" />
								<c:param name="memid" value="${bean.mem_id}" />
								<c:param name="launchdate" value="${bean.launch_date}" />
							</c:url>
							<a href="${path}">
							<img id="img1" class="img-responsive" style="width:300px;height:300px" 
							src='<c:url value="/pages/showImg.controller?prod_id="/>${bean.prod_id}'>
							
							</a>
							<h3 id="h3txt" align="center">					
<%-- 							<a>${bean.prod_id}</a><br>	 --%>
								<a>${bean.prod_name}</a><br>
								<a>NT:${bean.price}</a>						
							</h3>
							
						</div>
					</c:forEach>
				</div>

			</div>
	</div>
<!-- 下邊	--------------------------------------------------------------------------------- -->	
	<div id="bottom" style="clear:left;width:100%;position:fixed;bottom:0;left:0;">
		<jsp:include page="/tm/bottom.jsp" />	
	</div>
<!-------------------------------------------------------------------------------------- -->
</div>

<%-- <c:if test="${init == '0'}"> --%>
<%-- <jsp:forward page="/g03_product/ProductGenderServlet.controller?init=1" /> --%>
<%-- <c:set var="init" value="0" scope="session"></c:set> --%>
<%-- </c:if> --%>


</body>

</html>