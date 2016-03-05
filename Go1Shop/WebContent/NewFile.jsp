<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=request.getContextPath()%>/_js/jquery-1.12.0.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/car/jquery.fly.min.js"></script>
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/_css/app.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/_css/business-casual1.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/_js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id = "title" style="width:100%;height:100%;margin-bottom: 10px;clear: both;" class="titleClass">
			<div id="PtitleImg" style="width:60%;margin:5% 0 0 3%;float:left;"></div>
			<div style="margin:8% 0 0 3%;width:30%; float: left;">
<!------------------品名------------------>
				<div id="Pname" style="width:100%;height:50%;margin:4% 0 0 4%;font-size:20px;text-align:left;"></div>
<!------------------大小------------------>
					<div style="width:28%;margin:5% 0 0 4%;font-weight: bold;float:left;"><p style='font-size:25px;'>尺寸 ：</p></div>
				<div id="Psize" style="width:11%;margin:2% 0 0 0%;font-weight: bold;text-align:left;float:left;" ></div>
<!--------------------------------------->				
				<div style="clear: both;"></div>
<!------------------價錢------------------>
					<div style="width:23%;margin:40% 0 0 25%;font-size:30px;color:red;float:left; ">NT＄</div>
				<div id="Pprice" style="width:30%;font-size:45px;color:red;margin:40% 0 0 0%;float:left; "></div>
					<div style="width:8%;margin:42% 0 0 0;text-align:right;float:left;"><p  style='color:red;font-size:50px; '>元</p></div>
<!------------------送出------------------>
				<div style="width:100%;margin:100% 0 0 0;text-align:center;"><button style="width:160px;height: 60px;" type="submit" class="btn btn-primary">加入購物車</button></div>
			</div>
		
		
		<div style='display:block;margin-top:20px;padding-top:2px;background-color:#BEBEBE;height: 2px;clear: both;'></div>
		<br>
		<div id="content" style="width: 90%;margin:0 5% 0 5%;"></div>
</div>
	<script>
	
	
	$(function(){
		$.ajax({
			'type':'POST',
			'url':"<c:url value='/showProdImg.con'/>",
			'dataType':'json',
			'data':{prodId:'16'},
			'success':function(data){								
				content(data);
				console.log(data.imgid[0]);
			}
		});
	});
	
	
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
		$('#content').append("<img id='img2' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[1]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img3' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[2]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img4' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[3]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
		$('#content').append("<img id='img5' src='<c:url value='/g05_customer/ShowProdImg.con?imgId="+data.imgid[4]+"'/>' style='width: 100%;text-align: center;' /><div style='font-size:20px;background-color:#BEBEBE;height: 2px;margin: 20px 0 20px 0;'></div>");
			}
		});
	}
	
	</script>
</body>
</html>