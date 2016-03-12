<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
<title>Geocoding Test</title>
<script type='text/javascript' src='http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.js'></script>
<link href="http://code.jquery.com/ui/1.11.3/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
<script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.js"></script>
<script src="https://maps.google.com/maps/api/js?sensor=false&language=zh-TW"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style>
</style>

</head>
<body>
	<div id="address"></div>

	<div id="lat"></div>
	<div id="lng"></div>
	<div id="canvas" style="width: 500px; height: 400px"></div>
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
						alert(213);
						console.log($(this).children('store_address').text());
						addr = $(this).children('store_address').text();
						loadMap();
					})
				},
				'error':function(data){
					alert(123);
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
									zoom : 14,
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