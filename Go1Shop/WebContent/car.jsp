<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/jquery.fly.min.js"></script> 
<title>Insert title here</title>
<style type="text/css">

.box{float:left; width:198px; height:320px; margin-left:5px; border:1px solid #e0e0e0; text-align:center} 
.box p{line-height:20px; padding:4px 4px 10px 4px; text-align:left} 
.box:hover{border:1px solid #f90} 
.box h4{line-height:32px; font-size:14px; color:#f30;font-weight:500} 
.box h4 span{font-size:20px} 
.u-flyer{display: block;width: 50px;height: 50px;border-radius: 50px;position: fixed;z-index: 9999;} 
 
.m-sidebar{position: fixed;top: 0;right: 0;background: #000;z-index: 2000;width: 35px;height: 100%;font-size: 12px;color: #fff;} 
.cart{color: #fff;text-align:center;line-height: 20px;padding: 200px 0 0 0px;} 
.cart span{display:block;width:20px;margin:0 auto;} 
.cart i{width:35px;height:35px;display:block; background:url(car.png) no-repeat;} 
#msg{position:fixed; top:300px; right:35px; z-index:10000; width:1px; height:52px; line-height:52px; font-size:20px; text-align:center; color:#fff; background:#360; display:none} 

</style>
</head>
<body>
<div class="box"> 
    <img src="images/lg.jpg" width="180" height="180"> 
    <h4>￥<span>3499.00</span></h4> 
    <p>LG 49LF5400-CA 49寸IPS硬屏富贵招财铜钱设计</p> 
    <a href="#" class="button orange addcar">加入购物车</a> 
</div> 
<div class="box"> 
    <img src="images/hs.jpg" width="180" height="180"> 
    <h4>￥<span>3799.00</span></h4> 
    <p>Hisense/海信 LED50T1A 海信电视官方旗舰店</p> 
    <a href="#" class="button orange addcar">加入购物车</a> 
</div> 
<div class="box"> 
    <img src="images/cw.jpg" width="180" height="180"> 
    <h4>￥<span>￥3999.00</span></h4> 
    <p>Skyworth/创维 50E8EUS 8核4Kj极清酷开系统智能液晶电视</p> 
    <a href="#" class="button orange addcar">加入购物车</a> 
</div> 
<div class="box"> 
    <img src="images/ls.jpg" width="180" height="180"> 
    <h4>￥<span>6969.00</span></h4> 
    <p>乐视TV Letv X60S 4核1080P高清3D安卓智能超级电视</p> 
    <a href="#" class="button orange addcar">加入购物车</a> 
</div> 
<div class="m-sidebar"> 
    <div class="cart"> 
        <i id="end"></i> 
        <span>购物车</span> 
    </div> 
</div> 
<div id="msg">已成功加入购物车！</div> 




<script> 
$(function() { 
    var offset = $("#end").offset(); 
    $(".addcar").click(function(event){ 
        var addcar = $(this); 
        var img = addcar.parent().find('img').attr('src'); 
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
                addcar.css("cursor","default").removeClass('orange').unbind('click'); 
                this.destory(); //移除dom 
            } 
        }); 
    }); 
}); 
</script> 

</body>
</html>