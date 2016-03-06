<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/_css/app.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/_css/business-casual1.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/_js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
	<div class="container"  style="width:100%;border-radius:0 0 20px 20px;background-color:#DDDDDD">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
			<div style="float:left;">
			<a href="<%=request.getContextPath()%>/index.jsp" style="text-decoration: none; color: black; text-shadow:5px 5px 5px #5B5B5B;font-size:45px" >Go.E-Shopping</a>
			<div class="address-bar" style="color:black;text-shadow:5px 5px 5px #5B5B5B;font-size:8px;">Enjoy Your Life&nbsp;●&nbsp;Chase Love．Brave Dream</div>
			</div>
			<ul class="nav navbar-nav"  >
				<li><a href="<%=request.getContextPath()%>/p_WOMEN/W_index.jsp">WOMEN</a></li>
				<li><a href="<%=request.getContextPath()%>/p_MEN/M_index.jsp">MEN</a></li>
				<li><a href="<%=request.getContextPath()%>/p_KIDS/K_index.jsp">KIDS</a></li>
				<li><a href="<%=request.getContextPath()%>/p_SOPRTS/S_index.jsp">SOPRTS</a></li>
				<li><a href="<%=request.getContextPath()%>/p_BABIES/B_index.jsp">BABIES</a></li>
			</ul>
		</div>
	</div>
</nav>
</body>
</html>