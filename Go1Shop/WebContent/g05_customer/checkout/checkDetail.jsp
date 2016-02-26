<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/jQuery-TWzipcode-master/jQuery-TWzipcode-master/jquery.twzipcode.js"></script>




<style>
#all{
	margin:auto;
	width: 500px;
}

/* --------------------------------- */


.col-fixed{

	  margin:0px auto;
	
}

.form-control{
	width: 400px;
	margin:auto;
	
}


#bt{
	padding-left: 35%;
}

.btn{
	width: 70px;
}


/* --------------------------------- */

.tw{
	margin:auto;
}

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
<div id="all">
	<div id="tb">
		<table class="table table-striped">
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
	</div>
	<div class="form">
		<div class="col-fixed">
			<form name="my_form" method=POST class="form-group"  >
				<fieldset>
				<legend></legend>
				<div class="form-group">
					<label class="control-label" for="addressee">收件人:</label>
					<input type="text" name="orderBean.addressee" id=addressee class="form-control">${errors.addressee}<br>
				</div>
				<div class="form-group">
					<label class="control-label">手機:</label>
					<input type="text" name="orderBean.phone" id="phone" class="form-control">${errors.phone}<br>
				</div>
				<div class="form-group">
					<label class="control-label">收件人地址:</label>
					<table class="tw">
						<tr>
							<td>
								<div id="twzipcode"></div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text"  id="address" class="form-control">${errors.address}<br>
							</td>
						</tr>
					</table>
				</div>
				</fieldset>
				<fieldset>
				<legend></legend>
				<div class="form-group">
					<label class="control-label">寄件人:</label>
					<input type="text" name="orderBean.sender" id="sender" class="form-control">${errors.sender}<br>
				</div>
				<div class="form-group">
					<label class="control-label">手機:</label>
					<input type="text" name="orderBean.sender_phone" id="sender_phone" class="form-control">${errors.sender_phone}<br>
				</div>
				<div class="form-group">
					<label class="control-label">寄件人地址:</label>
					<table class="tw">
						<tr>
							<td>													
								<div id="twzipcode1"></div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text"  id="sender_address" class="form-control">${errors.sender_address}<br>
							</td>
						</tr>
					</table>				
				</div>
				</fieldset>
				<fieldset>
				<legend></legend>
					<label class="control-label">付款方式:</label>
				<div class="radio">
					<label class="radio-inline">
					<input type="radio" name="radio" value="1">1.貨到付款
					</label>
					<label class="radio-inline">
					<input type="radio" name="radio" value="2">2.信用卡付款 
					</label>
					<label class="radio-inline">
					<input type="radio" name="radio" value="3">3.ATM轉帳
					</label>
					${errors.payment} 
				</div>
				</fieldset>
					<div id = "bt">
						<button id="previous" class="btn btn-primary" >上一頁</button>
						<button id="button"  class="btn btn-primary" >送出</button>
					</div>
			</form>
		</div>
	</div>
