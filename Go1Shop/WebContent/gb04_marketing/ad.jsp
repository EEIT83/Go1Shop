<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>購衣蝦廣告</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/_css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/_css/default.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/_css/demo.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/_dist/slippry.css">
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
<script language="javascript">
		function reSize(){
		　　//parent.document.all.frameid.height=document.body.scrollHeight; 
		　　parent.document.getElementById("mainFrame").height=document.body.scrollHeight;
		} 
		window.onload=reSize;
</script>
</head>
<body>
	<article class="htmleaf-container">
<!-- 		<header class="htmleaf-header"> -->
<!-- 			<h1>~歡迎光臨購衣蝦~ <span>最方便的網路交易平台</span></h1> -->
<!-- 			<div> -->
<!-- 				<a class="htmleaf-icon icon-htmleaf-home-outline" href="index.jsp" target="_blank"></a> -->
<!-- 			</div> -->
			
<!-- 		</header> -->
		<div class="htmleaf-content" style="height: 480px;width: 100%;">
			<ul id="demo1">
				<li><a href="#slide1"><img src="/Go1Shop/gb04_marketing/showImg.do?id=1" alt=""></a></li>
				<li><a href="#slide2"><img src="/Go1Shop/gb04_marketing/showImg.do?id=2"  alt=""></a></li>
				<li><a href="#slide3"><img src="/Go1Shop/gb04_marketing/showImg.do?id=3" alt=""></a></li>
			</ul>
		</div>
<!-- 		<div class="htmleaf-demo center"> -->
<!-- 			<a href="#glob" class='prev'>Prev</a>  -->
<!-- 			<a href="#glob" class='next'>Next</a>  -->
<!-- 			<a href="#glob" class='init'>Init</a> -->
<!-- 			<a href="#glob" class='reset'>Destroy</a> -->
<!-- 			<a href="#glob" class='reload'>Reload</a> -->
<!-- 			<a href="#glob" class='stop'>Stop</a> -->
<!-- 			<a href="#glob" class='start'>Start</a> -->
<!-- 		</div> -->
	</article>
	
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src='<%=request.getContextPath()%>/_js/jquery-2.1.1.min.js'><\/script>')</script>
	<script src="<%=request.getContextPath()%>/_dist/slippry.min.js"></script>
	<script>
		$(function() {
			var demo1 = $("#demo1").slippry({
				// transition: 'fade',
				// useCSS: true,
				// speed: 1000,
				// pause: 3000,
				// auto: true,
				// preload: 'visible',
				// autoHover: false
			});

// 			$('.stop').click(function () {
// 				demo1.stopAuto();
// 			});

// 			$('.start').click(function () {
// 				demo1.startAuto();
// 			});

// 			$('.prev').click(function () {
// 				demo1.goToPrevSlide();
// 				return false;
// 			});
// 			$('.next').click(function () {
// 				demo1.goToNextSlide();
// 				return false;
// 			});
// 			$('.reset').click(function () {
// 				demo1.destroySlider();
// 				return false;
// 			});
// 			$('.reload').click(function () {
// 				demo1.reloadSlider();
// 				return false;
// 			});
// 			$('.init').click(function () {
// 				demo1 = $("#demo1").slippry();
// 				return false;
// 			});
		});
	</script>
</body>
</html>