<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="<%=request.getContextPath()%>/_css/page.css" rel="stylesheet">
<title>Insert title here</title>
<style>

/* ------------------------------------------------ */
</style>




</head>
<body>
<div style="width: 100%;height: 100%;">
<!-- 上邊	--------------------------------------------------------------------------------- -->
	<div style="margin-bottom:0.5%;">
	<jsp:include page="/tm/top.jsp" />
	</div>
	<div style="width:100%;height:90%;merge:0 5% 0 5%;border:1px solid red; " >
		<iframe src="<%=request.getContextPath()%>/gb04_marketing/ad.jsp" scrolling="no" frameborder="0" height="100%" id="mainFrame" width="100%" onload='IFrameReSize("mainFrame");IFrameReSizeWidth("mainFrame");'></iframe>
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
	<div id="left" style="float: left;margin-left:2%;width: 11%;">
	<jsp:include page="/tm/left.jsp" />
	</div>
<!-- 右邊	----------------------------------------------------------------------------------->
	<div id="right"style="float: left;margin-right:2%;margin-left:1%;margin-bottom:0.5%;width: 82%;">
	
	
	
	</div>
<!-- 下邊	--------------------------------------------------------------------------------- -->	
	<div id="bottom" style="clear:left;width:100%;position:relative;bottom:0;left:0;">
	<jsp:include page="/tm/bottom.jsp" />	
	</div>
<!-------------------------------------------------------------------------------------- -->
</div>
</body>
</html>
