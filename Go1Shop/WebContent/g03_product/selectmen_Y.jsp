<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="<%=request.getContextPath()%>/_css/app.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/_css/business-casual1.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/_js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/_css/page.css" rel="stylesheet">
<title>Insert title here</title>
<!-- yoga -->
<style type="text/css">
/*  input {padding:5px 15px; background:#ccc; border:0 none; */
/* cursor:pointer; */
/* -webkit-border-radius: 5px; */
/* border-radius: 5px; } */
/*  input[type="submit"]{padding:5px 15px; background:#ccc; border:0 none; */
/* cursor:pointer; */
/* -webkit-border-radius: 5px; */
/* border-radius: 5px; } */
/* input[type="text"]{padding:5px 15px; border:2px black solid; */
/* cursor:pointer; */
/* -webkit-border-radius: 5px; */
/* border-radius: 5px; } */
/* #B{ */
/* font-size:20px; */
/* } */
/* #B span{ */
/* /* margin-left:50px; */ */
/*  padding-left:70px; */
/* } */

/* #header5{ */
/* margin:0 21%; */
/* } */


/* #div{ */
/* width:100%; */
/* overflow: auto; */
/* } */
/* #img1 { */
/*  border: 2px solid #292929; */
/*  padding: 1px; */
/* } */
/* #h3txt{ */
/*     color: #337ab7; */
/*     text-align: center; */
/*     } */
/* #div_out {     */
/*     padding:10px; */
/*     border:2px; */
/*     margin:15px; */
/*     display:inline-block; */
/*  	float:left; */
/*     padding-right: 15px; */
/*     padding-left: 15px;  */
/*  }  */
/* #div_out:nth-child(3n+1){ */
/*  clear: both; */
/*  } */
  
  
/*  #header { */
/* 	margin: 0 auto; */
/* 	padding: 44px 0 50px; */
/* 	text-align: center; */
/* 	width: 960px; */
/* } */
/* #header a.logo { */
/* 	display: block; */
/* 	margin: 0 auto; */
/* 	padding: 0; */
/* 	width: 340px; */
/* } */
/* #header a.logo img { */
/* 	border: 0; */
/* 	display: block; */
/* 	margin: 0; */
/* 	padding: 0; */
/* } */
/* #header ul { */
/* 	margin: 0; */
/* 	padding: 56px 0 0; */
/* } */
/* #header ul li { */
/* 	display: inline; */
/* 	list-style: none; */
/* 	margin: 0; */
/* 	padding: 0 19px; */
/* } */
/* #header ul li a { */
/* 	color: #252525; */
/* 	display: inline-block; */
/* 	font-family: "Arial Black", Gadget, sans-serif; */
/* 	font-size: 14px; */
/* 	font-weight: normal; */
/* 	margin: 0; */
/* 	padding: 0 0 3px; */
/* 	text-decoration: none; */
/* 	text-transform: uppercase; */
/* } */

/* #header ul li a:hover, #header ul li.selected a { */
/* 	color: #0ba39c; */
/* } */
</style> 
</head>
<body>
<div style="width: 100%;height: 100%;">
	<!-- 上邊	--------------------------------------------------------------------------------- -->
	<div style="margin-bottom:0.5%;">
		<jsp:include page="/tm/top.jsp" />
	</div>

	<!-- 左邊	--------------------------------------------------------------------------------- -->
	<div id="left" style="float: left;margin-left:2%;width: 11%;">
		<jsp:include page="/tm/left.jsp" />
	</div>
	<!-- 右邊	----------------------------------------------------------------------------------->
	<div id="right"style="float: left;margin-right:2%;margin-left:1%;margin-bottom:0.5%;width: 82%;">
		<div style="float: left;margin:5% 0 0 0;width: 100%;border:1px solid black; ">
			<div style="width:100%;margin-left:5%">
				<form action="<c:url value="/g03_product/ProductGenderServlet.controller?gender=M"/>" method="post">
					<div id="B">
						<span>產品名稱：</span> <input type="text" name="prod_name"	value="${param.prod_name}" style="width: 70%;"><br>
						<span>價錢範圍從：</span><input type="text" name="lowprice" value="${param.lowprice}" style="width:10%;">
						&nbsp;&nbsp;到&nbsp;&nbsp;
						<input type="text" name="highprice" value="${param.highprice}" style="width:10%;" >
						<span><input type="submit" name="prodaction" value="Select" style="width:10%"class="btn btn-primary"></span>
						<button type="submit" name="selectorder" value="OrderByPrice" class="btn btn-primary">依金額低至高</button>
						<button type="submit" name="selectorder" value="OrderByPriceDesc" class="btn btn-primary">依金額高至低</button>
						<button type="submit" name="selectorder" value="OrderByDate" class="btn btn-primary">依刊登日期舊至新</button>
						<button type="submit" name="selectorder" value="OrderByDateDesc" class="btn btn-primary">依刊登日期新至舊</button>
						<br>
						<br>
					
					</div>
				</form>
				<div id="div">
					<c:forEach var="bean" items="${select}">
						<div id="div_out">
							<a href="#">
							<img id="img1" class="img-responsive" style="width:300px;height:300px" src='<c:url value="/pages/showImg.controller?prod_id="/>${bean.prod_id}'>
							</a>
							<h3 id="h3txt">						
								<a>${bean.prod_name}</a><br>
								<a>金額:${bean.price}</a>						
							</h3>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
<!-- 下邊	--------------------------------------------------------------------------------- -->	
	<div id="bottom" style="clear:left;width:100%;position:relative;bottom:0;left:0;">
		<jsp:include page="/tm/bottom.jsp" />	
	</div>
</div>
</body>
</html>