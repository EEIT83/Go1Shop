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
	<form action="<c:url value="/Admin/Register.controller" />?pageStatus=insert" method="post" id="form">
		<label>Mail</label> 
		<input type="text" name="ad_mail" id="ad_mail" value="${param.ad_mail }"> 
			<br> 
		<input type="button" value="submit" ><span id="successMessage"></span>
	</form>
<script type="text/javascript">		
<%int status = (request.getAttribute("returnStatus")) == null? 0: Integer.parseInt(request.getAttribute("returnStatus").toString());
//String returnMessage = (request.getAttribute("returnMessage")) == null?null: request.getAttribute("returnMessage").toString();
System.out.println(status);	
	if (status == -1) {%>
		alert("${returnMessage}");
<%}else if(status==1){%>
		 document.getElementById("ad_mail").removeAttribute("value");
		document.getElementById("successMessage").innerHTML="${returnMessage}";
		
<%}%>
document.getElementById("submit").addEventListener("click", function(){
	var regExp = /^[^@^\s]+@[^\.@^\s]+(\.[^\.@^\s]+)+$/;
	if(this.value!=""){
		if (regExp.test(this.value)){
			document.getElementById("form").submit();
		}else{
			alert("電子郵件不正確");
		}
	}else{
			alert("不可以空白");
	}
});
</script>
</body>
</html>
