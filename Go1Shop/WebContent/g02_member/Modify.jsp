<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Modify</title>
<script language="javascript">
		function reSize(){
		　　//parent.document.all.frameid.height=document.body.scrollHeight; 
		　　parent.document.getElementById("modifyFrame").height=document.body.scrollHeight;
		} 
		window.onload=reSize;
</script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  </head>
  
  <body>
 <div style="margin: 0 auto;">
  <form action="<c:url value="/Account/Modify.controller" />" method="post" style="text-align:center;">
   <label>Mail</label>
   <input type="text" name="mail" value="${account.mail}" disabled />
   <br>
   <label>Name</label>
   <input type="text" name="mem_name" id="mem_name" value="${account.mem_name }" />
   <span id="errorMem_name">${error.mem_name }</span>
   <br>
   <label>gender</label>
   <input type="radio" name="gender" value="1" ${account.gender != 2 ? "checked" : ""}> Male
   <input type="radio" name="gender" value="2" ${account.gender == 2 ? "checked" : ""}> Female
   <br>
   <label>NickName</label>
   <input type="text" name="nickName" id="nickName" value="${account.nickName}">
   <span id="errorNickname">${error.nickName }</span>
   <br>
   <label>Birthday</label>
   <input type="text" name="bdate" id="bdate" value="${account.bdate}">
   <span id="errorBdate">${error.bdate }</span>
   <br>
   <input type="submit" name="pageStatus" value="save" class="btn btn-primary btn-lg">

   </form>
  </div>
 <!--<script src="../js/Modify.js"></script>  -->

  </body>
</html>
