<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="../js/jquery-1.12.0.min.js"></script>
<script src="../js/jQuery-TWzipcode-master/jQuery-TWzipcode-master/jquery.twzipcode.min.js"></script>

<style>
.zipcode {
	background-color: #c00;
	color: #fff;
}

.county {
	background-color: #4169E1;
	color: #fff;
}

.district {
	background-color: #008000;
	color: #fff;
}
</style>
<title>Check Detail</title>
</head>
<body>

	<table>
		<tr>

			<th>product</th>
			<th>price</th>
			<th>count</th>
			<th>subtotal</th>
		</tr>
		<c:forEach var="cars" items="${shopcar.car}">

			<tr>
				<td>${cars.value.prod_Name}</td>
				<td>${cars.value.price}</td>
				<td>${cars.value.count}</td>
				<td>${cars.value.subtotal}</td>
			</tr>
		</c:forEach>
	</table>
	<form name="my_form" method=POST>

		收件人:<input type="text" name="orderBean.addressee">${errors.addressee}<br>
		地址:
		<div id="twzipcode"></div>
		<input type="text"  id="address">${errors.address}<br>
		電話:<input type="text" name="orderBean.phone">${errors.phone}<br>
		寄件人:<input type="text" name="orderBean.sender">${errors.sender}<br>
		地址:<input type="text" name="orderBean.sender_address">${errors.sender_address}<br>
		電話:<input type="text" name="orderBean.sender_phone">${errors.sender_phone}<br>

		付款方式: <input type="radio" name="radio" value="1">1.貨到付款 <input
			type="radio" name="radio" value="2">2.信用卡付款 <input
			type="radio" name="radio" value="3">3.ATM轉帳 <br>
		${errors.payment} <br> <INPUT TYPE="button" id="button" VALUE="確認"	>
	</form>


	<SCRIPT>
		$('#twzipcode').twzipcode({
			// 依序套用至縣市、鄉鎮市區及郵遞區號框
			'css' : [ 'county', 'district', 'zipcode' ]
		});
		window.onload = function() {
			document.getElementById("twzipcode").onclick = choice;
			document.getElementById("button").onclick = click;
			
		}

		var county;
		var district;
		var zipcode;
		var address="";
		function choice() {
			$('#twzipcode').twzipcode('get', function(el) {
				//console.log($(el.county).val()); // 輸出 County 選定的值。
				//console.log($(el.district).val());
				//console.log($(el.zipcode).val());
				county = $(el.county).val();
				district = $(el.district).val();
				zipcode = $(el.zipcode).val();
				var add = document.getElementById("address").value;
				address=county+district+add;
				//console.log(address);
			});
		}

		function click() {
			var tag;
			var str = "";
			
			for (var i = 0; i < my_form.radio.length; i++) {
				var x = document.forms[0].radio[i].checked;
				if (x) {
					tag = i;
				}
			}
			if (tag == 1)
				str += "貨到付款\n";
			if (tag == 2)
				str += "信用卡付款\n";
			if (tag == 3)
				str += "ATM轉帳\n";
			document.forms[0].action = "<c:url value='/checkDetail.action?payment=" + str +"&address=" + address +"'/>";
			//document.forms[0].action="<c:url value='/checkDetail.action'/>";
			document.forms[0].method = "POST";
			document.forms[0].submit();
		}
	</SCRIPT>

</body>
</html>