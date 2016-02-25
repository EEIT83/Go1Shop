<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>register</title>
</head>

<body>
	<form action="<c:url value="/Admin/Register.controller" />?pageStatus=insert" method="post">
		<label>Mail</label> 
		<input type="text" name="ad_mail" id="ad_mail" value="${param.ad_mail }"> 
			<br> 
			<label>Name</label> 
			<input type="text" name="ad_name" id="ad_name" value="${param.ad_name }"> 
		<br> 
		<input type="submit" value="submit" ><span id="successMessage"></span>
	</form>
<script type="text/javascript">		
<%int status = (request.getAttribute("returnStatus")) == null? 0: Integer.parseInt(request.getAttribute("returnStatus").toString());
//String returnMessage = (request.getAttribute("returnMessage")) == null?null: request.getAttribute("returnMessage").toString();
System.out.println(status);	
	if (status == -1) {%>
		alert("${returnMessage}");
<%}else if(status==1){%>
		 document.getElementById("ad_mail").removeAttribute("value");
		document.getElementById("ad_name").removeAttribute("value");
		document.getElementById("successMessage").innerHTML="${returnMessage}";
		
<%}%>
</script>
</body>
</html>
