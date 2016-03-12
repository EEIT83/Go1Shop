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



<script type='text/javascript' src='http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.js'></script>
<link href="http://code.jquery.com/ui/1.11.3/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
<script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.js"></script>
<script src="https://maps.google.com/maps/api/js?sensor=false&language=zh-TW"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<title>Insert title here</title>
</head>
<body>	
	<div class="container-fluid">		
		<div class="row">
			<div class="col-md-offset-2">	
				<c:if test="${not empty StoreVO}">
					<main class="col-md-10" >
					<div class="panel panel-default" style="margin: 0 auto;">						
						<div class="panel-heading">
							<h3 class="panel-title">${StoreVO.storeName}</h3>
						</div>
						<div class="panel-body">
							<p>商店地址:${StoreVO.storeAddress}</p>
							<p>商店描述:${StoreVO.note}</p>
						</div>
					</div>
					<div id="address" style=""></div>
					<div id="lat"></div>
					<div id="lng"></div>
					<div id="canvas" style="width: 800px; height: 525px"></div>
					</main>
				</c:if>
			</div>
		</div>
	</div>
	
	<script>
		var addr;
		$(function() {
			$.ajax({
				'type' : 'get',
				'url' : '/Go1Shop/XMLServlet.do',
				'dataType' : 'xml',
				'data' : {},
				'success' : function(data) {
					$(data).find('Store_address').each(function() {
						//alert(213);
						console.log($(this).children('store_address').text());
						addr = $(this).children('store_address').text();
						loadMap();
					})
				},
				'error':function(data){
				}
			});
		});

		function loadMap() {
		var geocoder = new google.maps.Geocoder();
		//var addr = $("#address").text();
			geocoder.geocode({
				'address' : addr
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					
// 					$('#lat').text(results[0].geometry.location.lat());
// 					$('#lng').text(results[0].geometry.location.lng());
					$(document).ready(
							function() {
								var canvas = $("#canvas")[0];
								var latlng = new google.maps.LatLng(
										results[0].geometry.location.lat(),
										results[0].geometry.location.lng());
								var opt = {
									zoom : 18,
									center : latlng,
									mapTypeId : "roadmap"
								};
								var map = new google.maps.Map(canvas, opt);
								var marker = new google.maps.Marker({
									position : latlng,
									map : map
								});
							});

				}
			});
		}
	</script>

</body>
</html>