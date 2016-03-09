<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Go1Shop Home</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/_css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/_js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
	$(function() {
  			$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
	});
</script>


</head>
<body>
			<ul id="leftNavigation">
				<c:if test="${!empty LoginOK}">				
				<li class="active1"><a href="" id="modify" style="text-decoration: none" target="_blank">
				<i class="glyphicon glyphicon-user leftNavIcon"></i>基本資料</a>
				
				<li class="active1"><a href="#" style="text-decoration: none" target="_blank">
				<i class="glyphicon glyphicon-comment leftNavIcon"></i>簡訊</a>
				<ul>
					<li><a href='#' id="mail">收信</a></li>
					<li><a href='#' id="sendmail">寫信</a></li>
				</ul>
			</li>
			</c:if>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i class="glyphicon glyphicon-triangle-right leftNavIcon"></i>上衣專區</a>
				<ul>
					<li><a href="#" style="width: 100%">短袖</a></li>
					<li><a href="#">長袖</a></li>
					<li><a href="#">背心</a></li>
					<li><a id="d" href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=襯衫'/>">襯衫</a></li>
					<li><a href="#">毛衣</a></li>
					<li><a href="#">外套</a></li>
				</ul>
			</li>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i 	class="glyphicon glyphicon-triangle-right leftNavIcon"></i>褲子專區</a>
				<ul>
					<li><a href="#">短褲</a></li>
					<li><a href="#">長褲</a></li>
					<li><a href="#">牛仔褲</a></li>
					<li><a href="#">休閒褲</a></li>
					<li><a href="#">工作褲</a></li>
					<li><a href="#">飛鼠褲</a></li>
					<li><a href="#">海灘褲</a></li>
					<li><a href="#">運動褲</a></li>
				</ul>
			</li>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i 	class="glyphicon glyphicon-triangle-right leftNavIcon"></i>配件專區</a>
				<ul>
					<li><a href="#">圍巾</a></li>
					<li><a href="#">帽子</a></li>
					<li><a href="#">眼鏡</a></li>
					<li><a href="#">項鍊</a></li>
					<li><a href="#">髮圈</a></li>
					<li><a href="#">皮帶</a></li>
				</ul>
			</li>
		</ul>

<script type="text/javascript">
	var modify = document.getElementById("modify");
	modify.addEventListener("click", function() {
		document.getElementById("mainFrame").style.display="none";
		document.getElementById("right").innerHTML="<iframe src='<c:url value='/Account/Modify.controller'/>' scrolling='no' frameborder='0' height='100%' id='modifyFrame' width='100%' onload='IFrameReSize('modifyFrame');IFrameReSizeWidth('modifyFrame');'></iframe>";
	})
	var mail = document.getElementById("mail");
	mail.addEventListener("click", function() {
		document.getElementById("mainFrame").style.display="none";
		document.getElementById("right").innerHTML="<iframe  src='<c:url value='/mail.do'/>' frameborder='0' height='100%' id='mailFrame' width='100%' onload='IFrameReSize('mailFrame');IFrameReSizeWidth('mailFrame');'></iframe>";
	})
	var sendmail = document.getElementById("sendmail");
	sendmail.addEventListener("click", function() {
		document.getElementById("mainFrame").style.display="none";
		document.getElementById("right").innerHTML="<iframe style='width: 100%;' src='/Go1Shop/gb05_mail/send.jsp' scrolling='no' frameborder='0' height='100%' id='sendmailFrame' width='100%' onload='IFrameReSize('sendmailFrame');IFrameReSizeWidth('sendmailFrame');'></iframe>";
	})
	var d = document.getElementById("d");
	d.addEventListener("click", function() {
		document.getElementById("mainFrame").style.display="none";
// 		document.getElementById("right").innerHTML="<iframe style='width: 100%;' src='<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=襯衫'/>' scrolling='no' frameborder='0' height='100%' id='dFrame' width='100%' onload='IFrameReSize('dFrame');IFrameReSizeWidth('dFrame');'></iframe>";
	})

	
</script>



</body>
</html>
