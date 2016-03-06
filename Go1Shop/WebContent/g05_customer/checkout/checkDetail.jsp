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
<link href="<%=request.getContextPath()%>/_css/app.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/_css/business-casual1.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/_js/bootstrap.min.js"></script>




<style>
#p1 a {
	font-size: 20px;
	text-decoration: none;
	color: #5B5B5B;
	
}
#bottom {
background-color:#DDDDDD;
border-radius:20px 20px 0 0;

}
.active{ 
border-radius:10px 10px 10px 10px;
}
.active ul li{
border-radius:10px 10px 10px 10px;
}
body{ 
font-family:微軟正黑體;
} 




/*-------------------------------------*/

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
	background-color: #4E92E6;
	color: #fff;
	height: 22px;
	
}

.county {
	background-color: #4E92E6;
	color: #fff;
	
}

.district {
	background-color: #4E92E6;
	color: #fff;
}
</style>
<title>Check Detail</title>
</head>
<body>
<div style="width: 100%;height: 100%;">
<!-- 上邊	--------------------------------------------------------------------------------- -->
	<div style="margin-bottom:0.5%;">
<!-------------------------------------------------------------------------------------- -->
		<nav class="navbar navbar-default" role="navigation">
			<div class="container"  style="width:100%;border-radius:0 0 20px 20px;background-color:#DDDDDD">
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
					<div style="float:left;">
					<a href="women.html" style="text-decoration: none; color: black; text-shadow:5px 5px 5px #5B5B5B;font-size:45px" >Go.E-Shopping</a>
					<div class="address-bar" style="color:black;text-shadow:5px 5px 5px #5B5B5B;font-size:8px;">Enjoy Your Life&nbsp;●&nbsp;Chase Love．Brave Dream</div>
					</div>
					<ul class="nav navbar-nav"  >
						<li><a href="women.html">WOMEN</a></li>
						<li><a href="men.html">MEN</a></li>
						<li><a href="kids.html">KIDS</a></li>
						<li><a href="soprts.html">SOPRTS</a></li>
						<li><a href="babies.html">BABIES</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
<!-- 左邊	--------------------------------------------------------------------------------- -->
	<div id="left" style="float: left;margin-left:2%;width: 11%;">
<!-------------------------------------------------------------------------------------- -->
		<ul id="leftNavigation">
			<li><a href="login.html" style="text-decoration: none">
			<i class="glyphicon glyphicon-user leftNavIcon"></i>會員登入</a></li>
			
			<li><a href="login.html" style="text-decoration: none">
			<i class="glyphicon glyphicon-search leftNavIcon"></i>查詢</a></li>
		
			<li class="active1"><a href="#" style="text-decoration: none">
			<i class="glyphicon glyphicon-triangle-right leftNavIcon"></i>上衣專區</a>
				<ul>
					<li><a href="#">短袖</a></li>
					<li><a href="#">長袖</a></li>
					<li><a href="#">背心</a></li>
					<li><a href="#">襯衫</a></li>
					<li><a href="#">毛衣</a></li>
					<li><a href="#">外套</a></li>
				</ul></li>
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
				</ul></li>
			<li class="active1"><a href="#" style="text-decoration: none">
			<i 	class="glyphicon glyphicon-triangle-right leftNavIcon"></i>配件專區</a>
			<ul>
				<li><a href="#">圍巾</a></li>
				<li><a href="#">帽子</a></li>
				<li><a href="#">眼鏡</a></li>
				<li><a href="#">項鍊</a></li>
				<li><a href="#">髮圈</a></li>
				<li><a href="#">皮帶</a></li>
			</ul></li>
		</ul>
	</div>
<!-- 右邊	----------------------------------------------------------------------------------->
	<div id="right"style="float: left;margin-right:2%;margin-left:1%;margin-bottom:0.5%;width: 82%;">
<!----------------------------------------------------------------------------------------->	
	</div>
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
					<label class="control-label" id="radio">付款方式:</label>
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
				<br>
				<br>
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
			
			var r  = document.getElementsByName("radio");
			for(var i = 0 ; i<r.length ; i++){
				r[i].onchange = radio;
			}
			
			document.getElementById("button").onclick =check;
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

		var tag="";
		var str = "";
		function radio(){
				for (var i = 0; i < my_form.radio.length; i++) {
					var x = document.forms[0].radio[i].checked;
					if (x) {
						tag = i;
					}
				}
				if(tag==""){
					var v = document.getElementById("radio");	
					$('#radio').after("<span class='glyphicon glyphicon-remove form-control-feedback'></span>");
					document.getElementById("radio").parentNode.className="form-group has-error has-feedback";
				}else{
					var v = document.getElementById("radio");
					v.parentNode.removeChild(v.nextSibling);				
					$('#radio').after("<span class='glyphicon glyphicon-ok form-control-feedback'></span>");
					document.getElementById("radio").parentNode.className="form-group has-success has-feedback";
				}
				//alert(tag);
		}
		
		function ok(){
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
		
		
		function check(){
			checkAddressee();
			checkPhone();
			choice();
			checkSender();
			checkPhoneSen();
			choice_sen();
			radio();
			if(!$('span').hasClass('glyphicon-remove')){
				ok();
			}else{
				return false;
			}
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
			console.log("district=" + district +"  county="+county +"  zipcode="+zipcode +"theAddress=" + theAddress);
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
			console.log("district=" + district_sen + "  county=" + county_sen +"  zipcode=" + zipcode_sen + +"theAddress=" + theAddress);
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
<!-- 下邊	--------------------------------------------------------------------------------- -->	
	<div id="bottom" style="clear:left;width:100%;position:relative;bottom:0;left:0;">
<!-------------------------------------------------------------------------------------- -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<p id="p1">
						<a href=""><i class="glyphicon glyphicon-envelope leftNavIcon"></i>聯絡
							Go.E</a>&nbsp;●&nbsp;<a href="">購物指南</a>&nbsp;●&nbsp;<a
							href="">品牌日誌</a>&nbsp;●&nbsp;<a href="">最新消息</a>&nbsp;●&nbsp;<a
							href="">使用條款</a>&nbsp;●&nbsp;<a href="">隱私政策</a>&nbsp;●&nbsp;<a href="index.html">Go.E-Shopping<i
							class="glyphicon glyphicon-home leftNavIcon"></i>
						</a>
					</p>
				</div>
			</div>
		</div>
	<script src="<%=request.getContextPath()%>/_js/jquery.ssd-vertical-navigation.js"></script>
	<script src="<%=request.getContextPath()%>/_js/app.js"></script>
</div>
</body>
</html>