<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/car/jquery.fly.min.js"></script>

<title>Insert title here</title>
<style>

/* -------------------購物車-------------------------- */
.box{float:left; width:198px; height:320px; margin-left:5px; border:1px solid #e0e0e0; text-align:center} 
.box p{line-height:20px; padding:4px 4px 10px 4px; text-align:left} 
.box:hover{border:1px solid #f90} 
.box h4{line-height:32px; font-size:14px; color:#f30;font-weight:500} 
.box h4 span{font-size:20px} 
.u-flyer{display: block;width: 50px;height: 50px;border-radius: 50px;position: fixed;z-index: 9999;} 
 
.m-sidebar{position: fixed;top: 40%;right: 0;background: #000;z-index: 2000;width: 35px;height: 10%;font-size: 12px;color: #fff;} 
.cart{color: #fff;text-align:center;} 
.cart span{display:block;width:20px;margin:auto auto;} 
.cart i{width:35px;height:35px;display:block; background:url(/Go1Shop/_img/car.png) no-repeat;} 
#msg{position:fixed; top:300px; right:35px; z-index:10000; width:1px; height:52px; line-height:52px; font-size:20px; text-align:center; color:#fff; background:#360; display:none} 



.cart a{
	text-decoration: none;
	color:white;
}

</style>
</head>
<body>


<div class="m-sidebar"> 
    <div class="cart"> 
        <i id="end"></i> 
        <span><a style="" id="carurl" href="<c:url value="/g05_customer/shoppingCar/car.jsp" />">購物車</a></span> 
    </div> 
</div> 
<div id="msg">已成功加入購物車！</div> 

<script type="text/javascript">
$(function() {
	
	//加入購物車
		$(".addcar").click(function(event){
			
			$.ajax({
				'type':'POST',
				'url':"<c:url value='/BuyProServlet.con'/>",
				'dataType':'json',
				'data':{prodId:'${param.id}'},
				'success':function(data){		

					if(data.error=='error'){
						document.location.href="/Go1Shop/g01_login/Login.jsp";
						return;
					}
				//------------------------------------購物車動畫-----------------------------
			
				}
				
			});
			var offset = $("#end").offset(); 
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
})
</script>
</body>
</html>