</div>
	<SCRIPT>
		$('#twzipcode').twzipcode({
			// 依序套用至縣市、鄉鎮市區及郵遞區號框
			'css' : [ 'county', 'district', 'zipcode' ]
		});
		$('#twzipcode1').twzipcode({
			// 依序套用至縣市、鄉鎮市區及郵遞區號框
			'css' : [ 'county', 'district', 'zipcode' ]
		});
		window.onload = function() {
			document.getElementById("twzipcode").onchange = choice;
			document.getElementById("address").onblur = choice;
			document.getElementById("twzipcode1").onchange = choice_sen;
			document.getElementById("sender_address").onblur = choice_sen;
			
			document.getElementById("addressee").onblur = checkAddressee;
			document.getElementById("address").onblur = checkAddress;
			document.getElementById("phone").onblur = checkPhone;
			
			document.getElementById("sender").onblur = checkSender;
			document.getElementById("sender_address").onblur = checkAddressSen;
			document.getElementById("sender_phone").onblur = checkPhoneSen;
			
			document.getElementById("button").onclick = click;
			document.getElementById("previous").onclick = previous;
			
			
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
				checkAddress();
			});
		}
		var county_sen;
		var district_sen;
		var zipcode_sen;
		var address_sen="";
		function choice_sen() {
			$('#twzipcode1').twzipcode('get', function(el) {
				//console.log($(el.county).val()); // 輸出 County 選定的值。
				//console.log($(el.district).val());
				//console.log($(el.zipcode).val());
				county_sen = $(el.county).val();
				district_sen = $(el.district).val();
				zipcode_sen = $(el.zipcode).val();
				var add = document.getElementById("sender_address").value;
				address_sen=county_sen+district_sen+add;
				//console.log(address);
				checkAddressSen();
			});
		}
		function previous(){
			window.location.href='<c:url value="/g05_customer/shoppingCar/show.jsp" />';
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
			//alert(tag);
			if (tag == 0)
				str += "貨到付款\n";
			if (tag == 1)
				str += "信用卡付款\n";
			if (tag == 2)
				str += "ATM轉帳\n";
			document.forms[0].action="<c:url value='/checkDetail.action?payment=" + str + "&address=" + address + "&zip_code=" + zipcode + "&sender_address=" + address_sen + "&zip_code_sen=" + zipcode_sen + "'/>";	
			document.forms[0].method = "POST";
			document.forms[0].submit();
		}
		
		function checkAddressee(){
			var theAddressee=document.getElementById("addressee").value;
			var re=/^[\u4E00-\u9FFF]{2,}$/;
			if(re.test(theAddressee)){
				//alert("成功");
				var x = document.getElementById("addressee");
				x.parentNode.removeChild(x.nextSibling);				
				$('#addressee').after("<span class='glyphicon glyphicon-ok form-control-feedback'></span>");
				document.getElementById("addressee").parentNode.className="form-group has-success has-feedback";
			}
			else {
				//alert("失敗");
				var x = document.getElementById("addressee");
				x.parentNode.removeChild(x.nextSibling);	
				$('#addressee').after("<span class='glyphicon glyphicon-remove form-control-feedback' class='sr-only'></span>");
				document.getElementById("addressee").parentNode.className="form-group has-error has-feedback";
				document.getElementById("addressee").parentNode.style.height ="79px";
			}
			
		}
		
		
		function checkPhone(){
			var theAddress=document.getElementById("phone").value;
			var re=/^\d{10}$/;
			if(re.test(theAddress)){
				var x = document.getElementById("phone");
				x.parentNode.removeChild(x.nextSibling);				
				$('#phone').after("<span class='glyphicon glyphicon-ok form-control-feedback'></span>");
				document.getElementById("phone").parentNode.className="form-group has-success has-feedback";
			}
			else{
				var x = document.getElementById("phone");
				x.parentNode.removeChild(x.nextSibling);	
				$('#phone').after("<span class='glyphicon glyphicon-remove form-control-feedback'></span>");
				document.getElementById("phone").parentNode.className="form-group has-error has-feedback";
				console.log(document.getElementById("phone").parentNode);
				document.getElementById("phone").parentNode.style.height ="79px";
			}
		}
		
		function checkAddress(){
			var theAddress=document.getElementById("address").value;
			var re=/^[\u4E00-\u9FFF]{2,}$/;
			console.log("district=" + district +"  county="+county +"  zipcode="+zipcode);
			if(re.test(theAddress) & district != null & county != null & zipcode != null){
				//alert("成功");
				var x = document.getElementById("address");
				x.parentNode.removeChild(x.nextSibling);				
				$('#address').after("<span class='glyphicon glyphicon-ok form-control-feedback' style='margin-top:50px'></span>");
				document.getElementById("address").parentNode.parentNode.parentNode.parentNode.parentNode.className="form-group has-success has-feedback";
			}
			else {
				var x = document.getElementById("address");
				x.parentNode.removeChild(x.nextSibling);	
				$('#address').after("<span class='glyphicon glyphicon-remove form-control-feedback' style='margin-top:50px'></span>");
				document.getElementById("address").parentNode.parentNode.parentNode.parentNode.parentNode.className="form-group has-error has-feedback";
				document.getElementById("address").parentNode.parentNode.parentNode.parentNode.parentNode.style.height ="105px";
			}
				
		}
		
		
		function checkSender(){
			var theAddressee=document.getElementById("sender").value;
			var re=/^[\u4E00-\u9FFF]{2,}$/;
			if(re.test(theAddressee)){
				//alert("成功");
				var x = document.getElementById("sender");
				x.parentNode.removeChild(x.nextSibling);				
				$('#sender').after("<span class='glyphicon glyphicon-ok form-control-feedback'></span>");
				document.getElementById("sender").parentNode.className="form-group has-success has-feedback";
			}
			else {
				//alert("失敗");
				var x = document.getElementById("sender");
				x.parentNode.removeChild(x.nextSibling);	
				$('#sender').after("<span class='glyphicon glyphicon-remove form-control-feedback' class='sr-only'></span>");
				document.getElementById("sender").parentNode.className="form-group has-error has-feedback";
				document.getElementById("sender").parentNode.style.height ="79px";
			}
			
		}
		
		
		function checkPhoneSen(){
			var theAddress=document.getElementById("sender_phone").value;
			var re=/^\d{10}$/;
			if(re.test(theAddress)){
				var x = document.getElementById("sender_phone");
				x.parentNode.removeChild(x.nextSibling);				
				$('#sender_phone').after("<span class='glyphicon glyphicon-ok form-control-feedback'></span>");
				document.getElementById("sender_phone").parentNode.className="form-group has-success has-feedback";
			}
			else{
				var x = document.getElementById("sender_phone");
				x.parentNode.removeChild(x.nextSibling);	
				$('#sender_phone').after("<span class='glyphicon glyphicon-remove form-control-feedback'></span>");
				document.getElementById("sender_phone").parentNode.className="form-group has-error has-feedback";
				//console.log(document.getElementById("sender_phonee").parentNode);
				document.getElementById("sender_phone").parentNode.style.height ="79px";
			}
		}
		
		function checkAddressSen(){
			var theAddress=document.getElementById("sender_address").value;
			var re=/^[\u4E00-\u9FFF]{2,}$/;
			console.log("district=" + district_sen + "  county=" + county_sen +"  zipcode=" + zipcode_sen);
			if(re.test(theAddress) & district_sen != null & county_sen != null & zipcode_sen != null){
				//alert("成功");
				var x = document.getElementById("sender_address");
				x.parentNode.removeChild(x.nextSibling);				
				$('#sender_address').after("<span class='glyphicon glyphicon-ok form-control-feedback' style='margin-top:50px'></span>");
				document.getElementById("sender_address").parentNode.parentNode.parentNode.parentNode.parentNode.className="form-group has-success has-feedback";
			}
			else {
				var x = document.getElementById("sender_address");
				x.parentNode.removeChild(x.nextSibling);	
				$('#sender_address').after("<span class='glyphicon glyphicon-remove form-control-feedback' style='margin-top:50px'></span>");
				document.getElementById("sender_address").parentNode.parentNode.parentNode.parentNode.parentNode.className="form-group has-error has-feedback";
				document.getElementById("sender_address").parentNode.parentNode.parentNode.parentNode.parentNode.style.height ="105px";
			}
			
		}
		
		
		
		
	</SCRIPT>

</body>
</html>