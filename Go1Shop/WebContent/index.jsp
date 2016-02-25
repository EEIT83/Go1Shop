<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.commons.lang3.StringUtils"%>    
<%@page import="java.util.*"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String mail = (String)session.getAttribute("mail");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

</head>
<body>

 Success Login ! Hello ${sessionScope.mail }<br>
<h3>	<a href='<c:url value="/Account/Login.controller" />'>Login</a><br></h3>
<h3>	<a href="<c:url value="/Account/Modify.controller" />">Modify</a><br></h3>
<h3>	<a href="<c:url value="/Account/ChangePwd.controller" />?pageStatus=prompt">ChangePwd</a><br></h3>
<h3>	<a href="<c:url value="/Admin/Properties.controller" />?pageStatus=prompt">Properties</a><br></h3>
	<c:if test="${sessionScope.mail=='admin@gmail.com' }">
<h3>	<a href="<c:url value="/Admin/Register.controller" />">Register</a><br></h3>
<h3>	<a href="<c:url value="/Admin/SelectAdmin.controller" />?pageStatus=prompt">SelectAdmin</a><br></h3>
	</c:if>

<hr>
<h3>	<a href='<c:url value="/g03_product/addNewProduct.jsp" />'>新增產品</a><br></h3>
<h3>	<a href='<c:url value="/g03_product/selectProductByMemId.jsp" />'>查詢產品</a><br></h3>
<h3>	<a href='<c:url value="/g03_product/uploadImg.jsp" />'>上傳圖片</a><br></h3>
<hr>
<h3>	<a href='<c:url value="/g03_product/productproject.jsp" />'>篩選產品</a><br></h3>
<hr>

<h3><a href="/Go1Shop/g07_msgboard/comments.do">jQuery之家留言板</a></h3>
<h3><a href="/Go1Shop/g07_msgboard/comments.do?manage=1">jQuery之家留言板管理</a></h3>
<h3><a href="/Go1Shop/gb04_marketing/ad.html">廣告輪播</a></h3>
<h3><a href="/Go1Shop/gb04_marketing/adManage.jsp">廣告輪播管理</a></h3>

<hr>
<a href='/Go1Shop/gb05_mail/send.jsp'>ch07_寫信</a><p/>
<a href='/Go1Shop/gb05_mail/mail.jsp'>ch07_收信</a><p/>

<hr>
<h3><a href="/g01_login">會員登入</a></h3>
<h3><a href="/g02_member">會員中心</a></h3>
<h3><a href="/g03_product">商品頁</a></h3>
<h3><a href="/g04_seller">賣家專區</a></h3>
<h3><a href="/g05_customer">買家專區</a></h3>
<h3><a href="/g06_newsletter">電子報</a></h3>
<h3><a href="/Go1Shop/g07_msgboard/message.jsp">留言板</a></h3>
<h3><a href="/gb01_login">管理員登入</a></h3>
<h3><a href="/gb02_member">會員管理</a></h3>
<h3><a href="/gb03_msgboard">留言板管理</a></h3>
<h3><a href="/gb04_marketing">行銷管理</a></h3>


<hr>




</body>
</html>