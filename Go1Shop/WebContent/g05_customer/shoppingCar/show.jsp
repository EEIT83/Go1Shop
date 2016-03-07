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
<script src="<%=request.getContextPath()%>/_js/jquery-1.12.0.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/car/jquery.fly.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/jquery.fly.min.js"></script> 
<title>Insert title here</title>
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
/* -------------------商品頁-------------------------- */
.titleClass:after, .titleClass:before{
  content:"";
  display:table;
}
.titleClass:after{
   clear:both;   
}


/* -------------------購物車-------------------------- */
.box{float:left; width:198px; height:320px; margin-left:5px; border:1px solid #e0e0e0; text-align:center} 
.box p{line-height:20px; padding:4px 4px 10px 4px; text-align:left} 
.box:hover{border:1px solid #f90} 
.box h4{line-height:32px; font-size:14px; color:#f30;font-weight:500} 
.box h4 span{font-size:20px} 
.u-flyer{display: block;width: 50px;height: 50px;border-radius: 50px;position: fixed;z-index: 9999;} 
 
.m-sidebar{position: fixed;top: 0;right: 0;background: #000;z-index: 2000;width: 35px;height: 100%;font-size: 12px;color: #fff;} 
.cart{color: #fff;text-align:center;line-height: 20px;padding: 200px 0 0 0px;} 
.cart span{display:block;width:20px;margin:0 auto;} 
.cart i{width:35px;height:35px;display:block; background:url(/Go1Shop/_img/car.png) no-repeat;} 
#msg{position:fixed; top:300px; right:35px; z-index:10000; width:1px; height:52px; line-height:52px; font-size:20px; text-align:center; color:#fff; background:#360; display:none} 



.cart a{
	text-decoration: none;
	color:white;
}

</style>

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
		<div id = "title" style="width:100%;height:100%;margin-bottom: 10px;clear: both;" class="titleClass">
			<div id="PtitleImg" style="width:60%;margin:5% 0 0 3%;float:left;"></div>
			<div style="margin:8% 0 0 3%;width:30%; float: left;">
<!------------------品名---------------- -->
				<div id="Pname" style="width:100%;height:50%;margin:4% 0 0 4%;font-size:20px;text-align:left;"></div>
<!------------------大小---------------- -->
					<div style="width:28%;margin:5% 0 0 4%;font-weight: bold;float:left;"><p style='font-size:25px;'>尺寸 ：</p></div>
				<div id="Psize" style="width:11%;margin:1% 0 0 0%;font-weight: bold;text-align:left;float:left;" ></div>
<!-------------------------------------				 -->
				<div style="clear: both;"></div>
<!------------------價錢---------------- -->
					<div style="width:23%;margin:40% 0 0 25%;font-size:30px;color:red;float:left; ">NT＄</div>
				<div id="Pprice" style="width:30%;font-size:45px;color:red;margin:40% 0 0 0%;float:left; "></div>
					<div style="width:8%;margin:42% 0 0 0;text-align:right;float:left;"><p  style='color:red;font-size:50px; '>元</p></div>
<!------------------送出---------------- -->
				<form>
				<div style="width:100%;margin:100% 0 0 0;text-align:center;" id="box"><input type="button" class="button addcar btn btn-primary" value="加入購物車" /></div>
				<input type="hidden" value="16" name="prodId">
				</form>
			</div>
		</div>
		
		
		<div style='display:block;margin-top:20px;padding-top:2px;background-color:#BEBEBE;height: 2px;clear: both;'></div>
		<br>
		<div>
				<ul class="nav nav-tabs">
				  <li role="presentation"><a  onclick="showImg()" >產品說明</a></li>
				  <li role="presentation"><a  onclick="msgboard()">留言板</a></li>
				</ul>
		</div>
		<div id="content" style="width: 90%;margin:0 5% 0 5%;"></div>
		<iframe>12313</iframe>

	</div>
	<script>
	$(function(){
		var prID;
		
		//找出產品圖片
		$.ajax({
			'type':'POST',
			'url':"<c:url value='/showProdImg.con'/>",
			'dataType':'json',
			'data':{prodId:'16'},
			'success':function(data){								
				content(data);
				console.log(data.imgid[0]);
				console.log(data.imgid[0]);
				prID = data.imgid[0];
			}
		});
		
		
		$(".addcar").click(function(event){
			$.ajax({
				'type':'POST',
				'url':"<c:url value='/g05_customer/shoppingCar/controller/BuyProServlet.con'/>",
				'dataType':'json',
				'data':{prodId:'16'},
				'success':function(data){								
					console.log("error=" + data.error);
					if(data!=null){
						document.location.href="/Go1Shop/g01_login/Login.jsp";
					}
				}
			});
			
			
		});
		
		
	});
	//找出產品
	function content(data){
		$.ajax({
			'type':'GET',
			'url':"<c:url value='/g05_customer/ShowProServlet.con'/>",
			'dataType':'json',
			'data':{prod_id:'16'},
			'success':function(Prod){								
			console.log(Prod);
		$('#PtitleImg').append("<img id='img1' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[0]+"'/>'  style='width: 100%' />");
		$('#Pname').append("<p>"+Prod.productName+"</p>");
		$('#Psize').append("<p style='font-size:35px;'>"+Prod.size+"</p>");
		$('#Pprice').append("<p style='color:red'>"+Prod.price+"</p>");
		$('#Pbrand').append("<h3 style='font-size:20px;'>"+Prod.brand+"</h3>");
		
		//$('#content').append("<iframe width='100%' height='1000 px' src='/Go1Shop/t11111.jsp'></iframe>");
		
		$('#content').append("<img id='img2' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[1]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img3' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[2]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img4' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[3]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img5' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[4]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
			}
		});
	}
	
	function content2(data){
		
		$('#content').append("<iframe width='100%' height='1000 px' id='imgif'>");
		$('#imgif').attr("src" , "/g05_customer/ShowProdImg.con?imgId="+data.imgid[1]);
// 		$('#imgif').append("<img id='img3' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[2]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
// 		$('#imgif').append("<img id='img4' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[3]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
// 		$('#imgif').append("<img id='img5' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[4]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("</iframe>");
		
	}
	
	
	
	
	function msgboard(){
		document.getElementById("content").innerHTML="";
 		document.getElementById("content").innerHTML="<iframe width='100%' height='1000 px' src='/Go1Shop/g07_msgboard/comments.do'></iframe>";
		
	
		
	}
	
	function showImg(){
	//	alert('xxx');
		document.getElementById("content").innerHTML="";
	//	document.getElementById("content").innerHTML="<img id='img2' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[1]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>";
		//$('#content').append("<iframe width='100%' height='1000 px' src='/Go1Shop/t11111.jsp'></iframe>");
		$(function(){
		
			
// 			找出產品圖片
			$.ajax({
				'type':'POST',
				'url':"<c:url value='/showProdImg.con'/>",
				'dataType':'json',
				'data':{prodId:'16'},
				'success':function(data){								
					content2(data);
					console.log(data.imgid[0]);
					console.log(data.imgid[0]);
					
				}
			});
			
		});
	
	
	}
	
	
	</script>
<%-- 	<c:forEach var="imgid" begin="1" end="${fn:length(imgId)}" varStatus="r"> --%>
<%-- 		<c:set var='x' value="${imgid}" /> --%>
<%-- 		<img  src="<c:url value='/g05_customer/ShowProdImg.con?imgId=${x}'/>" style="width: 40%"> --%>
<%-- 	</c:forEach> --%>
	

<!-- 下邊	--------------------------------------------------------------------------------- -->	
	<div id="bottom" style="clear:left;width:100%;position:fixed;bottom:0;left:0;">
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
<%-- <script src="<%=request.getContextPath()%>/_js/jquery.ssd-vertical-navigation.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/_js/app.js"></script> --%>
<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<th>price</th> -->
<!-- 		<th>product</th>		 -->
<!-- 		<th>count</th> -->
<!-- 		<th>subtotal</th> -->
<!-- 	</tr> -->
<%-- 	<c:forEach var="result" items="${result}"> --%>
<!-- 		<tr> -->
<%-- 			<td>${result.productName}</td> --%>
<%-- 			<td>${result.brand}</td> --%>
<%-- 			<td>${result.price}</td>		 --%>
<%-- 			<td>${result.note}</td> --%>
<!-- 		<td>						 -->
<%-- 			<form action='<c:url value="/g05_customer/shoppingCar/controller/BuyProServlet.con"/>' method="post" > --%>
<%-- 				<input type="hidden" name="id" value="${result.prodId}"> --%>
<%-- 				<input type="hidden" name="product" value="${result.productName}"> --%>
<%-- 				<input type="hidden" name="brand" value="${result.brand}"> --%>
<%-- 				<input type="hidden" name="price" value="${result.price}"> --%>
<!-- 				<input type="hidden" name="count" value="1"> -->
<!-- 				<input type="submit" name="car" class="button orange addcar" value="加入購物車"> -->
<%-- 				${error.exist} --%>
<!-- 			</form> -->
<!-- 		</td> -->
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
<!-- </table> -->
<div class="m-sidebar"> 
    <div class="cart"> 
        <i id="end"></i> 
        <span><a style="" id="carurl" href="<c:url value="/g05_customer/shoppingCar/car.jsp" />">購物車</a></span> 
    </div> 
</div> 
<div id="msg">已成功加入購物車！</div> 
<script type="text/javascript">
$(function() { 
    var offset = $("#end").offset(); 
    $(".addcar").click(function(event){ 
        var addcar = $(this); 
        var img = $('#PtitleImg').find('img').attr('src'); 
        var flyer = $('<img class="u-flyer" src="'+img+'">'); 
        flyer.fly({ 
            start: { 
                left: event.pageX, //开始位置（必填）#fly元素会被设置成position: fixed 
                top: event.pageY //开始位置（必填） 
            }, 
            end: { 
                left: offset.left+10, //结束位置（必填） 
                top: offset.top+10, //结束位置（必填） 
                width: 0, //结束时宽度 
                height: 0 //结束时高度 
            }, 
            onEnd: function(){ //结束回调 
                $("#msg").show().animate({width: '250px'}, 200).fadeOut(1000); //提示信息 
                addcar.css("cursor","default").removeClass('btn-primary').unbind('click'); 
                this.destory(); //移除dom 
            } 
        });
        
    }); 
}); 
</script>
</div>
</body>
</html>